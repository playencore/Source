<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>
<script src="/js/dropify.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		 activeItem('마이 페이지');
			showExtendedMenu('#nav_mypage');
			activeSubItem('판매메뉴 추가/수정',0);	
		$('#addFood').modal();
		$('.dropify').dropify(); //파일 업로드
		$('#name, #explanation').characterCounter();
		
		for(var i = 0 ; i < ${listsize} ; i++){
			$('#modifyMenu'+i).modal();
			$('#mname, #mexplanation').characterCounter();
		}
		
	});

	function foodsubmit() {

		if ($("input[name=name]").val() == null
				|| $("input[name=name]").val() == "") {
			alert("메뉴 이름을 입력해주세요");
			$("input[name=name]").focus();
			return false;
		} else if ($("#explanation").val() == null
				|| $("#explanation").val() == "") {
			alert("메뉴 설명을 입력해주세요.");
			$("#explanation").focus();
			return false;
		} else if ($("input[name=weight]").val() == null
				|| $("input[name=weight]").val() == "") {
			alert("메뉴 중량을 입력해주세요.");
			$("input[name=weight]").focus();
			return false;
		} else if($("input[name=weight]").val().length > 4){
			alert("메뉴 중량은 최대 9.9kg 까지 입니다.")
			$("input[name=weight]").focus();
			return false;
		} 

	}
	
	function modifysubmit(){
		if ($("input[name=mname]").val() == null
				|| $("input[name=mname]").val() == "") {
			alert("메뉴 이름을 입력해주세요");
			$("input[name=mname]").focus();
			return false;
		} else if ($("#mexplanation").val() == null
				|| $("#mexplanation").val() == "") {
			alert("메뉴 설명을 입력해주세요.");
			$("#mexplanation").focus();
			return false;
		} else if ($("input[name=mweight]").val() == null
				|| $("input[name=mweight]").val() == "") {
			alert("메뉴 중량을 입력해주세요.");
			$("input[name=mweight]").focus();
			return false;
		} else if($("input[name=mweight]").val().length > 4){
			alert("메뉴 중량은 최대 9.9kg 까지 입니다.")
			$("input[name=mweight]").focus();
			return false;
		} 
	}
	
	
	function menudelete(menu_id, menuname){
		$.ajax(
				{
					type : "POST",
					url: "/supplier/fooddelete.do",
					data : 
					{
						"menu_id":menu_id, 
					},
					success:function(data){
						alert("삭제에 성공했습니다") ;
						location.reload();
					},
					error: function(data){
						alert("삭제에 실패했습니다.") ;
					}
				}		
			);
	}
//-->
</script>
<br>
<br>

<div class="row">
	<div class="col s12">
		<div class="col s3"></div>
		<div class="col s7">
			<p style="padding-left: 10px">메뉴 추가 및 수정</p>
			<c:if test="${empty foodList}">
				<p>등록한 메뉴가 없습니다. 메뉴가 등록되어야 제안이 가능합니다.</p>
			</c:if>
			<div id="result">
				<c:set var = "count" value = "${0}" />
				<c:forEach var="list" items="${foodList}">
					<div class = "col s6">
						<div class="card">
							<div class="card-image">
								<img src="/file/file-down/${list.file_id}" width="200" height="200">
								<span class="card-title">${list.name}</span>
							</div>
							<div class="card-content">
								<p> 
								메뉴 이름 : ${list.name} <br>
								메뉴 설명 : ${list.explanation} <br>
								메뉴 중량 : ${list.weight} <br>
								</p> 
							</div>
							<div class="card-action">
								<a class = "waves-effect waves-light" onclick="menudelete('${list.menu_id}','${list.name}')">삭제하기</a>
								<!-- Modal Trigger -->
								<a class="waves-effect waves-light modal-trigger" href="#modifyMenu${count}">수정하기</a>
								
								<!-- Modal Structure -->
								<div id="modifyMenu${count}" class="modal">
									<div class="modal-content">
										<form name="modifyMenu" method="post" action="/supplier/modifymenu.do"
											enctype="multipart/form-data" onsubmit="return modifysubmit() "
											class="col s8">
											<input type = "hidden" name = "mmenu_id" value = "${list.menu_id}">
											<div class="row">
												<div class="input-field col s12">
													<input name="mname" id="name" type="text" class="validate" 	data-length="19" value = "${list.name}"> 
													<label for="name">*메뉴명</label> 
													<span class="helper-text" data-error="값을 입력하세요" data-success=""></span>
												</div>
											</div>
											<div class="row">
												<div class="input-field col s12">
													<textarea name="mexplanation" id="mexplanation" class="materialize-textarea validate" data-length="49">${list.explanation}</textarea>
													<label for="textarea1">*메뉴설명</label> 
													<span class="helper-text" data-error="값을 입력하세요" data-success=""></span>
												</div>
											</div>
											<div class="row">
												<div class="input-field col s12">
													<input value = "${list.weight}" placeholder="Gram을 기준으로 " name="mweight" id="weight" type="number" class="validate" maxlength="4"> 
													<label for="weight">*메뉴중량</label> 
													<span class="helper-text" data-error="값을 입력하세요" data-success=""></span>
												</div>
											</div>
							
											<div class="row">
												<div class="input-field col s12">
													<p>*메뉴의 사진을 넣어주세요</p>
													<input data-default-file="/file/file-down/${list.file_id}" name="mfile_id" type="file" class="cp dropify validate"
														data-height="100">
												</div>
											</div>
											<button class="btn waves-effect waves-light" type="submit">
												<i class="material-icons right">add</i> 메뉴수정
											</button>
											<br><br>
										</form>
										<div class="modal-footer">
											<a href="#!" class="modal-close waves-effect waves-green btn-flat">수정 취소</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<c:set var = "count" value = "${count=count+1}" />
				</c:forEach>
			</div>
			<div class="col s6">
				<div data-target="addFood"
					class="modal-trigger card text-align: center bar grey lighten-2 "
					 style="border: 1px solid black; height: 300px; width:auto"
					 >
					<i class="medium material-icons" style="margin-top:120px" >add</i>
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
			<div class="col s2"></div>
			<form name="addfoodform" method="post" action="/supplier/setfoodPro.do"
				enctype="multipart/form-data" onsubmit="return foodsubmit() "
				class="col s8">
				<div class="row">
					<div class="input-field col s12">
						<input name="name" id="name" type="text" class="validate"
							data-length="19"> <label for="name">*메뉴명</label> <span
							class="helper-text" data-error="값을 입력하세요" data-success=""></span>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<textarea name="explanation" id="explanation"
							class="materialize-textarea validate" data-length="49"></textarea>
						<label for="textarea1">*메뉴설명</label> <span class="helper-text"
							data-error="값을 입력하세요" data-success=""></span>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input placeholder="Gram을 기준으로 " name="weight" id="weight"
							type="number" class="validate" maxlength="4"> <label
							for="weight">*메뉴중량</label> <span class="helper-text"
							data-error="값을 입력하세요" data-success=""></span>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s12">
						<p>*메뉴의 사진을 넣어주세요</p>
						<input name="file_id" type="file" class="cp dropify validate"
							data-height="100">
					</div>
				</div>
				<button class="btn waves-effect waves-light" type="submit">
					<i class="material-icons right">add</i> 메뉴등록
				</button>
			</form>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#!" class="modal-close waves-effect waves-green btn-flat">닫기</a>
	</div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<%@include file="/include/footer.jsp"%>
</body>
</html>
