<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>
</head>
<style>

</style>
<body>
<br><br><br>
<h1 align="center">Insert Player</h1>
<div class="container" align="center">
	<form action="/playerinfo/upload" method="post"
		enctype="multipart/form-data">
		<table class= "table tabla-hover table-bordered">
			<tr>
				<th>선수 이름 </th>
				<td><input type="text"  class="form-control" name="scname"  maxlength="33" required></td>
			</tr>
			<tr>
				<th>소속 팀 </th>
				<td><input type="text"  class="form-control" name="sctimname"  maxlength="33" required></td>
			</tr>
			<tr>
				<th>등 번호 </th>
				<td><input type="number"  class="form-control" name="scbacknum" max="99" maxlength="2" oninput="max(this)" required></td>
			</tr>
			<tr>
				<th>포지션 </th>
				<td><input type="text"  class="form-control" name="scposition" maxlength="6" required></td>
			</tr>
			<tr>
				<th>출신 국가 </th>
				<td><input type="text"  class="form-control" name="sccountry" maxlength="18" required></td>
			</tr>
			<tr>
				<th>키 </th>
				<td><input type="number"  class="form-control" name="scheight" maxlength="3" required ></td>
			</tr>
			<tr>
				<th>몸무게 </th>x
				<td><input type="number"  class="form-control" name="scweight" maxlength="3" required></td>
			</tr>
			<tr>
				<th>생일 </th>
				<td><input type="date"  class="form-control" name="scbirthdat" required></td>
			</tr>
			<tr>
				<th>혈액형 </th>
				<td><select name="scbloodtype"  class="form-control" required>
						<option value="A">A</option>
						<option value="B">B</option>
						<option value="AB">AB</option>
						<option value="O">O</option>
				</select></td>
			</tr>
			<tr>
				<th>프로필 사진 </th>
				<td><input type="file" accept=".jpg,.png" class="form-control" name="multipartFile"></td>
			</tr>
			<tr>
				<th>비고</th>
				<td><textarea name="scdesc"  class="form-control" maxlength="666"></textarea></td>
			</tr>
			<tr align="center">			
				<td colspan="2"><button class="btn btn-secondary" onclick="insertPlayerInfo()">확인</button></td>
			</tr>

		</table>
	</form>
	</div>
	<script>
	function max(scbacknum) {
		if(scbacknum.value.length > scbacknum.maxLength) {
			scbacknum.value = scbacknum.value.slice(0, scbacknum.maxLength);
		}
	}
	
	function insertPlayerInfo(){

		var xhr = new XMLHttpRequest();

		/* var conf = {
			url : '/levelInfo/' + linum,
			methid : 'PUT',
			data : data,
			success : function(res){ 
				alert(res);
			}
		} */

		var url = "/playerinfo/upload";
		var method = "post";
		
		xhr.open(method,url);
		if (method != 'GET') {
			xhr.setRequestHeader("Content-type","application/json;charset=utf-8");
		}
			xhr.onreadystatechange = function(){
			if(xhr.readyState==4){
				if(xhr.status=="200"){
					if(xhr.responseText=='1'){
						alert("추가 성공!");
						location.href='/url/playerinfo:list';
					}
				}		
				else{
					alert(xhr.status);
					alert("추가 실패");
				}
			}
		}
		xhr.send(); 
	}
		/* function insertPlayerInfo(){
			
			var lilevel = document.querySelector("input[name=lilevel]").value;
		 	var liname = document.querySelector("input[name=liname]").value;
		 	var lidesc = document.querySelector("input[name=lidesc]").value;
			alert(lilevel + "," + liname + "," +lidesc);
			
			var file = document.getElementById('myFile');
			var filedata = new FormData();
			
			var xhr = new XMLHttpRequest();
			var data = {
					liname:liname,
					lilevel:lilevel,
					lidesc:lidesc
					};
			data = JSON.stringify(data)
			alert(data);
			var url = "/levelinfo";
			var method = "POST";
			var enctype = "multipart/form-data";
			
			xhr.open(method,url);
			xhr.setRequestHeader("Content-type","application/json");
			
			xhr.onreadystatechange = function(){
				
				if(xhr.readyState==4){
					alert(xhr.responseText);
					if(xhr.status=="200"){
						
						if(xhr.responseText=='1'){
							alert("추가 성공!");
							location.href='/levelinfo/list';
						}
					}else if(xhr.status=="500"){
						alert("중복된 레벨이름이 있습니다. 다시 입력해주세요.");
						location.href='/url/levelinfo:insert';
					}else{
						alert(xhr.status);
						alert("추가 실패");
					}
				}
			}
			xhr.send(data,file); 
		}  */
	</script>
</body>
<%@ include file="/WEB-INF/views/common/foot.jsp"%>
</html>