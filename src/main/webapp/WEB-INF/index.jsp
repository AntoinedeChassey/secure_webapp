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

<title>Home</title>

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
					Home <small>Secure Web Application <i>GTI-619</i></small>
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
				<h1>Welcome</h1>
				<div class="col-md-4">
					<div class="list-group">
						<a href="#" class="list-group-item active"><b>${user.username}</b>
							<img id="avatar" class="pull-right img-responsive"
							src="${user.avatar}" alt="Profile"></a> <a href="#"
							class="list-group-item">${user.surname}</a> <a href="#"
							class="list-group-item">${user.name}</a><a href="#"
							class="list-group-item">${user.country}</a> <a href="#"
							class="list-group-item">${user.date}</a> <a href="#"
							class="list-group-item"><button type="button"
								class="btn btn-success center-block" onclick="setPassword()">
								<i class="fa fa-key fa-fw"></i> Set password
							</button></a>
					</div>
				</div>
				<div class="col-md-8">
					<form id="formPassword" class="form-horizontal" method="POST">
						<div class="form-group">
							<label class="col-xs-3 control-label">Password</label>
							<div class="col-xs-5">
								<input type="password" class="form-control" name="newPassword"
									placeholder="Password" required>
								<div class="help-block">Minimum of 8 characters</div>
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
</body>

</html>