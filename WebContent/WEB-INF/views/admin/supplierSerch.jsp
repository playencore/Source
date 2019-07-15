<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>
<script type="text/javascript">
//<!--
	$(document).ready(function(){
	    $('.tabs').tabs();
	    $("#searchCategory").formSelect();
	    $("#searchstart").on(
				"click",
				function( event ){
					var searchCategory = $("#searchCategory").val() ;
					var searchContent = $("#searchcontent").val() ;
					$.ajax(
						{
							type : "POST",
							url: "/admin/serchsupplierajax.do",
							data : 
							{
								"searchCategory":searchCategory, 
								"searchContent":searchContent	
							},
							dataType:"json",
							success:function(data){
								showlist(data);
								setModal(data);
							},
							error: function(data){
								alert("검색에 실패 했습니다. 다시 시도해주세요") ;
							}
						}		
					);
				}
			); // 업체넘버 중복 방지 ajax
	});
	
	function showlist(data){
		var cards = "" ;	
		for(var i = 0 ; i < Object.keys(data).length ; i++){
			cards = cards 
			+"<div class='card col s12'>"
			+ "<div class='card-content black-text'>"
			+	"<span class='card-title'>"
			+    data[i].COMPANYNAME
			+     "</span>"
			+	"<p>"
			+		"판매자 이름 : "+data[i].NAME+" <br>"
			+		"판매자 아이디 : "+data[i].MEM_ID+" <br>"
			+		"판매자 사업자 등록번호 : "+data[i].REGIST_NUM+" <br>"
			+	"</p>"
			+"</div>"
			+"<div class='card-action'>"
			+	"<a class = 'waves-effect waves-light modal-trigger' href='#resultModal"+i+"' >상세보기</a>"
			+"</div>"
			+"</div>"
			+"<div class = 'modallist'>"
			+"<div id='resultModal"+i+"' class='modal'>"
			+	"<div class='modal-content'>"
			+		"<h4>업체 상세보기</h4>"
			+		"<p>"
			+			"판매자 이름 : "+data[i].NAME+" <br>"
			+			"판매자 아이디 : "+data[i].MEM_ID+" <br>"
			+			"판매자 전화번호 :	"+data[i].TEL+"<br>"
			+		"</p>"
			+	"</div>"
			+	"<div class='modal-footer'>"
			+		"<a href='#!' class='modal-close waves-effect waves-green btn-flat'>창닫기</a>"
			+	"</div>"
			+"</div>"
			+"</div>" ;
		}
		$("#showcard").html(cards);
	}
	
	function setModal(data){
		for(var i = 0 ; i<Object.keys(data).length ; i++){
			$('#resultModal'+i).modal();
		}
	}
	
	
//-->
</script>
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
			<div class = "col s7">
			<p style = "padding-left:10px">판매자 조회</p>
				<div class = "col s3" style = "padding-top:15px">
					<select id = "searchCategory">
						<option value="" disabled selected>검색 카테고리 선택</option>
						<option value="MEM_ID">판매자 ID</option>
						<option value="NAME">판매자 이름</option>
						<option value="TEL">판매자 전화번호</option>
						<option value="COMPANYNAME">업체이름</option>
						<option value="REGIST_NUM">판매자 사업장 등록 번호</option>
					</select>
					<label>검색 카테고리</label>
				</div>
				<div class="input-field col s6">
					<i class="material-icons prefix">search</i>
					<input id="searchcontent" type="text" class="">
					<label for="icon_prefix">검색내용 작성</label>
				</div>
				<div class = "col s3" style = "padding-top:15px" >
					<a id="searchstart" class="waves-effect waves-light btn">검색</a>
				</div>
			</div>
			<div class = "col s2"></div>
			<div class = "col s3"></div>
			<div class = "col s7" id = "showcard">
			
			</div>
		</div>
	</div>
<br><br><br><br><br><br><br><br><br><br>	
<%@include file="/include/footer.jsp" %>
</body>
</html>