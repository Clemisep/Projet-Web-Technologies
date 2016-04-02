package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Test {
	public static void main(String[] args) {
		connect();
	}
	
	public static void connect() {
		try {
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/GAPP?user=root&password=root");
			
			if(connection != null) {
				System.out.println("Connection successfull");
			} else {
				System.out.println("Connection unsuccessfull");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
