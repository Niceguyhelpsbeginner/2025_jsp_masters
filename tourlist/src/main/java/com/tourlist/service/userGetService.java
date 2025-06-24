package com.tourlist.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import users.UsersDAO;
import users.UsersDTO;

public class userGetService implements userService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		UsersDTO dto = new UsersDTO();
		UsersDAO dao = new UsersDAO();
		
		dto = dao.getUser(username);
		request.setAttribute("dto", dto);
	}

}
