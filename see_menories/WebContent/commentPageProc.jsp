<%@page import="model.Comment"%>
<%@page import="java.util.List"%>
<%@page import="model.photo"%>
<%@page import="Database.photoUserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/account.css">
<link rel="stylesheet" href="css/comment.css">


</head>
<body>
	<%
		String user_id = null;

		if (session.getAttribute("root_id") != null) {
			 user_id = (String) session.getAttribute("root_id");
		}
		else {
			user_id = (String) session.getAttribute("user_id");

		}
		
		request.setCharacterEncoding("utf-8");

		boolean isLogin = false;
		boolean like = false;
		if (user_id != null)
			isLogin = true;
		int id = Integer.parseInt(request.getParameter("id"));

		photoUserDAO dao = photoUserDAO.getInstance();

		photo photo = dao.selectOnephoto(id);

		if (photo == null) {//실패 
			out.println("해당 사진은 삭제되었거나 존재하지않습니다.");
			//out.println("<script> window.history.back();</script>");

		} else {//성공

			like = dao.isLike(id, user_id);
	%>

	<div class="content-profile-page">
		<div class="profile-user-page card">
			<div class="user-profile-data">
				<section>
					<div class="photo">

					<%
						if (isLogin && user_id.equals(photo.getuser_id())) {
								out.println("<p class='extra'><a href='modifyPhotoPage.jsp?id=" + photo.getId() + "'>수정하기</a>");
								out.println("<a href='deletePhoto.jsp?id='" + photo.getId() + "'>&times;</a></p>");
							}
					%>

					<h6>
						<a href="cornPage.jsp?id=<%=photo.getuser_id()%>"><%=photo.getuser_name()%></a>님의
						Photo입니다. ---
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
						String[] pop = photo.getPhoto();
							for (int i = 0; i < pop.length; i++) {
								if (pop[i] != null) {
									out.println("<img src='" + pop[i] + "'class='photo-img'><br><br>");
								}
							}
					%>


					<p>
						<a
							href="like.jsp?like=<%=like%>&photo_id=<%=photo.getId()%>&user_id=<%=user_id%>&page=commentPage">
							<%
								if (isLogin && like)
										out.println("♥");
									else
										out.println("♡");
							%>
						</a> &nbsp;<%=photo.getLike_num()%>
													</p>
						
						<%

						if (session.getAttribute("root_id") != null) {
							 user_id = (String) session.getAttribute("root_id");
							 
						%>
						
						<%
						}
						else {
							user_id = (String) session.getAttribute("user_id");
						%>
						
				<form action="writeComment.jsp">
						<input type="hidden" name="photo_id" value=<%=photo.getId()%>>
						<input type="text" placeholder="댓글을 입력하세요." name="comment"
							id="comment-input" required="required">&nbsp;&nbsp;&nbsp;<input
							type="submit" value="작성" id="write"></input>
					</form>
						
						<% 
						}
						%>
						
						
					
					<%
						List<Comment> list = dao.selectAllComment(photo.getId());
							if (list.isEmpty()) {
								out.println("댓글이 없습니다.");
							} else {
								for (Comment comment : list) {
					%>
					<div class="comment">
					
					<% 
						
						if (session.getAttribute("root_id") != null) {
							
						%>
							<a
							href="deleteComment.jsp?pop_id=<%=photo.getId()%>&id=<%=comment.getId()%>"><span
							style="float: right;">&times;</span></a>
						
						<%	
							 }else{
									if (isLogin && (user_id.equals(comment.getuser_id()) || user_id.equals(photo.getuser_id()))) {

						%>
					
						
						<a
							href="deleteComment.jsp?pop_id=<%=photo.getId()%>&id=<%=comment.getId()%>"><span
							style="float: right;">&times;</span></a>
						<%
									}
							}
						%>
						<h5><%=comment.getuser_name()%></h5>
						<p><%=comment.getReg_date()%></p>
						<h6><%=comment.getComment()%></h6>
					</div>
					<%
						}
							}
					%>

				</div>
				<%
					}
				%> </section>
			</div>

		</div>
	</div>



</body>
</html>