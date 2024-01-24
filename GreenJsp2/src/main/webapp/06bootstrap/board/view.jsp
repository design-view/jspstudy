<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<% 
	BoardDTO dto = (BoardDTO) request.getAttribute("dto");
%>
<div>
	<h2>상세보기 입니다.</h2>
	<p>제목 : <%=dto.getTitle()%></p>
	<p>글쓴이 : <%=dto.getId() %> 글번호 :<%=dto.getNum() %> 
	조회수 : <%=dto.getVisitcount() %> </p>
	<p>내용<br/>
		<%=dto.getContent() %>
	</p>
	<p>
	<%
		//로그인한 사용자가 이게시글의 id랑 동일할때 
		//모든 속성은 object타입 
		String sessionid = "";
		if(session.getAttribute("userId")!=null){
			sessionid = session.getAttribute("userId").toString();
		}
		
		if(sessionid.equals(dto.getId())){
	%>
		<form method="post" action="/GreenJsp2/board?cmd=edit">
		<input type="hidden" name="num" value="<%=dto.getNum()%>" />
		<button type="submit" class="btn btn-primary">수정하기</button>
		</form>
		<br/>
		<form method="post" action="/GreenJsp2/board?cmd=delete">
		<input type="hidden" name="num" value="<%=dto.getNum()%>" />
		<button type="submit" class="btn btn-primary">삭제하기</button>
		</form>
	<%		
		}
	%>
	
	</p>
</div>
<%@ include file="../include/footer.jsp" %>

