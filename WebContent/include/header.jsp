<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html  lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>단 하나의 서비스 - 차리다</title>
	<!-- css -->
  	<link rel="stylesheet" href="/css/materialize.css">
  	<link rel="stylesheet" href="/css/free.css">
  	<link rel="stylesheet" href="/css/free-v4-shims.css">
  	<link rel="stylesheet" href="/css/nouislider.css">
  	<link rel="stylesheet" href="/css/common/common.css">
  	<link rel = "stylesheet" type = "text/css" href ="/css/dropify.css" />
  	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style media="screen">
      
    </style>
    <!-- css -->
	<!--js-->
	<!-- <script src="https://kit.fontawesome.com/0ad913ff34.js"></script> -->	
	<script src="/js/jquery-3.4.1.js"></script>
	<script src="/js/materialize.js"></script>
	<script type="text/javascript" src="/js/moment.min.js"></script>
	<script type="text/javascript" src="/js/nouislider.js"></script>
	<script type="text/javascript" src="/js/common/common.js"></script>
</head>
<body style="background-color: #dfdfdd6b">
<ul id='dropdown1' class='dropdown-content'>
    <li><a href="#!">정보수정</a></li>
    <li class="divider" tabindex="-1"></li>
    <li><a href="/login/logout.do">로그아웃</a></li>
  </ul>
<nav class="nav-extended">
  <div class="nav-wrapper" style="background-color:#2bbbad;">
    <a href="/main.do" class="brand-logo">차리다</a>
    <a href="#" data-target="mobile-demo" class="sidenav-trigger">menu</a>
    <ul id="navbar" class="right hide-on-med-and-down">
      <li><a href="/service/application.do">서비스 신청</a></li>
      <li><a href="badges.html">서비스 후기</a></li>
      <li><a href="#" >회사 소개</a></li>
      <c:if test="${sessionScope.session_name ne null}">
      	<li><a href="#" onclick="showExtendedMenu('#nav_mypage');return false;" >마이 페이지<i class="fas fa-chevron-down" style="margin-left: 5px; font-size: 10px"></i></a></li>
      </c:if>
      <c:if test="${sessionScope.session_name eq null}">
      	<li><a href="/login/loginForm.do" style="margin-left:20px">로그인</a></li>
      </c:if>
      <c:if test="${sessionScope.session_name ne null}">
      	<li><a  class='dropdown-trigger' href='#' data-target='dropdown1' style="margin-left:20px">${sessionScope.session_name}님 안녕하세요 <i class="fas fa-chevron-down" style="margin-left: 5px; font-size: 10px"></i></a></li>
      </c:if>
    </ul>
  </div>
  
  <c:if test="${sessionScope.session_authority ne null && sessionScope.session_authority eq '2'}">
   <div class="nav-content" id="nav_mypage" style="display:none">
     <ul class="tabs tabs-transparent">
       <li class="tab"><a href="#test1">구매자1 </a></li>
       <li class="tab"><a href="#test2">구매자2</a></li>
       <li class="tab"><a href="#test3">구매자3</a></li>
       <li class="tab"><a href="#test4">구매자4</a></li>
     </ul>
   </div>
  </c:if>
  <c:if test="${sessionScope.session_authority ne null && sessionScope.session_authority eq '3'}">
   <div class="nav-content" id="nav_mypage" style="display:none">
     <ul class="tabs tabs-transparent">
       <li class="tab"><a href="#test1">판매자1</a></li>
       <li class="tab"><a href="#test2">판매자2</a></li>
       <li class="tab"><a href="#test3">판매자3</a></li>
       <li class="tab"><a href="#test4">판매자4</a></li>
     </ul>
   </div>
  </c:if>
</nav>

  