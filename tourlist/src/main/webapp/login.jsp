<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
</head>
<body>
    <h2>로그인</h2>
    <form method="post" action="loginProcess.jsp">
        아이디: <input type="text" name="userId" required><br>
        비밀번호: <input type="password" name="password" required><br>
        <input type="submit" value="로그인">
    </form>
</body>
</html>
