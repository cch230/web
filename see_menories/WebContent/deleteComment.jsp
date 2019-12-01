<%@page import="Database.photoUserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");

			int pop_id = Integer.parseInt(request.getParameter("pop_id"));

			int id = Integer.parseInt(request.getParameter("id"));

			photoUserDAO dao = photoUserDAO.getInstance();

			dao.deleteComment(id);

			response.sendRedirect("commentPage.jsp?id="+pop_id);
	%>

</body>
</html>
