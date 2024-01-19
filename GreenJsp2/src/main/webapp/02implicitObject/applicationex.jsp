<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		public String useImplicitObject(ServletContext app){
			return app.getInitParameter("init_param");
		}
	%>
	<%
		String app1 = useImplicitObject(application);
		//작성중인 폴더의 물리적인 위치
		String path = application.getRealPath("/02implicitObject");
	%>
	<h2>web.xml에 설정한 내용 읽어오기</h2>
	<p>초기화 매개변수 : <%=app1%></p>
	<p>폴더의 물리적인 위치 : <%=path%></p>
</body>
</html>