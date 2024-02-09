package itm.testgfish.model;

import itm.testgfish.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PersonDAO {
    private Connection connection;
    private PreparedStatement pstm;
    private ResultSet resultSet;
    private String query = "";

    public PersonDAO() {
        DBConnection conn = new DBConnection();
        this.connection = conn.startConnection();
    }

    public String getUser(int id) {
        try {
            pstm = connection.prepareStatement("SELECT fname FROM users WHERE id="+id);
            resultSet = pstm.executeQuery("SELECT fname FROM users WHERE id="+id);
            resultSet.next();
            return resultSet.getString(1);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return "Nothing found";
    }

    public ArrayList getAllUsers() {
        ArrayList<Person> people = new ArrayList<>();
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
}
