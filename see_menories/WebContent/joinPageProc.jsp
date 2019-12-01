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

<%
   request.setCharacterEncoding("utf-8");
%>

   <div class="body"style="overflow:scroll; height:100vh">
      <form action="join.jsp" method="get">
      <div class="panel-lite"  >
         <div class="thumbur">
            <div class="icon-lock"></div>
         </div>
         <h4>Join</h4>

         <div class="form-group">
            <input class="form-control" name="id" required="required"  placeholder="ID" pattern="^[A-Za-z]{1}[A-Za-z0-9]{3,19}"/> 
         </div>
         <div class="form-group">
            <input class="form-control" name="pw" type="password" required="required" placeholder="PASSWORD" 
            pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}" />
            
         </div>
         <div class="form-group">
            <input class="form-control" name="name" type="text" required="required" placeholder="NAME"/> 
         </div>
         <div class="form-group">
            <input class="form-control" name="nickname" type="text" required="required" placeholder="NICKNAME"/> 
         </div>
         
         <div class="form-group">
            <input class="form-control" type="text" name="birth" required="required" placeholder="2000-11-22"
            pattern="^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])">
            
         </div>
         
         <div class="form-group">
            <input class="form-control"type="text" name="phone" required="required"
            pattern="^01(?:0|1|[6-9])[-]?[0-9]{3,4}[-]?[0-9]{4}" placeholder="010-1111-2222">
            
         </div>
         <div class="form-group">
         
            <select class="form-control" name="question" required="required" >
                <option selected>비밀번호 찾을때 이용됩니다.</option>
                  <option>초등학교 이름은?</option>
                <option>가장친한 친구는?</option>
                <option>보물1호는?</option>
                <option>태어난 고향은?</option>
                <option>가장 종아하는 음식은?</option>
                <option>기억남는 별명은?</option>
                <option>가장기억에 남는 여행지는?</option>
                <option>좋아하는 연예인은?</option>
            </select>
         </div>
         <div class="form-group">
            <input class="form-control" name="answer" type="text"
               required="required" placeholder="질문에 대한 답을 적어주세요."
               pattern="{0,50}" /> 
         </div>
         <a href="accountPage.jsp">Are you already a member ? </a>
         <button class="floating-btn">
            <i class="icon-arrow"></i>
         </button>
      </div>
      </form>
   </div>
</body>
</html>