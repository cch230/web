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
<title>photo</title>
<link rel="stylesheet" href="css/account.css">

</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");


		photoUserDAO dao = photoUserDAO.getInstance();
		String user_id = (String) session.getAttribute("user_id");

		boolean isLogin = false;
		if (user_id != null)
			isLogin = true;
		
		boolean like = false;
	%>


	<div class="content-profile-page">
		<div class="profile-user-page card">
			<div class="user-profile-data">

				<section>
					<%
						List<photo> list = dao.selectAllphoto();
									if (list.isEmpty()) {
										out.println("<div class='photo'>게시된 photo이 없습니다.</div>");
									} else {
										for (photo photo : list) {
					%>

						<div class="photo" align ="center"
                		style=" background-color: white ;float:left; ; width: 31%;">
						<%
							if (isLogin && user_id.equals(photo.getuser_id())) {
						%>
						<p class="extra">
							<a href="modifyPopPage.jsp?id=<%=photo.getId()%>">수정하기</a><a
								href="deletePop.jsp?id=<%=photo.getId()%>">&times;</a>
						</p>
						<%
							}
							String[] pop = photo.getPhoto();
							for(int i=0;i<pop.length;i++){
								if(pop[i]!=null){
									out.println("<img src='"+pop[i]+"' class='pre-photo'>");
								}
							}
							like = dao.isLike(photo.getId(), user_id);

						%>
						
						
						<h6><a href="cornPage.jsp?id=<%=photo.getuser_id()%>"><%=photo.getuser_name()%></a>님의 POP입니다. --
							<%=photo.getLocation()%>
							여행 &nbsp;&nbsp;&nbsp; #<%=photo.getTag() %>
						</h6>
						<h3>
							<%=photo.getTitle()%>
						</h3>
						<p>
							<%=photo.getReg_Date()%></p>
						

						<p><a
                    href="like.jsp?like=<%=like%>&photo_id=<%=photo.getId()%>&user_id=<%=user_id%>&page=accountPage">
                     <%
                        if (isLogin && like)
                              out.println("♥");
                           else
                              out.println("♡");
                     %>
                  </a> &nbsp;<%=photo.getLike_num()%></p>
						<a href="commentPage.jsp?id=<%=photo.getId()%>" id="write">더
							보기..</a>


					</div>
					<%
						}
						}
					%>

				</section>
			</div>

		</div>
	</div>


</body>
</html>
