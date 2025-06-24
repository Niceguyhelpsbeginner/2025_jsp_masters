package com.tourlist.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import users.UsersDAO;
import users.UsersDTO;

public class userRegisterService implements userService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username);
		UsersDAO dao = new UsersDAO();
		UsersDTO dto = new UsersDTO(username, password);
		System.out.print("시스템 로그인 시도 "+username);
		dao.register(dto);
	    request.setAttribute("username", username);
//	    response.sendRedirect("main.do"); // 메인 페이지로 이동

	}

}