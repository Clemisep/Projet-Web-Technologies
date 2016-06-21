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
</body>

</html>