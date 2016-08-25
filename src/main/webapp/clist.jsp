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
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<!-- DataTable -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="main.css">
</head>
<body class="bod">
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container">
<h2>Clients</h2>
<table class="table" id="jqueryTable2">
  	<thead>
      	<tr class="rowHeader">
      		<th>ID</th>
      		<th>Name</th>
      		<th>Type</th>
      		<th>Contact</th>
      		<th>Email</th>
      		<th>Phone</th>
      		<th>Fax</th>
      		<th>Location</th>
      		<th></th>
      		<th hidden></th>
      		<th hidden></th>
      		<th hidden></th>
      		<th hidden></th>
      		<th hidden></th>        		
    		</tr>
  	</thead>
  	<tbody>
  		<c:forEach var="c" items="${clients}">
  			<tr>
  				<td id="id${c.imsClientId}"><c:out value="${c.imsClientId}"></c:out></td>       			
      			<td id="name${c.imsClientId}"><c:out value="${c.clientName}"></c:out></td>
      			<td id="type${c.imsClientId}"><c:out value="${c.clientType}"></c:out></td>
      			<td id="contact${c.imsClientId}"><c:out value="${c.pointOfContactName}"></c:out></td>
      			<td id="email${c.imsClientId}"><c:out value="${c.clientEmail}"></c:out></td>
      			<td id="phone${c.imsClientId}"><c:out value="${c.clientPhone}"></c:out></td>
      			<td id="fax${c.imsClientId}"><c:out value="${c.clientFax}"></c:out></td>
      			<td id="address${c.imsClientId}"><c:out value="${c.address}"></c:out></td>
      			<td>
      				<span data-toggle="modal" data-target="#updatemodal" id="${c.imsClientId}" onclick=edit(this.id) style="cursor: pointer;" class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
      				<span id="${c.imsClientId}" onclick=remove(this.id) style="cursor: pointer;" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
      			</td>
      			<td id="saddress1${c.imsClientId}" hidden><c:out value="${c.address.streetAddress1}"></c:out></td>
      			<td id="saddress2${c.imsClientId}" hidden><c:out value="${c.address.streetAddress2}"></c:out></td>
      			<td id="city${c.imsClientId}" hidden><c:out value="${c.address.addressCity}"></c:out></td>
      			<td id="state${c.imsClientId}" hidden><c:out value="${c.address.stateAbbrv}"></c:out></td>
      			<td id="zip${c.imsClientId}" hidden><c:out value="${c.address.addressZip}"></c:out></td>
      		</tr>
  		</c:forEach>
  	</tbody>
</table>




    <button type="button" class="btn btn-default buttons" data-toggle="modal" data-target="#addclientmodal">+ New Client</button>
    <!-- New product -->
    
    <div id="addclientmodal" class="modal fade">
	 	<div class="modal-dialog">
	   		<div class="modal-content">
	     		<div class="modal-header">
	       			<button type="button" class="close" data-dismiss="modal">&times;</button>
	       			<h4 class="modal-title">Add Client</h4>
	    		</div>
	    		<form:form action="addclient.do" method="post" modelAttribute="client">
		    		<div class="modal-body">
						<div class="row">
							<div class="form-group col-xs-9">
								<label for="clientName">Client: </label>
								<form:input path="clientName" id="clientName" cssClass="form-control" /> <form:errors path="clientName" cssClass="error"/> <br /> <!-- path = bean property -->
							</div>
							<div class="form-group col-xs-3">
								<label for="clientType">Type:</label>
								<form:select path="clientType.clientTypeId" items="${clientTypes}" itemValue="clientTypeId" itemLabel="clientType" id="clientType" cssClass="form-control"/> <form:errors path="clientType.clientTypeId" cssClass="error"/> <br /> <!-- path = bean property -->
							</div>
						</div>
						<div class="row">
							<div class="form-group col-xs-6">
								<label for="contact">Point of Contact:</label> 
								<form:input path="pointOfContactName" id="contact" cssClass="form-control" /> <form:errors path="pointOfContactName" cssClass="error"/> <br />
							</div>
							<div class="form-group col-xs-6">
								<label for="email">Email:</label> 
								<form:input path="clientEmail" id="email" cssClass="form-control" /> <form:errors path="clientEmail" cssClass="error"/> <br />
							</div>
						</div>
						
						<div class="row">
							<div class="form-group col-xs-6">
								<label for="phone">Phone:</label> 
								<form:input path="clientPhone" id="phone" cssClass="form-control" /> <form:errors path="clientPhone" cssClass="error"/> <br />
							</div>
							<div class="form-group col-xs-6">
								<label for="fax">Fax:</label> 
								<form:input path="clientFax" id="fax" cssClass="form-control" /> <form:errors path="clientFax" cssClass="error"/> <br />
							</div>
						</div>
						
						<div class="row">
							<div class="form-group col-xs-12">
								<label for="street1">Street Address 1:</label> 
								<form:input path="address.streetAddress1" id="street1" cssClass="form-control" /> <form:errors path="address.streetAddress1" cssClass="error"/> <br />
							</div>
						</div>
		
						<div class="row">
							<div class="form-group col-xs-12">
								<label for="street1">Street Address 2:</label> 
								<form:input path="address.streetAddress2" id="street2" cssClass="form-control" /> <form:errors path="address.streetAddress2" cssClass="error"/> <br />
							</div>
						</div>
						<div class="row">
							<div class="form-group col-xs-6">
								<label for="city">City:</label> 
								<form:input path="address.addressCity" id="city" cssClass="form-control" /> <form:errors path="address.addressCity" cssClass="error"/> <br />
							</div>
							<div class="form-group col-xs-3">
								<label for="state">State:</label> 
								<form:select path="address.stateAbbrv.abbrvId" items="${states}" itemValue="abbrvId" itemLabel="stateName" id="state" cssClass="form-control"/> <form:errors path="address.stateAbbrv.abbrvId" cssClass="error"/> <br />
							</div>
							<div class="form-group col-xs-3">
								<label for="zip">Zip:</label> 
								<form:input path="address.addressZip" id="zip" cssClass="form-control" /> <form:errors path="address.addressZip" cssClass="error"/> <br />
							</div>
						</div>
		     		</div>
		     		<div class="modal-footer">
		       			<input class="btn btn-default buttons" type="submit" value="Add Client" />
					</div>
				</form:form>
		     </div>
	   	</div>
	</div>


</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
    $('#jqueryTable2').DataTable();
	$("#jqueryTable2_info").hide();
});
</script>
</html>