<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	.error{
		color: red;
	}
</style>
</head>
<body>
<form:form action="addproduct.do" method="post" commandName="product"> 
	Product Name: <form:input path="productName" /> <form:errors path="productName" cssClass="error"/> <br /> <!-- path = bean property -->
	Description: <form:input path="productDescription" /> <form:errors path="productDescription" cssClass="error"/> <br />
	Short Name: <form:input path="shortName" /> <form:errors path="shortName" cssClass="error"/> <br />
	Unit Cost: <form:input path="unitCost" /> <form:errors path="unitCost" cssClass="error"/> <br />
	Pack Size: <form:input path="packSize" /> <form:errors path="packSize" cssClass="error"/> <br />
	Reorder Quantity: <form:input path="reorderQuantity" /> <form:errors path="reorderQuantity" cssClass="error"/> <br />
	Reorder Threshold: <form:input path="reorderThreshold" /> <form:errors path="reorderThreshold" cssClass="error"/> <br />
	Quantity in stock: <form:input path="quantityOnHand" /> <form:errors path="quantityOnHand" cssClass="error"/> <br />
	Retail price: <form:input path="retailPrice" /> <form:errors path="retailPrice" cssClass="error"/> <br />
	Weight: <form:input path="productWeight" /> <form:errors path="productWeight" cssClass="error"/> <br />
	Categories: <form:checkboxes items="${categories}" path="productCategories" />
	<input type="submit" value="Register" />
</form:form>
</body>
</html>