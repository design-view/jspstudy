<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<button onclick="getajax()">전송</button>	
	<script>
		function getajax(){
			$.ajax({
				type:"GET", //get일때 생략가능 default가 get임
				url:"/AjaxTest/ajax1?username=green&userage=30"
				dataType: "json"   //응답받을타입지정 
				//json으로 지정하면 응답되는 데이터를 자바스크립트 객체로 파싱해줌
			})
			//ajax통신이 정상이면 done이 가지고 있는 함수를 호출
			.done(function(result){
				console.log("통신완료");
				console.log(result);
			})
		}
	</script>
</body>
</html>