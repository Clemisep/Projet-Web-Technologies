<%@ page import="java.util.List"%>
<%@ page import="model.User"%>
<!DOCTYPE html>
<html ng-app="app" ng-controller="include as incCtrl">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>ISEP | GAPP</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">

<link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">

<script src="plugins/jQuery/jQuery-2.2.0.min.js"></script>

<!-- Calendar -->
<link rel="stylesheet" href="plugins/fullcalendar/fullcalendar.min.css">
<link rel="stylesheet"
	href="plugins/fullcalendar/fullcalendar.print.css" media="print">
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="dist/js/app.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="plugins/fastclick/fastclick.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="plugins/fullcalendar/fullcalendar.min.js"></script>

<!-- JavaScript -->
<script src="javaScript/ajax.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.2/angular.min.js"></script>
<script src="javaScript/app.module.js"></script>
<!-- Controllers -->
<script src="javaScript/register/register.js"></script>
<!--<script src="javaScript/skillManager.spec.js"></script>-->
<!--<script src="javaScript/getStudent.spec.js"></script>-->
<!-- Factories -->

<!--<script src="javaScript/getStudent.factory.spec.js"></script>-->

</head>

<body class="hold-transition skin-blue sidebar-mini">
{{ incCtrl.template }}
	<div hidden id="default_redirect"><% 
		   	String redirect = (String) session.getAttribute("redirect");
		    if(redirect == null) redirect = "views/student.jsp";
		    session.setAttribute("redirect", null);%><%= redirect %></div>
		
		<% 
String addrImg = "";
Object pseudo = session.getAttribute("pseudo");
if(pseudo != null) {
User user = User.findUser((String)pseudo);
if(user.extractAdmin() != null || user.extractTutor()!= null || user.extractResponsible() != null ) {
	addrImg = "img/admin.png";
} else if(user.extractStudent() != null) {
	addrImg = "img/icone_eleve.png";
}
}
	%>

	<div class="wrapper">
		<header class="main-header">

			<!-- Logo -->
			<a href="#" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini">ISEP</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>ISEP</b>GAPP</span>
			</a>

			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- User Account Menu -->
						<li class="dropdown user user-menu">
							<!-- Menu Toggle Button --> <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <!-- The user image in the navbar-->
								<img src="<%= addrImg %>"
								class="user-image" alt="User Image"> <!-- hidden-xs hides the username on small devices so only the image appears. -->
								<span class="hidden-xs"><%= session.getAttribute("pseudo") %></span>
						</a>
							<ul class="dropdown-menu">
								<!-- The user image in the menu -->
								<li class="user-header"><img
									src="<%= addrImg %>"
									class="img-circle" alt="User Image"></li>

								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-left">
										<a href="#" onclick="include_in_dynamic('views/profile.jsp?id_user=<%= request.getSession().getAttribute("id_user") %>')"
											class="btn btn-default btn-flat">Profil</a>
									</div>
									<div class="pull-right">
										<a href="http://localhost:8080/GAPP/Logout"
											class="btn btn-default btn-flat">Déconnexion</a>
									</div>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">

			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">

				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="<%= addrImg %>"
							class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<!-- Professor name -->
						<p></p>
						<!-- Status -->
						<a href="#"></a>
					</div>
				</div>

				

				<!-- Sidebar Menu -->
				<ul class="sidebar-menu">
					<li class="header">Menu</li>
					<!-- Optionally, you can add icons to the links -->
					<li><a href="#" onclick="include_in_dynamic('views/student.jsp')"> <span>Élèves</span>
					</a></li>


					<%
                    if(pseudo != null) {
                    User user = User.findUser((String)pseudo);
                    if(user.extractAdmin() != null || user.extractTutor()!= null || user.extractResponsible() != null ) { %>
                    
					<li><a href="#"> <span> APP et Groupes</span>
					</a>
						<ul class="treeview-menu">

							<li><a href="#"
								onclick="include_in_dynamic('views/skill/app_manager.jsp')"><i
									class="fa fa-circle-o"></i> Type d'APP </a></li>

							<li><a href="#" onclick="include_in_dynamic('views/group.jsp')"> <i
									class="fa fa-circle-o"></i> Gestion des groupes
							</a></li>

							<% }} %>


						</ul></li>
					



					<li><a href="#"
						onclick="include_in_dynamic('views/calendar/hyperplanning.jsp')"> <span>Hyperplanning</span>
					</a></li>

					<% 
                    if(pseudo != null) {
                    User user = User.findUser((String)pseudo);
                    if(user.extractAdmin() != null) { %>
					<li><a href="#" onclick="include_in_dynamic('views/add_user.jsp')"> <span>Ajouter
								utilisateur</span>
					</a></li>
					<% }} %>

				</ul>
				<!-- /.sidebar-menu -->
			</section>
			<!-- /.sidebar -->
		</aside>

		<div class="content-wrapper">
			<section class="content">

				<div id="corps">

				<!-- Your Page Content Here -->
				<div ng-include="incCtrl.template"></div>
				</div>
			</section>
		</div>

		<footer class="main-footer">
			<div class="pull-right hidden-xs">Groupe D</div>
			<strong>Copyright &copy; 2016 <a href="#"
				ng-click="incCtrl.redirect('views/student')">ISEPGAPP</a>.
			</strong> Tous droits réservés.
		</footer>
	</div>
<script src="javaScript/include.js"></script>
</body>


</html>