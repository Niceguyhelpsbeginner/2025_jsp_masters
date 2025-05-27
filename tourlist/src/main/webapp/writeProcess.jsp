<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*, java.text.SimpleDateFormat" %>
<%
    String userId = (String) session.getAttribute("userId");
    if (userId == null) {
%>
<script>
    alert("로그인 후 글쓰기를 이용하실 수 있습니다.");
    location.href = "login.jsp";
</script>
<%
        return;
    }

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        if (title == null || title.trim().isEmpty() || content == null || content.trim().isEmpty()) {
%>
<script>
    alert("제목과 내용을 모두 입력해주세요.");
    history.back();
</script>
<%
            return;
        }

        List<Map<String, String>> posts = (List<Map<String, String>>) application.getAttribute("posts");
        if (posts == null) {
            posts = new ArrayList<>();
            application.setAttribute("posts", posts);
        }

        // 새 글 ID는 현재 리스트 크기 + 1 (간단히)
        String id = String.valueOf(posts.size() + 1);

        Map<String, String> newPost = new HashMap<>();
        newPost.put("id", id);
        newPost.put("title", title);
        newPost.put("content", content);
        newPost.put("writer", userId);
        newPost.put("date", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

        posts.add(newPost);

        response.sendRedirect("New.jsp");
    } else {
%>
<script>
    alert("잘못된 접근입니다.");
    location.href = "write.jsp";
</script>
<%
    }
%>
