<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>

<html>
<head>
    <title>게시글 보기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding-bottom: 60px; /* 푸터 공간 확보 */
            background-color: #f5f5f5;
        }

        .header {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 15px;
        }

        .post-content {
            padding: 20px;
            margin: 20px auto;
            max-width: 800px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .post-content img {
            max-width: 100%;
            margin-top: 10px;
        }
    </style>
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
