<%@page import="model.user"%>
<%@page import="Database.photoUserDAO"%>
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

			String user_id = (String) session.getAttribute("user_id");

			photoUserDAO dao = photoUserDAO.getInstance();

			user user = dao.selectOneuser(user_id);
	%>

	<div class="panel-lite">
		<form action="modify.jsp" method="get">

			<h4>Modify</h4>
			<div class="form-group">
				<input class="form-control" name="profile" type="file"
					required="required" /> <label
					class="form-label">Profile</label>
			</div>
			<div class="form-group">
				<input class="form-control" name="id" required="required"
					value="<%=user.getId()%>" disabled /> <label class="form-label"></label>
			</div>
			<div class="form-group">
				<input class="form-control" name="pw" type="password"
					required="required" value="<%=user.getPw()%>" /> <label
					class="form-label">Password</label>
			</div>
			<div class="form-group">
				<input class="form-control" name="name" type="text"
					required="required" value="<%=user.getName()%>" /> <label
					class="form-label">Name</label>
			</div>
			<div class="form-group">
				<input class="form-control" name="nickname" type="text"
					required="required" value="<%=user.getNickname()%>" /> <label
					class="form-label">NickName</label>
			</div>
			<div class="form-group">
				<input class="form-control" name="birth" type="text"
					required="required" placeholder="           2000-02-28"
					pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" value="<%=user.getBirth()%>" />
				<label class="form-label">Birth</label>
			</div>
			<div class="form-group">
				<input class="form-control" name="phone" type="tel"
					required="required" placeholder="              010-0000-1111"
					pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}"
					value="<%=user.getPhone()%>" /> <label class="form-label">Phone</label>
			</div>

			<button class="floating-btn">
				<i class="icon-arrow"></i>
			</button>

		</form>
	</div>
</body>
</html>
