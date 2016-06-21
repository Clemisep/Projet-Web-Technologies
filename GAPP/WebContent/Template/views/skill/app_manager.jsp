<%@ page import="java.util.List"%>
<%@ page import="model.User"%>
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
					<input type="text" class="form-control" id="type" name="type"
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



					<select class="form-control" id="id_tutor" name="id_tutor"
						required>
						<%
                  List<User.Responsible> responsibles=  User.getAllResponsibles();
                 for (User.Responsible responsible : responsibles) {
                %>

						<option>
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
				<label>Responsable APP</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-user"></i>
					</div>
					<input type"text" id="id_group_app" name="id_group_app">
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
						<table id="example2"
							class="table table-bordered table-hover dataTable" role="grid"
							aria-describedby="example2_info">
							<thead>
								<tr role="row">

									<th class="sorting_asc" tabindex="1" aria-controls="example2"
										rowspan="1" colspan="1" aria-sort="ascending"
										aria-label="skill: activate to sort column descending">Nom
										du Type d'APP</th>




									<th class="sorting_asc" tabindex="2" aria-controls="example2"
										rowspan="1" colspan="1" aria-sort="ascending"
										aria-label="subSkill: activate to sort column descending">Responsable
										APP</th>
								</tr>
							</thead>
							<tbody>
								<!-- Dynamic data display -->
								<tr>
									<th></th>
									<th></th>
									<th></th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- /.box-body -->
	</div>
	<div ng-show="skmCtrl.show" class="box box-primary">
		<br>
		<form>
			<label>Nouveau Type d'APP : </label> <input type="text"
				ng-model="skmCtrl.skillInput"> <br> <br> <label>Nouvelle
				sous-compétence : </label> <input type="text"
				ng-model="skmCtrl.subSkillInput"> <br> <br> <input
				type="button" class="btn btn-sm btn-info btn-flat pull-left"
				value="Ajouter une sous-compétence" ng-click="skmCtrl.addSubSkill()" />
			<br> <br>
		</form>
	</div>

	<div></div>












</body>

</html>