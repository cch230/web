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
			<jsp:param name="CONTENTPAGE" value="Managerlogin.jsp" />
		</jsp:forward>
<%
	}
%>
	

</body>
</html>
