<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>차리다</title>
<script src = "/js/jquery-3.4.1.js"></script>
<script src = "/js/nouislider.js"></script>
<script src = "/js/materialize.js"></script>
<script src = "/js/dropify.js"></script>

<!-- material css-->
<link rel = "stylesheet" type = "text/css" href ="/css/nouislider.css" />
<link rel = "stylesheet" type = "text/css" href ="/css/materialize.css" />
<link rel = "stylesheet" type = "text/css" href ="/css/dropify.css" />
<!-- icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<br><br>
	<div class = "row  card" >
		<div class = "col s12  ">
			<div class = "col s1"></div>
			<div class = "col s2">
				<br>
				<h5>
					회원관리 페이지
				</h5>
				<br><br>
			</div>
		</div>
		<div class = "col s1"></div>
		 <div class="col s6  ">
		    <ul class="tabs ">
			    <li class="tab col s3"><a class="" href="#test1">구매자 조회 및 관리</a></li>
			    <li class="tab col s3"><a class="active" href="#test2">판매자 조회 및 관리</a></li>
			    <li class="tab col s3"><a class="" href="#test3">후기 조회 및 관리</a></li>
			    <li class="tab col s3"><a class="" href="#test4">홈페이지 관리</a></li>
		    </ul>
		    <br>
	    </div>
	</div>
	<br>
	<div class = "row" >
		<div class = "col s12" >
			<div class = "col s1"></div>
			<div class = "col s2">
				 <div class="collection">
			        <a href="/admin/updatepermissionSupplier.do" class="collection-item active ">판매자 정보 조회</a>
			        <a href="/admin/notPermissionList.do" class="collection-item ">승인 대기 리스트</a>
			        <a href="#!" class="collection-item">Alvin</a>
			        <a href="#!" class="collection-item">Alvin</a>
     			 </div>
			</div>
		</div>
	</div>
</body>
</html>