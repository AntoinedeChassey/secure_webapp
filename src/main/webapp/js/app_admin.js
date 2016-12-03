function home() {
	window.location.href = "home";
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

function setPassword() {
	window.location.href = "setPassword";
}

function addUser() {
	window.location.href = "addUser";
}

function administration() {
	window.location.href = "administration";
}

function validatePassword_newUser() {
	var newPassword = $('input[name=password]').val();
	var specialChars = "<>@!#$%^&*()_+[]{}?:;|'\"\\,./~`-";

	var checkSpecialChar = function(string) {
		for (i = 0; i < specialChars.length; i++) {
			if (string.indexOf(specialChars[i]) > -1) {
				return true;
			}
		}
		return false;
	}

	if (newPassword.length == 0) {
		console.log("null");
		return toastr.error("The password need to be filled!");
	} else if (newPassword.length <= 7) {
		console.log("too_short");
		return toastr.error("The password is too short!");
	} else if (newPassword.length >= 20) {
		console.log("too_long");
		return toastr.error("The password is too long!");
	} else if (newPassword.search(/\d/) == -1) {
		console.log("no_num");
		return toastr.error("The password must contain a number!");
	} else if (newPassword.search(/[A-Z]/) == -1) {
		console.log("no_upper_letter");
		return toastr.error("The password must contain an upper case letter!");
	} else if (newPassword.search(/[a-z]/) == -1) {
		console.log("no_lower_letter");
		return toastr.error("The password must contain a lower case letter!");
	} else if (!checkSpecialChar(newPassword)) {
		console.log("no_special_char");
		return toastr.error("The password must contain a special character!");
	}
	return true;
}

function validateString(str) {
	if (str.length > 0 && str.length <= 10) {
		// regexp /[^a-z\s]/i
		var regex = /^[a-zA-Z\s]+$/;
		if (regex.test(str))
			return true;
		else
			return toastr.error("Please type letters only!");
	} else {
		return toastr
				.error("Please fill the fields and respect the maximum characters allowed.");
	}
}

function validateNewUser() {
	if (validatePassword_newUser() == true
			&& validateString($('input[name=surname]').val()) == true
			&& validateString($('input[name=name]').val()) == true
			&& validateString($('input[name=country]').val()) == true) {
		$('#formUser').submit();
		console.log("Good input");
	}
}

function validatePassword() {
	var newPassword = $('input[name=newPassword]').val();
	var confirmNewPassword = $('input[name=confirmNewPassword]').val();
	var specialChars = "<>@!#$%^&*()_+[]{}?:;|'\"\\,./~`-";

	var checkSpecialChar = function(string) {
		for (i = 0; i < specialChars.length; i++) {
			if (string.indexOf(specialChars[i]) > -1) {
				return true;
			}
		}
		return false;
	}

	if (newPassword != confirmNewPassword) {
		return toastr.error("The passwords must match!");
	} else {
		if (newPassword.length == 0) {
			console.log("null");
			return toastr.error("The passwords need to be filled!");
		} else if (newPassword.length <= 7) {
			console.log("too_short");
			return toastr.error("The passwords are too short!");
		} else if (newPassword.length >= 20) {
			console.log("too_long");
			return toastr.error("The passwords are too long!");
		} else if (newPassword.search(/\d/) == -1) {
			console.log("no_num");
			return toastr.error("The passwords must contain a number!");
		} else if (newPassword.search(/[A-Z]/) == -1) {
			console.log("no_upper_letter");
			return toastr
					.error("The passwords must contain an upper case letter!");
		} else if (newPassword.search(/[a-z]/) == -1) {
			console.log("no_lower_letter");
			return toastr
					.error("The passwords must contain a lower case letter!");
		} else if (!checkSpecialChar(newPassword)) {
			console.log("no_special_char");
			return toastr
					.error("The passwords must contain a special character!");
		}
		// toastr.options.onHidden = function() {
		// $('#formPassword').submit();
		// }
		// toastr.options.timeOut = 1000;
		$('#formPassword').submit();
		console.log("Good input");
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