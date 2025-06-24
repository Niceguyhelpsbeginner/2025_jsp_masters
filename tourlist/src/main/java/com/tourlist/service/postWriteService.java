package com.tourlist.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import posts.PostsDAO;
import posts.PostsDTO;

public class postWriteService implements postService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    request.setCharacterEncoding("utf-8");

	    String title = request.getParameter("title");
		String content = request.getParameter("content");
		String author_id = request.getParameter("writer");
		String country = request.getParameter("country");
		
		
		PostsDTO dto = new PostsDTO(title,content,author_id,country);
		PostsDAO dao = new PostsDAO();
		dao.write_post(dto);
		
		System.out.println(country + "나라");
		System.out.println(title + "제목");

		
	}

}
