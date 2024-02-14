package itm.testgfish.model;

import itm.testgfish.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PersonDAO {
    private Connection connection;
    private PreparedStatement pstm;
    private ResultSet resultSet;
    private String query = "";

    public PersonDAO() {
        DBConnection conn = new DBConnection();
        this.connection = conn.startConnection();
    }

    public Person getUser(int id) {
        Person p = null;
        try {
            query = "SELECT * FROM users WHERE id="+id;
            pstm = connection.prepareStatement(query);
            resultSet = pstm.executeQuery(query);
            resultSet.next();
            p = new Person(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3));
            return p;
        } catch (SQLException e) {
            System.out.println(e);
            return p;
        }
    }

    public List getAllUsers() {
        List<Person> people = new ArrayList<Person>();
        try {
            query = "SELECT * FROM users";
            pstm = connection.prepareStatement(query);
            resultSet = pstm.executeQuery(query);
            while(resultSet.next()){
                Person p = new Person(resultSet.getInt("id"), resultSet.getString("fname"), resultSet.getString("lname"));
                people.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return people;
    }

    public boolean addNewUser(Person p) {
        query = "INSERT INTO users(id,fname,lname) VALUES(DEFAULT,?,?)";
        try {
            pstm = connection.prepareStatement(query);
            pstm.setString(1,p.getFirstName());
            pstm.setString(2, p.getLastName());
            return pstm.executeUpdate() > 0;
        } catch(SQLException e){
            System.out.println(e);
            return false;
        }
    }

    public boolean updateUser(Person p) {
        query = "UPDATE users SET fname=?, lname=? WHERE id=?";
        try {
            pstm = connection.prepareStatement(query);
            pstm.setString(1,p.getFirstName());
            pstm.setString(2, p.getLastName());
            pstm.setInt(3,p.getId());
            return pstm.executeUpdate() > 0;
        } catch(SQLException e){
            System.out.println(e);
            return false;
        }
    }

    public boolean deleteUser(int id) {
        query = "DELETE FROM users WHERE id=?";
        try {
            pstm = connection.prepareStatement(query);
            pstm.setInt(1, id);
            return pstm.executeUpdate() > 0;
        }catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }
}
