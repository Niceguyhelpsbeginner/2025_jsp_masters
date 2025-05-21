<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글쓰기</title>
   <link rel="stylesheet" type="text/css" href="css/write1.css">
</head>
<body>

<!-- 헤더 -->
<div class="header">
    <h1>글쓰기</h1>
</div>

<!-- 글쓰기 폼 -->
<div class="form-container">
    <form action="writePost.jsp" method="post" enctype="multipart/form-data">
        <input type="text" name="title" placeholder="제목" required />
        <textarea name="description" placeholder="내용" rows="5" required></textarea>
        <input type="file" name="image" />
        <button type="submit">작성하기</button>
    </form>
</div>

<!-- 푸터 -->
<div class="footer">
    <p>&copy; 2025 여행 게시판. All Rights Reserved.</p>
</div>

</body>
</html>
