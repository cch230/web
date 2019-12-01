<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Database.photoUserDAO"%>
<%@ page import="model.user"%>
<%@ page import="model.photo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 리스트</title>
<link rel="stylesheet" href="css/corn_list.css">
<link rel="stylesheet" href="css/list.css">
<link rel="stylesheet" href="css/comment.css">


</head>
<body>
	<%
		String user_id = (String) session.getAttribute("user_id");
			photoUserDAO dao = photoUserDAO.getInstance();
			List<user> list = dao.selectAlluser();
			if (list.isEmpty()) {
		out.println("<div class='pop'>등록된 유저 회원이 없습니다.</div>");

			} else {
	%>

	<div class="content-profile-page">
		<div class="profile-user-page card">

			<%
			boolean isVaild = false;
				for (user user : list) {
						if (user_id != null && user_id.equals(user.getId())) {
							//out.println("다른 유저 회원이 없습니다.");
							continue;
						}
						isVaild=true;
			%>
			<div class="user-profile-data">

				<div class="container">
					<div class="service-details">
						<img src="<%=user.getProfile() %>" alt="profile">
						<div class="service-hover-text">
							<h3><%=user.getName()%></h3>
							<h4><%=user.getBirth()%></h4>
							<p>
							<table class="info-table">
								<tr>
									<td>LIKE</td>
									<td>POP</td>
								</tr>
								<tr>
									<td><%=user.getLike_num()%></td>
									<td><%=user.getphoto_num()%></td>
								</tr>
							</table>
							</p>
						</div>
						<div class="service-white service-text">
							<p><%=user.getName()%></p>
							<a href="cornPage.jsp?id=<%=user.getId()%>">@<%=user.getNickname()%></a>
						</div>
					</div>
				</div>
			</div>



			<%
				}
				
				if(!isVaild)
					out.println("<div class='pop'>등록된 다른 유저 회원이 없습니다.</div>");

				}
		
		
			%>
		</div>

	</div>

</body>
</html>
