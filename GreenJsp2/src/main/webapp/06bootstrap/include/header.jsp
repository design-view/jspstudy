<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String isLogin = "logout";
	if(session.getAttribute("userId")!=null){
		isLogin = "login";
	}	
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>GreenBlog</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-md bg-dark navbar-dark">
  <a class="navbar-brand" href="#">GreenBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
     
      <% 
      if(isLogin.equals("logout")) { 
      %>
      <li class="nav-item">
      <a class="nav-link" href="/GreenJsp2/user?cmd=login">로그인</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/GreenJsp2/user?cmd=join">회원가입</a>
      </li>
      
      <%  
      } 
      else {
      %>
      <li class="nav-item">
      <a class="nav-link" href="/GreenJsp2/user?cmd=logout">로그아웃</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/GreenJsp2/user?cmd=edit">회원정보수정</a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="/GreenJsp2/board?cmd=write">게시글작성</a>
      </li>
      <%	  
      }
      %>
      <li class="nav-item">
        <a class="nav-link" href="/GreenJsp2/board?cmd=list">게시글보기</a>
      </li>    
    </ul>
  </div>  
</nav>
<br>

<div class="container">