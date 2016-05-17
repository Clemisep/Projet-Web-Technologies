package model;

import java.io.PrintStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Test {
    public static void main(String[] args) {
        Test.connect();
    }

    public static void connect() {
        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/GAPP?user=root&password=root");
            if (connection != null) {
                System.out.println("Connection successfull");
            } else {
                System.out.println("Connection unsuccessfull");
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
