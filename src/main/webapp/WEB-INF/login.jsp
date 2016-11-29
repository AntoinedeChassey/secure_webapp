<%@ page pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Login</title>

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
					Login <small>Secure Web Application <i>GTI-619</i></small>
				</h1>
			</div>
		</div>
		<!-- /.row -->

		<!-- Projects Row -->
		<div class="row">
			<div class="col-md-12">		

				<div class="col-md-6 col-md-offset-3">

					<div class="panel">
						<h3>Sign in</h3>
						<hr>
						<h4>Type in your information</h4>
						<form name="connexion" method="POST" role="form">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="Username"
										name="username" type="email" autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Password"
										name="password" type="password">
								</div>
								<div class="form-group">
									<div class="checkbox checkbox-success">
										<input id="rememberMe" class="styled" type="checkbox"
											name="rememberMe"> <label for="rememberMe">Remember
											me</label>
									</div>
								</div>
								<div class="col-md-6 col-md-offset-3">
									<button type="submit" class="btn btn-lg btn-success btn-block ">Go!</button>
								</div>
								<br>
								<div class="small pull-right">
									<label><a href="#" onClick="forgotPassword()">Lost
											password ?</a></label>
								</div>
							</fieldset>
						</form>
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

	<!-- Custom JS -->
	<!-- 	<script src="js/app.js"></script>
 -->
</body>

</html>