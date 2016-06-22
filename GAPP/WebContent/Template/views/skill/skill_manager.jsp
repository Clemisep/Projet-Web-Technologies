<%@ page import="java.util.List"%>
<%@ page import="model.*" %>

<h1>Famille de compétences</h1>
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
				
					<%
					System.out.println(request.getParameter("id_skill_group"));
					long id_skill_group = Long.parseLong(request.getParameter("id_skill_group"));
					SkillGroup skillGroup = SkillGroup.getSkillGroup(id_skill_group);
					
					String description = request.getParameter("description");
					String remove = request.getParameter("remove");
					
					if(description != null) {
						Skill skill = Skill.addSkill(skillGroup, description);
						request.getSession().setAttribute("redirect", "views/skill/skill_manager.jsp?id_skill_group="+id_skill_group);
			    		response.sendRedirect("../../starter_admin.jsp");
					} else if(remove != null) {
						
						request.getSession().setAttribute("redirect", "views/view_kind_of_app.jsp?id_kind_of_app=" + skillGroup.getKindOfApp().getId());
						skillGroup.remove();
			    		response.sendRedirect("../../starter_admin.jsp");
					} else {
					%>
					
					<form method="post" action="views/skill/skill_manager.jsp">
							<input hidden type="text" value=" " name="remove">
							<input type="text" hidden value="<%= id_skill_group %>" name="id_skill_group">
							<input type="submit" class="btn btn-danger" value="Supprimer la famille de compétences">
					</form>
					
					Type d'APP correspondant :
					<a style="font-size:125%; color:#3c8dbc; font-weight:bold;" href="#" onclick="include_in_dynamic('views/view_kind_of_app.jsp?id_kind_of_app=<%= skillGroup.getKindOfApp().getId() %>')">
					<%= skillGroup.getKindOfApp().getDescription() %>
					</a>
					<br/>
					Famille : <%= skillGroup.getDescription() %>					
					
					<table id="table1" class="table table-bordered table-hover dataTable">
		    	<thead>
		    		<th>Compétences</th>
		    	</thead>
		    	<tbody>
		    <%
		    for(Skill skill : skillGroup.getSkills()) { %>
		    		<tr>
		    			<td><%= skill.getDescription() %></td>
		    		</tr>
		    		<% } %>
		    	</tbody>
		    </table>
    
    <h3 class="box-title">Ajouter une compétence</h3>
            
            <div class="box-body">
            <form action="views/skill/skill_manager.jsp" method="post" >
              <input hidden type="number" id="id_skill_group" name="id_skill_group" value="<%= id_skill_group %>">
                <label>Nom : </label> <input type="text" id="description" name="description" >
                <br>
                <div >
                <br>
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