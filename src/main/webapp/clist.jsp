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
<h2>Add a New Client</h2>
<form:form action="addclient.do" method="post" commandName="client"> <!-- commandname supplies empty object for form to fill (in addclient.do) -->
<div class="form-group">
<label for="companyName">Company Name: </label>
<form:input cssClass="form-control" id="companyName" path="clientName"/><form:errors path="clientName" cssClass="error"/><br>
<label for="contactName">Contact Name: </label>
<form:input cssClass="form-control" id="contactName" path="pointOfContactName"/><form:errors path="pointOfContactName" cssClass="error"/><br>
<label for="email">Email: </label>
<form:input cssClass="form-control" id="email" path="clientEmail"/><form:errors path="clientEmail" cssClass="error"/><br>
<label for="phone">Phone: </label>
<form:input cssClass="form-control" id="phone" path="clientPhone"/><form:errors path="clientPhone" cssClass="error"/><br>
<label for="fax">Fax: </label>
<form:input cssClass="form-control" id="fax" path="clientFax"/><form:errors path="clientFax" cssClass="error"/><br>
<label for="address">Address: </label>
<form:input cssClass="form-control" id="address" path="address"/><form:errors path="address" cssClass="error"/><br>

<input class="btn btn-default buttons" type="submit" value="Add Client" />
</div>
</form:form>
</div>
</body>
</html>