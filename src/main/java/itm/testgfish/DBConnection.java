package itm.testgfish;

import javax.swing.plaf.nimbus.State;
import java.sql.*;

public class DBConnection {
    private Connection connection;
    private String url = "jdbc:mysql://localhost:3306/test?autoReconnect=true&useSSL=false";
    private String username = "root";
    private String password = "tec20490712";

    public Connection startConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Connection error: "+e);
        }
        return connection;
    }


}
