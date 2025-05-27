<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String author = request.getParameter("author");
    String userId = (String) session.getAttribute("userId");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title><%= author %> 님의 게시글 | TourList</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/New.css"> <!-- New.jsp에서 사용한 CSS 동일하게 적용 -->
</head>
<body>

<!-- 네비게이션 바 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top shadow">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold" href="index.jsp">🌍 TourList</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav">
        <% if (userId == null) { %>
            <li class="nav-item">
              <a class="nav-link" href="login.jsp">로그인</a>
            </li>
        <% } else { %>
            <li class="nav-item">
              <span class="nav-link active"><%= userId %>님</span>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="logout.jsp">로그아웃</a>
            </li>
        <% } %>
      </ul>
    </div>
  </div>
</nav>

<!-- 메인 콘텐츠 -->
<main class="container" style="margin-top: 80px; margin-bottom: 40px;">
    <h2 class="mb-4">📝 <%= author %> 님의 게시글 목록</h2>
    <hr>

    <%-- 실제 DB 연동 전 샘플 데이터 하드코딩 --%>
    <% if ("홍길동".equals(author)) { %>
        <div class="card mb-3 shadow-sm">
            <div class="card-body">
                <h5><a href="view.jsp?id=1" class="text-decoration-none text-primary">제주도 추천 여행지</a></h5>
                <p class="text-muted">by <%= author %> | 2025-05-08</p>
                <p class="card-text">맑은 바다와 아름다운 오름들, 맛있는 흑돼지까지! 제주도만의 매력을 소개합니다.</p>
            </div>
        </div>
    <% } else if ("이몽룡".equals(author)) { %>
        <div class="card mb-3 shadow-sm">
            <div class="card-body">
                <h5><a href="view.jsp?id=2" class="text-decoration-none text-primary">오사카 맛집 리스트</a></h5>
                <p class="text-muted">by <%= author %> | 2025-05-07</p>
                <p class="card-text">타코야키, 오코노미야키 등 오사카에서 꼭 가봐야 할 맛집을 소개합니다.</p>
            </div>
        </div>
    <% } else { %>
        <div class="alert alert-info">작성자 <strong><%= author %></strong>님의 게시글이 없습니다.</div>
    <% } %>

    <a href="New.jsp" class="btn btn-secondary mt-4">← 전체 게시글 목록으로 돌아가기</a>
</main>

<!-- Footer -->
<footer class="bg-light text-center text-muted py-3 mt-5 border-top">
    ⓒ 2025 TourBoard. All rights reserved.
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
