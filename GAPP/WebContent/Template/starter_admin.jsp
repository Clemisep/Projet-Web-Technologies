<!DOCTYPE html>
<html ng-app="app" ng-controller="include as incCtrl">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>ISEP | GAPP</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">

    <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">

    <script src="plugins/jQuery/jQuery-2.2.0.min.js"></script>

    <!-- Calendar -->
    <link rel="stylesheet" href="plugins/fullcalendar/fullcalendar.min.css">
    <link rel="stylesheet" href="plugins/fullcalendar/fullcalendar.print.css" media="print">
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="dist/js/app.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <script src="plugins/fastclick/fastclick.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
    <script src="plugins/fullcalendar/fullcalendar.min.js"></script>

    <!-- JavaScript -->
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.2/angular.min.js"></script>
    <script src="javaScript/app.module.js"></script>
    <!-- Controllers -->
    <script src="javaScript/include.js"></script>
    <script src="javaScript/register/register.js"></script>
    <!--<script src="javaScript/skillManager.spec.js"></script>-->
    <!--<script src="javaScript/getStudent.spec.js"></script>-->
    <!-- Factories -->
    <script src="javaScript/register/comparePassword.factory.js"></script>
    <!-- <script src="javaScript/register/passwordValidator.factory.js"></script> -->
    <!--<script src="javaScript/getStudent.factory.spec.js"></script>-->


    <!-- Tableau -->
<script type="text/javascript" src="http://tablefilter.free.fr/TableFilter/tablefilter.js"></script>  
	
</head>

<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
        <header class="main-header">

            <!-- Logo -->
            <a href="#" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini">ISEP</span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg"><b>ISEP</b>GAPP</span>
            </a>

            <!-- Header Navbar -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>
                <!-- Navbar Right Menu -->
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <!-- User Account Menu -->
                        <li class="dropdown user user-menu">
                            <!-- Menu Toggle Button -->
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <!-- The user image in the navbar-->
                                <img src="http://perso.isep.fr/msellami/images/moi.JPG" class="user-image" alt="User Image">
                                <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                <span class="hidden-xs"><%= session.getAttribute("pseudo") %></span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- The user image in the menu -->
                                <li class="user-header">
                                    <img src="http://perso.isep.fr/msellami/images/moi.JPG" class="img-circle" alt="User Image">

                                    <p>
                                        page accueil
                                        <small>Administrateur</small>
                                    </p>
                                </li>

                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="#" ng-click="incCtrl.redirect('views/profile')" class="btn btn-default btn-flat">Profile</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="#" class="btn btn-default btn-flat">Sign out</a>
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
                        <img src="http://perso.isep.fr/msellami/images/moi.JPG" class="img-circle" alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <!-- Professor name -->
                        <p></p>
                        <!-- Status -->
                        <a href="#"></a>
                    </div>
                </div>

                <!-- search form -->
                <form action="#" method="get" class="sidebar-form">
                    <div class="input-group">
                        <input type="text" name="q" class="form-control" placeholder="Élève/Groupe">
                        <span class="input-group-btn">
					<button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
					</button>
				  </span>
                    </div>
                </form>
                <!--/.search form -->

                <!-- Sidebar Menu -->
                <ul class="sidebar-menu">
                    <li class="header">Menu</li>
                    <!-- Optionally, you can add icons to the links -->
                    <li>
                        <a href="#" ng-click="incCtrl.redirect('student')">
                            <span>Élèves</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" ng-click="incCtrl.redirect('group')">
                            <span>Groupes</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span>Compétences</span>
                        </a>

                        <ul class="treeview-menu">
                            <li>
                                <a href="#" ng-click="incCtrl.redirect('skill/skill_manager')"> <i class="fa fa-circle-o"></i> Famille de compétences</a>
                            </li>
                            <li>
                                <a href="#" ng-click="incCtrl.redirect('skill/skill_assigner')"> <i class="fa fa-circle-o"></i> Compétences élèves</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" ng-click="incCtrl.redirect('calendar/calendar')">
                            <span>Calendrier</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" ng-click="incCtrl.redirect('calendar/hyperplanning')">
                            <span>Hyperplanning</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" ng-click="incCtrl.redirect('add_user')">
                            <span>Ajouter utilisateur</span>
                        </a>
                    </li>
                    
                </ul>
                <!-- /.sidebar-menu -->
            </section>
            <!-- /.sidebar -->
        </aside>

        <div class="content-wrapper">
            <section class="content">

                <!-- Your Page Content Here -->
                <div ng-include="incCtrl.template">

                </div>

            </section>
        </div>

        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                Groupe D
            </div>
            <strong>Copyright &copy; 2016 <a href="#" ng-click="incCtrl.redirect('views/student')">ISEPGAPP</a>.</strong>            Tous droits réservés.
        </footer>
    </div>
</body>

</html>