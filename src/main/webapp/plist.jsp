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
        		<th>Categories</th>
        		<th>Unit Cost</th>
        		<th>Retail Price</th>
        		<th>Amt In Stock</th>
        		<th>Reorder Amt</th>
        		<th></th>
        		<th hidden></th>
        		<th hidden></th>
        		<th hidden></th>
        		<th hidden></th>
        		<th hidden></th>
        		<th hidden></th>        		
      		</tr>
    	</thead>
    	<tbody>
    		<c:forEach var="p" items="${products}">
    			<tr id="${p.productUpc}">
    				<td id="upc${p.productUpc}"><c:out value="${p.productUpc}"></c:out></td>       			
        			<td id="name${p.productUpc}"><c:out value="${p.productName}"></c:out></td>
        			<td><c:out value="${p.categoriesString}"></c:out></td>
        			<td><fmt:formatNumber value="${p.unitCost}" type="currency" /></td>
        			<td><fmt:formatNumber value="${p.retailPrice}" type="currency" /></td>
        			<td id="squantity${p.productUpc}"><c:out value="${p.quantityOnHand}"></c:out></td>
        			<td id="rquantity${p.productUpc}"><c:out value="${p.reorderQuantity}"></c:out></td>
        			<td>
        				<span data-toggle="modal" data-target="#updatemodal" id="${p.productUpc}" onclick=edit(this.id) style="cursor: pointer;" class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
        				<span id="${p.productUpc}" onclick=remove(this.id) style="cursor: pointer;" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
        			</td>
        			<td id="desc${p.productUpc}" hidden><c:out value="${p.productDescription}"></c:out></td>
        			<td id="short${p.productUpc}" hidden><c:out value="${p.shortName}"></c:out></td>
        			<td id="pack${p.productUpc}" hidden><c:out value="${p.packSize}"></c:out></td>
        			<td id="weight${p.productUpc}" hidden><c:out value="${p.productWeight}"></c:out></td>
        			<td id="ucost${p.productUpc}" hidden><c:out value="${p.unitCost}"></c:out></td>
        			<td id="rprice${p.productUpc}" hidden><c:out value="${p.retailPrice}"></c:out></td>
        		</tr>
    		</c:forEach>
    	</tbody>
    </table>
    
    <button type="button" class="btn btn-default buttons" data-toggle="modal" data-target="#addmodal">+ New Product</button>
    <!-- New product -->
    
    <div id="addmodal" class="modal fade">
	 	<div class="modal-dialog">
	   		<div class="modal-content">
	     		<div class="modal-header">
	       			<button type="button" class="close" data-dismiss="modal">&times;</button>
	       			<h4 class="modal-title">Add Product</h4>
	    		</div>
	    		<form:form action="addproduct.do" method="post" commandName="product"> 
		    		<div class="modal-body">
						<div class="row">
							<div class="form-group col-xs-12">
								<label for="prodName">Product Name: </label>
								<form:input cssClass="form-control" id="prodName" path="productName" /> <form:errors path="productName" cssClass="error"/> <br /> <!-- path = bean property -->
							</div>
						</div>
						<div class="row">
							<div class="form-group col-xs-4">
								<label for="short">Short Name: </label> 
								<form:input cssClass="form-control" id="short" path="shortName" /> <form:errors path="shortName" cssClass="error"/> <br />
							</div>
							<div class="form-group col-xs-4">
								<label for="ucost">Unit Cost: </label> 
								<form:input cssClass="form-control" id="ucost" path="unitCost" /> <form:errors path="unitCost" cssClass="error"/> <br />
							</div>
							<div class="form-group col-xs-4">
								<label for="rprice">Retail price: </label>
								<form:input cssClass="form-control" id="rprice" path="retailPrice" /> <form:errors path="retailPrice" cssClass="error"/> <br />
							</div>
						</div>
						
						<div class="row">
							<div class="form-group col-xs-4">
								<label for="pack">Pack size: </label> 
								<form:input cssClass="form-control" id="pack" path="packSize" /> <form:errors path="packSize" cssClass="error"/> <br />
							</div>
							<div class="form-group col-xs-4">
								<label for="stock">Stock amt: </label> 
								<form:input cssClass="form-control" id="stock" path="quantityOnHand" /> <form:errors path="quantityOnHand" cssClass="error"/> <br />
							</div>
							<div class="form-group col-xs-4">
								<label for="quantity">Reorder amt: </label> 
								<form:input cssClass="form-control" id="quantity" path="reorderQuantity" /> <form:errors path="reorderQuantity" cssClass="error"/> <br />
							</div>
						</div>
						
						<div class="row">
							<div class="form-group col-xs-2">
								<label for="weight">Weight: </label> 
								<form:input cssClass="form-control" id="weight" path="productWeight" /> <form:errors path="productWeight" cssClass="error"/> <br />
							</div>
							<div class="form-group col-xs-10">
								<label for="desc">Description: </label> 
								<form:input cssClass="form-control" id="desc" path="productDescription" /> <form:errors path="productDescription" cssClass="error"/> <br />
							</div>
						</div>
		
						<div class="row">
							<div class="form-group col-xs-12">
								<label for="cats">Categories: </label>
								<form:checkboxes cssClass="checkbox-inline" items="${categories}" path="categoryNames" id="cats" /> 
									<form:errors path="categoryNames" cssClass="error"/>  <br />
							</div>
						</div>
		     		</div>
		     		<div class="modal-footer">
		       			<input type="submit" value="Add Product" class="btn btn-default buttons"/>
					</div>
				</form:form>
		     </div>
	   	</div>
	</div>
    
    
    <!-- Update product -->
	<div id="updatemodal" class="modal fade">
	 	<div class="modal-dialog">
	   		<div class="modal-content">
	     		<div class="modal-header">
	       			<button type="button" class="close" data-dismiss="modal">&times;</button>
	       			<h4 class="modal-title">Update Product</h4>
	    		</div>
	    		<form:form action="updateproduct.do" method="post" commandName="product"> 
		    		<div class="modal-body">
		    			<form:hidden path="productUpc" id="updateupc" />
						<div class="row">
							<div class="form-group col-xs-12">
								<label for="prodName">Product Name: </label>
								<form:input cssClass="form-control" id="updateprodName" path="productName" /> <form:errors path="productName" cssClass="error"/> <br /> <!-- path = bean property -->
							</div>
						</div>
						<div class="row">
							<div class="form-group col-xs-4">
								<label for="short">Short Name: </label> 
								<form:input cssClass="form-control" id="updateshort" path="shortName" /><form:errors path="shortName" cssClass="error"/> <br />
							</div>
							<div class="form-group col-xs-4">
								<label for="ucost">Unit Cost: </label> 
								<form:input cssClass="form-control" id="updateucost" path="unitCost" /> <form:errors path="unitCost" cssClass="error"/> <br />
							</div>
							<div class="form-group col-xs-4">
								<label for="rprice">Retail price: </label>
								<form:input cssClass="form-control" id="updaterprice" path="retailPrice" /> <form:errors path="retailPrice" cssClass="error"/> <br />
							</div>
						</div>
						
						<div class="row">
							<div class="form-group col-xs-4">
								<label for="pack">Pack size: </label> 
								<form:input cssClass="form-control" id="updatepack" path="packSize" /> <form:errors path="packSize" cssClass="error"/> <br />
							</div>
							<div class="form-group col-xs-4">
								<label for="stock">Stock amt: </label> 
								<form:input cssClass="form-control" id="updatestock" path="quantityOnHand" /> <form:errors path="quantityOnHand" cssClass="error"/> <br />
							</div>
							<div class="form-group col-xs-4">
								<label for="quantity">Reorder amt: </label> 
								<form:input cssClass="form-control" id="updatequantity" path="reorderQuantity" /> <form:errors path="reorderQuantity" cssClass="error"/> <br />
							</div>
						</div>
						
						<div class="row">
							<div class="form-group col-xs-2">
								<label for="weight">Weight: </label> 
								<form:input cssClass="form-control" id="updateweight" path="productWeight" /> <form:errors path="productWeight" cssClass="error"/> <br />
							</div>
							<div class="form-group col-xs-10">
								<label for="desc">Description: </label> 
								<form:input cssClass="form-control" id="updatedesc" path="productDescription"></form:input> <form:errors path="productDescription" cssClass="error"/> <br />
							</div>
						</div>
		
						<div class="row">
							<div class="form-group col-xs-12">
								<label for="cats">Categories: </label>
								<form:checkboxes cssClass="checkbox-inline" items="${categories}" itemValue="categoryDescription" path="categoryNames" id="updatecats" /> 
									<form:errors path="categoryNames" cssClass="error"/>  <br />
							</div>
						</div>
		     		</div>
		     		<div class="modal-footer">
		       			<input type="submit" value="Update" class="btn btn-default buttons"/>
					</div>
				</form:form>
		     </div>
	   	</div>
	</div>

<span id="test"></span>
<br>


<c:if test="${not empty success}">
	<c:out value="${success}"></c:out>
</c:if>

</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
    $('#jqueryTable').DataTable();
	$("#jqueryTable_info").hide();
});

function edit(upc){
	$("#updateprodName").val($("#name" + upc).html());
	$("#updateshort").val($("#short" + upc).html());
	$("#updateweight").val($("#weight" + upc).html());
	$("#updateucost").val($("#ucost" + upc).html());
	$("#updaterprice").val($("#rprice" + upc).html());
	$("#updatepack").val($("#pack" + upc).html());
	$("#updatestock").val($("#squantity" + upc).html());
	$("#updatequantity").val($("#rquantity" + upc).html());
	$("#updatedesc").val($("#desc" + upc).html());
	$("#updateupc").val($("#upc" + upc).html());
}

function remove(upc){
	$.ajax({
			url: "deleteproduct.do",
			method: "POST",
			data : { 'upc'  : upc},
			success: function(success){
				
			}
	});
	$("#"+ upc).remove();
}

</script>
</html>