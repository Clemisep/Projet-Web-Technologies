package projectgapp;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;

	public class Gapp {

		public static void main(String[] args) {
			
		
			try {
							
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gapp", "root", "");
				System.out.println("Connexion réussie");
			} catch (Exception e) {
				
				System.err.println(e);
			}
		}
	
	}
