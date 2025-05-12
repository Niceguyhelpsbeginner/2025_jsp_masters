<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 로그인 여부 확인
    String userId = (String) session.getAttribute("userId");
    if (userId == null) {
%>
    <script>
        alert("로그인 후 글쓰기를 이용하실 수 있습니다.");
        location.href = "login.jsp";
    </script>
<%
        return; // 로그인 안 된 경우 write.jsp 실행 중지
    }
%>
<html>
<head>
    <title>글쓰기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            padding: 30px;
        }

        .container {
            width: 600px;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            box-sizing: border-box;
        }

        textarea {
            height: 200px;
            resize: vertical;
        }

        .buttons {
            text-align: center;
            margin-top: 20px;
        }

        .buttons input {
            padding: 10px 20px;
            margin: 0 10px;
            font-size: 14px;
        }

        .readonly {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>게시글 작성</h2>
    <form action="writeProcess.jsp" method="post">
        <label for="title">제목</label>
        <input type="text" name="title" id="title" required>

        <label for="writer">작성자</label>
        <input type="text" name="writer" id="writer" value="<%= userId %>" readonly class="readonly">

        <label for="content">내용</label>
        <textarea name="content" id="content" required></textarea>

        <div class="buttons">
            <input type="submit" value="등록">
            <input type="button" value="취소" onclick="location.href='index.jsp'">
        </div>
    </form>
</div>

</body>
</html>
