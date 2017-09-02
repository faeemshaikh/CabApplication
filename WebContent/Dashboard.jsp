
<%@page import="com.data.Request"%>
<%@page import="com.dao.RequestUpdater"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Cab Request</title>
</head>
<body>
	<div class="App">
		<h1 align="center">All Cab request</h1>
		<p align="center">
			<input type="submit" value="Refresh"
				onclick="window.location.reload()">
		</p>
		<table border=1 align="center">
			<thead>
				<tr>
					<th>Request ID</th>
					<th>Customer ID</th>
					<th>Time Elapsed</th>
					<th>Status</th>
					<th>Driver</th>
				</tr>
			</thead>
			<tbody>
				<%
					RequestUpdater d = new RequestUpdater();
					Vector<Request> All = d.updateAll();
					int i = 0;
					try {
						while (i < All.size()) {
				%>
				<tr>
					<td>
						<%
							out.print(All.get(i).getRid());
						%>
					</td>
					<td>
						<%
							out.print(All.get(i).getCid());
						%>
					</td>
					<td>
						<%
							if (All.get(i).getStart_time() == null) {
										out.print(" - ");
									} else {
										out.print(All.get(i).getStart_time().toString());
									}
						%>
					</td>
					<td>
						<%
							out.print(All.get(i).getStatus());
						%>
					</td>
					<td>
						<%
							if (All.get(i).getDid() == 0) {
										out.print(" - ");
									} else {
										out.print(All.get(i).getDid());
									}
						%>
					</td>
				</tr>
				<%
					i++;
						}
					} catch (Exception e) {
						out.println(e);
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>