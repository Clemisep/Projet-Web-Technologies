<%@ page import="java.util.List" %>
<%@ page import="model.*"%>

<!DOCTYPE html>
<html>

<body>
	<h1>Mes groupes</h1>




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
								<th>Type d'APP</th>
							</thead>
							<tbody>
						<%
						User user = User.getUser(((Long)session.getAttribute("id_user")).longValue());
						User.Tutor tutor = user.extractTutor();
						
									for(GroupApp group : tutor.getMyGroups()) {
										%>
								<tr style="cursor:pointer" onclick="include_in_dynamic('views/view_group.jsp?id_group=<%= group.getId() %>')">
									<td><%= group.getName() %></td>
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