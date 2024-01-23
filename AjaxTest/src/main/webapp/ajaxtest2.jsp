<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<button onclick="postajax()">전송</button>
	<script>
		//자바스크립트 객체 
		let dataobj = {
				username: "love",
				userage: 22		
		}
		function postajax(){
			$.ajax({
				type:"POST",
				url:"/AjaxTest/ajax1",
				data:JSON.stringify(dataobj),
				contentType:"application/json", //요청데이터타입 지정 
				dataType: "json"
			})
			.done(function(result){
				console.log(result);
				console.log(result.name);
			})
		}
	</script>
</body>
</html>