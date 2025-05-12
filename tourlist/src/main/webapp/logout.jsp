<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 세션에서 로그인 정보 제거
    session.invalidate();
    // 로그아웃 후 메인 페이지로 리다이렉트
    response.sendRedirect("main.jsp");
%>
