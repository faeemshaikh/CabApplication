package com.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.RequestUpdater;
import com.dao.ValidateDriver;
import com.data.Request;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int did =Integer.parseInt(request.getParameter("did"));
		String pass = request.getParameter("pass");
		ValidateDriver v = new ValidateDriver();
		RequestUpdater r = new RequestUpdater();
		ArrayList<Vector<Request>> R;
		if(v.validate(did,pass)){
			HttpSession session = request.getSession();
			session.setAttribute("did", did);
			R = r.updateRequests(did);
			//System.out.println(R.size());
			session.setAttribute("waiting", R.get(0));
			session.setAttribute("ongoing", R.get(1));
			session.setAttribute("complete", R.get(2));
			response.sendRedirect("DriverApp.jsp");
			
		}
		else{
			response.sendRedirect("DriverLogin.jsp");
		}
	}

}