<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>
<script src = "/js/dropify.js"></script>
<script type = "text/javascript">
	//<!--
$(document).ready(function(){
    $('.tabs').tabs();
    $('#addFood').modal();
    $('.dropify').dropify(); //파일 업로드
    $('#name, #explanation').characterCounter();
    
    $("#addfoodform").validate({
        rules: {
            name: {
                required: true,
               	maxlength: 19
            },
            explanation: {
                required: true,
                maxlength: 49
            },
            weight: {
				required: true,
				maxlength:4
			},
			cpassword: {
				required: true,
				minlength: 5,
				equalTo: "#password"
			},
			file_id: {
                required: true,
            },
        },
        //For custom messages
        messages: {
        	name:{
                required: "메뉴이름을 입력해주세요.",
                minlength: "최대 20자 가능합니다."
            },
            explanation:{
                required: "메뉴 설명을 꼭 작성해야합니다.",
                minlength: "최대 50자 가능합니다."
            },
            weight:{
                required: "중량을 입력해주세요",
                minlength: "최대 4자 가능합니다."
            },
        },
        errorElement : 'div',
        errorPlacement: function(error, element) {
          var placement = $(element).data('error');
          if (placement) {
            $(placement).append(error)
          } else {
            error.insertAfter(element);
          }
        }
     });
    
 });
	//-->
</script>
	<br><br>
	<div class = "row  card" >
		<div class = "col s12  ">
			<div class = "col s1"></div>
			<div class = "col s2">
				<br>
				<h5>
					판매자 마이페이지
				</h5>
				<br><br>
			</div>
		</div>
		<div class = "col s1"></div>
		 <div class="col s6  ">
		    <ul class="tabs ">
			    <li class="tab col s3"><a class="" href="#test1">매칭리스트 조회</a></li>
			    <li class="tab col s3"><a class="active" href="#test2">메뉴 추가 및 수정</a></li>
			    <li class="tab col s3"><a class="" href="#test3">후기 조회 및 관리</a></li>
			    <li class="tab col s3"><a class="" href="#test4">홈페이지 관리</a></li>
		    </ul>
		    <br>
	    </div>
	</div>
	<div class = "row" >
		<div class = "col s12" >
			<div class = "col s1"></div>
			<div class = "col s2">
				 <div class="collection">
			        <a href="#!" class="collection-item ">기본정보 수정</a>
			        <a href="#!" class="collection-item ">판매 카테고리 수정</a>
			        <a href="#!" class="collection-item active">메뉴 추가 및 수정</a>
			        <a href="#!" class="collection-item">Alvin</a>
     			 </div>
			</div>
			<div class = "col s7">
				<p style = "padding-left:10px" >메뉴 추가 및 수정</p>
				<c:if test="${empty foodList}">
					<p> 등록한 메뉴가 없습니다. 메뉴가 등록되어야 제안이 가능합니다.</p>
				</c:if>
				<div id = "foodlist">
					
				</div>
				<div class = "col s6">
					<div data-target="addFood" class="modal-trigger card text-align: center bar grey lighten-2 ">
						<i class="medium material-icons">add</i>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- Modal Structure -->
<div id="addFood" class="modal">
	<div class="modal-content">
		<h4>메뉴 추가</h4>
		<div class="row">
			<div class = "col s2"></div>
			<form name = "addfoodform" method="post" action="" enctype="multipart/form-data" onsubmit=" "  class="col s8">
				<input type = "hidden" name = "menu_id">
				<input type = "hidden" name = "mem_id">
				<div class="row">
					<div class="input-field col s12">
						<input name = "name" id="name" type="text" class="validate" " data-length="19"> 
						<label for="name">*메뉴명</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<textarea name = "explanation" id="explanation" class="materialize-textarea validate"  data-length="49"></textarea>
          				<label for="textarea1">*메뉴설명</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input placeholder="Gram을 기준으로 " name ="weight" id="name" type="number" class="validate"  maxlength="4"> 
						<label for="weight">*메뉴중량</label>
					</div>
				</div>
				 
				<div class="row">
					<div class="input-field col s12">
						<p>*메뉴의 사진을 넣어주세요</p>
						<input name ="file_id" type="file"  class="cp dropify validate" data-height="100" required >
					</div>
				</div>
				<button class="btn waves-effect waves-light" type="submit"  >
					<i class="material-icons right">add</i>
					메뉴등록
				</button>
			</form>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#!" class="modal-close waves-effect waves-green btn-flat">닫기</a>
	</div>
</div>
<br><br><br><br><br><br><br><br><br><br><br>
<%@include file="/include/footer.jsp" %>
</body>
</html>