<%@page import="users.UsersDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="users.UsersDAO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String userId = request.getParameter("userId");
    String password = request.getParameter("password");

   UsersDAO dao = new UsersDAO();

   ArrayList<UsersDTO> dtos = dao.list();
   
   for (UsersDTO dto: dtos){
	   
      if (userId.equals(dto.getUsername())){
         if (dto.getpassword().equals(password)){
              session.setAttribute("username", userId);
              response.sendRedirect("main.jsp"); // 메인 페이지로 이동
            break;
         }
         else{
            
            %>
            <script>
               alert("로그인 실패: 아이디 또는 비밀번호가 일치하지 않습니다.");
               history.back();
               </script>
               <%
               break;
         }
      }
   }
%>
   

   
