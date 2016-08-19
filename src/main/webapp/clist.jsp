<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>A very ugly client list</title>
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="bod">
<jsp:include page="navbar.jsp"></jsp:include>
Input information for new client:<br>
Company name:<input type="text"><br>
Contact name:<input type="text"><br>
email:<input type="text"><br>
Phone:<input type="text"><br>
Fax:<input type="text"><br>
Address:<input type="text"><br>
<input type="text">
<script>
function populateDropdown(){
	var states = ["AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND", "OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY"]
	var dropdown = document.createElement("select");
	for(var i=0; i<states.length; i++) {
		var selection = document.createElement("option")
		var selectionName = document.createTextNode(states[i]);
		selection.appendChild(selectionName);
		dropdown.appendChild(selection);
		document.body.appendChild(dropdown);
	}
}
populateDropdown();
</script>
<input type="text">
</body>
</html>