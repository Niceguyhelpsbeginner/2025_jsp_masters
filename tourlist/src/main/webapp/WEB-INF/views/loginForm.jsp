<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인 | TourBoard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/login.css"> <!-- ✅ 분리된 CSS 연결 -->
</head>
<body>

<div class="login-container">
    <div class="login-card">
        <div class="login-title">🌍 TourList 로그인</div>
        
        <% 
            String errorMsg = request.getParameter("error");
            if (errorMsg != null) {
        %>
            <div class="alert alert-danger" role="alert">
                <%= errorMsg %>
            </div>
        <% } %>

        <form method="post" action="login.do">
            <div class="mb-3">
                <label for="userId" class="form-label">아이디</label>
                <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력하세요" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">로그인</button>
            </div>
        </form>

        <!-- 뒤로 가기 버튼 이동 -->
        <div class="mt-3">
            <a href="main.do" class="btn btn-secondary w-100">뒤로 가기</a>
        </div>

        <!-- 회원가입 링크 이동 -->
        <div class="footer-text mt-3">
            계정이 없으신가요? <a href="registerForm.do">회원가입</a>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
