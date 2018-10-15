<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8" />
<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="/css/bootstrap.min.sec.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="/js/bootstrap.min.js" type="text/js"
	media="screen" />

</head>
<style>
.rDiv {
	display: block;
	max-width: 100%;
	width: 400px;
	float: right;
}

img {
	border-radius: 50%;
}

#img {
	max-width: 100%;
	width: 400px;
	opacity: 1;
}

</style>

<body>
	<div class="jumbotron">
		<br>
		<div class="rDiv">
			<img id="img" class="img-responsive img-thumbnail"
				src="/resources/upload/image.jpg"
				onmouseover="this.style.opacity='0.2'"
				onmouseout="this.style.opacity='0.8'">
		</div>

		<h1 class="display-5">
			<b>Soccer Player Profile</b>
		</h1>

		<h2 class="lead">리버풀</h2>
		<p>새로운 팀의 선수 프로필을 확인하세요.</p>
		<a href="#" class="btn btn-primary btn-lg">다른 팀 선택</a>

	</div>

</body>
</html>