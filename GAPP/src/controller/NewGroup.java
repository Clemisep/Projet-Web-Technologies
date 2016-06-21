package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GroupApp;
import model.KindOfApp;
import model.User;

/**
 * Servlet implementation class NewGroup
 */
@WebServlet("/NewGroup")
public class NewGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewGroup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String groupName = request.getParameter("group_name");
		long idTutor = Long.parseLong(request.getParameter("id_tutor"));
		System.out.println(idTutor);
		long idKindOfApp = Long.parseLong(request.getParameter("id_kind_of_app"));
		
		if(groupName != null) {
			
			try {
				GroupApp.addGroupApp(User.getTutor(idTutor), groupName, KindOfApp.getKindOfApp(idKindOfApp));
				request.getSession().setAttribute("redirect", "views/group.jsp");
				response.sendRedirect("Template/starter_admin.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} else {
			
			// Renvoyer une erreur
		}
	}

}
