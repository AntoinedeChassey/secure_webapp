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
				<c:import url="menu.jsp"></c:import>
			</div>
			<!-- /.col-md-12 -->

			<div class="col-md-12">

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
										<th>Role</th>
										<th>Id_user</th>
										<th>Username</th>
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
											<td><select class="roleName form-control">
													<c:forEach var="role" items="${roles}">
														<option class="text-danger" value="${role.id_role}">${role.name}</option>
													</c:forEach>
											</select></td>
											<td class="id_user">${user.id_user}</td>
											<td class="username text-success">${user.username}</td>
											<td class="surname">${user.surname}</td>
											<td class="name">${user.name}</td>
											<td class="avatar"><img
												class="avatarTable img-responsive" src="${user.avatar}"
												alt="Profile"></td>
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
										<th>MaxAttempts</th>
										<th>MaxTimeForPhase1</th>
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
											<td class="maxAttempts">${role.maxAttempts}</td>
											<td class="maxTimeForPhase1">${role.maxTimeForPhase1}</td>
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

				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Blocked users</h3>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>Role</th>
										<th>Username</th>
										<th>Surname</th>
										<th>Name</th>
										<th>Avatar</th>
										<th>Country</th>
										<th>Date</th>
										<th>Options</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="user" items="${blockedUsers}" varStatus="loop">
										<tr>
											<td>${loop.index+1}</td>
											<td class="role">${user.role.name}</td>
											<td class="username text-success">${user.username}</td>
											<td class="surname">${user.surname}</td>
											<td class="name">${user.name}</td>
											<td class="avatar"><img
												class="avatarTable img-responsive" src="${user.avatar}"
												alt="Profile"></td>
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
						<h3 class="panel-title">IP Bans</h3>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>IP</th>
										<th>Date</th>
										<th>Options</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="ban" items="${bans}" varStatus="loop">
										<tr>
											<td>${loop.index+1}</td>
											<td class="ip">${ban.ip}</td>
											<td class="date">${ban.date}</td>
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
						<h3 class="panel-title">User connections log</h3>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>Id_user</th>
										<th>Phase</th>
										<th>Attempts</th>
										<th>Date</th>
										<th>Options</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="log" items="${logsConnection}" varStatus="loop">
										<tr>
											<td>${loop.index+1}</td>
											<td class="id_user">${log.id_user}</td>
											<td class="phase">${log.phase}</td>
											<td class="attempts">${log.attempts}</td>
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
	<script src="js/app_admin.js"></script>
</body>

</html>