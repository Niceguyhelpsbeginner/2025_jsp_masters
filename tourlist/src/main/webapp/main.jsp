<%@page import="posts.PostsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="posts.PostsDAO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userId = (String) session.getAttribute("userId");
	
	
%>
<html>
<head>
    <title>Tour Board</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .header {
            text-align: center;
            padding: 20px;
            background-color: #f2f2f2;
            font-size: 24px;
            font-weight: bold;
        }

        .top-section {
            display: flex;
            justify-content: space-between;
            padding: 20px;
        }

        .intro {
            width: 60%;
            padding: 10px;
            background-color: #e0f7fa;
        }

        .auth {
            width: 35%;
            text-align: right;
            padding: 10px;
            background-color: #ffe0b2;
        }

        .auth button {
            margin-left: 10px;
            padding: 6px 12px;
            font-size: 14px;
        }

        .image-section {
            text-align: center;
            padding: 30px;
        }

        .countries {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            padding: 30px;
            background-color: #f0f4c3;
        }

        .country {
            text-align: center;
            background-color: white;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        .country img {
            max-width: 100%;
            height: auto;
        }

        .country p {
            margin-top: 10px;
            font-weight: bold;
        }

        .board-section {
            padding: 30px;
        }

        .board-section h3 {
            margin-bottom: 15px;
            border-left: 5px solid #81c784;
            padding-left: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
        }

        table th, table td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        table thead {
            background-color: #c8e6c9;
        }

        .write-btn {
            text-align: right;
            margin-bottom: 10px;
        }

        .write-btn button {
            padding: 6px 12px;
            background-color: #4caf50;
            color: white;
            border: none;
            cursor: pointer;
        }

        .write-btn button:hover {
            background-color: #388e3c;
        }
    </style>
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
    <div style="width: 300px; height: 150px; background-color: #ddd; margin: auto; line-height: 150px;">
        [비행기 이미지 자리]
    </div>
</div>

<div class="countries">
    <div class="country"><img src="images/korea.jpg" alt="한국"><p>한국</p></div>
    <div class="country"><img src="images/japan.jpg" alt="일본"><p>일본</p></div>
    <div class="country"><img src="images/france.jpg" alt="프랑스"><p>프랑스</p></div>
    <div class="country"><img src="images/italy.jpg" alt="이탈리아"><p>이탈리아</p></div>
    <div class="country"><img src="images/usa.jpg" alt="미국"><p>미국</p></div>
    <div class="country"><img src="images/thailand.jpg" alt="태국"><p>태국</p></div>
    <div class="country"><img src="images/vietnam.jpg" alt="베트남"><p>베트남</p></div>
    <div class="country"><img src="images/australia.jpg" alt="호주"><p>호주</p></div>
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
    
<!--     <table> -->
<!--         <thead> -->
<!--         <tr> -->
<!--             <th>번호</th> -->
<!--             <th>제목</th> -->
<!--             <th>작성자</th> -->
<!--             <th>작성일</th> -->
<!--         </tr> -->
<!--         </thead> -->
<!--         <tbody> -->
<!--         <tr> -->
<!--             <td>1</td> -->
<!--             <td><a href="view.jsp?id=1">제주도 추천 여행지</a></td> -->
<!--             <td>홍길동</td> -->
<!--             <td>2025-05-08</td> -->
<!--         </tr> -->
<!--         <tr> -->
<!--             <td>2</td> -->
<!--             <td><a href="view.jsp?id=2">오사카 맛집 리스트</a></td> -->
<!--             <td>이몽룡</td> -->
<!--             <td>2025-05-07</td> -->
<!--         </tr> -->
        
        
        
<!--         </tbody> -->
<!--     </table> -->
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
