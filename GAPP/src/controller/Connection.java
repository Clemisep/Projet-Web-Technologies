package controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CryptWithMD5;
import model.User;

@WebServlet("/Connection")
public class Connection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Connection() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
	        
	       String password = request.getParameter("password");
	       String pseudo = request.getParameter("pseudo");
	       
	    HttpSession session = request.getSession();
		try {
			User user = null;
			if(pseudo != null && !pseudo.equals("")) user = User.findUser(pseudo);
			
			if(password != null && !password.equals("") && user != null && CryptWithMD5.cryptWithMD5(password).equals(user.getEncryptedPassword())) {
				
				session.setAttribute("id_user", user.getId());
				session.setAttribute("pseudo", pseudo);
				session.setAttribute("password", password);
				 response.sendRedirect("Template/starter_admin.jsp");
				
				
			} else {
				 response.sendRedirect("Template/login.jsp");
			
			}
			
		} catch (SQLException | NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	        /* Récupération de la session depuis la requête */
	       // HttpSession session = session;

	        
	    }
	}