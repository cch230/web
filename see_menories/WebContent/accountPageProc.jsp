<%@page import="model.photo"%>
<%@page import="java.util.List"%>
<%@page import="Database.photoUserDAO"%>
<%@page import="model.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 페이지</title>
<link rel="stylesheet" href="css/account.css">
<script src="js/account.js"></script>

</head>
<body>

   <%
      request.setCharacterEncoding("utf-8");

      String user_id = (String) session.getAttribute("user_id");

      photoUserDAO dao = photoUserDAO.getInstance();

      user user = dao.selectOneuser(user_id);

      if (user == null) {//실패 
         out.println("<script>alert('네트워크를 확인해주세요.');</script>");
         out.println("<script> window.history.back();</script>");

      } else {//성공
         
         boolean isLogin = false;
         boolean like = false;
         if (user_id != null)
      isLogin = true;
   %>
   <div class="content-profile-page">
      <div class="profile-user-page card">
         <div class="img-user-profile">
            <div class="card hovercard">
               <div class="card-background">
                  <img class="card-bkimg" alt="" src="<%=user.getProfile()%>">
               </div>
               <div class="useravatar">
                  <img alt="" src="<%=user.getProfile()%>">
               </div>
            </div>
         </div>

         <a href="modifyPage.jsp"><button id="floating">MODIFY</button></a>

         <div class="user-profile-data">
            <h1><%=user.getName()%></h1>
            <p><%=user.getNickname()%></p>
         </div>
         <div class="description-profile">
            <%=user.getBirth()%>
            |
            <%=user.getPhone()%>
         </div>
         <ul class="data-user">
            <li><a href="likePage.jsp?type=like_user_id&user_id=<%=user.getId()%>"><strong><%=user.getLike_num()%></strong><span>LIKE ME</span></a></li>            <li><a href="likePage.jsp?type=user_id&user_id=<%=user.getId()%>"><strong><%=user.getMylike_num()%></strong><span>MY LIKE</span></a></li>
            <li><a><strong><%=user.getphoto_num()%></strong><span>PHOTO</span></a></li>
         </ul>
      </div>
   </div>

   <div class="content-profile-page">
      <div class="profile-user-page card">
         <div class="user-profile-data">
            <h3>새로운 PHOTO을 작성하시겠어요?</h3>
            <a href="writePage.jsp" id="write">글 작성하기</a>
         </div>

      </div>
   </div>
   <div class="content-profile-page">
      <div class="profile-user-page card">
         <div class="user-profile-data">
            <section style="text-align: center">
               <a href="deleteAll.jsp?user_id=<%=user_id%>" id="write">전체 삭제하기</a>
            </section>
         </div>
       
      </div>
            <section>
               <%
                  List<photo> list = dao.selectAllphoto(user_id);
                              if (list.isEmpty()) {
                                 
                                 out.println("<div class='photo'>게시한 PHOTO이 없습니다.</div>");
                              } else {
                                 for (photo photo : list) {
                                    like = dao.isLike(photo.getId(), user_id);
               %>

            <div class="photo"align ="center"
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


                  <p><a
                    href="like.jsp?like=<%=like%>&photo_id=<%=photo.getId()%>&user_id=<%=user_id%>&page=accountPage">
                     <%
                        if (isLogin && like)
                              out.println("♥");
                           else
                              out.println("♡");
                     %>
                  </a> &nbsp;<%=photo.getLike_num()%></p>
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