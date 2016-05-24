<%@ page import="model.*"%>
<!DOCTYPE html>
<html>

<body>
	<h1>Compétences</h1>
	<br>
	<br>
	<div>
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
						<label>Type de groupe : </label>
						<input type="text" name="skillInput" placeholder="TECHNOLOGIE WEB" class="form-control input-sm" ng-model="groupT">
						<br><br>
						<%! String groupType; %>
						<% groupType=request.getParameter("skillInput");%>
						
							<table class="table table-bordered table-hover dataTable">
								<thead>
									<tr role="row">
										<th><input type="checkbox" /></th>
										<th>Compétence</th>
										<th>Sous-compétence</th>
									</tr>
								</thead>
								<tbody>
									<!-- Dynamic data display -->
									
									<tr>
										<th><%= groupType%></th>
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
				<label>Nouvelle compétence : </label> <input type="text"
					ng-model="skmCtrl.skillInput"> <br> <br> <label>Nouvelle
					sous-compétence : </label> <input type="text"
					ng-model="skmCtrl.subSkillInput"> <br> <br> <input
					type="button" class="btn btn-sm btn-info btn-flat pull-left"
					value="Ajouter une sous-compÃ©tence"
					ng-click="skmCtrl.addSubSkill()" /> <br> <br>
			</form>
		</div>

		<div>
			<a href="" class="btn btn-sm btn-info btn-flat pull-left">Modifier
				compétence</a>
		</div>
		<div>
			<a href="" class="btn btn-sm btn-info btn-flat pull-left"
				ng-click="skmCtrl.showPanel()">Ajouter compétence</a>
		</div>

	</div>
</body>

</html>