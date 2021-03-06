<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html  lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
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
    <li><a href="/member/modifyinfo.do">정보수정</a></li>
    <li class="divider" tabindex="-1"></li>
    <li><a href="/login/logout.do">로그아웃</a></li>
  </ul>
<nav class="nav-extended">
  <div class="nav-wrapper" >
    <a href="/main.do" class="brand-logo">&nbsp;&nbsp;차리다</a>
    <a href="#" data-target="mobile-demo" class="sidenav-trigger">menu</a>
    <ul id="navbar" class="right hide-on-med-and-down">
    	<c:if test="${sessionScope.session_authority ne null && sessionScope.session_authority eq '3'}">
    		<li><a href="/supplier/servlistforsuggest.do">서비스 제안</a></li>
    	</c:if>
    	<c:if test="${sessionScope.session_authority ne null && sessionScope.session_authority eq '2'}">
    		 <li><a href="/service/application.do">서비스 신청</a></li>
    	</c:if>
      <li><a href="/review/review.do">서비스 후기</a></li>
      <li><a href="/intro/introduce.do" >회사 소개</a></li>
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
  <c:if test="${sessionScope.session_authority ne null && sessionScope.session_authority eq '1'}">
   <div class="nav-content" id="nav_mypage" style="display:none;    border-bottom: 1px solid #999;">
     <ul class="tabs tabs-transparent" style="border-top: 0.5px solid #00000042;">
       <li class="tab"><a href="/admin/supplierSearch.do">판매자 조회</a></li>
       <li class="tab"><a href="/admin/notPermissionList.do">판매자 승인/반려</a></li>
       <li class="tab"><a href="/admin/appAnalysis.do">빅데이터 분석</a></li>
     </ul>
   </div>
  </c:if>
  
  <c:if test="${sessionScope.session_authority ne null && sessionScope.session_authority eq '2'}">
   <div class="nav-content" id="nav_mypage" style="display:none; border-bottom: 1px solid #999;">
     <ul class="tabs tabs-transparent" style="border-top: 0.5px solid #00000042;">
       <li class="tab"><a href="/service/cus-app-list.do">신청 리스트</a></li>
       <li class="tab"><a href="/review/ableToReview.do">작성가능한 후기</a></li>
       <li class="tab"><a href="/review/ownReview.do">작성한 후기</a></li>
	   <li class="tab"><a href="/customer/matchingSuccess.do">서비스완료 목록</a></li>
     </ul>
   </div>
  </c:if>
  <c:if test="${sessionScope.session_authority ne null && sessionScope.session_authority eq '3'}">
   <div class="nav-content" id="nav_mypage" style="display:none;    border-bottom: 1px solid #999;">
     <ul class="tabs tabs-transparent" style="border-top: 0.5px solid #00000042;">
       <li class="tab"><a href="/sugg/suggestions-list.do">제안 리스트</a></li>
       <li class="tab"><a href="/supplier/matchingSuccess.do">완료 리스트</a></li>
       <li class="tab"><a href="/sales/sales-management.do">매출 관리</a></li>
       <li class="tab"><a href="/supplier/modifyDefaultInfo.do">판매 정보 수정</a></li>
       <li class="tab"><a href="/supplier/setfood.do">판매메뉴 추가/수정</a></li>
     </ul>
   </div>
  </c:if>
</nav>

  