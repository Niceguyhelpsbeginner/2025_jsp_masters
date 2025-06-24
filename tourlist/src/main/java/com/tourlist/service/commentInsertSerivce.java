package com.tourlist.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comments.CommentsDAO;
import comments.CommentsDTO;

public class commentInsertSerivce implements commentService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    request.setCharacterEncoding("UTF-8");

	    String commented_post = request.getParameter("postId");

	    // 이름 
	    String author = request.getParameter("author");
	   
	    String content = request.getParameter("content");
	    
	   CommentsDAO dao = new CommentsDAO();	
	   
	   CommentsDTO dto = new CommentsDTO(commented_post, author, content);
	      
	   dao.insertComment(dto);
	   ArrayList<CommentsDTO> comments = dao.getCommentsByPost(commented_post);	
	   
	   request.setAttribute("comments", comments);
	   
	}

}
