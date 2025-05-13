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
</head>
<body>
<div class="header">
    TourList
</div>

<div class="top-section">
    <div class="intro">
        <h3 style="cursor: pointer;" onclick="toggleIntro()">
            소개
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
            <button onclick="location.href='login.jsp'">로그인</button>
        <% } else { %>
            <span><%= userId %>님</span>
            <button onclick="location.href='logout.jsp'">로그아웃</button>
            <button onclick="location.href='write.jsp'">글쓰기</button>
        <% } %>
    </div>
</div>

<div class="image-section">
    <div>
        [비행기 이미지 자리]
    </div>
</div>

<div class="countries">
    <div class="country"><img src="images/korea.png" alt="한국"><p>한국</p></div>
    <div class="country"><img src="images/japan.png" alt="일본"><p>일본</p></div>
    <div class="country"><img src="images/france.png" alt="프랑스"><p>프랑스</p></div>
    <div class="country"><img src="images/italy.png" alt="이탈리아"><p>이탈리아</p></div>
    <div class="country"><img src="images/usa.png" alt="미국"><p>미국</p></div>
    <div class="country"><img src="images/thailand.png" alt="태국"><p>태국</p></div>
    <div class="country"><img src="images/vietnam.png" alt="베트남"><p>베트남</p></div>
    <div class="country"><img src="images/australia.png" alt="호주"><p>호주</p></div>
</div>

<div class="board-section">
    <h3>최신 게시글</h3>
    <% if (userId != null) { %>
    <div class="write-btn">
        <button onclick="location.href='write.jsp'">+ 글쓰기</button>
    </div>
    <% } %>
    
    <%
		PostsDAO dao = new PostsDAO();
		ArrayList<PostsDTO> dtos = dao.list();
		for(PostsDTO dto : dtos){
			out.println(dto.getTitle());
			out.println(dto.getContent());
			out.println(dto.getCreated_at());
			out.println(dto.getLike_count());
			out.println(dto.getCountry());
			
		};
		%>
    
    <table>
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>1</td>
            <td><a href="view.jsp?id=1">제주도 추천 여행지</a></td>
            <td>홍길동</td>
            <td>2025-05-08</td>
        </tr>
        <tr>
            <td>2</td>
            <td><a href="view.jsp?id=2">오사카 맛집 리스트</a></td>
            <td>이몽룡</td>
            <td>2025-05-07</td>
        </tr>
        </tbody>
    </table>
</div>

<script>
    function toggleIntro() {
        const content = document.getElementById("introContent");

        if (content.style.display === "none" || content.style.display === "") {
            content.style.display = "block";  // 보이게 설정
        } else {
            content.style.display = "none";  // 숨기기 설정
        }
    }
</script>

</body>
</html>
