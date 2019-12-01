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
<link rel="stylesheet" href="css/comment.css">
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");

		String corn_id = request.getParameter("id");

		String user_id = (String) session.getAttribute("user_id");
			
		boolean isLogin = false;
		boolean like = false;
		if (user_id != null)
			isLogin = true;

		photoUserDAO dao = photoUserDAO.getInstance();

		user user = dao.selectOneuser(corn_id);

		if (user == null) {//실패 
			out.println("<script>alert('네트워크를 확인해주세요.');</script>");
			out.println("<script> window.history.back();</script>");

		} else {//성공
			
			like = dao.isLike(user.getId(),user_id);
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

			<a href="likeCorn.jsp?like=<%=like%>&corn_id=<%=user.getId()%>&user_id=<%=user_id%>"><button id="floating">LIKE
			
					<%
				if(isLogin && like)
								out.println("♥");
							else
								out.println("♡");
			%>

			</button></a>
			
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
				<li><a href="likePage.jsp?type=like_corn_id&corn_id=<%=user.getId()%>"><strong><%=user.getLike_num()%></strong><span>LIKE ME</span></a></li>
				<li><a href="likePage.jsp?type=corn_id&corn_id=<%=user.getId()%>"><strong><%=user.getMylike_num()%></strong><span>MY LIKE</span></a></li>
				<li><a><strong><%=user.getphoto_num()%></strong><span>PHOTO</span></a></li>
			</ul>
		</div>
	</div>

	
	<div class="content-profile-page">
		<div class="profile-user-page card">
			<div class="user-profile-data">
				
				<section>
					<%
						List<photo> list = dao.selectAllphoto(corn_id);
										if (list.isEmpty()) {
											out.println("<div class='photo' style='text-align:center;'>게시한 PHOTO가 없습니다.</div>");
										} else {
											for (photo photo : list) {
												boolean like_photo = false;
												
												like_photo=dao.isLike(photo.getId(), user_id);
					%>

					<div class="photo">
						<h6><%=photo.getuser_name()%>님의 PHOTO입니다. --
							<%=photo.getLocation()%>
							여행(<%=photo.getTag() %>)
						</h6>
						<h3>
							<%=photo.getTitle()%>
						</h3>
						<p>
							<%=photo.getReg_Date()%></p>
						<h5>
							<%=photo.getContent()%></h5>

						<%
							String[] pop = photo.getPhoto();
							for (int i = 0; i < pop.length; i++) {
								if (pop[i] != null) {
									out.println("<img src='"+pop[i]+"'class='photo-img'><br><br>");
								}
							}
						%>
						

					<p><a
							href="like.jsp?like=<%=like_photo%>&photo_id=<%=photo.getId()%>&user_id=<%=user_id%>&page=cornPage&id=<%=user_id%>">
							<%
								if (isLogin && like_photo)
										out.println("♥");
									else
										out.println("♡");
							%>
						</a> &nbsp;<%=photo.getLike_num() %></p>
					<a href="commentPage.jsp?id=<%=photo.getId() %>" id="write">댓글 작성하기</a>
					

					</div>
					<%
						}
							}
					%>

				</section>
			</div>

		</div>
	</div>


	<%
		}
	%>


</body>
</html>
