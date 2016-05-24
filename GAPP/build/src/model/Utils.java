package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Utils {
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/gapp", "root", "");
    }

    public static Statement createStatement() throws SQLException {
        return Utils.getConnection().createStatement();
    }

    public static PreparedStatement prepareStatement(String sql) throws SQLException {
        return Utils.getConnection().prepareStatement(sql);
    }

    public static PreparedStatement prepareStatementWithKey(String sql) throws SQLException {
        return Utils.getConnection().prepareStatement(sql, 1);
    }

    public static long getKey(PreparedStatement p) throws SQLException {
        ResultSet keys = p.getGeneratedKeys();
        keys.next();
        long key = keys.getLong(1);
        return key;
    }

    public static ResultSet execResult(PreparedStatement p) throws SQLException {
        ResultSet resultSet = p.executeQuery();
        resultSet.next();
        return resultSet;
    }
}
