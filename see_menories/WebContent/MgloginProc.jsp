<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Database.photoUserDAO"%>
<%@ page import="model.Root"%>
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
		
			String root_id = request.getParameter("id");
			String root_pw = request.getParameter("pw");
			
			Root root = new Root(root_id,root_pw);
			System.out.println(root);
			
			photoUserDAO dao = photoUserDAO.getInstance();
			
			int status_code = dao.checkroot(root);
			
			String[] status = {"비밀번호가 틀렸습니다.","존재하지 않는 관리자입니다.","네트워크를 확인해주세요."};
			
			if(status_code==0){//성공	
		out.println("로그인 성공");
		root = dao.selectOneroot(root_id);

		
		session.setAttribute("root_id", root_id);


		
		
		        //response.sendRedirect("accountPage.jsp");
		out.println("<script> location.href='acManager.jsp'</script>");

			}else{
		out.println("<script>alert('"+status[status_code-1]+"');</script>");
		        //response.sendRedirect("loginPage.jsp");
		out.println("<script> window.history.back();</script>");

			}
	%>

</body>
</html>
