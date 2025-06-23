<%@page import="comments.CommentsDAO"%>
<%@page import="comments.CommentsDTO"%>
<%@page import="posts.PostsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="posts.PostsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
    request.setCharacterEncoding("UTF-8");

    String commented_post = request.getParameter("postId");

    // 이름 
    String author = request.getParameter("author");
   
    String content = request.getParameter("content");
    
   CommentsDAO dao = new CommentsDAO();	
   
   CommentsDTO dto = new CommentsDTO(commented_post, author, content);
   
   System.out.println(commented_post, author, content);
   
   dao.insertComment(dto);
   ArrayList<CommentsDTO> comments = dao.getCommentsByPost(commented_post);	
   
   session.setAttribute("comments", comments);
   response.sendRedirect("main.jsp"); // 메인 페이지로 이동
   
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		
	</body>
</html>