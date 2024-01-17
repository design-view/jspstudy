<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>

<div>
	<h2>로그인페이지입니다.</h2>
<%
//로그인전이면 로그인폼을 보여주고 로그인후면 환영메세지를 보여줌
if(session.getAttribute("userId")==null) {
%>
	<div>
		<form action="process/login_process.jsp" method="post">
		  <div class="form-group">
		    아이디
		    <input type="text" class="form-control" 
		    placeholder="Enter 아이디" name="userId">
		  </div>
		  <div class="form-group">
		    비밀번호 
		    <input type="password" class="form-control" 
		    placeholder="Enter 패스워드" name="userPw">
		  </div>
		  <div class="form-group form-check">
		    <label class="form-check-label">
		      <input class="form-check-input" type="checkbox"> Remember me
		    </label>
		  </div>
  		  <button type="submit" class="btn btn-primary">로그인</button>
		</form>
	</div>
<% 	
}else {
%>
<div>
	<p><%=session.getAttribute("userName")%>님 환영합니다.</p>
</div>
<% 	
} 
%>
	
</div>
<%@ include file="include/footer.jsp" %>