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
				Type d'APP
				
					<% // GET parameter : id_kind_of_app
					
					long id_kind_of_app = Long.parseLong(request.getParameter("id_kind_of_app"));
					KindOfApp kindOfApp = KindOfApp.getKindOfApp(id_kind_of_app);
					
					String description = request.getParameter("description");
					if(description != null) {
						SkillGroup skillGroup = SkillGroup.addSkillGroup(description, kindOfApp);
						request.getSession().setAttribute("redirect", "views/view_kind_of_app.jsp?id_kind_of_app="+id_kind_of_app);
			    		response.sendRedirect("../starter_admin.jsp");
					} else {
						User responsible = kindOfApp.getResponsible().getUser();
					%>
					
					Nom : <%= kindOfApp.getName() %><br/>
					Description : <%= kindOfApp.getDescription() %><br/>
					Responsable : <%= responsible.getLastName() + " " + responsible.getFirstName() %>
					
					<br/>
					
					<% for(SkillGroup skillGroup : kindOfApp.getSkillGroups()) { %>
					
					Nom : <%= skillGroup.getDescription() %>
					
					<% } %>
    
    <h3 class="box-title">Ajouter une famille de compétences</h3>
            
            <div class="box-body">
            <form action="views/view_kind_of_app.jsp" method="post" >
              <input hidden type="number" id="id_kind_of_app" name="id_kind_of_app" value="<%= id_kind_of_app %>">
                <label>Nom : </label> <input type="text" id="description" name="description" >
                <br>
                <div >
                <input type="submit" class="btn btn-danger" id="envoie">
                </div>
              </form>
					<% } %>
		</div>
		</div>
		</div>
		</div>
	</div>
</div>