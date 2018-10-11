<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
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
			url : '/playerinfo/'+ scnum,
			success : function(res){
				contentType: "application/json; charset=UTF-8";
				res = JSON.parse(res);
				alert(res);
				var html = '';

				for(var sc of res){						 
				html += '<b>'+sc.scnum+'</b>';
				html += '<b>'+sc.scname+'</b>';
				html += '<b>'+sc.sctimname+'</b>';
				}
			document.querySelector('#scBody').insertAdjacentHTML('beforeend',html);
		}
}
var au = new AjaxUtil(conf);
au.send();
});
 
</script>
<body>
<body>
<br>ddddd
<br>ddddd
<br>ddddd
<br>ddddd
<br>ddddd
<br>ddddd
<br>ddddd
<br>ddddd
<br>ddddd
<br>ddddd
<br>ddddd
<br>ddddd



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
</body>
<%@ include file="/WEB-INF/views/common/foot.jsp"%>
</html>