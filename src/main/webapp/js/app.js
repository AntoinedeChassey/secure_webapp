function home() {
	window.location.href = "home";
}

function administration() {
	window.location.href = "administration";
}

function logout() {
	window.location.href = "logout";
}

function carre() {
	window.location.href = "carre";
}

function cercle() {
	window.location.href = "cercle";
}

var isShown = false;
function setPassword() {
	if (isShown) {
		$('#formPassword').hide();
		isShown = false;
	} else {
		promptForPassword();
		isShown = true;
	}
}

function promptForPassword() {
	$('#formPassword').show();
}

function validatePassword() {
	var newPassword = $('input[name=newPassword]').val();
	var confirmNewPassword = $('input[name=confirmNewPassword]').val();
	if (newPassword != confirmNewPassword) {
		toastr.error("The passwords must match!");
	} else {
		if (newPassword.length <= 7) {
			console.log("too_short");
			return toastr.error("The passwords are too short!");
		} else if (newPassword.length >= 20) {
			console.log("too_long");
			return toastr.error("The passwords are too long!");
		} else if (newPassword.search(/\d/) == -1) {
			console.log("no_num");
			return toastr.error("The passwords must contain a number!");
		} else if (newPassword.search(/[a-zA-Z]/) == -1) {
			console.log("no_letter");
			return toastr.error("The passwords must contain a letter!");
		} else if (newPassword.search(/[^a-zA-Z0-9\!\@\#\$\%\^\&\*\(\)\_\+]/) != -1) {
			console.log("bad_char");
			return toastr.error("The passwords contain bad characters!");
		}
		toastr.options.onHidden = function() {
			$('#formPassword').submit();
		}
		toastr.options.timeOut = 1000;
		return "ok";
	}
}

$('.updateUser')
		.click(
				function() {
					var row = $(this).closest('tr');
					var id_user = row.find('td.id_user').text();
					var roleName = row.find('select.roleName')
							.find(":selected").text();
					var username = row.find('td.username').text();
					var password = row.find('td.password').text();
					var surname = row.find('td.surname').text();
					var name = row.find('td.name').text();
					var avatar = row.find('td.avatar').text();
					var country = row.find('td.country').text();
					var date = row.find('td.date').text();
					console.log(id_user + "," + roleName + "," + username + ","
							+ password + "," + surname + "," + name + ","
							+ avatar + "," + country + "," + date);
				});

$('.deleteUser')
		.click(
				function() {
					var row = $(this).closest('tr');
					bootbox
							.confirm({
								message : "<h3 class='text-danger'>Are you sure you want to delete this user?</h3>",
								buttons : {
									confirm : {
										label : 'Yes',
										className : 'btn-success'
									},
									cancel : {
										label : 'No',
										className : 'btn-danger'
									}
								},
								callback : function(result) {
									console
											.log('This was logged in the callback: '
													+ result);
									if (result) {
										var id_user = row.find('td.id_user')
												.text();
										var roleName = row.find(
												'select.roleName').find(
												":selected").text();
										var username = row.find('td.username')
												.text();
										var password = row.find('td.password')
												.text();
										var surname = row.find('td.surname')
												.text();
										var name = row.find('td.name').text();
										var avatar = row.find('td.avatar')
												.text();
										var country = row.find('td.country')
												.text();
										var date = row.find('td.date').text();
										row.remove();

										console.log(id_user + "," + roleName
												+ "," + username + ","
												+ password + "," + surname
												+ "," + name + "," + avatar
												+ "," + country + "," + date);
									}
								}
							});
				});

$('.updateRole').click(function() {
	var row = $(this).closest('tr');
	var id_role = row.find('td.id_role').text();
	var name = row.find('td.name').text();
	var maxInactiveInterval = row.find('td.maxInactiveInterval').text();
	console.log(id_role + "," + name + "," + maxInactiveInterval);
});

$('.deleteRole')
		.click(
				function() {
					var row = $(this).closest('tr');
					bootbox
							.confirm({
								message : "<h3 class='text-danger'>Are you sure you want to delete this role?</h3>",
								buttons : {
									confirm : {
										label : 'Yes',
										className : 'btn-success'
									},
									cancel : {
										label : 'No',
										className : 'btn-danger'
									}
								},
								callback : function(result) {
									console
											.log('This was logged in the callback: '
													+ result);
									if (result) {
										var id_role = row.find('td.id_role')
												.text();
										var name = row.find('td.name').text();
										var maxInactiveInterval = row.find(
												'td.maxInactiveInterval')
												.text();
										row.remove();
										console.log(id_role + "," + name + ","
												+ maxInactiveInterval);
									}
								}
							});
				});