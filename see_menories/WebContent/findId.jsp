<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
   
   <jsp:include page="top.jsp" flush="false" />
   
   <div class="body"style="overflow:scroll; height:100vh">
   <div class="panel-lite">
      <form action="findidproc.jsp" method="post">
         <div class="thumbur">
            <div class="icon-lock"></div>
         </div>
         <h4>아이디 찾기</h4>
         <div class="form-group">
            <input class="form-control" name="name" required="required" placeholder="NANE">
         </div>
         
         <div class="form-group">
            <input class="form-control"type="text" name="phone" required="required"
            pattern="^01(?:0|1|[6-9])[-]?[0-9]{3,4}[-]?[0-9]{4}" placeholder="010-1111-2222">
            
         </div>
         <a href="framePw.jsp">Want you to find password ? </a>
         <a href="accountPage.jsp">Are you already a member ? </a>
         <br><button class="floating-btn">
            <i class="icon-arrow"></i>
         </button>
      </form>
   </div>
   </div>
</body>
</html>