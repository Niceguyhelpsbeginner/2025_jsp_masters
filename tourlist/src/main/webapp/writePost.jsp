<%@page import="posts.PostsDAO"%>
<%@page import="posts.PostsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.nio.file.Paths, java.io.File" %>
<%
    request.setCharacterEncoding("utf-8");

    String title = request.getParameter("title");
	String content = request.getParameter("content");
	String author_id = request.getParameter("writer");
	String country = request.getParameter("country");
	System.out.println(country + "나라");
	System.out.println(title + "제목");
	PostsDTO dto = new PostsDTO(title,content,author_id,country);
	PostsDAO dao = new PostsDAO();
	dao.write_post(dto);
	
    response.sendRedirect("main.jsp");
%>
