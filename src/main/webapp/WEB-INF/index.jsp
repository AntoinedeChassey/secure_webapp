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
<!-- jGrowl -->
<link href="plugins/css/jquery.jgrowl.min.css" rel="stylesheet">

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
					Welcome <small>Secure Web Application <i>GTI-619</i></small>
				</h1>
			</div>
		</div>
		<!-- /.row -->

		<!-- App Row -->
		<div class="row">
			<div class="col-md-12" id="links">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-primary" onclick="welcome()">
						<i class="fa fa-home fa-fw"></i> Welcome
					</button>
					<button type="button" class="btn btn-warning"
						onclick="administration()">
						<i class="fa fa-gear fa-fw"></i> Administration
					</button>
					<button type="button" class="btn btn-danger" onclick="logout()">
						<i class="fa fa-sign-out fa-fw"></i> Logout
					</button>
				</div>

			</div>
			<!-- /.col-md-12 -->

			<div class="col-md-12">
				<div class="col-md-offset-4">
					<img class="img-responsive" src="img/test.png" alt="">
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
	<!-- jGrowl -->
	<script src="plugins/js/jquery.jgrowl.min.js"></script>

	<!-- Custom JS -->
	<script src="js/app.js"></script>
</body>

</html>