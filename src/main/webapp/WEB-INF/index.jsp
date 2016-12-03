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