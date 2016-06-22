<%@ page import="java.util.List"%>
<%@ page import="java.util.LinkedList"%>
<%@ page import="model.*"%>

<%
String idSkill = request.getParameter("id_skill");
String remove = request.getParameter("remove");

if(idSkill != null) {
	String idStudent = request.getParameter("id_student");
	String level = request.getParameter("level");
	User.Student student = User.getStudent(Long.parseLong(idStudent));
	SkillInstance.addSkillInstance(student,
			Skill.getSkill(Long.parseLong(idSkill)),
			Long.parseLong(level));
	request.getSession().setAttribute("redirect", "views/profile.jsp?id_user="+student.getUser().getId());
	response.sendRedirect("../starter_admin.jsp");	
} else if(remove != null) {

	long id_user = Long.parseLong(request.getParameter("id_user"));
	User.getUser(id_user).remove();
	request.getSession().setAttribute("redirect", "views/profile.jsp?id_user="+session.getAttribute("id_user"));
	response.sendRedirect("../starter_admin.jsp");
	
} else {
	
%>

<h1>Profil</h1>
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
					<table class="table table-bordered table-hover dataTable">
						<%
								String id_user = request.getParameter("id_user");
								if (id_user == null) {
							%>
						<p>Cette page n'existe pas.</p>
						<%
								} else {
									User user = User.getUser(Long.parseLong(id_user));
									
									{
									User.Admin admin = User.getUser(((Long)session.getAttribute("id_user")).longValue()).extractAdmin();
									if(admin != null) {
							%>
						<tr>	
						<td>
						<form method="post" action="views/profile.jsp">
							<input hidden type="text" value=" " name="remove">
							<input type="text" hidden value="<%= user.getId() %>" name="id_user">
							<input type="submit" class="btn btn-danger" value="Supprimer l'utilisateur">
									</form>
									</td>
									</tr>
									
									<% }} %>

						<td>Nom : <%=user.getLastName()%>
						<tr>
							<td>Prénom : <%=user.getFirstName()%></td>
						</tr>
						<tr>
							<td>Date de naissance : <%=user.getBirthDate()%></td>
						</tr>
						<tr>
							<td>Rôles : <%
									User.Student student = user.extractStudent();
										if (student != null) {
								%>
								<p>
									Étudiant :<br /> Numéro d'étudiant :
									<%=student.getStudentId()%><br />
									
									Groupe d'APP :
									<% GroupApp groupApp = student.getGroupApp();
									if(groupApp == null) {
										%>
										aucun
										<%
										
									} else {
										%>
										
										<%= groupApp.getName() %>
										
										<%
										
									}
									%>
									
									<br/>
									Compétences :<br />
									<%
											List<SkillInstance> skillInstances = student.getSkillInstances();
													for (SkillInstance skillInstance : skillInstances) {
										%>
									Compétence :
									<%=skillInstance.getSkill().getDescription()%>
									Niveau acquis :
									<%=skillInstance.getLevel()%>
								</p> <%
 	}
 		}
										User.Admin admin = user.extractAdmin();
 		if (admin != null) {
 %>
								<p>Administrateur</p> <%
 	}

 		User.Responsible responsible = user.extractResponsible();
 		if (responsible != null) {
 %>
								<p>Responsable</p> <%
 	}

 		User.Tutor tutor = user.extractTutor();
 		if (tutor != null) {
 %>
								<p>Tuteur</p>
							</td>
						</tr>
						<%
								}
							%>

					</table>
					<%
							if (student != null) {
								
								List<Skill> skills = new LinkedList<>();
								
								GroupApp groupApp = student.getGroupApp();
								
								if(groupApp == null) {
									
									%>

					L'étudiant n'est pas associé à un groupe APP.
					<%
								} else {
									
									 for(SkillGroup skillGroup : groupApp.getKindOfApp().getSkillGroups()) {
										 for(Skill skill : skillGroup.getSkills()) {
										 	skills.add(skill);
										 }
									 }
									 
									 List<Skill> instantiatedSkills = new LinkedList<>();
									 
									 List<SkillInstance> skillInstances = student.getSkillInstances();
									 for(SkillInstance skillInstance : skillInstances) {
										 instantiatedSkills.add(skillInstance.getSkill());
									 }
									 
									 for(int i=0 ; i<skills.size() ; i++) {
										 Skill skill = skills.get(i);
										 boolean appears = false;
										 for(SkillInstance skillInstance : skillInstances) {
											 if(skill.getId() == skillInstance.getSkill().getId()) {
												 skills.remove(i--);
											 }
										 }
									 }
						%>
					<h2>Compétences notées</h2>
					<table id="table1"
						class="table table-bordered table-hover dataTable">
						<thead>
							<th>Famille de compétence</th>
							<th>Compétence</th>
							<th>Note</th>
						</thead>
						<tbody>
							<% for(SkillInstance skillInstance : skillInstances) { %>
							<tr>
								<td><%=skillInstance.getSkill().getSkillGroup().getDescription()%></td>
								<td><%=skillInstance.getSkill().getDescription()%></td>
								<td><%=skillInstance.getLevel()%></td>
							</tr>
							<%
									}
								%>
						</tbody>
					</table>

					<h2>Compétences à noter</h2>
					<table id="table1"
						class="table table-bordered table-hover dataTable">
						<thead>
							<th>Famille de compétence</th>
							<th>Compétence</th>
							<th>Note</th>
						</thead>
						<tbody>
							<%
									for(Skill skill : skills) {
								%>
							<tr>
								<td><%=skill.getSkillGroup().getDescription()%></td>
								<td><%=skill.getDescription()%></td>
								<td>
									<form method="post" action="views/profile.jsp">
										<input type="text" hidden value="<%= skill.getId() %>"
											name="id_skill"> <input type="text" hidden
											value="<%= student.getId() %>" name="id_student"> <input
											type="number" name="level"> <input type="submit"
											class="btn btn-danger" id="envoie">
									</form>

								</td>
							</tr>
							<%
									}
								%>
						</tbody>
					</table>
					<%
						
						if(skills.size() != 0) {
							%>
							Instancier toutes les compétences pour obtenir une note.
							
							<%
						} else {
							
							int sum = 0;
							int nb = 0;
							
							for(SkillInstance skillInstance : skillInstances) {
								sum += skillInstance.getLevel();
								nb++;
							}
							%>
							
							Moyenne : <%= sum/nb %>
							
							<%
							
							
						}
						
							}
								}
								}
						%>
				</div>
			</div>
		</div>
	</div>
</div>
<% } %>