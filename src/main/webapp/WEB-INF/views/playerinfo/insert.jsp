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
	<br>
	<br>
	<br>
	<h1 align="center">Insert Player</h1>
	<div class="container" align="center">
		<form action="/playerinfo/upload" method="post" name="form"
			enctype="multipart/form-data">
			<table class="table tabla-hover table-bordered">
				<tr>
					<th>선수 이름</th>
					<td><input type="text"
						onblur="onfocus_event(this.form,this)" class="form-control" 
						placeholder="선수 이름 입력"
						name="scname" maxlength="33" required></td>
				</tr>
				<tr>
					<th>소속 팀</th>
					<td><input type="text" onblur="onfocus_event(this.form,this)" placeholder="소속 팀 이름 입력"
						class="form-control" name="sctimname" maxlength="33" required></td>

				</tr>
				<tr>
					<th>등 번호</th>
					<td><input type="number"
						onblur="onfocus_event(this.form,this)" class="form-control" placeholder="등 번호 입력"
						name="scbacknum" max="99" min="0" maxlength="2" oninput="max(this)"
						required></td>
				</tr>
				<tr>
					<th>포지션</th>
					<td><input type="text" class="form-control" placeholder="포지션 입력"
						onblur="onfocus_event(this.form,this)" name="scposition"
						maxlength="6" required></td>
				</tr>
				<tr>
					<th>출신 국가</th>
					<td><input type="text" onblur="onfocus_event(this.form,this)" placeholder="소속 국가 입력"
					class="form-control" name="sccountry"
						maxlength="18" required></td>
				</tr>
				<tr>
					<th>키</th>
					<td><input type="number" onblur="onfocus_event(this.form,this)" placeholder="키 입력"
					class="form-control" name="scheight"
						max="250" min="0" maxlength="3" required></td>
				</tr>
				<tr>
					<th>몸무게</th>
					<td><input type="number" onblur="onfocus_event(this.form,this)"	placeholder="몸무게 입력"
					class="form-control" name="scweight"
						max="700" min="0" maxlength="3" required></td>
				</tr>
				<tr>
					<th>생일</th>
					<td><input type="date" onblur="onfocus_event(this.form,this)"
						class="form-control" name="scbirthdat" required></td>
						
				</tr>
				<tr>
					<th>혈액형</th>
					<td><select name="scbloodtype" onblur="onfocus_event(this.form,this)"
						class="form-control" required>
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="AB">AB</option>
							<option value="O">O</option>
					</select></td>
				</tr>
				<tr>
					<th>프로필 사진</th>
					<td><input type="file"  onblur="onfocus_event(this.form,this)"
						accept=".jpg,.png" 
						class="form-control" name="multipartFile"></td>
				</tr>
				<tr>
					<th>비고</th>
					<td><textarea name="scdesc" class="form-control"
							maxlength="666"></textarea></td>
				</tr>
				<tr align="center">
					<td colspan="2"><button class="btn btn-secondary" id="test">파일
							전송</button></td>
				</tr>
				
			</table>
		</form>
	</div>
	<script>

		function max(scbacknum) {
			if (scbacknum.value.length > scbacknum.maxLength) {
				scbacknum.value = scbacknum.value.slice(0, scbacknum.maxLength);
			}
		}
		
		function onfocus_event(frm, obj) {
		
		if (obj.value.trim().length == 0) {
				obj.blur();
				obj.className = "form-control is-invalid";
				alert("올바른 문자를 입력해주세요.");
				obj.value='';

			} /* else if (obj.value.search(/\s/) != -1) {
				obj.blur();
				obj.className = "form-control is-invalid";
				alert("문자열에 공백을 포함 할 수 없습니다. 다시 입력해주세요");
				obj.value='';

			} */ else {
				obj.className = "form-control is-valid";
				/* alert("성공"); */
				if (obj.onkeydown == 13 || obj.onkeydown == 9) {
					for (i = 0; i < frm.length; ++i) {
						if (obj.name == frm[i].name)
							break;
					}
					setTimeout(function() {
						frm[i].focus();
					}, 10)
				}
			}
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
							location.href='/playerinfo/list';
						}
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