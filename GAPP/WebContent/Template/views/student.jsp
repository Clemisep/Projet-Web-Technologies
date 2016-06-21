<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html>

<body>
    <h1>Élèves</h1>
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
        
    <table id="table1" class="mytable filterable">
    	<thead>
    		<th>Numéro élève</th>
    		<th>Nom</th>
    		<th>Prénom</th>
    	</thead>
    	<tbody>
    <%
	String param = "";
	List<User.Student> students = User.findStudents(param);
	for(int i=0 ; i<students.size() ; i++) {
		User user = students.get(i).getUser();%>
    		<tr>
    			<td><%= user.getId() %></td>
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