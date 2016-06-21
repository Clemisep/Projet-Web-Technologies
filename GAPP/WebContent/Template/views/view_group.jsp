<%@ page import="java.util.List"%>
<%@ page import="model.*" %>

<h1>Voir groupe</h1>
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
					<% // GET parameter : id_group
					
					long id_group = Long.parseLong(request.getParameter("id_group"));
					GroupApp.getGroupApp(id_group);
					
					%>
				</div>
			</div>
		</div>
	</div>
</div>