<%@ page import="java.util.List"%>
<%@ page import="model.*" %>

<h1>Voir groupe</h1>
<div class="box">
	<!-- /.box-header -->
	<div class="box-body">
		<div id="example2_wrapper"
			class="dataTables_wrapper form-inline dt-bootstrap">
			<div class="row">
				<div class="col-sm-6"></div>
				<div class="col-sm-6"></div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<% // GET parameter : id_group
					
					long id_group = Long.parseLong(request.getParameter("id_group"));
					GroupApp groupApp = GroupApp.getGroupApp(id_group);
					
					
					String student_id = request.getParameter("student_id");
					if(student_id != null) {
						groupApp.addStudent(User.getStudentByStudentId(Long.parseLong(student_id)));
						request.getSession().setAttribute("redirect", "views/view_group.jsp");
			    		response.sendRedirect("../starter_admin.jsp");
					} else {
					
					User tutor = groupApp.getTutor().getUser();
					%>
					
					Type d'APP : <%= groupApp.getKindOfApp().getName() %><br/>
					Tuteur : <%= tutor.getLastName() + " " + tutor.getFirstName() %><br/>
					
					<table id="table1" class="table table-bordered table-hover dataTable">
    	<thead>
    		<th>Numéro élève</th>
    		<th>Nom</th>
    		<th>Prénom</th>
    	</thead>
    	<tbody>
    <%
	String param = "";
	List<User.Student> students = groupApp.getStudents();
	for(int i=0 ; i<students.size() ; i++) {
		User user = students.get(i).getUser();%>
    		<tr>
    			<td><%= user.getId() %></td>
    			<td><%= user.getLastName() %></td>
    			<td><%= user.getFirstName() %></td>
    		</tr>
    		<% } %>
    	</tbody>
    </table>
    
    <h3 class="box-title">Ajouter un utilisateur</h3>
            </div>
            
            <div class="box-body">
            <form action="views/view_group.jsp?id_group=<%= id_group %>" method="post" >
              
                <label>Numéro d'étudiant</label> <input type="number" id="student_id" name="student_id" >
                <br>
                <div >
                <input type="submit" class="btn btn-danger" id="envoie">
                </div>
              </form>
					<% } %>
		</div>
	</div>
</div>