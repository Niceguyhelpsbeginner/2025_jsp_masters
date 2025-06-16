<%@page import="java.util.ArrayList"%>
<%@page import="users.UsersDTO"%>
<%@page import="users.UsersDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- <% --%>
// 	request.setCharacterEncoding("UTF-8");


//     // DB 연결 설정 (JDBC)
//     Connection conn = null;
//     PreparedStatement stmt = null;
//     String dbURL = "jdbc:mysql://localhost:3307/guo7404";
//     String dbUser = "root";
//     String dbPass = "password"; // 실제 DB 패스워드로 변경 필요

//     try {
//         // DB 연결
//         Class.forName("com.mysql.cj.jdbc.Driver");
//         conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

//         // SQL 쿼리 작성
//         String sql = "INSERT INTO users (username, password) VALUES (?, ?)";
//         stmt = conn.prepareStatement(sql);
//         stmt.setString(1, username);
//         stmt.setString(2, password);  // 비밀번호는 나중에 암호화 처리하는 것이 좋습니다.

//         // 쿼리 실행
//         int rowsAffected = stmt.executeUpdate();

//         if (rowsAffected > 0) {
//             // 성공적으로 회원가입을 완료한 경우
//             out.println("<script>alert('회원가입 성공!'); location.href='login.jsp';</script>");
//         } else {
//             out.println("<script>alert('회원가입 실패!'); history.back();</script>");
//         }
//     } catch (Exception e) {
//         e.printStackTrace();
//         out.println("<script>alert('에러가 발생했습니다.'); history.back();</script>");
//     } finally {
//         try {
//             if (stmt != null) stmt.close();
//             if (conn != null) conn.close();
//         } catch (SQLException e) {
//             e.printStackTrace();
//         }
//     }
<%-- %> --%>
<%
    request.setCharacterEncoding("UTF-8");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	System.out.println(username);
	UsersDAO dao = new UsersDAO();
	UsersDTO dto = new UsersDTO(username, password);
	dao.register(dto);
    session.setAttribute("username", username);
    response.sendRedirect("main.jsp"); // 메인 페이지로 이동

%>
