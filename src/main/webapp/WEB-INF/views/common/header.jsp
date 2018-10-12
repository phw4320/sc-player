<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="/js/bootstrap.min.js" type="text/js"
	media="screen" />
</head>
<style>
#rDiv {
	border:10;
	max-width: 100%;
	width: 200px;
	float:right;
}

img {
	max-width: 100%;
	width: 500px;
	opacity:1;
}
</style>

<body>
	<div class="jumbotron my-4">

		<h1 class="display-4">Soccer Player Profile</h1>
		<h2 class="lead">리버풀</h2>
		<p>새로운 팀의 선수 프로필을 확인하세요.</p>
		<a href="#" class="btn btn-primary btn-lg">다른 팀 선택</a>
		<div id="rDiv" >
			<img src="/resources/upload/image.jpg"
				onmouseover="this.style.opacity='0.2'"
				onmouseout="this.style.opacity='0.8'">
		</div>
	</div>

</body>
</html>