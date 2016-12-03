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