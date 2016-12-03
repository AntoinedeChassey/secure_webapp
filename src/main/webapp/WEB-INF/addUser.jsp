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

<title>Add User</title>

<!-- Bootstrap CSS -->
<link href="plugins/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="plugins/css/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Checkbox -->
<link href="plugins/css/awesome-bootstrap-checkbox.css" rel="stylesheet">
<!-- Toastr -->
<link href="plugins/css/toastr.min.css" rel="stylesheet">

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
					Add a new user <small>Secure Web Application <i>GTI-619</i></small>
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
				<h1>New User</h1>
				<br>
				<div class="col-md-8">
					<form id="formUser" class="form-horizontal" method="POST">
						<div class="form-group">
							<label class="col-xs-3 control-label">Role</label>
							<div class="col-xs-5">
								<select class="roleName form-control" name="id_role">
									<c:forEach var="role" items="${roles}">
										<option class="text-danger" value="${role.id_role}">${role.name}</option>
									</c:forEach>
								</select>
								<div class="help-block">Pick one</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-3 control-label">Username</label>
							<div class="col-xs-5">
								<input type="email" class="form-control" name="username"
									placeholder="Username" required>
								<div class="help-block">Valid email address</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-3 control-label">Password</label>
							<div class="col-xs-5">
								<input type="password" class="form-control" name="password"
									placeholder="Password" required>
								<div class="help-block">Minimum of: 8 characters with 1
									upper, 1 lower, 1 special</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-3 control-label">Surname</label>
							<div class="col-xs-5">
								<input class="form-control" name="surname" placeholder="Surname"
									required>
								<div class="help-block">Max 10 characters</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-3 control-label">Name</label>
							<div class="col-xs-5">
								<input class="form-control" name="name" placeholder="Name"
									required>
								<div class="help-block">Max 10 characters</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-3 control-label">Country</label>
							<div class="col-xs-5">
								<input class="form-control" name="country" placeholder="Country"
									required>
								<div class="help-block">Max 10 characters</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-3 control-label"></label>
							<div class="col-xs-5">
								<button type="button" class="btn btn-success center-block"
									onclick="validateNewUser()">Submit</button>
							</div>
						</div>
					</form>
					<div id="messageCallback" class="hidden">${messageCallback}</div>
				</div>


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
	<!-- Toastr JS -->
	<script src="plugins/js/toastr.min.js"></script>

	<!-- Custom JS -->
	<script src="js/app_admin.js"></script>
	<script src="js/notification.js"></script>
</body>

</html>