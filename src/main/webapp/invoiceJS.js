function getClients(type){
	if(type == "Supplier") {
		$.ajax({
			url: "http://localhost:7001/IMSWeb/getSuppliers.do",
			method: "GET",
			success: function(resp) {
				var result = JSON.parse(resp);
				$("#dropdownSelection").html("Supplier")
				$("#clientDropdown").show()
				$("#clientNames").html("");
				$.each(result, function(i,item){
					$("#clientNames").append(
							"<li onclick='getProducts(this.id)' id=" + item.clientName + ">" + item.clientName + "</li>"					);
				});
			},
			error: function() {alert("error in supplier")}
		
        });
	}
	else if(type == "Retailer") {
		$.ajax({
			url: "http://localhost:7001/IMSWeb/getRetailers.do",
			method: "GET",
			success: function(resp) {
				var result = JSON.parse(resp);
				$("#dropdownSelection").html("Retailer")
				$("#clientDropdown").show()
				$("#clientNames").html("");
				$.each(result, function(i,item){
					$("#clientNames").append(
						"<li onclick='getProducts(this.id)' id=" + item.clientName + ">" + item.clientName + "</li>");
				});
			},
			error: function() {alert("error in retailer")}
        });
	}
}

function getProducts(client) {
	$("#clientSelection").html(client)
	$("#productDropdown").show()
	$.ajax({
		url: "http://localhost:7001/IMSWeb/getProducts.do",
		method: "GET",
		success: function(resp) {
			var result = JSON.parse(resp);
			$("#productNames").html("")
			$.each(result, function(i, item){
				$("#productNames").append(
						"<li onclick='getProduct(this.id)' id=" + item.productName + ">" + item.productName + "</li>");
			})
		},
		error: function() {alert("error in getProducts()")}
	})
}

function getProduct(product) {
	$("#productSelection").html(product)
	$("#poLine").show()
}