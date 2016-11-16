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
					Secure Web App <small>GTI-619</small>
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
						<div class="col-md-offset-2">
							<img class="img-responsive" src="img/test.png" alt="">
						</div>
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
									<label><a href="#" onClick="mdpOublie()">Lost
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
					<p>Copyright &copy; ??? - 2016</p>
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
	<!-- 	<script src="js/app.js"></script>
 -->
</body>

</html>




















<!-- 





<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="./img/cloud.png" />

<title>Connexion</title>

Bootstrap Core CSS
<link href="./plugins/css/bootstrap.min.css" rel="stylesheet">

MetisMenu CSS
<link href="./plugins/css/metisMenu.min.css" rel="stylesheet">

Custom CSS
<link href="./plugins/css/sb-admin-2.css" rel="stylesheet">

Custom Fonts
<link href="./plugins/css/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries
WARNING: Respond.js doesn't work if you view the page via file://
[if lt IE 9]>	
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]

</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h2>Sign In</h2>
					</div>
					<div class="panel-body">
						<div id="haut"></div>
						<div id="connexionField">
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
									<div class="checkbox">
										<label> <input name="rememberMe" type="checkbox">Remember
											me
										</label>
									</div>
									Change this to a button or input when using this as a form
									<button type="submit" class="btn btn-lg btn-success btn-block ">Connect</button>
									<hr>
									<div class="small pull-right">
										<label><a href="#" onClick="mdpOublie()">Forgot
												password ?</a></label>
									</div>
								</fieldset>
							</form>
						</div>
						<fieldset id="mdpOublieDiv" class="hidden">
							<div class="text-center">
								<p>If you forgot your password, you can generate a new one
									here.</p>
								<fieldset>
									<div class="form-group">
										<input id="mail" class="form-control" placeholder="E-mail"
											name="mail" type="email">
									</div>
									<button class="btn btn-lg btn-primary btn-block" type="submit"
										onClick="sendMailMdpOublie()">Send</button>
									<hr>
									<div class="small pull-right">
										<label><a href="#" onClick="mdpOublie()">Back <i
												class="fa fa-chevron-circle-right" aria-hidden="true"></i>
										</a></label>
									</div>
								</fieldset>
							</div>
						</fieldset>

					</div>
				</div>
			</div>
		</div>
	</div>



	jQuery
	<script src="./plugins/js/jquery.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

	Bootstrap Core JavaScript
	<script src="./plugins/js/bootstrap.min.js"></script>

	Metis Menu Plugin JavaScript
	<script src="./plugins/js/metisMenu.min.js"></script>

	Custom Theme JavaScript
	<script src="./plugins/js/sb-admin-2.js"></script>

	BootstrapValidator
	<script src="./plugins/js/bootstrapValidator.min.js"
		type="text/javascript"></script>
	<script src="./plugins/js/validationsFormulaires.js"
		type="text/javascript"></script>

	MdP oublié
	<script src="./plugins/js/mdpOublie.js"></script>

</body>
</html> -->