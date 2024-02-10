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
                    break;
                case "/":
                    showUserList(request, response);
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
        ArrayList<Person> people = personDAO.getAllUsers();
        req.setAttribute("people", people);
        RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
        dispatcher.forward(req,res);
    }

    private void insertUser(HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        Person person = new Person(1, firstName, lastName);
        personDAO.addNewUser(person);
        res.sendRedirect("/testGFish-1.0-SNAPSHOT");
    }
}
