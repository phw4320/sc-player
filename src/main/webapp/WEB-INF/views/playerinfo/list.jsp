<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="/js/bootstrap.min.js" type="text/js"
	media="screen" />

<script></script>
</head>
<!-- <style>
.container {
   align: center;
}
.src-image {
  display: none;
}

.card {
  overflow: hidden;
  position: relative;
  border: 1px solid #CCC;
  border-radius: 8px;
  text-align: center;
  padding: 0;
  background-color: #284c79;
  color: rgb(136, 172, 217);
}

.card .header-bg {
  /* This stretches the canvas across the entire hero unit */
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 70px;
  border-bottom: 1px #FFF solid;
  /* This positions the canvas under the text */
  z-index: 1;
}
.card .avatar {
  position: relative;
  margin-top: 15px;
  z-index: 100;
}

.card .avatar img {
  width: 100px;
  height: 100px;
  -webkit-border-radius: 50%;
  -moz-border-radius: 50%;
  border-radius: 50%;
  border: 5px solid rgba(0,0,30,0.8);
}

</style>  -->

<script>

var AjaxUtil = function(conf){
	var xhr = new XMLHttpRequest();
	var url = conf.url;
	var method = conf.method?conf.method:'GET';
	var param = conf.param;
	
	var success = conf.success?conf.success:function(res){
		alert(res);
	}
	var error = conf.error?conf.error:function(res){
		alert(res);
	}
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4){
			if(xhr.status=="200"){
				success(xhr.responseText);
			}else{
				error(xhr.responseText);
			}
		}
	}
	xhr.open(method,url);

	this.send = function(){
		xhr.send();
	}
};
 window.addEventListener('load',function(){

	var conf = {
			url : '/playerinfo',
			success : function(res){
				contentType: "application/json; charset=UTF-8";
				res = JSON.parse(res);
				alert(res);
				var html = '';
				
			 /*    for(var sc of res){
					html += '<tr>';
					html += '<td> <input type="text" name="scNum" value='+sc.scnum+' readonly></td>';
					html += '<td> <input type="text" name="scName'+sc.scnum+'" value='+sc.scname+'></td>';
					html += '<td> <input type="text" name="scTimname'+sc.scnum+'"  value='+sc.sctimname+'></td>';
					html += '<td> <input type="text" name="scBacknum'+sc.scnum+'"  value='+sc.scbacknum+'></td>';
					html += '<td> <input type="text" name="scPosition'+sc.scnum+'"  value='+sc.scposition+'>번</td>';
					html += '<td> <input type="text" name="scCountry'+sc.scnum+'"  value='+sc.sccountry+'></td>';
					html += '<td> <input type="text" name="scHeight'+sc.scnum+'"  value='+sc.scheight+'>cm</td>';
					html += '<td> <input type="text" name="scWeight'+sc.scnum+'"  value='+sc.scweight+'>kg</td>';
					html += '<td> <input type="text" name="scBirthdat'+sc.scnum+'"  value='+sc.scbirthdat+'></td>';
					html += '<td> <input type="text" name="scBloodtype'+sc.scnum+'"  value='+sc.scbloodtype+'>형</td>';
					html += '<td> <input type="text" name="scPropic'+sc.scnum+'"  value='+sc.scpropic+'></td>';
					html += '<td> <input type="text" name="scDesc'+sc.scnum+'"  value='+sc.scdesc+'></td>';
					html += '<td><button onclick="">수정</button><button onclick="">삭제</button></td>';
					html += '</tr>';
				}  
					 */
			    	html += '<div id="team" class="pb-5">';
					html += ' <div>';
					html += ' <h5 class="section-title h1">SOCCER PLAYER PROFILE</h5>';
					html += '  <div class="row">';

					for(var sc of res){						 
					html += ' <div class="col-xs-12 col-sm-6 col-md-4">';
					html += ' <div class="image-flip">';
					html += ' <div class="mainflip">';
					html += ' <div class="frontside">';
					html += ' <div class="card">';
					html += ' <div class="card-body text-center">';
					html += '  <p><img class=" img-fluid" src=/resources'+sc.scpropic+'"></p>';
					html += '  <h4 class="card-title">'+sc.scname+'</h4>';
					html += ' <p class="card-text">This is basic card with image on top, title, description and button.</p>';
					html += ' <a href="" onclick="selectPlayer('+sc.scnum+')" class="btn btn-primary btn-sm"><i class="fa fa-plus">상세보기</i></a>';
					html += '   </div>';
					html += '  </div>';
					html += '  </div>';
					html += '  </div>';
					html += '  </div>';
					html += '  </div>';
				    }
				    html += '  </div>';
					html += '  </div>';
					html += '  </div>';
				document.querySelector('#scBody').insertAdjacentHTML('beforeend',html);
			}
	}
	var au = new AjaxUtil(conf);
	au.send();
});
 
/* 

function BlurStack()
{
	this.r = 0;
	this.g = 0;
	this.b = 0;
	this.a = 0;
	this.next = null;
}

$( document ).ready(function() {
var BLUR_RADIUS = 40;
var sourceImages = [];

$('.src-image').each(function(){
 sourceImages.push($(this).attr('src'));
});

$('.avatar img').each(function(index){
 $(this).attr('src', sourceImages[index] );
});

var drawBlur = function(canvas, image) {
 var w = canvas.width;
 var h = canvas.height;
 var canvasContext = canvas.getContext('2d');
 canvasContext.drawImage(image, 0, 0, w, h);
 stackBlurCanvasRGBA(canvas, 0, 0, w, h, BLUR_RADIUS);
}; 
 

$('.card canvas').each(function(index){
 var canvas = $(this)[0];
 
 var image = new Image();
 image.src = sourceImages[index];
 
 image.onload = function() {
   drawBlur(canvas, image);
 }
});
}); */
</script>

<body>
<img src="/resources/upload/1539271071461앤드류 로버트슨.jpg">
	<table border="1">
		<thead>
			<tr>
				<!-- <th>번호</th>
				<th>선수이름</th>
				<th>소속 팀</th>
				<th>등 번호</th>
				<th>포지션</th>
				<th>소속 국가</th>
				<th>키</th>
				<th>몸무게</th>
				<th>생년월일</th>
				<th>혈액형</th>
				<th>프로필 사진</th>
				<th>비고</th>
				<th>수정/삭제</th> -->

</tr>
</thead>
<tbody id="scBody">
</tbody>
</table>

<script>
function selectPlayer(scnum) {
	
	var xhr = new XMLHttpRequest();
	var data = {
			scnum:scnum
			};
	data = JSON.stringify(data)
	alert("aa"+data);
	var url = "/playerinfo/"+scnum;
	var method = "GET";
	xhr.open(method,url);
	xhr.setRequestHeader("Content-type","application/json");
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4){	z
			alert(xhr.responseText);
			if(xhr.status=="200"){
				
				if(xhr.responseText!=null){
					alert("성공!");
					location.href='/levelinfo/list';
				}
			}else{
				alert(xhr.status);
				alert("실패");
			}
		}
	}
	xhr.send(data); 
}
 
</script>
</body>
<%@ include file="/WEB-INF/views/common/foot.jsp"%>
</html>