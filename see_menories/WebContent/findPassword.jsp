<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
<jsp:include page="top.jsp" flush="false" />
   
   <div class="body"style="overflow:scroll; height:100vh">
   
   <div class="panel-lite">
      <form action="findpasswordproc.jsp" method="post">
         <div class="thumbur">
            <div class="icon-lock"></div>
         </div>
         <h4>비밀번호 찾기</h4>
         <div class="form-group">
            <input class="form-control" name="id" required="required" placeholder="ID"/>
         </div>
         <div class="form-group">
         
            <select class="form-control" name="question" required="required">
                <option selected>가입때 골랐던 질문</option>
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
               required="required" placeholder="가입때 썼던 질문의 답을 입력하세요."
               pattern="{0,80}" /> 
         </div>
         <a href="frameId.jsp">Want you to find ID ? </a>
         <button class="floating-btn">
            <i class="icon-arrow"></i>
         </button>
         <br><a href="accountPage.jsp">Are you already a member ? </a>
      </form>
   </div>
   </div>
</body>
</html>