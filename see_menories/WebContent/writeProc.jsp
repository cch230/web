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
			
		String title = request.getParameter("title");
		String tag = request.getParameter("tag");
		String location = request.getParameter("location");
		String content = request.getParameter("content");
		String[] photo = new String[3];
		String photo1 = request.getParameter("photo1");
		photo[0] = photo1 == null || photo1.equals("") ? "" : "image/"+photo1;
		String photo2 = request.getParameter("photo2");
		photo[1] = photo2 == null || photo2.equals("") ? "" : "image/"+photo2;
		String photo3 = request.getParameter("photo3");
		photo[2] = photo3 == null || photo3.equals("") ? "" : "image/"+photo3;
		
		

		tag = tag.equals("see") ? "볼거리" : "먹거리";
		photo pop = new photo(title,tag,location,content,0,photo);
		int status_code=-1;
		int status_rootcode=-1;
		String[] status = {"사진을 등록하였습니다.","네트워크를 확인해주세요.","네트워크를 확인해주세요."};
		photoUserDAO dao = photoUserDAO.getInstance();
		int flag=dao.whouser((String)session.getAttribute("root_id"));
		
		System.out.println(flag);
		System.out.println((String)session.getAttribute("root_id"));

		if(flag==1){
			status_rootcode = dao.insertInfo(pop,(String)session.getAttribute("root_id"));
			out.println("<script>alert('"+status[status_rootcode]+"');</script>");
		}
		else{
			status_code = dao.insertphoto(pop,(String)session.getAttribute("user_id"));	
			out.println("<script>alert('"+status[status_code]+"');</script>");
		}
			
		System.out.println(flag);


		

		if((status_code==0)||(status_rootcode==0)){//성공	
			        //response.sendRedirect("accountPage.jsp");
			out.println("<script> location.href='accountPage.jsp'</script>");

		}else{
			        //response.sendRedirect("loginPage.jsp");
			out.println("<script> window.history.back();</script>");

		}
	%>

</body>
</html>
