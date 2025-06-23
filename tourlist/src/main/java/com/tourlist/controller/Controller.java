package com.tourlist.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tourlist.service.userService;
import com.tourlist.service.userInsertService;

/**
 * Servlet implementation class Controller
 */
@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		System.out.println(uri);
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".do"));
		System.out.println(com);
		String viewPage = null;
		if(com != null && com.equals("main")) {
//			Service service = new MemberListService();
			viewPage = "/WEB-INF/views/main.jsp";
//			service.excute(request, response);
		}else if(com != null && com.equals("insertForm")) {
			userService service = new userInsertService();
			viewPage = "/WEB-INF/views/insertForm.jsp";
			service.excute(request, response);
		}
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
