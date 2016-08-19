<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cabbage Corp</title>
<style>
	.error{
		color: red;
	}
</style>
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="bod">
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container">
<h2>Add a New Product</h2>
<form:form action="addproduct.do" method="post" commandName="product"> 
<div class="form-group">
	<label for="prodName">Product Name: </label>
	<form:input cssClass="form-control" id="prodName" path="productName" /> <form:errors path="productName" cssClass="error"/> <br /> <!-- path = bean property -->
	<label for="desc">Description: </label> 
	<form:input cssClass="form-control" id="desc" path="productDescription" /> <form:errors path="productDescription" cssClass="error"/> <br />
	<label for="short">Short Name: </label> 
	<form:input cssClass="form-control" id="short" path="shortName" /> <form:errors path="shortName" cssClass="error"/> <br />
	<label for="ucost">Unit Cost: </label> 
	<form:input cssClass="form-control" id="ucost" path="unitCost" /> <form:errors path="unitCost" cssClass="error"/> <br />
	<label for="pack">Pack size: </label> 
	<form:input cssClass="form-control" id="pack" path="packSize" /> <form:errors path="packSize" cssClass="error"/> <br />
	<label for="quantity">Reorder quantity: </label> 
	<form:input cssClass="form-control" id="quantity" path="reorderQuantity" /> <form:errors path="reorderQuantity" cssClass="error"/> <br />
	<label for="threshold">Reorder threshold: </label>
	<form:input cssClass="form-control" id="threshold" path="reorderThreshold" /> <form:errors path="reorderThreshold" cssClass="error"/> <br />
	<label for="stock">Quantity in stock: </label> 
	<form:input cssClass="form-control" id="stock" path="quantityOnHand" /> <form:errors path="quantityOnHand" cssClass="error"/> <br />
	<label for="rprice">Retail price: </label>
	<form:input cssClass="form-control" id="rprice" path="retailPrice" /> <form:errors path="retailPrice" cssClass="error"/> <br />
	<label for="weight">Weight: </label> 
	<form:input cssClass="form-control" id="weight" path="productWeight" /> <form:errors path="productWeight" cssClass="error"/> <br />
	<label for="cats">Categories: </label> 
	<form:checkboxes cssClass="checkbox-inline" items="${categories}" path="categoryNames" id="cats" /> <br>
	<input type="submit" value="Add Product" />
</div>
</form:form>
</div>
</body>
</html>