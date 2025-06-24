<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String) session.getAttribute("username");
	System.out.print("writeForm"+username);
    if (username == null) {
        response.setContentType("text/html; charset=UTF-8");
%>
<script>
    alert("로그인 후 글쓰기를 이용하실 수 있습니다.");
    location.href = "main.do";
</script>
<%
        return;
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>글쓰기 | TourList</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/write1.css">  <%-- 분리한 CSS --%>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top shadow">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold" href="main.do">🌍 TourList</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <span class="nav-link active"><%= username %>님</span>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="logout.do">로그아웃</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container form-container" style="margin-top: 100px; max-width: 720px;">
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white text-center fs-4">
            글쓰기
        </div>
        <div class="card-body">
            <form action="write.do" method="get" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="title" class="form-label">제목</label>
                    <input type="text" id="title" name="title" class="form-control" placeholder="제목" required>
                </div>
                <div class="mb-3">
                    <label for="content" class="form-label">내용</label>
                    <textarea id="content" name="content" class="form-control" placeholder="내용" rows="6" required></textarea>
                </div>
                <div class="mb-3">
                    <label for="image" class="form-label">이미지 첨부 (선택)</label>
                    <input type="file" name="image" class="form-control" id="image" accept="image/*">
                </div>
                <div class="mb-3">
                    <label for="writer" class="form-label">작성자</label>
                    <input type="text" id="writer" name="writer" class="form-control" value="<%= username %>" readonly>
                </div>                
                <div class="mb-3">
					<select name="country" id="country" required>
					            <option value="korea">한국</option>
					            <option value="japan">일본</option>
					            <option value="france">프랑스</option>
					            <option value="usa">미국</option>
					            <option value="thailand">태국</option>
					            <option value="vietnam">베트남</option>
					            <option value="italy">이탈리아</option>
					            <option value="australia">호주</option>
					</select>
                </div>
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-success">작성하기</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='main.do'">취소</button>
                </div>
            </form>
        </div>
    </div>
</div>

<footer class="footer text-center mt-4">
    <p>&copy; 2025 TourBoard. All Rights Reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
