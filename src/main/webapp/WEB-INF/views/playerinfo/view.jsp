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
				html += '<input type="hidden" name="scpropic" value="'+sc.scpropic+'">';
				
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
				html += '<tr align="center">';
				html += '<td colspan="3"><button type="button" class="btn btn-secondary" onclick="updatePlayerInfo(<%=request.getParameter("scnum")%>)">수정</button>&nbsp;&nbsp;';
				html += '<button type="button" class="btn btn-secondary" onclick="deletePlayerInfo(<%=request.getParameter("scnum")%>)">삭제</button></td>';
				html += '</tr>';
				html += '</table>';
				html += '<input type="file" name="scpropic2" value="'+sc.scpropic+'">';
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
<script>
function updatePlayerInfo(scnum){
	alert(scnum);
	var scname = document.querySelector("input[name=scname]").value;
	var sctimname = document.querySelector("input[name=sctimname]").value;
	var scbacknum = document.querySelector("input[name=scbacknum]").value;
	var scposition = document.querySelector("input[name=scposition]").value;
	var sccountry = document.querySelector("input[name=sccountry]").value;
	var scheight = document.querySelector("input[name=scheight]").value;
	var scweight = document.querySelector("input[name=scweight]").value;
	var scbirthdat = document.querySelector("input[name=scbirthdat]").value;
	var scbloodtype = document.querySelector("input[name=scbloodtype]").value;
	var scdesc = document.querySelector("textarea[name=scdesc]").value;
 

	var xhr = new XMLHttpRequest();
	var data = {
			scname:scname,
			sctimname:sctimname,
			scbacknum:scbacknum,
			scposition:scposition,
			sccountry:sccountry,
			scheight:scheight,
			scweight:scweight,
			scbirthdat:scbirthdat,
			scbloodtype:scbloodtype,
			scdesc:scdesc,
			};
	data = JSON.stringify(data)
	/* var conf = {
		url : '/levelInfo/' + linum,
		methid : 'PUT',
		data : data,
		success : function(res){ 
			alert(res);
		}
	} */
	alert(data);
	var url = "/playerinfo/"+scnum;
	var method = "put";
	
	xhr.open(method,url);
	if (method != 'GET') {
		xhr.setRequestHeader("Content-type","application/json;charset=utf-8");
	}
		xhr.onreadystatechange = function(){
		if(xhr.readyState==4){
			if(xhr.status=="200"){
				if(xhr.responseText=='1'){
					alert("수정 성공!");
					location.href='/url/playerinfo:list';
				}
			}		
			else{
				alert(xhr.status);
				alert("수정 실패");
			}
		}
	}
	xhr.send(data); 

}

function deletePlayerInfo(scnum) {
	var scpropic = document.querySelector("input[name=scpropic]").value;
	alert (scpropic); 	
	var xhr = new XMLHttpRequest();
	var url = "/playerinfo/" + scnum;
	var data = {scpropic:scpropic};
	data = JSON.stringify(data)
	var method = "DELETE";
	xhr.open(method,url);
	if (method != 'GET') {
		xhr.setRequestHeader("Content-type","application/json;charset=utf-8");
	}
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4){
			if(xhr.status=="200"){
				if(xhr.responseText=='1'){
					alert("삭제 성공!");
					location.href='/url/playerinfo:list';
				}
			}else{
				alert("삭제 실패");
			}
		}
	}
	xhr.send(data); 
}
</script>
</body>
<%@ include file="/WEB-INF/views/common/foot.jsp"%>
</html>