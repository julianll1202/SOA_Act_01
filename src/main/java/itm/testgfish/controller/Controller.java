package itm.testgfish.controller;

import itm.testgfish.model.Person;
import itm.testgfish.model.PersonDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Controller extends HttpServlet {
    private PersonDAO personDAO;

    public void init() {
        String url = getServletContext().getInitParameter("jdbcURL");
        String username = getServletContext().getInitParameter("jdbcUsername");
        String password = getServletContext().getInitParameter("jdbcPassword");
        personDAO = new PersonDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        try {
            switch (action) {
                case "/add-user":
                    showAddUserForm(request,response);
                    break;
                case "/update-user":
                    showEditUserForm(request,response);
                    break;
                case "/":
                    showUserList(request, response);
                    break;
                case "/delete":
                    deleteUser(request, response);
                    break;
                case "/update":
                    updateUser(request, response);
                    break;
                case "/add":
                    insertUser(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    private void showAddUserForm(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("addUser.jsp");
        dispatcher.forward(req,res);
    }

    private void showUserList(HttpServletRequest req, HttpServletResponse res) throws SQLException,ServletException, IOException {
        List<Person> people = personDAO.getAllUsers();
        req.setAttribute("people", people);
        RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
        dispatcher.forward(req,res);
    }
    private void showEditUserForm(HttpServletRequest req, HttpServletResponse res) throws SQLException,ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Person p = personDAO.getUser(id);
        req.setAttribute("person", p);
        RequestDispatcher dispatcher = req.getRequestDispatcher("updateUser.jsp");
        dispatcher.forward(req,res);
    }

    private void insertUser(HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        Person person = new Person();
        person.setFirstName(firstName);
        person.setLastName(lastName);
        personDAO.addNewUser(person);
        res.sendRedirect("/testGFish-1.0-SNAPSHOT");
    }

    private void updateUser(HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        Person person = new Person(id, firstName, lastName);
        personDAO.updateUser(person);
        res.sendRedirect("/testGFish-1.0-SNAPSHOT");
    }
    private void deleteUser(HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        personDAO.deleteUser(id);
        res.sendRedirect("/testGFish-1.0-SNAPSHOT");
    }
}
