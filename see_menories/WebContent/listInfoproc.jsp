<%@page import="java.util.List"%>
<%@page import="Database.photoUserDAO"%>
<%@page import="model.user"%>
<%@page import="model.info"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info</title>
<link rel="stylesheet" href="css/account.css">

</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");


		photoUserDAO dao = photoUserDAO.getInstance();
		String root_id = (String) session.getAttribute("root_id");

		boolean isLogin = false;
		if (root_id != null)
			isLogin = true;
		
		boolean like = false;
	%>


	<div class="content-profile-page">
		<div class="profile-user-page card">
			<div class="user-profile-data">

				<section>
					<%
						List<info> list = dao.selectAllinfo();
									if (list.isEmpty()) {
										out.println("<div class='photo'>게시된 공지가 없습니다.</div>");
									} else {
										for (info info : list) {
					%>

						<div class="photo" align ="center"
                		style=" background-color: white ;float:left; ; width: 31%;">
						<%
							if (isLogin && root_id.equals(info.getuser_id())) {
						%>
						
						<%
							}
							String[] pop = info.getinfo();
							for(int i=0;i<pop.length;i++){
								if(pop[i]!=null){
									out.println("<img src='"+pop[i]+"' class='pre-photo'>");
								}
							}

						%>
						
						
						<h6>공지입니다. --
							
						</h6>
						<h3>
							<%=info.getTitle()%>
						</h3>
						<p>
							<%=info.getReg_Date()%></p>
						

						


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
