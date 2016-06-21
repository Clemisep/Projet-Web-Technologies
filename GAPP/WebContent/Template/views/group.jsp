<%@ page import="java.util.List" %>
<%@ page import="model.*"%>

<!DOCTYPE html>
<html>

<body>
	<h1>Groupes</h1>




	<form action="http://localhost:8080/GAPP/NewGroup" method="post">



		<div class="form-group">
			<label>Nom du Groupe</label>
			<div class="input-group">
				<div class="input-group-addon">
					<i class="fa fa-file-picture-o"></i>
				</div>
				<input type="text" class="form-control" id="group_name"
					name="group_name" required>

			</div>
			</br>
			
			<label> Sélectionner le tuteur</label>
			
				<select class="form-control" id="id_tutor"
						name="id_tutor" required>
						<%
                  List<User.Tutor> tutors =  User.getAllTutors();
                 for (User.Tutor tutor : tutors) {
                %>

						<option value="<%= tutor.getId() %>">
							<%= tutor.getUser().getLastName()%>
							<%= tutor.getUser().getFirstName()%>
						</option>
						<%
                 }
                 %>

					</select>
			
			<!-- /.input group -->
		</div>
		</br>

		</div>
		<!-- /.input group -->
		</div>


		<label> Type d'APP </label> <select class="form-control" id="id_kind_of_app"
			name="id_kind_of_app" required>
			<%
                 for (KindOfApp kind_of_app : KindOfApp.getKindOfApps()) {
                %>

			<option value="<%= kind_of_app.getId() %>">
				<%= kind_of_app.getName() %>
				
			</option>
			<%
                 }
                 %>

		</select>

</br>

		<div>
			<input type="submit" class="btn btn-danger" id="envoie">
		</div>


	</form>





						Groupe
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
							<thead>
								<th>Nom</th>
								<th>Tuteur</th>
								<th>Type d'APP</th>
							</thead>
							<tbody>
						<%
									for(GroupApp group : GroupApp.getGroups()) {
										%>
								<tr style="cursor:pointer" onclick="include_in_dynamic('views/view_group.jsp?id_group=<%= group.getId() %>')">
									<td><%= group.getName() %></td>
									<% User tutor = group.getTutor().getUser();  %>
									<td><%= tutor.getLastName() + " " + tutor.getFirstName() %></td>
									<td><%= group.getKindOfApp().getName() %></td>
								</tr>

								<% } %>
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>