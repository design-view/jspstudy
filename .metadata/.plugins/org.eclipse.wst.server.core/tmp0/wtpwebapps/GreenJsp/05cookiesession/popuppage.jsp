<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String popupMode="on";
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie c: cookies){
			String cookename = c.getName();
			if(cookename.equals("popupClose")){
				popupMode="off";
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#popup {
		position: absolute;
		top: 100px;
		left: 100px;
		width: 300px;
		background: pink;
		text-align:center;
		border: 1px solid #ccc;
	}
	#popup div {
		background: #fff;
		padding:20px;
	}
</style>
<script>
	window.addEventListener("load",function(){
		let btn=document.querySelector("#closebtn");
		let popup = document.querySelector("#popup");
		//버튼클릭하면 팝업창 안보이게 하기
		btn.addEventListener("click",function(){
			//체크박스가 체크되었다면
			if(document.querySelector("#checkToday").checked){
				console.log("체크되었다.")
				fetchPopup();
			}
			popup.style.display = "none";
		})
		async function fetchPopup(){
			let inputvalue = document.querySelector("#checkToday").value;
			let response = await fetch("./popupCookie.jsp?checkCookie="
					+inputvalue);
			if(response.status==200){
				location.reload();  //새로고침 
			}
		}
	})
	
</script>
</head>
<body>
	<h2>팝업페이지</h2>
	<%
		for(int i=0; i<10; i++){
			out.println("현재 팝업창은 "+popupMode+"상태입니다<br/>");
		}
		if(popupMode.equals("on")){
	%>
		<div id="popup">
			<h2>공지사항 팝업입니다.</h2>
			<div>
				<form>
					<input type="checkbox" id="checkToday" value="1" />
					하루동안 열지않음 <input type="button"  value="닫기" id="closebtn"/>
				</form>
			</div>
		</div>
	<% 
		}
	%>
	
</body>
</html>