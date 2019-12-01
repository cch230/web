<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/top.css">

</head>
<body>
   <%
      request.setCharacterEncoding("UTF-8");
   
      String root_id = (String)session.getAttribute("root_id");
   %>

   <div class="navbar">
      <div class="left">
         <a href="javascript:history.back();">BACK</a>
         <a href="Mgmain.jsp">MAIN</a>
         <a href="listUser.jsp">USER</a> 
      </div>
      <div class="right">
      <% 
      if(root_id != null)
         out.println("<a href='logout.jsp'>LOGOUT</a>");
      %>
      <% 
      if(root_id == null)
         out.println("<a href='acManager.jsp'>MANAGER</a>");
      else
         out.println("<a href='acManager.jsp'>MANAGER</a>");
      %>
      </div>
   </div>


</body>
</html>