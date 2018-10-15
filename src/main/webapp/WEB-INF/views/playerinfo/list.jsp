<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html><%@ include file="/WEB-INF/views/common/nav.jsp"%>


<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<script></script>
</head>

<style>
img {
	max-width: 100%;
	width: 200px;
}
</style>  

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
				var html = '';

			    	html += '<div id="team" class="pb-5">';
					html += ' <div>';
					html += '  <div class="row">';

					for(var sc of res){						 
					html += ' <div class="col-xs-12 col-sm-6 col-md-4">';
					html += ' <div class="image-flip">';
					html += ' <div class="mainflip">';
					html += ' <div class="frontside">';
					html += ' <div class="card">';
					html += ' <div class="card-body text-center">';
					html += '  <p><img class="img-circle" src="/resources'+sc.scpropic+'"></p>';
					html += '  <h4 class="card-title">'+sc.scname+'</h4>';
					html += ' <p class="card-text"><b>'+'"'+sc.scdesc+'"'+'</b></p><br>';
					html += ' <a href="/url/playerinfo:view?scnum='+sc.scnum+'" onclick="" class="btn btn-primary btn-sm"><i class="fa fa-plus">상세보기</i></a>';
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

</script>

<body>
<div id="scBody"></div>

<script>
/* function selectPlayer(scnum) {
	
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
		if(xhr.readyState==4){	
			alert(xhr.status);
			if(xhr.status=="200"){
				alert(xhr.responseText);
				if(xhr.responseText!=null){
					alert("성공!");
					location.href='/playerinfo/list';
				}
			}else{
				alert(xhr.status);
				alert("실패");
			}
		}
	}
	xhr.send(data); 
}
  */

</script>

</body>
<%@ include file="/WEB-INF/views/common/foot.jsp"%>
</html>
