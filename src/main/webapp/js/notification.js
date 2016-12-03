var messageCallback = $("#messageCallback").text();
if (messageCallback.length > 0) {
	if (messageCallback.search("successfully") == -1)
		toastr.error(messageCallback);
	else
		toastr.success(messageCallback);
}