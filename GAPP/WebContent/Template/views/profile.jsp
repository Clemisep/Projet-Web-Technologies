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
					
<%
	String pseudo = (String) session.getAttribute("pseudo");
	if (pseudo == null) {
%>
Cette page n'existe pas.
<%
	} else {
		User user = User.findUser(pseudo);
		if (user == null) {
%>
Cette page n'existe pas.
<%
	} else {
		%>
		
		Nom : <%= user.getLastName() %><br/>
		Prénom : <%= user.getFirstName() %><br/>
		Date de naissance : <%= user.getBirthDate() %><br/>
		
		Rôles :
		
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
			</p>
			<%
		}
	}
}
%>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>