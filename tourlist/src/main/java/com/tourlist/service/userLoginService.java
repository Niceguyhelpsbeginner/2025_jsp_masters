package com.tourlist.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import users.UsersDAO;
import users.UsersDTO;

public class userLoginService implements userService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    request.setCharacterEncoding("UTF-8");

	    String userId = request.getParameter("userId");
	    String password = request.getParameter("password");
//	    HttpSession session = request.getSession();

	   UsersDAO dao = new UsersDAO();

	   ArrayList<UsersDTO> dtos = dao.list();
	   
	   for (UsersDTO dto: dtos){
		   
	      if (userId.equals(dto.getUsername())){
	         if (dto.getpassword().equals(password)){
	        	 System.out.println("로그인서비스 유저아이디"  + dto.getUsername());
//	             request.setAttribute("username", userId);
	             HttpSession session = request.getSession();
	             session.setAttribute("username", userId);
	             
	            break;
	         }
	         else{
//	            
//	            %>
//	            <script>
//	               alert("로그인 실패: 아이디 또는 비밀번호가 일치하지 않습니다.");
//	               history.back();
//	               </script>
//	               <%
	               break;
	         }
	      }
	   }

	}

}
