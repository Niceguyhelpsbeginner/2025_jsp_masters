<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="posts.PostsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="posts.PostsDAO"%>
<%
    String userId = (String) session.getAttribute("userId");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>TourList | 전 세계 여행 커뮤니티</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/New.css">
</head>
<body>

<!-- ✅ 네비게이션 바 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top shadow">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold" href="#">🌍 TourList</a>
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
            <li class="nav-item">
              <a class="btn btn-light btn-sm ms-2" href="write.jsp">글쓰기</a> <!-- 글쓰기 버튼 추가 -->
            </li>
        <% } %>
      </ul>
    </div>
  </div>
</nav>

<!-- ✅ 메인 콘텐츠 -->
<main class="container" style="margin-top: 80px;">
    <div class="row">
        <!-- 왼쪽 소개 카드 -->
        <div class="col-md-4">
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <h5 class="card-title">🌟 소개</h5>
                    <p class="card-text">
                        TourList는 세계의 여행지를 공유하고 추천하는 플랫폼입니다.
                        <br>당신만의 특별한 여행 스토리를 공유하세요!
                    </p>
                </div>
            </div>

            <!-- 나라별 필터 (간단 리스트) -->
            <div class="card shadow-sm">
                <div class="card-header bg-light fw-bold">🌏 나라별 보기</div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <img src="images/korea.png" alt="한국" class="me-2" style="width: 30px; height: 30px;">
                        한국
                    </li>
                    <li class="list-group-item">
                        <img src="images/japan.png" alt="일본" class="me-2" style="width: 30px; height: 30px;">
                        일본
                    </li>
                    <li class="list-group-item">
                        <img src="images/france.png" alt="프랑스" class="me-2" style="width: 30px; height: 30px;">
                        프랑스
                    </li>
                    <li class="list-group-item">
                        <img src="images/usa.png" alt="미국" class="me-2" style="width: 30px; height: 30px;">
                        미국
                    </li>
                    <li class="list-group-item">
                        <img src="images/thailand.png" alt="태국" class="me-2" style="width: 30px; height: 30px;">
                        태국
                    </li>
                    <li class="list-group-item">
                        <img src="images/vietnam.png" alt="베트남" class="me-2" style="width: 30px; height: 30px;">
                        베트남
                    </li>
                    <li class="list-group-item">
                        <img src="images/italy.png" alt="이탈리아" class="me-2" style="width: 30px; height: 30px;">
                        이탈리아
                    </li>
                    <li class="list-group-item">
                        <img src="images/australia.png" alt="호주" class="me-2" style="width: 30px; height: 30px;">
                        호주
                    </li>
                </ul>
            </div>
        </div>

        <!-- 오른쪽 콘텐츠 -->
        <div class="col-md-8">
            <!-- 게시판 섹션 -->
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4>📌 최신 여행 이야기</h4>
                <% if (userId != null) { %>
                <a class="btn btn-success btn-sm" href="write.jsp">+ 글쓰기</a> <!-- 글쓰기 버튼 -->
                <% } %>
            </div>

            <div class="card mb-3 shadow-sm">
                <div class="card-body">
                    <h5><a href="view.jsp?id=1" class="text-decoration-none text-primary">제주도 추천 여행지</a></h5>
                    <p class="text-muted">by 홍길동 | 2025-05-08</p>
                    <p class="card-text">맑은 바다와 아름다운 오름들, 맛있는 흑돼지까지! 제주도만의 매력을 소개합니다.</p>
                </div>
            </div>

            <div class="card mb-3 shadow-sm">
                <div class="card-body">
                    <h5><a href="view.jsp?id=2" class="text-decoration-none text-primary">오사카 맛집 리스트</a></h5>
                    <p class="text-muted">by 이몽룡 | 2025-05-07</p>
                    <p class="card-text">타코야키, 오코노미야키 등 오사카에서 꼭 가봐야 할 맛집을 소개합니다.</p>
                </div>
            </div>
            <%
		        PostsDAO dao = new PostsDAO();
		        ArrayList<PostsDTO> dtos = dao.list();
		    %>
            <% for(PostsDTO dto : dtos) { %>
            <div class="card mb-3 shadow-sm">
                <div class="card-body">
                    <h5><a href="view.jsp?id=<%=dto.getPostnum()%>" class="text-decoration-none text-primary"><%=dto.getTitle()%></a></h5>
                    <p class="text-muted">by <%=dto.getAuthor_id()%> | <%=dto.getCreated_at()%></p>
                    <p class="card-text"><%=dto.getContent()%></p>
                </div>
            </div>
            <%} %>
        </div>
    </div>
</main>

<!-- ✅ Footer -->
<footer class="bg-light text-center text-muted py-3 mt-5 border-top">
    ⓒ 2025 TourBoard. All rights reserved.
</footer>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
