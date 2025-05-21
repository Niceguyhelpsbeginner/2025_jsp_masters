<%@page import="posts.PostsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="posts.PostsDAO"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userId = (String) session.getAttribute("userId");
%>
<html>
<head>
    <title>Tour Board</title>
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<div class="header">
    <i class="fas fa-globe-asia"></i> TourList
</div>

<div class="top-section">
    <div class="intro">
        <h3 style="cursor: pointer;" onclick="toggleIntro()">
            <i class="fas fa-info-circle"></i> 소개
        </h3>
        <div id="introContent" style="display: none;">
            <p>
                이 웹사이트는 전 세계의 멋진 여행지를 소개하는 게시판입니다.<br>
                다양한 나라의 관광지, 문화, 음식을 함께 즐겨보세요!
            </p>
        </div>
    </div>

    <div class="auth">
        <% if (userId == null) { %>
            <button onclick="location.href='login.jsp'"><i class="fas fa-sign-in-alt"></i> 로그인</button>
        <% } else { %>
            <span><i class="fas fa-user"></i> <%= userId %>님</span>
            <button onclick="location.href='logout.jsp'"><i class="fas fa-sign-out-alt"></i> 로그아웃</button>
            <button onclick="location.href='write.jsp'"><i class="fas fa-pen"></i> 글쓰기</button>
        <% } %>
    </div>
</div>

<div class="image-section">
    <div>
        <h2>당신의 꿈꾸는 여행을 시작하세요</h2>
        <p>전 세계의 아름다운 여행지를 만나보세요</p>
    </div>
</div>

<div class="countries">
    <div class="country">
        <img src="images/korea.png" alt="한국">
        <p><i class="fas fa-map-marker-alt"></i> 한국</p>
    </div>
    <div class="country">
        <img src="images/japan.png" alt="일본">
        <p><i class="fas fa-map-marker-alt"></i> 일본</p>
    </div>
    <div class="country">
        <img src="images/france.png" alt="프랑스">
        <p><i class="fas fa-map-marker-alt"></i> 프랑스</p>
    </div>
    <div class="country">
        <img src="images/italy.png" alt="이탈리아">
        <p><i class="fas fa-map-marker-alt"></i> 이탈리아</p>
    </div>
    <div class="country">
        <img src="images/usa.png" alt="미국">
        <p><i class="fas fa-map-marker-alt"></i> 미국</p>
    </div>
    <div class="country">
        <img src="images/thailand.png" alt="태국">
        <p><i class="fas fa-map-marker-alt"></i> 태국</p>
    </div>
    <div class="country">
        <img src="images/vietnam.png" alt="베트남">
        <p><i class="fas fa-map-marker-alt"></i> 베트남</p>
    </div>
    <div class="country">
        <img src="images/australia.png" alt="호주">
        <p><i class="fas fa-map-marker-alt"></i> 호주</p>
    </div>
</div>

<div class="board-section">
    <h3><i class="fas fa-list"></i> 최신 게시글</h3>
    <% if (userId != null) { %>
    <div class="write-btn">
        <button onclick="location.href='write.jsp'"><i class="fas fa-pen"></i> 글쓰기</button>
    </div>
    <% } %>
    
    <%
        PostsDAO dao = new PostsDAO();
        ArrayList<PostsDTO> dtos = dao.list();
    %>
    
    <table>
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>좋아요</th>
        </tr>
        </thead>
        <tbody>
        <% for(PostsDTO dto : dtos) { %>
        <tr>
            <td><%= dto.getId() %></td>
            <td><a href="view.jsp?id=<%= dto.getId() %>"><%= dto.getTitle() %></a></td>
            <td><i class="fas fa-user"></i> <%= dto.getAuthor() %></td>
            <td><i class="far fa-calendar-alt"></i> <%= dto.getCreated_at() %></td>
            <td><i class="fas fa-heart"></i> <%= dto.getLike_count() %></td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

<script>
    function toggleIntro() {
        const content = document.getElementById("introContent");
        if (content.style.display === "none" || content.style.display === "") {
            content.style.display = "block";
            content.style.animation = "fadeIn 0.5s ease-in-out";
        } else {
            content.style.display = "none";
        }
    }
</script>

</body>
</html>
