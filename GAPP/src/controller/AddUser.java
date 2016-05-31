package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

@WebServlet(value={"/Test"})
public class AddUser
extends HttpServlet {
    private static final long serialVersionUID = 1;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String[] roles = request.getParameterValues("role");
    	String pseudo = request.getParameter("pseudo");
    	String firstname = request.getParameter("firstname");
    	String lastname = request.getParameter("lastname");
    	String birthday = request.getParameter("birthday");   	
    	String password = request.getParameter("password");
    	String picture = request.getParameter("picture");
    	String student_id = request.getParameter("student_id");
    	
    	
        try {
        	Calendar cal = Calendar.getInstance();
        	cal.set(1985, 8, 5);
        	User user = User.addUser(pseudo,firstname,lastname, new java.sql.Date(cal.getTimeInMillis()),password, picture);
            for (String role : roles) {
				switch(role) {
				case "tutor":
					user.becomeTutor();
					break;
				case "admin":
					user.becomeAdmin();
					break;
				case "student":
					user.becomeStudent(student_id);
					break;
				}
			}
            
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
