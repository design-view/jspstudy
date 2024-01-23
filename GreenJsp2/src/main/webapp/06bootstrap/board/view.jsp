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
</div>
<%@ include file="../include/footer.jsp" %>

