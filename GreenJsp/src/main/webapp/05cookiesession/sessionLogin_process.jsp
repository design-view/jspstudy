<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	//요청시 전송된 데이터 변수에 할당  getParameter("input의name")
	//userId변수에 사용자가입력한 값을 할당
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	//로그인 확인 userId가 admin이고 userPw는 1234인지 확인
	//맞으면 session에 속성을 추가
	if(userId.equals("admin") && userPw.equals("1234")){
		//session에 속성 추가  userId필드에 admin저장
		session.setAttribute("userId", userId);
		//session에 속성 추가 userPw필드에 1234저장
		session.setAttribute("userPw", userPw);
		//html화면 출력 
		out.println("세션 설정이 성공했습니다.<br/>");
		out.println(userId+"님 환영합니다.<br/>");
	}else {
		//html화면 출력 
		out.println("세션 설정이 실패했습니다.");
	}
%>
</body>
</html>