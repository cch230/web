<%@page import="Database.photoUserDAO"%>
<%@page import="model.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
      request.setCharacterEncoding("utf-8");

         
         String user_id = (String) session.getAttribute("user_id");
         if (user_id == null) {
   %>
   <jsp:forward page="framePage.jsp">
      <jsp:param name="CONTENTPAGE" value="loginPageProc.jsp" />
   </jsp:forward>
   <%
      } else {

      String user_name = (String) session.getAttribute("user_name");

      int photo_id = Integer.parseInt(request.getParameter("photo_id"));
      String input_comment = request.getParameter("comment");


      Comment comment = new Comment(photo_id, user_id, user_name, input_comment);


      photoUserDAO dao = photoUserDAO.getInstance();

      int status_code = dao.insertComment(comment);

      String[] status = { "네트워크를 확인해주세요." };

      if (status_code == 0) {//성공   
         //response.sendRedirect("accountPage.jsp");
         out.println("<script> location.href='commentPage.jsp?id="+photo_id+"'</script>");

      } else {
         out.println("<script>alert('" + status[status_code - 1] + "');</script>");
         //response.sendRedirect("loginPage.jsp");
         out.println("<script> window.history.back();</script>");

      }
         }
   %>
</body>
</html>