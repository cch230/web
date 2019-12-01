
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>SeeMemoreis - 사진 공유 사이트</title>
<link href="https://fonts.googleapis.com/css?family=Bangers" rel="stylesheet">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

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
	
}
#main{
  padding-top:0px;
  margin-top: 50px;
  }
</style>
</head>
<body>

	<%
		String contentpage = request.getParameter("CONTENTPAGE");
	%>


	<jsp:include page="top.jsp" flush="false" />

	<div id="main">
		<jsp:include page="<%=contentpage%>"></jsp:include>
	</div>


</body>
</html>
