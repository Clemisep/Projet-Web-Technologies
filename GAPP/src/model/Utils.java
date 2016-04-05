package model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Utils {
	public static Connection getConnection() throws SQLException {
//		return DriverManager.getConnection("jdbc:mysql://localhost/gapp", "root", "");
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		return DriverManager.getConnection("jdbc:mysql://localhost:3306/gapp", "root", "");
	}
	
	public static Statement createStatement() throws SQLException {
		return getConnection().createStatement();
	}
}
