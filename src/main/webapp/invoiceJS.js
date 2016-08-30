var row = 0;
var products = []

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

function updateTotal(numberOrdered, id) {
	alert(id)
	var product = products[id]
	var retailPrice = product.retailPrice
	var total = numberOrdered * retailPrice;
	$("#total").html(totalOrderPrice)
	$("#totalPrice" + id).html(total)
}

function addrow() {
	row = row + 1;
	$("#finalRow").html("")
	$("#tbody").append("<tr>" +
			"<td>" +
			"<div id='productDropdown2' class='dropdown'>" +
			"<button class='btn btn-default dropdown-toggle' type='button' id='dropdownMenu2' data-toggle='dropdown' aria-haspopup='true' aria-expanded='true'>" +
		    "<span id='productSelection2'>Product</span>" +
		    "<span class='caret'></span>" +
		    "</button>" +
		    "<ul id='row" + row + "'class='dropdown-menu' aria-labelledby='dropdownMenu2'/>" +
		    "</div>" +
		    "</td>" +
		    "<div id='poLine2'>" +
		    "<td><span id='pricePerItem" + row + "' ></span></td>" +
		    "<td><input id='" + row + "' type='number' onchange='updateTotal(this.value, this.id)' value='1' /></td>" + 
			"<td><span id='totalPrice" + row + "' ></span></td>" +
			"</div>" +
			"</tr>" + "<tr id='finalRow'><td></td><td></td><td></td><td id='total'></td></tr>")
			populateDropdown()
}

function populateDropdown() {
	$.ajax({
		url: "http://localhost:7001/IMSWeb/getProducts.do",
		method: "GET",
		success: function(resp) {
			var result = JSON.parse(resp);
			$.each(result, function(i, item){
				$("#row" + row).append("<li onclick='getProduct(this.id)' id='" + item.productUpc + "'>" + item.productName + "</li>")
			})
		}
	})
}

function getProduct(productId) {
	var s = productId;
	$.ajax({
		url: "http://localhost:7001/IMSWeb/getProductById.do",
		method: "GET",
		data: {str:s},
		success: function(resp) {
			var result = JSON.parse(resp);
			$("#productSelection" + row).html(result.productName)
			$("#pricePerItem" + row).html(result.retailPrice)
			$("#totalPrice" + row).html(result.retailPrice)
			products.push(result)
		}
	})
}

function calculateTotal() {
	var i = 0;
	var totalOrderPriceTag;
	while(i < row) {
		
	}
}