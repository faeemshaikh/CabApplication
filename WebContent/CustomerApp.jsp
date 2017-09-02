<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link href="style.css" rel="stylesheet" type="text/css" />
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Customer Application</title>
	</head>
	<body>
	<div class="App">
		<form method="post" action="AddRequest">
			Customer ID:
			<input type="text" name="cid"> <br>
			Location:
			<input type="text" name="lx">
			<input type="text" name="ly"> <br>
			<input type="submit" value="RIDE NOW">
		</form>
	</div>
	</body>
</html>