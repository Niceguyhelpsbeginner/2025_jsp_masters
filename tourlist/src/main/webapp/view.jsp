<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>

<html>
<head>
    <title>게시글 보기</title>
  
</head>
<body>

<!-- 헤더 -->
<div class="header">
    <h1>${post.title}</h1>
</div>

<!-- 게시글 내용 -->
<div class="post-content">
    <h3>${post.title}</h3>
    <p>${post.description}</p>
    <img src="${post.imageUrl}" alt="${post.title}">
    <p><a href="main.jsp">← 목록으로 돌아가기</a></p>
</div>

<!-- 푸터 포함 -->
<jsp:include page="footer.jsp" />

</body>
</html>
