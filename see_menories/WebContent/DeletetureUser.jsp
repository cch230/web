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

			String user_id = request.getParameter("user_id");

			photoUserDAO dao = photoUserDAO.getInstance();

			dao.deleteuser(user_id);

			response.sendRedirect("main.jsp");
	%>

</body>
</html>
