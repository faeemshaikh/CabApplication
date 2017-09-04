<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.RequestUpdater"%>
<%@page import="com.data.Request"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Vector"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Drivers Application</title>

</head>
<body>
<%
	if(session.getAttribute("did")==null){
		response.sendRedirect("DiverLogin.jsp");
	}
	else{
		RequestUpdater r = new RequestUpdater();
		ArrayList<Vector<Request>> R = r.updateRequests((int)session.getAttribute("did"));
		session.setAttribute("waiting", R.get(0));
		session.setAttribute("ongoing", R.get(1));
		session.setAttribute("complete", R.get(2));
	}
%>
	<div class="App"><br>
		<div class="headers">
		<div style="border=1">
				<h1>
					Drivers Application - Driver ID:<%
					out.print(" "+session.getAttribute("did"));
				%>
				</h1>
				<p style="text-align: center">
					<button onclick="window.location.reload()" class="button">Refresh</button>
				</p>
			</div>
		</div>
		

		<div class="AppContent">
			<table border=1 width="100%">
				<thead>
					<tr>
						<th>Waiting</th>
						<th>Ongoing</th>
						<th>Complete</th>
					</tr>
				</thead>
				<tbody  class="innerdata">
					<%
					 	Date cur = new Date();
						long diff;
						SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss", Locale.ENGLISH);
						String now = sdf.format(cur);
						Date Current = sdf.parse(now);
						int i;
						int did = (int)session.getAttribute("did");
						Vector<Request> waiting, ongoing, complete;
						waiting = (Vector<Request>) session.getAttribute("waiting");
						ongoing = (Vector<Request>) session.getAttribute("ongoing");
						complete = (Vector<Request>) session.getAttribute("complete");
						%>
					<tr>
						<td>
							<table border=1 width="100%">
								<tbody>
									<%
									i=0;
									if(waiting.size()==0){
										out.print("<td align=\"center\"> Null </td>");
									}
									else{
									while (i < waiting.size()) {%>
									<tr>
										<td>
											<div>
												<form id="Form" action="SelectRequest" method="post">
													<input type="hidden" name="rid" value="<%out.print(waiting.get(i).getRid());%>">
													<input type="hidden" name="did" value="<%out.print(did);%>">
													<input type="hidden" name="cid" value="<%out.print(waiting.get(i).getCid());%>">
													<table border="0" width=100%>
														<tbody>
															<tr class="innerdata"> 
																<td>Req.id =<%out.print(waiting.get(i).getRid());%></td>
																<td>Cust.id=<%out.print(waiting.get(i).getCid());%></td>
															</tr>
															<tr class="innerdata"> 
																<% 
																
																
																diff = Math.abs(Current.getTime()-waiting.get(i).getRequest_time().getTime());i++; 
																
																%>
																<td colspan="2" align="center"> <%out.print(diff/60000);%> mins ago</td>
															</tr>
															<tr class="innerdata"> 
																<td colspan="2" align="center"><input type="submit" value="Select" class="innerbutton"></td>
															</tr>
														</tbody>
													</table>
													
												</form>
											</div>

										</td>
									</tr>
									<%}}%>
								</tbody>
							</table>
						</td>
						<td>
							<table border=1 width="100%">
								<tbody>
									<%
									i=0;
									if(ongoing.size()==0){
										out.print("<td align=\"center\"> Null </td>");
									}
									else{
									while (i < ongoing.size()) {%>
									<tr>
										<td>
											<div>
													<table border="0" width=100%>
														<tbody>
															<tr class="innerdata"> 
																<td>Req.id =<%out.print(ongoing.get(i).getRid());%></td>
																<td>Cust.id=<%out.print(ongoing.get(i).getCid());%></td>
															</tr>
															<tr class="innerdata"> 
																<% 
																diff = Math.abs(Current.getTime()-ongoing.get(i).getRequest_time().getTime()); 
																%>
																<td colspan="2" align="center"> Request: <%out.print(diff/60000);%> mins ago</td>
															</tr>
															<tr class="innerdata"> 
																<% 
																diff = Math.abs(Current.getTime()-ongoing.get(i).getStart_time().getTime());i++; 
																%>
																<td colspan="2" align="center"> Picked up: <%out.print(diff/60000);%> mins ago</td>
															</tr>
														</tbody>
													</table>
											</div>

										</td>
									</tr>
									<%}}%>
								</tbody>
							</table>
						</td>
						<td>
							<table border=1 width="100%">
								<tbody>
									<%
									i=0;
									if(complete.size()==0){
										out.print("<td align=\"center\"> Null </td>");
									}
									else{
									while (i < complete.size()) {%>
									<tr>
										<td>
											<div>
													<input type="hidden" name="rid" value="<%out.print(complete.get(i).getRid());%>">
													<input type="hidden" name="did" value="<%out.print(did);%>">
													<input type="hidden" name="cid" value="<%out.print(complete.get(i).getCid());%>">
													<table border="0" width=100%>
														<tbody>
															<tr class="innerdata"> 
																<td>Req.id =<%out.print(complete.get(i).getRid());%></td>
																<td>Cust.id=<%out.print(complete.get(i).getCid());%></td>
															</tr>
															<tr class="innerdata"> 
																<% 
																diff = Math.abs(Current.getTime()-complete.get(i).getRequest_time().getTime()); 
																%>
																<td colspan="2" align="center"> Request: <%out.print(diff/60000);%> mins ago</td>
															</tr>
															<tr class="innerdata"> 
																<% 
																diff = Math.abs(Current.getTime()-complete.get(i).getStart_time().getTime()); 
																%>
																<td colspan="2" align="center"> Picked up: <%out.print(diff/60000);%> mins ago</td>
															</tr>
															<tr class="innerdata"> 
																<% 
																diff = Math.abs(Current.getTime()-complete.get(i).getStart_time().getTime());i++;
																%>
																<td colspan="2" align="center"> Complete: <%out.print((diff/60000)-5);%> mins ago</td>
															</tr>
														</tbody>
													</table>
											</div>

										</td>
									</tr>
									<%}}%>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<br>
	</div>

</body>
</html>