<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cabbage Corp</title>
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
      		<th>Amt In Stock</th>
      		<th>Threshold</th>
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
  			<tr>
  				<td id="upc${p.productUpc}"><c:out value="${p.productUpc}"></c:out></td>       			
      			<td id="name${p.productUpc}"><c:out value="${p.productName}"></c:out></td>
      			<td><fmt:formatNumber value="${p.unitCost}" type="currency" /></td>
      			<td><fmt:formatNumber value="${p.retailPrice}" type="currency" /></td>
      			<td id="squantity${p.productUpc}"><c:out value="${p.quantityOnHand}"></c:out></td>
      			<td id="threshold${p.productUpc}"><c:out value="${p.reorderThreshold}"></c:out></td>
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



<h2>Add a New Client</h2>
<form:form action="addclient.do" method="post" modelAttribute="client"> <!-- modelAttribute = name of bean in the session scope that are sending form data to -->
<div class="form-group">
Street Address 1:
<form:input path="address.streetAddress1" cssClass="form-control" />
Street Address 2: 
<form:input path="address.streetAddress2" cssClass="form-control" />
Address City:
<form:input path="address.addressCity" cssClass="form-control" />
State:
<form:select path="address.stateAbbrv.abbrvId" items="${states}" itemValue="abbrvId" itemLabel="stateName" />
Zip:
<form:input path="address.addressZip" cssClass="form-control" />

Client name:
<form:input path="clientName" cssClass="form-control" />
Client email:
<form:input path="clientEmail" cssClass="form-control" />
Point of contact name:
<form:input path="pointOfContactName" cssClass="form-control" />
Client Phone:
<form:input path="clientPhone" cssClass="form-control" />
Client Fax:
<form:input path="clientFax" cssClass="form-control" />
Client Type:
<form:select path="clientType.clientTypeId" items="${clientTypes}" itemValue="clientTypeId" itemLabel="clientType" />



<input class="btn btn-default buttons" type="submit" value="Add Client" />
</div>
</form:form>
</div>
</body>
</html>