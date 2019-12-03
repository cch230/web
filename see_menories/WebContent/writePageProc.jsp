<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 화면</title>
<link rel="stylesheet" href="css/write.css">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<div class="body"style="overflow:scroll; height:100vh">
		<div class="panel-lite"  >
			<form action="write.jsp" method="z">

			<h4>Photo</h4>

			<div class="form-group">
				<input class="form-control" name="title" required="required"
					pattern="{0,10}" /> <label class="form-label">Title</label>
			</div>
			<div class="form-group">
				<input  name="tag" type="radio" value="see"
					required="required" checked/> <label>볼거리</label>
					<input name="tag" type="radio" value="food"
					required="required" /> <label>먹거리</label>
			</div>
			<div class="form-group">
				<input class="form-control" name="location"
					required="required" pattern="{0,50}" /> <label class="form-label">Location</label>
			</div>
			
			<div class="form-group">
				<input class="form-control" name="content" type="text"
					required="required" pattern="{0,50}" /> <label class="form-label">Content</label>
			</div>
			<div class="form-group">
			사진은 0~3 장 올릴 수 있습니다.
			</div>
			<div class="form-group">
				<input class="form-control" name="photo1" type="file"/> <label class="form-label">Photo</label>
			</div>
			<div class="form-group">
				<input class="form-control" name="photo2" type="file"/> <label class="form-label">Photo</label>
			</div>
			<div class="form-group">
				<input class="form-control" name="photo3" type="file"
					/> <label class="form-label">Photo</label>
			</div>
			<button class="floating-btn">
				<i class="icon-arrow"></i>
			</button>

		</form>
		</div>
	
	</div>
</body>
</html>
