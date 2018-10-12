<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>

<meta charset="UTF-8" />
<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css" media="screen" />
<link rel="stylesheet" href="/js/bootstrap.min.js" type="text/js" media="screen" />

<head>
<style>
img {
	max-width: 100%;
	width: 400px;
	text-align:center;
}
</style>
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
			url : '/playerinfo/'+ <%=request.getParameter("scnum")%>,
			success : function(res){
				contentType: "application/json; charset=UTF-8";
				res = JSON.parse(res);
				alert(res);
				var html = '';

				for(var sc of res){				

				html += '<div class="container"><br><br><br>';
				html += '<table class="table table-hover table-bordered">';
				html += '<tr>';
				html += '<td rowspan="9" align="center"><img class=" img-fluid" src="/resources'+sc.scpropic+'"></td>';
				html += '<th>선수 이름</th>';
				html += '<td><input type="text" name="scname" value="'+sc.scname+'"></td>';
				html += '</tr>';
				html += '<tr>';
				html += '<th>소속 국가</th>';
				html += '<td><input type="text" name="sccountry" value="'+sc.sccountry+'"></td>';
				html += '</tr>';
				html += '<tr>';
				html += '<th>소속 팀</th>';
				html += '<td><input type="text" name="sctimname" value="'+sc.sctimname+'"></td>';
				html += '</tr>';
				html += '<tr>';
				html += '<th>등 번호</th>';
				html += '<td><input type="text" name="scbacknum" value="'+sc.scbacknum+'"></td>';
				html += '</tr>';
				html += '<tr>';
				html += '<th>포지션</th>';
				html += '<td><input type="text" name="scposition" value="'+sc.scposition+'"></td>';
				html += '</tr>';
				html += '<tr>';
				html += '<th>키</th>';
				html += '<td><input type="number" name="scheight" value="'+sc.scheight+'">cm</td>';
				html += '</tr>';
				html += '<tr>';
				html += '<th>몸무게</th>';
				html += '<td><input type="number" name="scweight" value="'+sc.scweight+'">kg</td>';
				html += '</tr>';
				html += '<tr>';
				html += '<th>생년월일</th>';
				html += '<td><input type="date" name="scbirthdat" value="'+sc.scbirthdat+'"></td>';
				html += '</tr>';
				html += '<tr>';
				html += '<th>혈액형</th>';
				html += '<td><input type="text" name="scbloodtype" value="'+sc.scbloodtype+'">형</td>';
				html += '</tr>';
				html += '<tr>';
				html += '<th colspan="3">비고</th>';
				html += '</tr>';
				html += '<tr>';
				html += '<td colspan="3"> <textarea name="scdesc" style="width:100%;">'+sc.scdesc+'</textarea></td>';
				html += '</tr>';
				html += '</table>';
				html += '</div>';
				}
			document.querySelector('#scBody').insertAdjacentHTML('beforeend',html);
			
		}
}
var au = new AjaxUtil(conf);
au.send();
});
 
</script>
<body>
<div id="scBody"></div>
</body>
<%@ include file="/WEB-INF/views/common/foot.jsp"%>
</html>