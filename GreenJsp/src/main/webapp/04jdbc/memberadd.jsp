<%@page import="member.MemberDAO"%>
<%@page import="common.JSFunction"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBCConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 추가 테스트</h2>
	<%
		//오라클 접속
		MemberDAO dao = new MemberDAO(application);
		request.setCharacterEncoding("utf-8");
		String id= request.getParameter("id");
		String pass= request.getParameter("pw");
		String name = request.getParameter("username");
		
		int result = dao.insertMember(id, pass, name);
		if(result==0){
			JSFunction.alertLocation("회원가입에 문제가 있습니다.", "join.jsp", out);
			/* String str = "<script>alert('회원가입에 문제가 있습니다.');"
					+"location.href='join.jsp';"
				    +"</script>"; */
			//out.println(str);   //스크립틀릿에서 html코드 작성 
		}else {
			JSFunction.alertLocation("회원가입이 되었습니다.", "memberlist.jsp", out);
			/* String str = "<script>alert('회원가입이 되었습니다.');"
					+"location.href='memberlist.jsp';"
				    +"</script>";
			out.println(str); 	 */
		}
		dao.close();
		//response.sendRedirect("memberlist.jsp");
		
	%>
	
	<script>
		//alert("회원가입 되었습니다.");
		//location.href="memberlist.jsp";
	</script>
</body>
</html>