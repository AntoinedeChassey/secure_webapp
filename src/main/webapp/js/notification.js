var messageCallback = $("#messageCallback").text();
console.log(messageCallback);
if (messageCallback.length > 0) {
	// From login
	if (messageCallback.indexOf("Welcome") !== -1)
		toastr.info(messageCallback);
	// From setPassword
	else if (messageCallback === "Please enter a valid password.")
		toastr.error(messageCallback);
	else if (messageCallback === "Please enter a different password from the ones you already used.")
		toastr.error(messageCallback);
	else if (messageCallback === "New password has been successfully set!")
		toastr.success(messageCallback);

	// From addUser
	else if (messageCallback === "New user has been successfully added!")
		toastr.success(messageCallback);
	else if (messageCallback === "There has been an error while trying to add a new user, double check he does not already exist.")
		toastr.error(messageCallback);
	else if (messageCallback === "There has been an error while trying to add a new user.")
		toastr.error(messageCallback);

	// From reauthenticate
	else if (messageCallback === "You are now authorized to proceed.")
		toastr.info(messageCallback);
	else if (messageCallback === "You are not authorized to proceed.")
		toastr.error(messageCallback);
}