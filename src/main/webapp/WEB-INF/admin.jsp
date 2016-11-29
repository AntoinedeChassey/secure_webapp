<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Administration</title>

<!-- Bootstrap CSS -->
<link href="plugins/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="plugins/css/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Checkbox -->
<link href="plugins/css/awesome-bootstrap-checkbox.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/app.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

</head>

<body>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Header -->
		<div class="row">
			<div class="col-md-12">
				<h1 class="page-header">
					Administration <small>Secure Web Application <i>GTI-619</i></small>
				</h1>
			</div>
		</div>
		<!-- /.row -->


		<!-- App Row -->
		<div class="row">
			<div class="col-md-12" id="links">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-primary" onclick="home()">
						<i class="fa fa-home fa-fw"></i> Home
					</button>
					<button type="button" class="btn btn-warning"
						onclick="administration()">
						<i class="fa fa-gear fa-fw"></i> Administration
					</button>
					<button type="button" class="btn btn-danger" onclick="logout()">
						<i class="fa fa-sign-out fa-fw"></i> Logout
					</button>
				</div>
				<!-- /.col-md-12 -->
			</div>

			<div class="col-md-12">

				<!--
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">View users</h3>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>id_user</th>
										<th>Role - id_role</th>
										<th>Role - name</th>
										<th>Role - maxInactiveInterval</th>
										<th>Username</th>
										<th>Password</th>
										<th>Surname</th>
										<th>Name</th>
										<th>Avatar</th>
										<th>Country</th>
										<th>Date</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="user" items="${users}" varStatus="loop">
										<tr>
											<td>${loop.index+1}</td>
											<td>${user.id_user}</td>
											<td>${user.role.id_role}</td>
											<td class="text-danger"><b>${user.role.name}</b></td>
											<td>${user.role.maxInactiveInterval}</td>
											<td class="text-success">${user.username}</td>
											<td>********</td>
											<td>${user.surname}</td>
											<td>${user.name}</td>
											<td>${user.avatar}</td>
											<td>${user.country}</td>
											<td>${user.date}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- /.panel -->


				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Users</h3>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>id_user</th>
										<th>Role</th>
										<th>Username</th>
										<th>Password</th>
										<th>Surname</th>
										<th>Name</th>
										<th>Avatar</th>
										<th>Country</th>
										<th>Date</th>
										<th>Options</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="user" items="${users}" varStatus="loop">
										<tr>
											<td>${loop.index+1}</td>
											<td class="id_user">${user.id_user}</td>
											<td><select class="roleName form-control">
													<c:forEach var="role" items="${roles}">
														<option class="text-danger">${role.name}</option>
													</c:forEach>
											</select></td>
											<td class="username text-success">${user.username}</td>
											<td class="password">********</td>
											<td class="surname">${user.surname}</td>
											<td class="name">${user.name}</td>
											<td class="avatar">${user.avatar}</td>
											<td class="country">${user.country}</td>
											<td class="date">${user.date}</td>
											<td><i class="updateUser fa fa-wrench fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;<i
												class="deleteUser fa fa-trash fa-lg"></i></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- /.panel -->


				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Roles</h3>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>id_role</th>
										<th>Name</th>
										<th>MaxInactiveInterval</th>
										<th>Options</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="role" items="${roles}" varStatus="loop">
										<tr>
											<td>${loop.index+1}</td>
											<td class="id_role">${role.id_role}</td>
											<td class="name">${role.name}</td>
											<td class="maxInactiveInterval">${role.maxInactiveInterval}</td>
											<td><i class="updateRole fa fa-wrench fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;<i
												class="deleteRole fa fa-trash fa-lg"></i></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- /.panel -->



			</div>
			<!-- /.col-md-12 -->
		</div>
		<!-- /.row -->



		<!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-md-12">
					<p>Copyright &copy; LAB5 - 2016</p>
				</div>
			</div>
			<!-- /.row -->
		</footer>

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="plugins/js/jquery-2.2.4.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="plugins/js/bootstrap.min.js"></script>
	<!-- Bootbox JS -->
	<script src="plugins/js/bootbox.min.js"></script>
	
	<!-- Custom JS -->
	<script src="js/app.js"></script>
</body>

</html>