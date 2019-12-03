<%@page import="Database.photoUserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
			var choose;
			choose=comfirm("정말 탈퇴하시겠습니까??"+"\n"+"되돌릴 수 없습니다!!");
			if(choose==true)
				{
				response.sendRedirect("DeletetureUser.jsp");				}
			else {
				response.sendRedirect("accountPage.jsp");
	
			}
		</script>
	
	
</head>
<body>
	
		

</body>
</html>
