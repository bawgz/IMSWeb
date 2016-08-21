<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Cabbage Corp</title>
<link rel="stylesheet" href="main.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container">
	<h2>Home Page</h2>
	<form action="plist.do">
		<button type="submit" class="btn btn-default buttons">Add Product</button>
	</form>
	<form action="clist.do">
		<button type="submit" class="btn btn-default buttons">Add Client</button>
	</form>
</div>
</body>
</html>
