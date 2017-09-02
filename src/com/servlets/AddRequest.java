package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.RequestUpdater;


@WebServlet("/AddRequest")
public class AddRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestUpdater r = new RequestUpdater();
		int cid = Integer.parseInt(request.getParameter("cid"));
		int lx = Integer.parseInt(request.getParameter("lx"));
		int ly = Integer.parseInt(request.getParameter("ly"));
		if(r.addRequest(cid,lx,ly)){
			response.sendRedirect("SubmittedRequest.jsp");
		}
		else{
			response.sendRedirect("RequestDenied.jsp");
		}
		
	}

}
