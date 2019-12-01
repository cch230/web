<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
