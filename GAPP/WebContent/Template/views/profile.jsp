<%@ page import="java.util.List"%>
<%@ page import="model.User"%>
<%@ page import="model.SkillInstance" %>
<!DOCTYPE html>
<html>

<body>
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
Cette page n'existe pas.
<%
	} else {
		User user = User.getUser(Long.parseLong(id_user));
		
		%>
		
		<td>Nom :  <%= user.getLastName() %> <tr>
		<td>Prénom : <%= user.getFirstName() %> <tr>
	<td>Date de naissance : <%= user.getBirthDate() %><tr>
		
	 <td>Rôles :
	
	<%
	User.Student student = user.extractStudent();
	if(student != null) {
		%>
		<p>
		Étudiant :<br/>
		Numéro d'étudiant : <%= student.getStudentId() %><br/>
		Groupe d'APP : <%= student.getGroupApp() %><br/>
		Compétences :<br/>
		<% List<SkillInstance> skillInstances = student.getSkillInstances();
		for(SkillInstance skillInstance : skillInstances) {
		%>
		Compétence : <%= skillInstance.getSkill().getDescription() %>
		Niveau acquis : <%= skillInstance.getLevel() %>
		</p>
		<%
		}
	}
	
	User.Admin admin = user.extractAdmin();
	if(admin != null) {
		%>
		<p>
		Administrateur
		</p>
		<%
	}
	
	User.Responsible responsible = user.extractResponsible();
	if(responsible != null) {
		%>
		<p>
		Responsable
		</p>
		<%
	}
	
	User.Tutor tutor = user.extractTutor();
	if(tutor != null) {
		%>
		<p>
		Tuteur
		</p> <tr>
		<%
	}
}
%>
</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>