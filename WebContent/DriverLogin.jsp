<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Driver Application Login</title>
</head>
<body>
	<div class="App" align="center"><br>
		<div class="headers">
			<h1>Cab Application</h1>
			<h2>Driver Login Form</h2>
		</div>
		<div class="logindeatails">
			<form action="Login" method="post">
				<table border=0>
					<tbody style="background:rgb(152, 241, 157);">
						<tr style="text-align:right">
							<td>
								User ID: 
							</td>
							<td style="margin-left:5px">
								<input type="text" name="did" placeholder="Enter Driver ID">
							</td>
						</tr>
						<tr style="text-align:right">
							<td>
								Password: 
							</td>
							<td style="margin-left:5px">
								<input type="password" name="pass"  placeholder="Enter password">
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="Login" class="button">
							</td>
						</tr>
					</tbody>			
				</table>
			</form>	
		</div>		
	</div>
</body>
</html>