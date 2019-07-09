<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>완료목록</title>
</head>
<body>
<div class="section"></div>

<div class="container">
 <div class="card big">
    <div class="col s12 m4">
      <div class="card blue-grey darken-1">
        <div class="card-content white-text">
          <span class="card-title">서비스 완료</span>
          <hr color="gray">
			<h6>신청일시 : ${service_date}</h6>
			<h6>서비스형태 : ${service_category} </h6>
			<h6>판매자명 : ${service_location}</h6>
			<h6>종료날짜 : ${service_fail}</h6>
        </div>
        <div class="card-action">
          <center><a class="waves-effect waves-light btn" href="#modal1">후기등록</a></center>        
        </div>
      </div>
    </div>
  </div>
</div>


</body>
</html>