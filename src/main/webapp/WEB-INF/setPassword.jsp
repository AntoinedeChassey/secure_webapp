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

<title>Set Password</title>

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
					Set your password <small>Secure Web Application <i>GTI-619</i></small>
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
				<h1>Change your password below</h1>
				<br>
				<div class="col-md-8">
					<form id="formPassword" class="form-horizontal" method="POST">
						<div class="form-group">
							<label class="col-xs-3 control-label">New password</label>
							<div class="col-xs-5">
								<input type="password" class="form-control" name="newPassword"
									placeholder="Password" required>
								<div class="help-block">Minimum of: 8 characters with 1
									upper, 1 lower, 1 special</div>
							</div>
						</div>

						<div class="form-group">

							<label class="col-xs-3 control-label">Retype password</label>
							<div class="col-xs-5">
								<input type="password" class="form-control"
									name="confirmNewPassword" placeholder="Re-enter Password"
									required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-3 control-label"></label>
							<div class="col-xs-5">
								<button type="button" class="btn btn-success center-block"
									onclick="validatePassword()">Submit</button>
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
	<script src="js/app.js"></script>
	<script src="js/notification.js"></script>
</body>

</html>