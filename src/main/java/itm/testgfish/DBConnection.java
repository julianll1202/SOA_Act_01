package itm.testgfish;

import javax.swing.plaf.nimbus.State;
import java.sql.*;

public class DBConnection {
    private Connection connection;
    private String url = "jdbc:mysql://localhost:3306/test?autoReconnect=true&useSSL=false";
    private String username = "root";
    private String password = "tec20490712";

    public String Connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.connection = DriverManager.getConnection(url, username, password);
            return "Succesful connection";
        } catch (ClassNotFoundException | SQLException e) {
            return ("Connection error: "+e);
        }
    }

    public String getUser(int id) {
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT fname FROM users WHERE id="+id);
            ResultSet resultSet = stmt.executeQuery("SELECT fname FROM users WHERE id="+id);
            resultSet.next();
            return resultSet.getString(1);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return "Nothing found";
    }
}
