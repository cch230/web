<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
   <jsp:include page="top1.jsp" flush="false" />
   <div class="body"style="overflow:scroll; height:100vh">
      <div class="panel-lite"  >
      <form action="login.jsp" method="post">
         <div class="thumbur">
            <div class="icon-lock"></div>
         </div>
         <h4>Login</h4>
         <div class="form-group">
            <input class="form-control" name="id" required="required" /> <label
               class="form-label">Id</label>
         </div>
         <div class="form-group">
            <input class="form-control" name="pw" type="password" required="required" /> <label
               class="form-label">Password</label>
         </div>
         <a href="joinPage.jsp">Are you not a member yet ?</a><br>
         <a href ="frameId.jsp">  Want you to find ID ? </a><br>
         <a href="framePw.jsp">Want you to find password ? </a>
         <button class="floating-btn">
            <i class="icon-arrow"></i>
         </button>
      </form>
   </div>
   </div>
</body>
</html>