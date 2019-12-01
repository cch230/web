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
	photoUserDAO dao = photoUserDAO.getInstance();
	int choose;
			dao.deleteAllphoto();
		%>	
		<script>
			var choose;
			choose=comfirm("정말 탈퇴하시겠습니까??"+"\n"+"되돌릴 수 없습니다!!");
			if(choose)
				{
					
					alter('"퇼퇴되었습니다..ㅜ"');
				}
			else {
				response.sendRedirect("main.jsp");
	
			}
		</script>
	
	<%
	out.println("<script>comfirm("+"정말 탈퇴하시겠습니까??"+ "\n"+"되돌릴 수 없습니다!!"+");</script>");
		request.setCharacterEncoding("utf-8");

			String user_id = request.getParameter("user_id");


			dao.deleteuser(user_id);

			response.sendRedirect("main.jsp");
	%>

</body>
</html>
