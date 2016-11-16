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
					Hello <small>Secure Web App<i>GTI-619</i></small>
				</h1>
			</div>
		</div>
		<!-- /.row -->

		<!-- App Row -->
		<div class="row">
			<div class="col-md-12">

				<%-- <div class="col-md-6">
					<div class="panel">
						<h3>Debug</h3>
						<hr>
						<h4>Listing 'users'</h4>
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>Username</th>
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
											<td>${user.username}</td>
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

				<div class="col-md-6">
					<div class="panel">
						<h3>Debug</h3>
						<hr>
						<h4>Listing 'applications'</h4>
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>Name</th>
										<th>MAC</th>
										<th>Latitude</th>
										<th>Longitude</th>
										<th>Date</th>
										<th>id_user</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="application" items="${applications}"
										varStatus="loop">
										<tr>
											<td>${loop.index+1}</td>
											<td>${application.name}</td>
											<td>${application.mac}</td>
											<td>${application.latitude}</td>
											<td>${application.longitude}</td>
											<td>${application.date}</td>
											<td>${application.id_user}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div> --%>


				<div class="col-md-4">
					<button onclick="addApplication(${user.id_user});" type="submit"
						class="btn btn-lg btn-success btn-block ">Create new
						thing</button>
				</div>


				<c:forEach var="application" items="${applications}"
					varStatus="loop">
					<div class="col-md-4 application">
						<div class="panel">
							<h3>${application.name}</h3>
							<hr>
							<h4>ID: ${application.id_application}</h4>
							<h4>Mac: ${application.mac}</h4>
							<h4>Latitude: ${application.latitude}</h4>
							<h4>Longitude: ${application.longitude}</h4>
							<div class="row">
								<div class="col-md-12">
									<div class="col-md-6">
										<button
											onclick="showAddressPanel(${application.id_application});"
											type="submit" class="btn btn-primary">Set app
											position</button>
									</div>

									<div class="col-md-6">
										<button
											onclick="deleteApplication(${application.id_application});"
											type="submit" class="btn btn-danger">Delete app</button>
									</div>
								</div>
							</div>

						</div>
					</div>
				</c:forEach>

				<div id="addressPanel" class="col-md-6 col-md-offset-3">
					<div class="panel">
						<h3>Address details</h3>
						<hr>
						<h4>The app will find the closest station from your address</h4>
						<!-- <form id="addressForm" class="form-horizontal" role="form"
							accept-charset="UTF-8" onsubmit="setApplicationGPS()"> -->
						<form id="addressForm" class="form-horizontal" role="form"
							accept-charset="UTF-8">
							<fieldset>
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-2 control-label" for="addressRoad">Address</label>
									<div class="col-sm-10">
										<input id="addressRoad" type="text"
											placeholder="Ex: 275 Rue Notre-Dame E" class="form-control">
									</div>
								</div>

								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-2 control-label" for="addressCity">City</label>
									<div class="col-sm-10">
										<input id="addressCity" type="text" placeholder="Ex: Montréal"
											class="form-control">
									</div>
								</div>

								<!-- Text input-->
								<div class="form-group">
									<!-- <label class="col-sm-2 control-label" for="addressState">State</label>
									<div class="col-sm-4">
										<input id="addressState" type="text" placeholder="State" class="form-control">
									</div> -->

									<label class="col-sm-2 control-label" for="addressPostcode">Postcode</label>
									<div class="col-sm-10">
										<input id="addressPostcode" type="text"
											placeholder="Ex: QC H2Y 1C6" class="form-control">
									</div>
								</div>



								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-2 control-label" for="addressCountry">Country</label>
									<div class="col-sm-10">
										<input id="addressCountry" type="text"
											placeholder="Ex: Canada" class="form-control">
									</div>
								</div>
								<div class="col-md-6 col-md-offset-3">
									<button type="submit" class="btn btn-lg btn-info btn-block ">Save</button>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
				<!-- /.col-lg-12 -->



				<!--<div class="col-md-6 portfolio-item">
<a href="#">
<img class="img-responsive" src="http://placehold.it/700x400" alt="">
</a>
<h3>
<a href="#">Lorem ipsum</a>
</h3>
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
</div>-->
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
	<!-- MQTT -->
	<script src="plugins/js/mqttws31.js"></script>
	<!-- jGrowl -->
	<script src="plugins/js/jquery.jgrowl.min.js"></script>
	<!-- Google Maps -->
	<script type="text/javascript"
		src="http://maps.google.com/maps/api/js?key=AIzaSyCslUeLAhNWrTFRofsZIRMovnq238Tm_Fg"></script>

	<!-- Custom JS -->
	<script src="js/app.js"></script>
</body>

</html>