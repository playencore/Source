<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<script type="text/javascript">
	//<!--
	  $(document).ready(function(){
	    $('.tabs').tabs();
	  });
	//-->
</script>
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
			    <li class="tab col s3"><a class="active" href="#test1">Test 1</a></li>
			    <li class="tab col s3"><a class="active" href="#test2">Test 2</a></li>
			    <li class="tab col s3"><a class="active" href="#test3">Disabled Tab</a></li>
			    <li class="tab col s3"><a class="active" href="#test4">Test 4</a></li>
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
			        <a href="#!" class="collection-item ">Alvin</a>
			        <a href="#!" class="collection-item active">Alvin</a>
			        <a href="#!" class="collection-item">Alvin</a>
			        <a href="#!" class="collection-item">Alvin</a>
     			 </div>
			</div>
			<div class = "col s7" style="height:500px; border:1px solid black; margin-top: 7px;" >
				
			</div>
		</div>
	</div>
	
</body>
</html>