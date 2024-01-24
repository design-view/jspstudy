<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
	<div>
		<h2>게시글 작성 입니다.</h2>
		<div>
		<form action="/GreenJsp2/board?cmd=write_process" method="post">
		  <input type="hidden" name="userid" 
		  value="<%=session.getAttribute("userId")%>"/>
		  <div class="form-group">
		    제목
		    <input type="text" class="form-control" 
		    placeholder="Enter 제목" name="title">
		  </div>
		  <div class="form-group">
		    내용
		    <textarea id="summernote" name="content"></textarea>
		  </div>
		  
  		  <button type="submit" class="btn btn-primary">글등록</button>
		</form>
		</div>
	</div>
	<script>
    
    	 $('#summernote').summernote({
    	        placeholder: 'Hello Bootstrap',
    	        tabsize: 2,
    	        height: 100
    	      });
   
  </script>
<%@ include file="../include/footer.jsp" %>