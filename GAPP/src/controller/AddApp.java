package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.KindOfApp;

@WebServlet("/AddApp")
public class AddApp
extends HttpServlet {
    private static final long serialVersionUID = 1;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	long id_responsible = Long.parseLong(request.getParameter("id_responsible"));
    	String name = request.getParameter("name");
    	String description = request.getParameter("description");
    	
    	try {
			KindOfApp.addKindOfApp(name, description, id_responsible);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	request.getSession().setAttribute("redirect", "views/skill/skill_manager.jsp");
    	response.sendRedirect("Template/starter_admin.jsp");
    	
    }
}
