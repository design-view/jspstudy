<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="form_process.jsp">
		<p>이름 : <input type="text" name="userName" /></p>
		<p>이메일 : <input type="text" name="userEmail" /></p>
		<p>성별  : 남<input type="radio" name="gender" value="man" />
		여<input type="radio" name="gender" value="woman" />
		</p>
		<p> 취미 : 독서<input type="checkbox" name="hobby" value="독서" />
		영화<input type="checkbox" name="hobby" value="영화" />
		영화<input type="checkbox" name="hobby" value="게임" />
		</p>
		<p><input type="submit" value="전송"/></p>
	</form>
</body>
</html>