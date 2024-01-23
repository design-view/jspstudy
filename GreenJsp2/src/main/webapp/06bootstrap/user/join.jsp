<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script>
	//회원가입시 아이디 중복체크를 해야한다!!!
	//아이디중복체크를 하지않으면 전송할수 없음
	//자바스크립트 이벤트 속성 on이벤트=함수명()
	let isChecking = false;
	function valid(){
		if(!isChecking){
			alert("id중복체크를 해주세요");
		}
		return isChecking;
	}
	//아이디 중복체크 버튼클릭시 중복체크해죠
	//userId인풋에 입력한 값이 member테이블에 존재하지 않는지?
	//ajax
	function idcheck(){
		let username = $("#userId").val();
		$.ajax({
			type:"POST", //통신방법 POST
			url: "/GreenJsp2/member",      //http://localhost:8090 생략가능
			data: username,     //보낼데이터
			contentType: "text/plain; charset=utf-8", //보내는 데이터 타입지정
			dataType: "text",   //응답받을데이터 타입 
			success:function(res){   //통신 성공일경우 success호출됨!!! 콜백으로 들어옴
				if(res=="ok"){
					isChecking = false;
					alert("유저네임이 중복되었습니다.");
				}else {
					alert("유저네임이 중복되지않습니다.");
					isChecking = true;
				}
			},
			error: function(request, textStatus, error){
				alert("통신실패");
			}
		})
	}
</script>
<div>
	<h2>회원가입페이지입니다.</h2>
	<div>
		<!-- submit이 발생하면 valid()호출 리턴값이 true일때만전송됨 -->
		<form action="/GreenJsp2/user?cmd=join_process" method="post"
		onsubmit="return valid()">
		  <div class="form-group">
		    아이디
		    <input type="text" id="userId" class="form-control" 
		    placeholder="Enter 아이디" name="userId" required>
		    <button type="button" onclick="idcheck()" class="btn btn-primary">아이디중복체크</button>
		  </div>
		  <div class="form-group">
		    비밀번호 
		    <input type="text" class="form-control" 
		    placeholder="Enter 패스워드" name="userPw" required>
		  </div>
		  <div class="form-group">
		    이름 
		    <input type="text" class="form-control" 
		    placeholder="Enter 이름" name="userName" required>
		  </div>
  		  <button type="submit" class="btn btn-primary">회원가입</button>
		</form>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>