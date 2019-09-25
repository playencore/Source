<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>
<%@ taglib prefix="ui" uri="http://charida.com/paging/ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/js/dropify.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		 activeItem('마이 페이지');
			showExtendedMenu('#nav_mypage');
			activeSubItem('판매메뉴 추가/수정',0);	
		$('#addFood').modal();
		$('.dropify').dropify(); //파일 업로드
		$('#name, #explanation').characterCounter();4
		$('select').formSelect();
		for(var i = 0 ; i < ${listsize} ; i++){
			$('#modifyMenu'+i).modal();
			$('#mname, #mexplanation').characterCounter();
		}
		
	});
	
	function movePage(pageNo){
		document.dForm.pageNo.value = pageNo;
		document.dForm.submit();
	}

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
		} else if ($("input[name=count]").val() == null
				|| $("input[name=count]").val() == "") {
			alert("메뉴의 갯수 및 인분을 입력하세요.");
			$("input[name=count]").focus();
			return false;
		} else if( $("#largesection").val() == "" || $("#largesection").val() == null){
			alert("대분류 카테고리를 입력해주세요.") ;
			$("#largesection").focus() ;
			return false ;
		}else if( $("#middlesection").val() == "" || $("#middlesection").val() == null){
			alert("중분류 카테고리를 입력해주세요.") ;
			$("#middlesection").focus() ;
			return false ;
		}else if( $("#smallsection").val() == "" || $("#smallsection").val() == null){
			alert("소분류 카테고리를 입력해주세요.") ;
			$("#smallsection").focus() ;
			return false ;
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
		} else if($("input[name=mcount]").val().length > 3){
			alert("메뉴의 갯숫 및 인분은 100인분 가지 입니다.")
			$("input[name=mcount]").focus();
			return false;
		} else if( $("#mlargesection").val() == "" || $("#mlargesection").val() == null){
			alert("대분류 카테고리를 입력해주세요.") ;
			$("#mlargesection").focus() ;
			return false ;
		}else if( $("#mmiddlesection").val() == "" || $("#mmiddlesection").val() == null){
			alert("중분류 카테고리를 입력해주세요.") ;
			$("#mmiddlesection").focus() ;
			return false ;
		}else if( $("#msmallsection").val() == "" || $("#msmallsection").val() == null){
			alert("소분류 카테고리를 입력해주세요.") ;
			$("#msmallsection").focus() ;
			return false ;
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
													<input name="mname" id="mname" type="text" class="validate" 	data-length="19" value = "${list.name}"> 
													<label for="mname">*메뉴명</label> 
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
													<input value = "${list.weight}" placeholder="Gram을 기준으로 " name="mweight" id="mweight" type="number" class="validate" maxlength="4"> 
													<label for="mweight">*메뉴중량</label> 
													<span class="helper-text" data-error="값을 입력하세요" data-success=""></span>
												</div>
											</div>
											<div class="row">
												<div class="input-field col s12">
													<input value = "${list.count}" placeholder="총 메뉴의 갯수 및 인분" name="mcount" id="mcount" type="number" class="validate" maxlength="3"> 
													<label for="mcount">*총 메뉴의 갯수 및 인분 </label> 
													<span class="helper-text" data-error="값을 입력하세요" data-success=""></span>
												</div>
											</div>
											<div class="row">
												<div class="col s12">
													<span> 음식의 카테고리를 넣어주세요. </span>
													<br><br>
													<div class = "row">
													<c:set var = "section" value = "${list.food_cg}" />
													<c:set var = "ls" value = "${fn:substring(section,0,3) }"/>
													<c:set var = "ms" value = "${fn:substring(section,3,6) }"/>
													<c:set var = "ss" value = "${fn:substring(section,6,9) }"/>
														<div class= " input-field col s4">
															<select id = "mlargesection" name = "mlargesection">
																<option <c:if test= "${ls == 'L01'}">selected</c:if> value="L01">한식</option>
																<option <c:if test= "${ls == 'L02'}">selected</c:if> value="L02">일식</option>
																<option <c:if test= "${ls == 'L03'}">selected</c:if> value="L03">중식</option>
																<option <c:if test= "${ls == 'L04'}">selected</c:if> value="L04">웨스턴</option>
																<option <c:if test= "${ls == 'L05'}">selected</c:if> value="L05">퓨전</option>
															</select>
															<label>대분류</label>
														</div>
														<div class= " input-field col s4">
															<select id = "mmiddlesection" name= "mmiddlesection"  >
																<option <c:if test= "${ms == 'M01'}">selected</c:if> value="M01">육류</option>
																<option <c:if test= "${ms == 'M02'}">selected</c:if> value="M02">해산물</option>
																<option <c:if test= "${ms == 'M03'}">selected</c:if> value="M03">밥류</option>
																<option <c:if test= "${ms == 'M04'}">selected</c:if> value="M04">면류</option>
																<option <c:if test= "${ms == 'M05'}">selected</c:if> value="M05">채소</option>
																<option <c:if test= "${ms == 'M06'}">selected</c:if> value="M06">두류</option>
																<option <c:if test= "${ms == 'M07'}">selected</c:if> value="M07">빵류</option>
															</select>
															<label>중분류</label>
														</div>
														<div class= " input-field col s4">
															<select id = "msmallsection" name = "msmallsection" >
																<option <c:if test= "${ss == 'S01'}">selected</c:if> value="S01">국류</option>
																<option <c:if test= "${ss == 'S02'}">selected</c:if> value="S02">볶음</option>
																<option <c:if test= "${ss == 'S03'}">selected</c:if> value="S03">찜</option>
																<option <c:if test= "${ss == 'S04'}">selected</c:if> value="S04">구이</option>
																<option <c:if test= "${ss == 'S05'}">selected</c:if> value="S05">튀김</option>
																<option <c:if test= "${ss == 'S06'}">selected</c:if> value="S06">날것(샌드위치)</option>
															</select>
															<label>소분류</label>
														</div>
													</div>
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
				<c:if test="${fn:length(foodList) != 6 }">
					<div data-target="addFood"
					class="modal-trigger card text-align: center bar grey lighten-2 "
					 style="border: 1px solid black; height: 300px; width:auto"
					 >
					<i class="medium material-icons" style="margin-top:120px" >add</i>
				</div>
				</c:if>
			</div>
			<div class="col m12 center">
				<ui:pagination paginationInfo = "${paging }" jsFunction="movePage"/>
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
						<input placeholder="총 메뉴의 갯수 및 인분  " name="count" id="count"
							type="number" class="validate" maxlength="4"> <label
							for="count">*총 메뉴의 갯수 및 인분</label> <span class="helper-text"
							data-error="값을 입력하세요" data-success=""></span>
					</div>
				</div>
				<div class="row">
					<div class="col s12">
						<span> 음식의 카테고리를 넣어주세요. </span>
						<br><br>
						<div class = "row">
							<div class= " input-field col s4">
								<select id = "largesection" name = "largesection">
									<option value="" disabled selected>선택해주세요</option>
									<option value="L01">한식</option>
									<option value="L02">일식</option>
									<option value="L03">중식</option>
									<option value="L04">웨스턴</option>
									<option value="L05">퓨전</option>
								</select>
								<label>대분류</label>
							</div>
							<div class= " input-field col s4">
								<select id = "middlesection" name = "middlesection"  >
									<option value="" disabled selected>선택해주세요</option>
									<option value="M01">육류</option>
									<option value="M02">해산물</option>
									<option value="M03">밥류</option>
									<option value="M04">면류</option>
									<option value="M05">채소</option>
									<option value="M06">두류</option>
									<option value="M07">빵류</option>
								</select>
								<label>중분류</label>
							</div>
							<div class= " input-field col s4">
								<select id = "smallsection" name ="smallsection"  >
									<option value="" disabled selected>선택해주세요</option>
									<option value="S01">국류</option>
									<option value="S02">볶음</option>
									<option value="S03">찜</option>
									<option value="S04">구이</option>
									<option value="S05">튀김</option>
									<option value="S06">날것(샌드위치)</option>
								</select>
								<label>소분류</label>
							</div>
						</div>
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
	<form name="dForm" method="post">
		<input type="hidden" name ="pageNo"value="${pageNo}">
	</form>
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
