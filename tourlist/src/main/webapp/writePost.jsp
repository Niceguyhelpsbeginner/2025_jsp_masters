<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>

<%
    String title = request.getParameter("title");
    String description = request.getParameter("description");

    // 이미지 처리 (파일 업로드)
    Part filePart = request.getPart("image");
    String imageUrl = "";
    if (filePart != null) {
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadDir = application.getRealPath("/") + "images/";
        File uploadFile = new File(uploadDir + fileName);
        filePart.write(uploadFile.getAbsolutePath());
        imageUrl = "images/" + fileName;
    }

    Post post = new Post();
    post.setTitle(title);
    post.setDescription(description);
    post.setImageUrl(imageUrl);

    PostService postService = new PostService();
    postService.savePost(post);

    response.sendRedirect("main.jsp");
%>
