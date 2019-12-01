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
			String user_question = request.getParameter("question");
			String user_answer = request.getParameter("answer");
			
			user user = new user(user_id,user_question,user_answer);
			System.out.println(user);
			
			photoUserDAO dao = photoUserDAO.getInstance();
			
			int status_code = dao.findpassword(user);
			
       	 String result= dao.findpwfin(user);

	
				String[] status = {"비밀번호는 "+result+" 입니다!","정보가 틀렸습니다.","존재하지 않는 회원입니다.","네트워크를 확인해주세요."};

			out.println("<script>alert('"+status[status_code]+"');</script>");
		        //response.sendRedirect("loginPage.jsp");
			out.println("<script> window.history.back();</script>");

	%>

</body>
</html>
