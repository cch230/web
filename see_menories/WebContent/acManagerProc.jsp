<%@page import="model.photo"%>
<%@page import="java.util.List"%>
<%@page import="Database.photoUserDAO"%>
<%@page import="model.Root"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="css/account.css">
<script src="js/account.js"></script>

</head>
<body>

   <%
      request.setCharacterEncoding("utf-8");

      String root_id = (String) session.getAttribute("root_id");

      photoUserDAO dao = photoUserDAO.getInstance();

      Root root = dao.selectOneroot(root_id);

      if (root == null) {//실패 
         out.println("<script>alert('네트워크를 확인해주세요.');</script>");
         out.println("<script> window.history.back();</script>");

      } else {//성공
         
         boolean isLogin = false;
         boolean like = false;
         if (root_id != null)
      isLogin = true;
   %>
   <div class="content-profile-page">
      <div class="profile-user-page card">
         <div class="img-user-profile">
            <div class="card hovercard">
               <div class="card-background">
                  <img class="card-bkimg" alt="">
               </div>
               <div class="useravatar">
               </div>
            </div>
         </div>

         <div class="user-profile-data">
           </div>
                 <div class="account-manager" align="center">
                 <h2>관리자 계정입니다.</h2>
         </div>
      </div>
   </div>

   <div class="content-profile-page">
      <div class="profile-user-page card">
         <div class="user-profile-data">
            <h3>새로운 공지사항을 작성하시겠어요?</h3>
            <a href="writePage.jsp" id="write">공지 작성하기</a>
         </div>

      </div>
   </div>
   <div class="content-profile-page">
      <div class="profile-user-page card">
         <div class="user-profile-data">
            <section style="text-align: center">
               <a href="deleteAll.jsp?user_id=<%=root_id%>" id="write">전체 삭제하기</a>
            </section>
         </div>
       
      </div>
            <section>
               <%
                  List<photo> list = dao.selectAllphoto();
                              if (list.isEmpty()) {
                                 
                                 out.println("<div class='photo'>게시한 PHOTO가 없습니다.</div>");
                              } else {
                                 for (photo photo : list) {
                                   
               %>

            <div class="pop"align ="center"
                style="border: 1px; background-color: white ; float:left ; width: 31%;">                  <p class="extra">
                     <a href="modifyPhotoPage.jsp?id=<%=photo.getId()%>">수정하기</a><a
                        href="deletePhoto.jsp?id=<%=photo.getId()%>">&times;</a>
                  </p>
                  <h6><%=photo.getuser_name()%>님의 PHOTO입니다. --
                     <%=photo.getLocation()%>
                     여행 &nbsp;&nbsp;&nbsp; #<%=photo.getTag() %>
                  </h6>
                  <h3>
                     <%=photo.getTitle()%>
                  </h3>
                  <p>
                     <%=photo.getReg_Date()%></p>
                  <h5>
                     <%=photo.getContent()%></h5>

                  <%
                     String[] Photo = photo.getPhoto();
                              for (int i = 0; i < Photo.length; i++) {
                                 if (Photo[i] != null) {
                                    out.println("<img src='" + Photo[i] + "'class='Photo-img'><br><br>");
                                 }
                              }
                  %>

                  <a href="commentPage.jsp?id=<%=photo.getId()%>" id="write">댓글
                     작성하기</a>


               </div>
               <%
                  }
                     }
               %>

            </section>
         

   </div>


   <%
      }
   %>


</body>
</html>