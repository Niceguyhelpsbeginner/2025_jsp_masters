<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userId = request.getParameter("userId");
    String password = request.getParameter("password");

    // 간단한 로그인 처리 (아이디가 '1'이고 비밀번호가 '1'일 때만 로그인 허용)
    if ("1".equals(userId) && "1".equals(password)) {
        // 세션에 로그인 정보 저장
        session.setAttribute("userId", userId);
        // 로그인 성공 시 메인 페이지로 리다이렉트
        response.sendRedirect("main.jsp");
    } else {
        // 로그인 실패 시 다시 로그인 페이지로 리다이렉트
        out.println("<script>alert('로그인 실패. 아이디와 비밀번호를 확인해주세요.'); window.location='login.jsp';</script>");
    }
%>
