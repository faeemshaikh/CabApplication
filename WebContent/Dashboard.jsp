
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	<div class="App"><br>
		<div class="headers">
			<h1 align="center">Cab Application</h1>
			<h2 align="center">All Cab request</h2>
			<p align="center">
			<input type="submit" value="Refresh" onclick="window.location.reload()" class="button">
			</p>
		</div>
		<div class="AppContent">
		<div align="center">
		<table border=1 align="center" width="100%">
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
					Date cur = new Date();
					long diff;
					SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss", Locale.ENGLISH);
					String now = sdf.format(cur);
					Date Current = sdf.parse(now);
					RequestUpdater d = new RequestUpdater();
					Vector<Request> All = d.updateAll();
					int i = 0;
					try {
						while (i < All.size()) {
				%>
				<tr>
					<td align="center">
						<%
							out.print(All.get(i).getRid());
						%>
					</td>
					<td align="center">
						<%
							out.print(All.get(i).getCid());
						%>
					</td>
					<td align="center">
						<%
							if (All.get(i).getStart_time() == null) {
										out.print(" - ");
									} else {
										diff = Math.abs(Current.getTime()-All.get(i).getStart_time().getTime());
										if(diff/3600000 ==1){
											out.print((diff/3600000) + " hour ");
											diff=diff%3600000;
										}
										else if(diff/3600000 >0){
											out.print((diff/3600000) + " hours ");
											diff=diff%3600000;
										}
										if(diff/60000 ==1){
											out.print((diff/60000) + " minute ");
											diff=diff/60000;
										}
										else if(diff/60000 >0){
											out.print((diff/60000) + " minutes ");
											diff=diff/60000;
										}
										if(diff==1000){
											out.print((diff/1000) + " second ");
										}
										else if(diff>1000){
											out.print((diff/1000) + " seconds ");
										}
									}
						%>
					</td>
					<td align="right">
						<%
							out.print(All.get(i).getStatus());
						%>
					</td>
					<td align="center">
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
		</div>
				<br>
	</div>
</body>
</html>