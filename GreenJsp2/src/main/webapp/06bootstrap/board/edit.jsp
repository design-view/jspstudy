<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%
	BoardDTO dto = (BoardDTO) request.getAttribute("dto");
%>
	<div>
		<h2>게시글 수정</h2>
		<div>
		<form action="/GreenJsp2/board?cmd=update_process" method="post">
		  <input type="hidden" name="num" value="<%=dto.getNum()%>"/>
		  <div class="form-group">
		    제목
		    
		    <input type="text" class="form-control" 
		    placeholder="Enter 제목" name="title" value="<%=dto.getTitle()%>">
		  </div>
		  <div class="form-group">
		    내용
		    <textarea id="summernote" name="content">
		    <%=dto.getContent()%>
		    </textarea>
		  </div>
		  
  		  <button type="submit" class="btn btn-primary">글등록</button>
		</form>
		</div>
		<script>
    
    	 $('#summernote').summernote({
    	        placeholder: 'Hello Bootstrap',
    	        tabsize: 2,
    	        height: 200
    	      });
   
  </script>
	</div>
<%@ include file="../include/footer.jsp" %>