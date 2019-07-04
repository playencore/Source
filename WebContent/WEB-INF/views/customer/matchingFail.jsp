<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<!-- material css-->
<link rel = "stylesheet" type = "text/css" href ="/css/materialize.css" />
<!--  -->
<script src = "/js/jquery-3.4.1.js"></script>
<script src = "/js/materialize.js"></script>
<meta charset="UTF-8">
<script type="text/javascript">
  //<!--
   $(document).ready(function(){
    $('.modal').modal();
  });         
  //-->
  </script>

<title>구매자 매칭 실패목록</title>
</head>

<body>

<div class="section"></div>

<div class="container">
 <div class="card big">
    <div class="col s12 m4">
      <div class="card blue-grey darken-1">
        <div class="card-content white-text">
          <span class="card-title">매칭 실패</span>
          <hr color="gray">
			<h6>신청일시 : ${service_date}</h6>
			<h6>서비스형태 : ${service_category} </h6>
			<h6>서비스희망지역 : ${service_location}</h6>
			<h6>매치실패유형 : ${service_fail}</h6>
        </div>
        <div class="card-action">
          <center><a class="waves-effect waves-light btn modal-trigger" href="#modal1">상세보기</a></center>
        </div>
      </div>
    </div>
  </div>
</div>

 <!-- Modal Structure -->
  <div id="modal1" class="modal">
    <div class="modal-content">
      <h4>Modal Header</h4>
      <hr color="gray">
      	<h5>경훈이형 서비스 신청폼 가져오면 됨</h5>
		<h6>신청일시 : ${service_date}</h6>
		<h6>서비스형태 : ${service_category} </h6>
		<h6>서비스희망지역 : ${service_location}</h6>
		<h6>매치실패유형 : ${service_fail}</h6>
    </div>
    <div class="modal-footer">
		<a href="#">재등록신청</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/customer/matchingFail.do">닫기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
  </div>

<div class="container">
 <div class="card big">
    <div class="col s12 m4">
      <div class="card blue-grey darken-1">
        <div class="card-content white-text">
          <span class="card-title">매칭 실패</span>
			<h6>신청일시 : ${service_date}</h6>
			<h6>서비스형태 : ${service_category} </h6>
			<h6>서비스희망지역 : ${service_location}</h6>
			<h6>매치실패유형 : ${service_fail}</h6>
        </div>
        <div class="card-action">
          <a href="#">This is a link</a>
          <a href="#">This is a link</a>
        </div>
      </div>
    </div>
  </div>
</div>
  
  



</body>
</html>