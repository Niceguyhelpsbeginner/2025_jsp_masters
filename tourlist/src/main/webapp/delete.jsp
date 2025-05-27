<%@ page import="java.util.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String userId = (String) session.getAttribute("userId");

    List<Map<String, String>> posts = (List<Map<String, String>>) application.getAttribute("posts");

    if (id != null && posts != null && userId != null) {
        Iterator<Map<String, String>> iterator = posts.iterator();
        while (iterator.hasNext()) {
            Map<String, String> post = iterator.next();
            if (post.get("id").equals(id) && userId.equals(post.get("writer"))) {
                iterator.remove(); // 해당 게시글 삭제
                break;
            }
        }
        application.setAttribute("posts", posts); // 갱신 저장
    }

    response.sendRedirect("New.jsp");
%>
