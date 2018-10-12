<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>

	<form action="/playerinfo/upload" method="post" enctype="multipart/form-data">
	 		선수 이름 : <input type="text" name="scname"> <br>
		 	 소속 팀 : <input type="text" name="sctimname"> <br> 
			 등 번호 : <input type="number" name="scbacknum"> <br> 
			 포지션 : <input type="text" name="scposition"> <br>
			 출신 국가 : <input type="text" name="sccountry"> <br>
			 키 : <input type="number" name="scheight"> <br>
			 몸무게 : <input type="number" name="scweight"> <br> 
			 생일 : <input type="date" name="scbirthdat"> <br> 
			 혈액형 : <select name="scbloodtype">
				<option value="A">A</option>
				<option value="B">B</option>	
				<option value="AB">AB</option>
				<option value="O">O</option>
			</select> <br> 
			프로필 사진 : <input type="file" name="multipartFile"><br>
			비고 : <textarea name="scdesc"></textarea>
			<br>
			<button onclick="">파일 전송</button>
		</form>
	<script>
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
	} */
	</script>
</body>
</html>