<%@ page import="java.util.List" %>
<<<<<<< HEAD
<%@ page import="model.*" %>

{
	students: [

<%
String param = request.getParameter("start");
if(param == null) param = "";
List<User.Student> students = User.findStudents(param);
for(int i=0 ; i<students.size() ; ) {
	User user = students.get(i).getUser();%>
	{
	 "first_name": "<%= user.getFirstName() %>",
	 "last_name":  "<%= user.getLastName() %>"
	}
	<% if(++i < students.size()) { %> , <% }
}
%>
]
}
=======
<%@ page import="model.User" %>
<!DOCTYPE html>
<html>

<body>
    <h1>Élèves</h1>

    <!--<div ng-controller="getStudent as getSCtrl">
        <button>Fetch data from server</button>
        <div ng-repeat="student in getSCtrl.data.students">
            {{ getSCtrl.student.firstName }} {{ getSCtrl.student.lastName }}
        </div>
    </div>-->
    
    <table><thead><tr>Nom</tr><tr>Prénom</tr></thead>
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
>>>>>>> branch 'Rbranch' of https://github.com/Clemisep/Projet-Web-Technologies
