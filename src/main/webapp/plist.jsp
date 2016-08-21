<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<!-- DataTable -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<!-- custom style sheet -->
<link rel="stylesheet" href="main.css">
</head>
<body class="bod">
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container">
<h2>Products</h2>



<table class="table" id="jqueryTable">
    	<thead>
        	<tr class="rowHeader">
        		<th>UPC</th>
        		<th>Name</th>
        		<th>Unit Cost</th>
        		<th>Retail Price</th>
        		<th>Reorder Amt</th>
        		<th>Threshold</th>
        		<th>Amt In Stock</th>
      		</tr>
    	</thead>
    	<tbody>
    		<c:forEach var="p" items="${products}">
    			<tr>
    				<td><c:out value="${p.productUpc}"></c:out></td>       			
        			<td><c:out value="${p.productName}"></c:out></td>
        			<td><fmt:formatNumber value="${p.unitCost}" type="currency" /></td>
        			<td><fmt:formatNumber value="${p.retailPrice}" type="currency" /></td>
        			<td><c:out value="${p.reorderQuantity}"></c:out></td>
        			<td><c:out value="${p.reorderThreshold}"></c:out></td>
        			<td><c:out value="${p.quantityOnHand}"></c:out></td>
        		</tr>
    		</c:forEach>
    	</tbody>
    </table>

<br>

<h2>Add a New Product</h2>
<form:form action="addproduct.do" method="post" commandName="product"> 
<div class="row">
<div class="form-group col-xs-8">
	<label for="prodName">Product Name: </label>
	<form:input cssClass="form-control" id="prodName" path="productName" /> <form:errors path="productName" cssClass="error"/> <br /> <!-- path = bean property -->
</div>
<div class="form-group col-xs-2">
	<label for="short">Short Name: </label> 
	<form:input cssClass="form-control" id="short" path="shortName" /> <form:errors path="shortName" cssClass="error"/> <br />
</div>
<div class="form-group col-xs-2">
	<label for="pack">Pack size: </label> 
	<form:input cssClass="form-control" id="pack" path="packSize" /> <form:errors path="packSize" cssClass="error"/> <br />
</div>
</div>
<div class="row">
<div class="form-group col-xs-12">
	<label for="desc">Description: </label> 
	<form:input cssClass="form-control" id="desc" path="productDescription" /> <form:errors path="productDescription" cssClass="error"/> <br />
</div>
</div>
<div class="row">
<div class="form-group col-xs-4">
	<label for="ucost">Unit Cost: </label> 
	<form:input cssClass="form-control" id="ucost" path="unitCost" /> <form:errors path="unitCost" cssClass="error"/> <br />
</div>
<div class="form-group col-xs-4">
	<label for="rprice">Retail price: </label>
	<form:input cssClass="form-control" id="rprice" path="retailPrice" /> <form:errors path="retailPrice" cssClass="error"/> <br />
</div>
<div class="form-group col-xs-4">
	<label for="weight">Weight: </label> 
	<form:input cssClass="form-control" id="weight" path="productWeight" /> <form:errors path="productWeight" cssClass="error"/> <br />
</div>
</div>
<div class="row">
<div class="form-group col-xs-4">
	<label for="stock">Quantity in stock: </label> 
	<form:input cssClass="form-control" id="stock" path="quantityOnHand" /> <form:errors path="quantityOnHand" cssClass="error"/> <br />
</div>
<div class="form-group col-xs-4">
	<label for="threshold">Reorder threshold: </label>
	<form:input cssClass="form-control" id="threshold" path="reorderThreshold" /> <form:errors path="reorderThreshold" cssClass="error"/> <br />
</div>
<div class="form-group col-xs-4">
	<label for="quantity">Reorder quantity: </label> 
	<form:input cssClass="form-control" id="quantity" path="reorderQuantity" /> <form:errors path="reorderQuantity" cssClass="error"/> <br />
</div>
</div>
<div class="row">
<div class="form-group col-xs-12">
	<label for="cats">Categories: </label>
	<form:checkboxes cssClass="checkbox-inline" items="${categories}" path="categoryNames" id="cats" /> 
		<form:errors path="categoryNames" cssClass="error"/>  <br />
</div>
</div>
	<input type="submit" value="Add Product" class="btn btn-default buttons"/>
</form:form>
<c:if test="${not empty success}">
	<c:out value="${success}"></c:out>
</c:if>
</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
    $('#jqueryTable').DataTable();
} );
</script>
</html>