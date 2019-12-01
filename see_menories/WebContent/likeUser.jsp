<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Database.photoUserDAO"%>
<%@ page import="model.user"%>
<%@ page import="model.photo"%>
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

			if (user_id == null || user_id.equals("")) {
	%>
	<jsp:forward page="framePage.jsp">
		<jsp:param name="CONTENTPAGE" value="accountPage.jsp" />
	</jsp:forward>
	<%
		}else{
		photoUserDAO dao = photoUserDAO.getInstance();

		String corn_id = request.getParameter("corn_id");
		
		boolean like = Boolean.parseBoolean(request.getParameter("like"));
		
		user like_corn = dao.selectOneuser(corn_id);
		user corn = dao.selectOneuser(user_id);
		
		int status_code = -1;
		if(like)
			status_code = dao.deleteLike(like_corn, corn);
		else
			status_code = dao.insertLike(like_corn, corn);
		
		String[] status = { "네트워크를 확인해주세요." };

		if (status_code == 0) {//성공	
			
			out.println("<script> location.href='cornPage.jsp?id="+corn_id+"'</script>");

		} else {
			out.println("<script>alert('" + status[status_code - 1] + "');</script>");
			//response.sendRedirect("loginPage.jsp");
			out.println("<script> window.history.back();</script>");

		}

			}
	%>

</body>
</html>
