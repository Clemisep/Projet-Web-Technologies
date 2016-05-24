<<<<<<< HEAD
<%@ page import="model.*" %>

<!DOCTYPE html>
<html>

<body>
    <h1>
    Groupes
    </h1>
    <div class="box">
        <!-- /.box-header -->
        <div class="box-body">
            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                <div class="row">
                    <div class="col-sm-6">
                    </div>
                    <div class="col-sm-6"></div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                            <thead>
                                <tr role="row">
                                    <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="CompÃ©tences: activate to sort column descending">Nom PrÃ©nom</th>
                                    <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Niveau demandÃ©: activate to sort column ascending">Groupe</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                </tr>
                                <tr role="row" class="even">
                                    <td class="sorting_1"></td>
                                    <td> </td>
                                    <td></td>
                                </tr>
                            </tbody>

                            <tfoot>
                                <tr>
                                    <th rowspan="1" colspan="1">Nom Prenom</th>
                                    <th rowspan="1" colspan="1">Groupe</th>
                                </tr>
                            </tfoot>
                        </table>
                        
                        
                                <%
									for(GroupApp group : GroupApp.getGroups()) {
										%>
										Groupe
                        <table>
                        	<thead><tr>
                        		<th>Nom</th>
                        		<th>Prénom</th>
                        	</tr></thead>
                        	<tbody>
                        	<% for(User.Student student : group.getStudents()) {
                        		User user = student.getUser();
                        		%>
                        		<tr>
                        			<td><%= user.getLastName() %></td>
                        			<td><%= user.getFirstName() %></td>
                        		</tr>
                        		
                        		<% } %>
                        	</tbody>
                        </table>
                        
										<%
									}
								%>
                    </div>
                </div>
            </div>
        </div>
    </div>
=======
<%@ page import="model.*"%>

<!DOCTYPE html>
<html>

<body>
	<h1>Groupes</h1>
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
									for(GroupApp group : GroupApp.getGroups()) {
										%>
						Groupe
						<table class="table table-bordered table-hover dataTable">
							<thead>
								<th>Nom</th>
								<th>Prénom</th>
							</thead>
							<tbody>
								<% for(User.Student student : group.getStudents()) {
                        		User user = student.getUser();
                        		%>
								<tr>
									<td><%= user.getLastName() %></td>
									<td><%= user.getFirstName() %></td>
								</tr>

								<% } %>
							</tbody>
						</table>

						<%
									}
								%>
					</div>
				</div>
			</div>
		</div>
	</div>
>>>>>>> branch 'Rbranch' of https://github.com/Clemisep/Projet-Web-Technologies
</body>

</html>