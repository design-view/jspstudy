<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button onclick="idcheck()">아이디있니?</button>
<div id="box"></div>
<script>
	async function idcheck(){
		let response = await fetch("http://localhost:8090/GreenJsp/AjaxTest");
		let data = await response.text();
		alert(data);
	}
</script>
</body>
</html>