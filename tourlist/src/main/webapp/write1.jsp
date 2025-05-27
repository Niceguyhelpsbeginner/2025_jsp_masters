<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <a class="navbar-brand fw-bold" href="New.jsp">🌍 TourList</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
  </div>
</nav>

<div class="container form-container">
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white text-center fs-4">
            글쓰기
        </div>
        <div class="card-body">
            <form action="writePost.jsp" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <input type="text" name="title" class="form-control" placeholder="제목" required>
                </div>
                <div class="mb-3">
                    <textarea name="description" class="form-control" placeholder="내용" rows="6" required></textarea>
                </div>
                <div class="mb-3">
                    <label for="image" class="form-label">이미지 첨부 (선택)</label>
                    <input type="file" name="image" class="form-control" id="image" accept="image/*">
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-success">작성하기</button>
                </div>
            </form>
        </div>
    </div>
</div>

<footer class="footer">
    <p>&copy; 2025 TourBoard. All Rights Reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
