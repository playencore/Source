<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<!-- material css-->
<link rel = "stylesheet" type = "text/css" href ="/css/materialize.css" />
<!--  -->
<script src = "/js/jquery-3.4.1.js"></script>
<script src = "/js/materialize.js"></script>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>후기보기</title>
</head>
<body>
	<h2>해당 구매자가 등록한 후기보기 페이지입니다.</h2>
	<hr color="gray">
	회원 분류 : ${session_name}<br>
	아이디 : ${session_id}<br>
	세션 코드 : ${session_authority}
	<hr color="gray">
	${reviews}<br><br>
	
	<c:forEach var="ReviewDto" items="${reviews}">
	
	<div class="container">
	 <div class="card big">
	    <div class="col s12 m4">
	      <div class="card blue-grey darken-1">
	        <div class="card-content white-text">
	          <center><span class="card-title">${session_name}님이 작성한 서비스 후기</span></center>
	          <hr color="gray">
				서비스 코드 : ${ReviewDto.serv_id} <br>
				<hr color="white">
				후기 제목 : ${ReviewDto.title} <br>
				<hr color="white">
				후기 내용 : ${ReviewDto.content} <br>
				<hr color="white">				
				서비스 이용경로 : ${ReviewDto.serv_root} <br>
				<hr color="white">
				
				<%-- 음식 만족도 : ${ReviewDto.menu_score } 점 <br> --%>
				<c:if test="${ReviewDto.menu_score eq 0}">
				음식 만족도 : ☆☆☆☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.menu_score eq 1}">
				음식 만족도 : ★☆☆☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.menu_score eq 2}">
				음식 만족도 : ★★☆☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.menu_score eq 3}">
				음식 만족도 : ★★★☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.menu_score eq 4}">
				음식 만족도 : ★★★★☆ <br>
				</c:if>
				<c:if test="${ReviewDto.menu_score eq 5}">
				음식 만족도 : ★★★★★ <br>
				</c:if>
				<%-- 가격 만족도 : ${ReviewDto.price_score } 점 <br> --%>
				<c:if test="${ReviewDto.price_score eq 0}">
				가격 만족도 : ☆☆☆☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.price_score eq 1}">
				가격 만족도 : ★☆☆☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.price_score eq 2}">
				가격 만족도 : ★★☆☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.price_score eq 3}">
				가격 만족도 : ★★★☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.price_score eq 4}">
				가격 만족도 : ★★★★☆ <br>
				</c:if>
				<c:if test="${ReviewDto.price_score eq 5}">
				가격 만족도 : ★★★★★ <br>
				</c:if>
				
				<%-- 서비스 만족도 : ${ReviewDto.serv_score } 점 <br> --%>
				<c:if test="${ReviewDto.serv_score eq 0}">
				서비스 만족도 : ☆☆☆☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.serv_score eq 1}">
				서비스 만족도 : ★☆☆☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.serv_score eq 2}">
				서비스 만족도 : ★★☆☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.serv_score eq 3}">
				서비스 만족도 : ★★★☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.serv_score eq 4}">
				서비스 만족도 : ★★★★☆ <br>
				</c:if>
				<c:if test="${ReviewDto.serv_score eq 5}">
				서비스 만족도 : ★★★★★ <br>
				</c:if>
				<hr color="white">
				<%-- 지인 추천 여부 : ${ReviewDto.recommand }	<br> --%>
				<c:if test="${ReviewDto.recommand eq 1}">
				지인 추천 여부 : 지인에게 추천할 의향이 있습니다.
				</c:if>
				<c:if test="${ReviewDto.recommand eq 0}">
				지인 추천 여부 : 지인에게 추천할 의향이 없습니다.
				</c:if>	
				<hr color="white">
				작성 시간 : ${ReviewDto.review_date } <br>
					
	        </div>
	        <div class="card-action">
	          <center><a class="waves-effect waves-light btn modal-trigger" href="#modal1">상세보기</a></center>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>	
	
	
		
	</c:forEach>


</body>
</html>