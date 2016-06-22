<%@ page import="java.util.List" %>
<%@ page import="model.*" %>
<!DOCTYPE html>
<html>

<body>
    <h1>Utilisateurs</h1>
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
                    
              
        
    <table id="table1" class="table table-bordered table-hover dataTable">
    	<thead>
    		<th>Pseudo</th>
    		<th>Nom</th>
    		<th>Pr�nom</th>
    	</thead>
    	<tbody>
    <%
	String param = "";
	List<User> users = User.getAllUsers();
	for(User user : users) { %>
    		<tr style="cursor:pointer" onclick="include_in_dynamic('views/profile.jsp?id_user=<%= user.getId() %>')">
    			<td><%= user.getPseudo() %></td>
    			<td><%= user.getLastName() %></td>
    			<td><%= user.getFirstName() %></td>
    		</tr>
    		<% } %>
    	</tbody>
    </table>
    <script type="text/javascript">
		//<![CDATA[
			var tf = new TF('table1');
			tf.AddGrid();
		//]]>
		</script>
	</div>
                </div>
            </div>
        </div>
    </div>
    
</body>

</html>