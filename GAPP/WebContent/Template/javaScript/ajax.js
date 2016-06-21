function include_in(url_page, id_div) {
	$.ajax({
		url: url_page,
		type: "get",
		success: function(response) {
			document.getElementById(id_div).innerHTML = response;
		}
	})
}