<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.*, model.*"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>

<%
	String redirectURI = URLEncoder.encode("http://localhost:8080/see_memories/naverlogin.jsp", "UTF-8");
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	apiURL += "&client_id=o9dAOzmlu2HUZ5xiLfhj"; //애플리케이션 클라이언트 아이디값";
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&state=" + state;
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="754728780787-4kn7lsqru6ml4dicea1eforu3dhdid4o.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<title>로그인 화면</title>
<link rel="stylesheet" href="css/login.css">
<script>
	$(document).ready(function() {
	});
</script>
</head>
<body>
   <jsp:include page="top1.jsp" flush="false" />
   <div class="body"style="overflow:scroll; height:100vh">
      <div class="panel-lite"  >
      <form action="login.jsp" method="post">
         <div class="thumbur">
            <div class="icon-lock"></div>
         </div>
         <h4>Login</h4>
         <div class="form-group">
            <input class="form-control" name="id" required="required" /> <label
               class="form-label">Id</label>
         </div>
         <div class="form-group">
            <input class="form-control" name="pw" type="password" required="required" /> <label
               class="form-label">Password</label>
         </div>
        
         <div class="form-group">
         <div id="naver_id_login"></div>
			<script type="text/javascript" 
					src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" 
					charset="utf-8"></script>
			
			<script type="text/javascript">
					var clientId = "o9dAOzmlu2HUZ5xiLfhj";
					var callbackUrl = "http://localhost:8080/see_memories/Naverlogin.jsp";
					var naver_id_login = new naver_id_login(clientId, callbackUrl);
					var state = naver_id_login.getUniqState();
					naver_id_login.setButton("white", 3, 40);
					naver_id_login.setDomain("http://localhost:8080/see_memories");
					naver_id_login.setState(state);
					naver_id_login.setPopup();
					naver_id_login.init_naver_id_login();
			</script> 
		 </div>
		 
         <div class="form-group">
         <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
         </div>
	    <script>
	        function onSignIn(googleUser) {
	            // Useful data for your client-side scripts:
	            var profile = googleUser.getBasicProfile();
	            console.log("ID: " + profile.getId()); // Don't send this directly to your server!
	            console.log('Full Name: ' + profile.getName());
	            console.log('Given Name: ' + profile.getGivenName());
	            console.log('Family Name: ' + profile.getFamilyName());
	            console.log("Image URL: " + profile.getImageUrl());
	            console.log("Email: " + profile.getEmail());
	
	            // The ID token you need to pass to your backend:
	            var id_token = googleUser.getAuthResponse().id_token;
	            console.log("ID Token: " + id_token);
	        };
	    </script>
	    <button class="btn btn-default">네이버로 회원가입</button>
					<!-- (1) 버튼 event 처리를 위하여 id를 지정 id=loginButton -->
					<div id="naver_id_login" style="display: inline-block;">
						<a href="<%=apiURL%>"><img height="35"
							src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
					</div>
         <a href="joinPage.jsp">Are you not a member yet ?</a><br>
         <a href ="frameId.jsp">  Want you to find ID ? </a><br>
         <a href="framePw.jsp">Want you to find password ? </a>
         <button class="floating-btn">
            <i class="icon-arrow"></i>
         </button>
      </form>
   </div>
   </div>
</body>
</html>