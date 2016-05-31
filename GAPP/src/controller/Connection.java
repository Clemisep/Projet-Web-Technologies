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
			User user = User.findUser(pseudo);
			
			if(CryptWithMD5.cryptWithMD5(password).equals(user.getEncryptedPassword())) {
				
				session.setAttribute("pseudo", pseudo);
				session.setAttribute("password", password);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("..\\Template\\starter_admin.jsp");
				dispatcher.forward(request, response);
				
			} else {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("..\\Template\\login.jsp");
				dispatcher.forward(request, response);
			}
			
		} catch (SQLException | NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	        /* Récupération de la session depuis la requête */
	       // HttpSession session = session;

	        
	    }
	}