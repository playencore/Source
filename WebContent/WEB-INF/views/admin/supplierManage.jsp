<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    

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
	    for( var i = 0 ; i < ${listsize} ; i++){
	    	$('#infomodal'+i).modal();
	    	$('#permissionmodal'+i).modal() ;
	    }
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
			    <li class="tab col s3"><a class="active" href="#test1">구매자 조회 및 관리</a></li>
			    <li class="tab col s3"><a class="active" href="#test2">판매자 조회 및 관리</a></li>
			    <li class="tab col s3"><a class="active" href="#test3">후기 조회 및 관리</a></li>
			    <li class="tab col s3"><a class="active" href="#test4">홈페이지 관리</a></li>
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
			        <a href="#!" class="collection-item ">판매자 정보 조회</a>
			        <a href="#!" class="collection-item active">승인 대기 리스트</a>
			        <a href="#!" class="collection-item">Alvin</a>
			        <a href="#!" class="collection-item">Alvin</a>
     			 </div>
			</div>
			<div class = "col s7 " id = "permissionlist" >
			
				<div class = "row grey lighten-2" >
					<c:set var = "count" value = "${0}" />
					<c:forEach var="supplierDto" items="${suppliers}" >
					<div class = "col s6">
						<div class="card  ">
							<div class="card-content black-text ">
								<span class="card-title">${supplierDto.name}  </span>
								<p>
									판매자 이름 : ${supplierDto.name} <br>
									판매자 아이디 : ${supplierDto.mem_id} <br>
									판매자 전화번호 :	${supplierDto.memberDto.tel} <br>
									판매자 사업자 등록번호 : ${supplierDto.regist_num} <br>
									가입 신청일 :  <br>
									승인 상태 : N	<br>
									카운트 : ${count}
								</p>
							</div>
							<div class="card-action">
								<a class = "waves-effect waves-light modal-trigger" href="#infomodal${count}" >상세보기</a>
								<a class = "waves-effect waves-light modal-trigger" href="#permissionmodal${count}" >승인/반려 하기</a>
							</div>
						</div>
					</div>
					
					<!-- Modal Structure 상세보기 -->
					<div class = "modallist">
						<div id="infomodal${count}" class="modal">
							<div class="modal-content">
								<h4>업체 상세보기</h4>
								<p>
									판매자 이름 : ${supplierDto.name} <br>
									판매자 아이디 : ${supplierDto.mem_id} <br>
									판매자 전화번호 :	<br>
									판매자 사업자 등록번호 : ${supplierDto.regist_num} <br>
									가입 신청일 :  <br>
									승인 상태 : N	<br>
									판매자 소개 : <br>
									${supplierDto.explanation} <br>
									${count}
								</p>
								
							</div>
							<div class="modal-footer">
								<a href="#!" class="modal-close waves-effect waves-green btn-flat">창닫기</a>
							</div>
						</div>
					</div>
					<!-- Modal Structure 승인 반려사항 적기 -->
					<div class = "permisionreasonlist">
						<div id="permissionmodal${count}" class="modal">
							<div class="modal-content">
								<h4>승인 상태 변경하기</h4>
								<p>업체명 : ${supplierDto.name} <br>
									${count}
								</p>
							</div>
							<div class="modal-footer">
								<a href="#!" class="modal-close waves-effect waves-green btn-flat">Agree</a>
							</div>
						</div>
					</div>
					<c:set var = "count" value = "${count=count+1}" />
					</c:forEach>
				</div>
				
			</div>
		</div>
	</div>
	
</body>
</html>












