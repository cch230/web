<%@page import="model.photo"%>
<%@page import="Database.photoUserDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/account.css">
<link rel="stylesheet" href="css/card.css">


</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
			
		String search = request.getParameter("search");
		System.out.println(search);

		String user_id = (String) session.getAttribute("user_id");

		boolean isLogin = false;
		if (user_id != null)
			isLogin = true;
		
			
		
		boolean like = false;

		photoUserDAO dao = photoUserDAO.getInstance();
	%>


	<div class="content-profile-page">
		<div class="profile-user-page card">
			<div class="user-profile-data">
				<h3>먹거리 사진!</h3>
				<div class="container">


					<%
						List<photo> foodList = dao.searchphoto(search,"먹거리");
									if (foodList.isEmpty()) {
										out.println("<div class='pop'>먹거리 사진이 없습니다.</div>");
									} else {
										for (photo photo : foodList) {
					%>

					<div class="column">
						<a href="commentPage.jsp?id=<%=photo.getId()%>">

							<div class="post-module">
								<!-- Thumbnail-->
								<div class="thumbnail">
									<div class="date">
										<div class="day"><%=photo.getLike_num()%></div>
										<div class="month">♥</div>
									</div>
									<%
										String[] pop = photo.getPhoto();
																			String photo_location = "image/none.png";
																			for (int j = 0; j < pop.length; j++) {
																				if (pop[j] != null) {
																			
																					photo_location = pop[j];
																					break;
																				}
																			}
									%>
									<img src="<%=photo_location%>" />
								</div>
								<!-- Post Content-->
								<div class="post-content">
									<div class="category"><%=photo.getLocation()%></div>
									<h1 class="title"><%=photo.getTitle()%></h1>
									<h2 class="sub_title"><%=photo.getuser_name()%></h2>
									<p><%=photo.getTag()%>여행</p>

									<div class="post-meta">
										<span class="timestamp"><i class="fa fa-clock-">o</i><%=photo.getReg_Date()%></span><br>
										<span class="comments"><i class="fa fa-comments"></i> <%=photo.getComment_num()%>
											comments</span>
									</div>
								</div>
							</div>
						</a>
					</div>


					<%
						}
									}
					%>
				</div>
			</div>
		</div>
	</div>

<div class="content-profile-page">
		<div class="profile-user-page card">
			<div class="user-profile-data">
				<h3>볼거리 사진!</h3>
				<div class="container">


					<%
						List<photo> seeList = dao.searchphoto(search,"볼거리");
									if (seeList.isEmpty()) {
										out.println("<div class='pop'>볼거리 사진이 없습니다.</div>");
									} else {
										for (photo photo : seeList) {
					%>

					<div class="column">
						<a href="commentPage.jsp?id=<%=photo.getId()%>">

							<div class="post-module">
								<!-- Thumbnail-->
								<div class="thumbnail">
									<div class="date">
										<div class="day"><%=photo.getLike_num()%></div>
										<div class="month">♥</div>
									</div>
									<%
										String[] pop = photo.getPhoto();
																			String photo_location = "image/none.png";
																			for (int j = 0; j < pop.length; j++) {
																				if (pop[j] != null) {
																					photo_location = pop[j];
																					break;
																				}
																			}
									%>
									<img src="<%=photo_location%>" />
								</div>
								<!-- Post Content-->
								<div class="post-content">
									<div class="category"><%=photo.getLocation()%></div>
									<h1 class="title"><%=photo.getTitle()%></h1>
									<h2 class="sub_title"><%=photo.getuser_name()%></h2>
									<p><%=photo.getTag()%>여행</p>

									<div class="post-meta">
										<span class="timestamp"><i class="fa fa-clock-">o</i><%=photo.getReg_Date()%></span><br>
										<span class="comments"><i class="fa fa-comments"></i> <%=photo.getComment_num()%>
											comments</span>
									</div>
								</div>
							</div>
						</a>
					</div>


					<%
						}
									}
					%>
				</div>
			</div>
		</div>
	</div>

	<div class="content-profile-page">
		<div class="profile-user-page card">
			<div class="user-profile-data">


				<%
					List<photo> list = dao.searchphoto(search);
							if (list.isEmpty()) {
								out.println("<div class='photo'>해당하는 PHOTO가 없습니다.</div>");
							} else {
								for (photo photo : list) {
				%>


				<div class="photo">

					<%
						if (isLogin && user_id.equals(photo.getuser_id())) {
					%>
					<p class="extra">
						<a href="modifyPhotoPage.jsp?id=<%=photo.getId()%>">수정하기</a><a
							href="deletePhoto.jsp?id=<%=photo.getId()%>">&times;</a>
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
					<h6>
						<a href="cornPage.jsp?id=<%=photo.getuser_id()%>"><%=photo.getuser_name()%></a>님의
						POP입니다. --
						<%=photo.getLocation()%>
						여행 &nbsp;&nbsp;&nbsp; #<%=photo.getTag() %>
					</h6>
					<h3>
						<%=photo.getTitle()%>
					</h3>
					<p>
						<%=photo.getReg_Date()%></p>
					
					<p>
						
							<%
								if (isLogin && like)
										out.println("♥");
									else
										out.println("♡");
							%>
						 &nbsp;<%=photo.getLike_num()%></p>
					<a href="commentPage.jsp?id=<%=photo.getId()%>" id="write">더 보기..</a>


				</div>
				<%
					}
					}
				%>
			</div>
		</div>
	</div>

</body>
</html>
