window.onload = function() {
	var timeLeft = $('#waitTimeLeft').text();

	setInterval(function() {
		timeLeft--;
		if (timeLeft >= 0) {
			span = document.getElementById("waitTimeLeft");
			span.innerHTML = "Please wait for " + timeLeft
					+ " seconds before retrying.";
		}
		// Display 'counter' wherever you want to display it.
		if (timeLeft === 0) {
//			window.location.href = "login";
			span = document.getElementById("waitTimeLeft");
			span.remove();
			clearInterval(timeLeft);
		}

	}, 1000);
}