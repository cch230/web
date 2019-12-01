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

	if (session.getAttribute("root_id") != null) {

		photoUserDAO dao = photoUserDAO.getInstance();

		dao.deleteAllphoto();
		
%>
		
<%
	} else {

				String user_id = request.getParameter("user_id");

				photoUserDAO dao = photoUserDAO.getInstance();

				dao.deleteAllphoto(user_id);
	}
%>

<%
	if (session.getAttribute("root_id") != null) {
%>
		<jsp:forward page="Mgframe.jsp">
			<jsp:param name="CONTENTPAGE" value="acManagerProc.jsp" />
		</jsp:forward>
<%
	} else {
%>
		<jsp:forward page="Mgframe.jsp">
			<jsp:param name="CONTENTPAGE" value="accountPage.jsp" />
		</jsp:forward>
<%
	}
%>

</body>
</html>
