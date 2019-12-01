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
		<jsp:param name="CONTENTPAGE" value="loginPageProc.jsp" />
	</jsp:forward>
	<%
		}else{
			photoUserDAO dao = photoUserDAO.getInstance();

			int photo_id = Integer.parseInt(request.getParameter("photo_id"));
			String page_type = request.getParameter("page");
			boolean like = Boolean.parseBoolean(request.getParameter("like"));
			
			photo photo = dao.selectOnephoto(photo_id);
			user user = dao.selectOneuser(user_id);
			
			int status_code = -1;
			if(like)
		status_code = dao.deleteLike(photo, user);
			else
		status_code = dao.insertLike(photo, user);
			
			String[] status = { "네트워크를 확인해주세요." };

			if (status_code == 0) {//성공
		if(page_type == null){
			out.println("<script> window.history.back(); </script>");
		}else if(page_type.equals("commentPage")){
			out.println("<script> location.href='"+page_type+".jsp?id="+photo_id+"'</script>");
		}else if(page_type.equals("accountPage")){
			out.println("<script> location.href='"+page_type+".jsp?id="+user_id+"'</script>");
		}else if(page_type.equals("userPage")){
			String id = request.getParameter("id");
			out.println("<script> location.href='"+page_type+".jsp?id="+id+"'</script>");

		}else{
			out.println("<script> location.href='"+page_type+".jsp'</script>");

		}
		

			} else {
		out.println("<script>alert('" + status[status_code - 1] + "');</script>");
		//response.sendRedirect("loginPage.jsp");
		out.println("<script> window.history.back();</script>");

			}

		}
	%>

</body>
</html>
