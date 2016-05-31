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
public class Test
extends HttpServlet {
    private static final long serialVersionUID = 1;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String isStudent = request.getParameter("student");
        try {
        	Calendar cal = Calendar.getInstance();
        	cal.set(1985, 8, 5);
        	User user = User.addUser("mohamed","mohamed","sellami", new java.sql.Date(cal.getTimeInMillis()),"mohamedsellami", "2.jpeg");
            if(isStudent.equals("true")) user.becomeStudent("46512");
            
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
