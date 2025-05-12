<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글쓰기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 15px;
        }

        .form-container {
            width: 500px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-container input, .form-container textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
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
