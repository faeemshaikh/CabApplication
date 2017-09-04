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
	<div class="App"><br>
		<div class="headers">
			<h1 align="center">Cab Application</h1>
			<h2 align="center">Book your cab now</h2>
		</div>
		<div class="logindeatails">
			<form method="post" action="AddRequest">
				<table border="0" align="center">
					<tbody style="background:rgb(152, 241, 157);">
						<tr>
							<td>
								Customer ID
							</td>
							<td>
								<input type="text" name="cid" style="width:120px;margin-left:5px;" placeholder="Enter Customet ID">
							</td>
						</tr>
						<tr>
							<td>
								Location X <input type="text" name="lx" class="location" placeholder="LX">
							</td>
							<td>
								Location Y <input type="text" name="ly" class="location" placeholder="LY">
							</td>
						</tr>
						<tr style="margin-top: 5px;">
						
							<td colspan="2" align="center"><input type="submit" value="RIDE NOW" class="button"></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	</body>
</html>