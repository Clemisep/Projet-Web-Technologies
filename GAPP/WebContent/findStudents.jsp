<%@ page import="java.util.List" %>
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
