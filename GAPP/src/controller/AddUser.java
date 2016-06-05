package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

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
    private static final String PASSWORD_PATTERN ="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String[] roles = request.getParameterValues("role");
    	String pseudo = request.getParameter("pseudo");
    	String firstname = request.getParameter("firstname");
    	String lastname = request.getParameter("lastname");
    	String birthday = request.getParameter("birthday");   	
    	String password = request.getParameter("password");
    	String password2 = request.getParameter("password2");
    	String picture = request.getParameter("picture");
    	String student_id = request.getParameter("student_id");
    	
    	if(validate(password) && password == password2) {    	
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
    	}else {
    		log("Password is not correct or passwords do not match");
    	}
    }
    
    
    public boolean validate (final String password) {
    	Pattern pattern = Pattern.compile(PASSWORD_PATTERN);
    	Matcher matcher = pattern.matcher(password);
    	return matcher.matches();
    }
}
