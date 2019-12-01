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
		
			String user_id = request.getParameter("id");
			String user_pw = request.getParameter("pw");
			
			user user = new user(user_id,user_pw);
			System.out.println(user);
			
			photoUserDAO dao = photoUserDAO.getInstance();
			
			int status_code = dao.checkuser(user);
			
			String[] status = {"비밀번호가 틀렸습니다.","존재하지 않는 회원입니다.","네트워크를 확인해주세요."};
			
			if(status_code==0){//성공	
		out.println("로그인 성공");
		user = dao.selectOneuser(user_id);

			
		session.setAttribute("user_id", user_id);
		session.setAttribute("user_name", user.getName());
		session.setAttribute("user_birth", user.getBirth());
		
		
		        //response.sendRedirect("accountPage.jsp");
		out.println("<script> location.href='accountPage.jsp'</script>");

			}else{
		out.println("<script>alert('"+status[status_code-1]+"');</script>");
		        //response.sendRedirect("loginPage.jsp");
		out.println("<script> window.history.back();</script>");

			}
	%>

</body>
</html>
