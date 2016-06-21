<%@ page import="java.util.List"%>
<%@ page import="model.*"%>
<!DOCTYPE html>
<html>

<body>
	<h1>APP</h1>
	<br>
	<br>
	<div>
		<form action="http://localhost:8080/GAPP/AddApp" method="post">
			<div class="form-group">
				<label>Type d'APP</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-file-picture-o"></i>
					</div>
					<input type="text" class="form-control" id="name" name="name"
						required>
				</div>
				<!-- /.input group -->
			</div>


			<div class="form-group">
				<label>Responsable APP</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-user"></i>
					</div>



					<select class="form-control" id="id_responsible"
						name="id_responsible" required>
						<%
                  List<User.Responsible> responsibles =  User.getAllResponsibles();
                 for (User.Responsible responsible : responsibles) {
                %>

						<option value="<%= responsible.getId() %>">
							<%= responsible.getUser().getLastName()%>
							<%= responsible.getUser().getFirstName()%>
						</option>
						<%
                 }
                 %>

					</select>
				</div>
				<!-- /.input group -->
			</div>

			<div class="form-group">
				<label>Description</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-user"></i>
					</div>
					<textarea type="text" id="description" name="description"> Description de l'APP</textarea>
				</div>
				<!-- /.input group -->
			</div>

			<div>
				<input type="submit" class="btn btn-danger" id="envoie">
			</div>


		</form>

	</div>

	</br>







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





						<table id="table2" class="table table-bordered table-hover dataTable">
							<thead>
								<th>Nom APP</th>
								
								<th>Description</th>
							</thead>
							<tbody>
								<%
	String param = "";
								List<KindOfApp> kindOfApps = KindOfApp.getKindOfApps();
	for(KindOfApp kindOfApp : kindOfApps) {
%>								<tr>
									<td><%= kindOfApp.getName() %></td>
									
									<td><%= kindOfApp.getDescription() %></td>
								</tr>
								
																
								<% } %>
							</tbody>
						</table>
						<script type="text/javascript">
		//<![CDATA[
			var tf = new TF('table2');
			tf.AddGrid();
		//]]>
		</script>









				
					</div>
				</div>
			</div>
		</div>
		<!-- /.box-body -->
	</div>
	

	<div></div>












</body>

</html>