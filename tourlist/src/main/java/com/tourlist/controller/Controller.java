package com.tourlist.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tourlist.service.postService;
import com.tourlist.service.postWriteService;
import com.tourlist.service.userLoginService;
import com.tourlist.service.userRegisterService;
import com.tourlist.service.userService;

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
		System.out.println("com: " + com);
		String viewPage = null;
		
		if(com != null && com.equals("main")) {
			viewPage = "/WEB-INF/views/main.jsp";
			
		}else if(com != null && com.equals("registerForm")) { 
			viewPage = "/WEB-INF/views/registerForm.jsp";
			
		}else if(com != null && com.equals("register")) { 
			viewPage = "main.do";
			userService service = new userRegisterService();
			service.execute(request, response);
			
		}else if(com != null && com.equals("loginForm")) { 
			viewPage = "/WEB-INF/views/loginForm.jsp";
			
		}else if(com != null && com.equals("login")) { 
			viewPage = "main.do";
			userLoginService service = new userLoginService();
			service.execute(request, response);
			
		}else if(com != null && com.equals("logout")) { 
			viewPage = "main.do";
			HttpSession s = request.getSession();
			s.invalidate();
		}else if(com != null && com.equals("viewForm")) { 
			viewPage = "/WEB-INF/views/viewForm.jsp";
		
		}else if(com != null && com.equals("writeForm")) { 
			viewPage = "/WEB-INF/views/writeForm.jsp";
		
		}else if(com != null && com.equals("write")) { 
			viewPage = "main.do";
			postService service = new postWriteService();
			service.execute(request, response);
			
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
