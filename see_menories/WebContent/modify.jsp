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
		
			String user_id = (String) session.getAttribute("user_id");
			
			String user_pw = request.getParameter("pw");
			String user_name = request.getParameter("name");
			String user_nickname = request.getParameter("nickname");
			String user_birth = request.getParameter("birth");
			String user_phone = request.getParameter("phone");
			String profile = request.getParameter("profile");
			profile = profile == null || profile.equals("") ? "image/none.png" : "image/"+profile;

			
			user user = new user(user_id,user_pw,user_name,user_nickname,user_birth,user_phone,profile);
			
			System.out.println("정보수정 "+user);
			photoUserDAO dao = photoUserDAO.getInstance();
			
			int status_code = dao.updateuser(user);
			
			String[] status = {"네트워크를 확인해주세요."};
			
			if(status_code==0){//성공	
		out.println("업데이트 성공 ");
		        //response.sendRedirect("accountPage.jsp");
		        out.println("<script>alert('정보 수정에 성공했습니다.');</script>");
		out.println("<script> location.href='accountPage.jsp'</script>");

			}else{
		out.println("<script>alert('"+status[status_code-1]+"');</script>");
		        //response.sendRedirect("loginPage.jsp");
		out.println("<script> window.history.back();</script>");

			}
	%>

</body>
</html>
