function selectClientType(type){
	if(type===21) {
		$("#dropdown").html("Supplier");
		$.ajax({
			headers: {          
				Accept : "application/json"
			},
			url: "getSuppliers.do",
			method: "GET",
			success: function(resp){
				
			}

		})
	} else {
		$("#dropdown").html("Retailer")
	}
}