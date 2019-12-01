
<%@page import="model.photo"%>
<%@page import="model.Location"%>
<%@page import="java.util.List"%>
<%@page import="Database.photoUserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/account.css">
<link rel="stylesheet" href="css/card.css">

<title>봄.See Memories</title>
<style>
body, html {
	width: 100%;
	height: 100%;
	margin: 0px;
	padding: 0px;
	font-family: "Roboto", sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	background: #485b6e;
	
}</style>
</head>
<body>
	<jsp:include page="top2.jsp" flush="false" />

	<%
		photoUserDAO dao = photoUserDAO.getInstance();
	%>
	<section id="search-section" style="text-align: center;">
		<h2 id="logo">
			<a href="Mgmain.jsp">봄.See Memories</a>
			<p>PHOTO.Community</p>
		</h2>

		<form class="search" action="search.jsp"
			style="margin: auto; max-width: 500px">
			<table style="width: 100%; height: 100%;">
				<tr>
					   <tr>
               <td><input type="text" placeholder="검색할 내용을 입력하세요." name="search" style="width: 80%">
                  <button type="submit"  style="width: 15%; height: 75px;"> 
                     <i class="fa fa-search"></i>
                  </button></td>
            </tr>
			</table>
		</form>

	</section>
	<section>

		<div class="content-profile-page">
			<div class="profile-user-page card">
				<div class="user-profile-data">
					<h3>관심 있는 사진 있으신가요?</h3>
					<div class='photo'>

						<h5><strong>인기있는 사진 순위</strong></h5>
						<%
							List<Location> list = dao.selectAllLoaction();
							if (list==null || list.isEmpty()) {
								out.println("<div class='photo'>등록된 사진이 없습니다.</div>");
							} else {
								int i = 0;

								for (Location location : list) {
						%>
						<p><%=++i%>순위. <strong><%=location.getLocation_name()%></strong>
							(<%=location.getCount()%>개의 사진)
						</p>


						<%
							}
								out.println("</div>");

							}
							
							String user_birth = (String)session.getAttribute("user_birth");
								
							if(user_birth!=null && !user_birth.equals("")){
								String year = user_birth.substring(0,user_birth.indexOf("-"));			
						%>
						
						<div class='photo'>

						<h5><strong>내 나이대 사진 순위</strong> <%=Integer.parseInt(year)-4 %> ~ <%=Integer.parseInt(year)+4 %>년생</h5>
						<%
							List<Location> ageList = dao.selectAllLoaction(year);
							if (ageList==null || ageList.isEmpty()) {
								out.println("<div class='photo'>등록된 사진이 없습니다.</div>");
							} else {
								int i = 0;
								for (Location location : ageList) {
						%>
						<p><%=++i%>순위. <strong><%=location.getLocation_name()%></strong>
							(<%=location.getCount()%>개의 photo)
						</p>


						<%
							}
								//out.println("총 " + i + "개의 여행지");
							}
						%>
						</div>
						
						<%
						}
						%>
					</div>

				</div>
			</div>
		</div>
			
	</section>

	<section>
		<div class="content-profile-page">
			<div class="profile-user-page card">
				<div class="user-profile-data">
					<h3>인기있는 photo!</h3>
					<div class="container">

						<%
							List<photo> photoList = dao.selectphotoularphoto();
							if (photoList==null || photoList.isEmpty()) {
								out.println("<div class='photo'>인기있는 photo이 없습니다.</div>");
							} else {
								int i = 0;
								for (photo photo : photoList) {
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
										<p><%=photo.getTag()%>여행
										</p>

										<div class="post-meta">
											<span class="timestamp"><i class="fa fa-clock-">o</i><%=photo.getReg_Date()%></span><br>
											<span class="comments"><i class="fa fa-comments"></i>
												<%=photo.getComment_num()%> comments</span>
										</div>
									</div>
								</div>
							</a>
						</div>

						<%
							}
								//out.println("총 "+i+"개의 검색결과");
							}
						%>

					</div>
				</div>

			</div>
		</div>
	</section>
	<section>
		<div class="content-profile-page">
			<div class="profile-user-page card">
				<div class="user-profile-data">
					<h3>새로운 photo!</h3>
				</div>	
					<div class="container">
					
								<jsp:include page="listPhotoProc.jsp"></jsp:include>
						</div>
					</div>
				
		</div>

	</section>

</body>
</html>
