<%@page import="posts.PostsDTO"%>
<%@page import="posts.PostsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String) session.getAttribute("username");
    String country = request.getParameter("country");
    PostsDAO dao = new PostsDAO();
    ArrayList<PostsDTO> dtos = dao.list();
    request.setAttribute("dtos", dtos);
    System.out.println("main page : " + username);
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

<!-- 네비게이션 바 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top shadow">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold" href="main.do">🌍 TourList</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav">
        <% if (username == null) { %>
            <li class="nav-item">
              <a class="nav-link" href="loginForm.do">로그인</a>
            </li>
        <% } else { %>
            <li class="nav-item">
              <span class="nav-link active">${username}님</span>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="logout.do">로그아웃</a>
            </li>
        <% } %>
      </ul>
    </div>
  </div>
</nav>

<!-- 메인 콘텐츠 -->
<main class="container" style="margin-top: 80px;">
    <div class="row">
        <!-- 왼쪽 소개 카드 및 나라별 필터 -->
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

            <div class="card shadow-sm">
                <div class="card-header bg-light fw-bold">🌏 나라별 보기</div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <a href="main.do" class="text-decoration-none text-dark">🌐 전체 보기</a>
                    </li>
                    <li class="list-group-item">
                        <a href="#" onclick="goCountry('한국'); return false;" class="text-decoration-none text-dark">
                            <img src="images/flag/korea.png" alt="한국" class="me-2" style="width: 30px; height: 30px;">한국
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="#" onclick="goCountry('일본'); return false;" class="text-decoration-none text-dark">
                            <img src="images/flag/japan.png" alt="일본" class="me-2" style="width: 30px; height: 30px;">일본
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="#" onclick="goCountry('프랑스'); return false;" class="text-decoration-none text-dark">
                            <img src="images/flag/france.png" alt="프랑스" class="me-2" style="width: 30px; height: 30px;">프랑스
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="#" onclick="goCountry('미국'); return false;" class="text-decoration-none text-dark">
                            <img src="images/flag/usa.png" alt="미국" class="me-2" style="width: 30px; height: 30px;">미국
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="#" onclick="goCountry('태국'); return false;" class="text-decoration-none text-dark">
                            <img src="images/flag/thailand.png" alt="태국" class="me-2" style="width: 30px; height: 30px;">태국
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="#" onclick="goCountry('베트남'); return false;" class="text-decoration-none text-dark">
                            <img src="images/flag/vietnam.png" alt="베트남" class="me-2" style="width: 30px; height: 30px;">베트남
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="#" onclick="goCountry('이탈리아'); return false;" class="text-decoration-none text-dark">
                            <img src="images/flag/italy.png" alt="이탈리아" class="me-2" style="width: 30px; height: 30px;">이탈리아
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="#" onclick="goCountry('호주'); return false;" class="text-decoration-none text-dark">
                            <img src="images/flag/australia.png" alt="호주" class="me-2" style="width: 30px; height: 30px;">호주
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 오른쪽 게시글 영역 -->
        <div class="col-md-8">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4>📌 여행 이야기 
                    <small class="text-muted">
                        <% if (country != null) { %> - <%= country %> <% } %>
                    </small>
                </h4>
                <% if (username != null) { %>
                    <a class="btn btn-success btn-sm" href="writeForm.do">+ 글쓰기</a>
                <% } %>
            </div>

            <!-- 게시글 출력 -->
            <% if (username == null && country != null) { %>
                <div class="alert alert-warning">해당 국가의 게시글을 보려면 로그인이 필요합니다.</div>
            <% } else { %>
                <% boolean hasPosts = false; %>
                <% for(PostsDTO dto : dtos) { %>
                    <% if(country == null || country.equals("전체") || (dto.getCountry() != null && dto.getCountry().equals(country))) { %>
                        <% hasPosts = true; %>
                        <div class="card mb-3 shadow-sm">
                            <div class="card-body">
                                <h5><a href="viewForm.do?id=<%= dto.getPostnum() %>" class="text-decoration-none text-primary"><%= dto.getTitle() %></a></h5>
                                <p class="text-muted">
                                    by <a href="userPosts.jsp?author=<%= dto.getAuthor_id() %>" class="text-decoration-none"><%= dto.getAuthor_id() %></a> | 
                                    <%= dto.getCreated_at() %> | 
                                    조회수: <%= dto.getViews() %> | 
                                    좋아요: <%= dto.getLike_count() %>
                                </p>
                                <p class="card-text"><%= dto.getContent() %></p>
                            </div>
                        </div>
                    <% } %>
                <% } %>
                <% if(!hasPosts) { %>
                    <div class="alert alert-info">게시글이 없습니다.</div>
                <% } %>
            <% } %>
        </div>
    </div>
</main>

<!-- Footer -->
<footer class="bg-light text-center text-muted py-3 mt-5 border-top">
    ⓒ 2025 TourBoard. All rights reserved.
</footer>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function goCountry(country) {
        const isLoggedIn = <%= (username != null) ? "true" : "false" %>;
        if (isLoggedIn === "false") {
            alert("로그인이 필요합니다.");
            window.location.href = "loginForm.do";
        } else {
            window.location.href = "main.do?country=" + encodeURIComponent(country);
        }
    }
</script>
</body>
</html>
