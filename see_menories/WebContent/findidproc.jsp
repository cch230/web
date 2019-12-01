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
      
         String user_name = request.getParameter("name");
         String user_phone = request.getParameter("phone");
         int temp=0;
         user user = new user(user_name,user_phone,temp);
         
         photoUserDAO dao = photoUserDAO.getInstance();
         
         int status_code = dao.findid(user);
         String result=null;
         
         
         if(status_code==0){   
        	 user = new user(user_phone);
        	 result= dao.findidfin(user);
           
         }
             String[] status = {"아이디는 "+result+" 입니다!","정보가 틀렸습니다.","존재하지 않는 회원입니다.","네트워크를 확인해주세요."};
            out.println("<script>alert('"+status[status_code]+"');</script>");
              //response.sendRedirect("loginPage.jsp");
            out.println("<script> window.history.back();</script>");

        
   %>

</body>
</html>