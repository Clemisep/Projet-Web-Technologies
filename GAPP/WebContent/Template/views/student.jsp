<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html>

<body>
    <h1>�l�ves</h1>

        
    <table><thead><tr>Nom</tr><tr>Pr�nom</tr></thead>
    	<tbody>
    <%
	String param = "";
	List<User.Student> students = User.findStudents(param);
	for(int i=0 ; i<students.size() ; ) {
		User user = students.get(i).getUser();%>
    		<tr>
    			<td><%= user.getLastName() %></td>
    			<td><%= user.getFirstName() %></td>
    		</tr>
    		<% } %>
    	</tbody>
    </table>
	
    
</body>

</html>