<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Clever title</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<!-- custom style sheet -->
<link rel="stylesheet" href="main.css">
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container">
	<h2>Generate Invoice</h2>

<div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    <span id="dropdownSelection">Client Type</span>
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
  <c:forEach var="clientType" items="${clientTypes}">
  	<li onclick="getClients(this.id)" id="${clientType.clientType}"><a><c:out value="${clientType.clientType}"></c:out></a></li>
  </c:forEach>
  </ul>
</div>

<div class="row">
<div id="clientDropdown" class="dropdown col-xs-3" hidden>
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    <span id="clientSelection">Client Name</span>
    <span class="caret"></span>
  </button>
  <ul id="clientNames" class="dropdown-menu" aria-labelledby="dropdownMenu1"/>
</div>
</div>

<table class="table">
<thead>
<td><span class="glyphicon glyphicon-plus" style="cursor: pointer;" onclick="addrow()"></span></td>
<td>Price per item</td>
<td>Quantity</td>
<td>Total price</td>
</thead>
<tbody id="tbody">
<tr>
<td>
<div id="productDropdown2" class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    <span id="productSelection">Product</span>
    <span class="caret"></span>
  </button>
  <ul id="row0" class="dropdown-menu" aria-labelledby="dropdownMenu2"/>
  <c:forEach var="product" items="${products}">
  	<li onclick="getProduct(this.id)" id="${product.productUpc}">${product.productName}</li>
  </c:forEach>
</div>
</td>
<div id="poLine2">
	<td><span id="pricePerItem0" ></span></td>
	<td><input id="0" type="number" onchange="updateTotal(this.value, this.id)" value="1" /></td>
	<td><span id="totalPrice0" ></span></td>
</div>
</tr>
<tr id="finalRow"><td></td><td></td><td></td><td id='total'></td></tr>
</tbody> <!-- closes tbody -->
</table>
</div> <!-- closes container -->






</body>
<script src="invoiceJS.js"></script>
</html>