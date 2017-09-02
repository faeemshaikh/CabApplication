package com.servlets;

import java.io.IOException;
//import java.util.ArrayList;
//import java.util.Vector;
import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.RequestUpdater;
import com.data.Request;

@WebServlet("/SelectRequest")
public class SelectRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rid = Integer.parseInt(request.getParameter("rid"));
		int did = Integer.parseInt(request.getParameter("did"));
		RequestUpdater r = new RequestUpdater();
		//Request currentRequest = r.getRequest(rid);
		HttpSession session = request.getSession();
		session.setAttribute("did", did);
		ArrayList<Vector<Request>> R;
		r.updateState(rid,did);
		R=r.updateRequests(did);
		session.setAttribute("waiting", R.get(0));
		session.setAttribute("ongoing", R.get(1));
		session.setAttribute("complete", R.get(2));
		response.sendRedirect("DriverApp.jsp");
		
	}

}
