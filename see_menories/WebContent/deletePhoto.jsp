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

			int id = Integer.parseInt(request.getParameter("id"));

			photoUserDAO dao = photoUserDAO.getInstance();

			dao.deletephoto(id);

			response.sendRedirect("accountPage.jsp");
	%>

</body>
</html>
