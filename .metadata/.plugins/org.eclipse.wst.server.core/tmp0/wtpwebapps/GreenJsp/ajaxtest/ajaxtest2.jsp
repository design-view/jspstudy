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
<button onclick="idcheck()">아이디있니?</button>
<div id="box"></div>
<script>
	let person = { name: "그린", age: 30 }
	function idcheck(){
		$.ajax({
			url: "http://localhost:8090/GreenJsp/AjaxTest",
			success: function(result){
				alert(result);
			}
		})
	}
</script>
</body>
</html>