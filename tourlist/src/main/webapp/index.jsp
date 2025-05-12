<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userId = (String) session.getAttribute("userId");
%>
<!-- ... 생략 ... -->
<div class="auth">
    <% if (userId == null) { %>
        <button onclick="location.href='login.jsp'">로그인</button>
    <% } else { %>
        <span><%= userId %>님 환영합니다</span>
        <button onclick="location.href='logout.jsp'">로그아웃</button>
        <button onclick="location.href='write.jsp'">글쓰기</button>
    <% } %>
</div>
<!-- ... 생략 ... -->
