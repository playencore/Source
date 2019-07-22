<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/js/dropify.js"></script>
<script src="/js/join/join-basic.js"></script>
<script src="/js/mail/sendmail.js"></script>
<script src="/js/addresssearch.js"></script>

<c:forEach var="SupplierDto" items="${supplier_info}">
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("input[name=regist_num]")
								.on(
										"keyup",
										function(event) {
											var regist_num = $(
													"input[name=regist_num]")
													.val();
											$
													.ajax({
														type : "POST",
														url : "/joinUser/checkRegist_num.do",
														data : {
															"regist_num" : regist_num
														},
														dataType : "json",
														success : function(data) {
															$(
																	"#supplierlicensNumval")
																	.html(
																			data.result)
																	.attr(
																			"style",
																			data.color);
														},
														error : function(data) {
															$(
																	"#supplierlicensNumval")
																	.html(
																			"다시 시도해주세요.")
																	.attr(
																			"style",
																			"color:red");
														}
													});
										}); // 업체넘버 중복 방지 ajax

						$('select').formSelect();
						
						var slider = document.getElementById('test-slider');
						noUiSlider.create(slider, {
							
							start : [ ${SupplierDto.minimum_seating}, ${SupplierDto.maximum_seating} ],
							connect : true,
							step : 1,
							orientation : 'horizontal', // 'horizontal' or 'vertical'
							range : {
								'min' : 0,
								'max' : 100
							},
							format : wNumb({
								decimals : 0
							})
						}); // range

						slider.noUiSlider.on('update',
								function(values, handle) {
									// value for updated handle is in values[handle]
									$("input[name=minimum_seating]").val(
											values[0]);
									$("input[name=maximum_seating]").val(
											values[1]);
								});

						$('.dropify').dropify(); //파일 업로드
						$('#modal1').modal();
						$('input#companyname, textarea#explanation')
								.characterCounter();
						
					});
	/* function picture{
		var picture = $("form[name=modifysupplierForm]").attr("enctype","multipart/form-data");
		} */
	
	function supplierinput() {
		if ($("input[name=companyname]").val() == null
				|| $("input[name=companyname]").val() == "") {
			alert("업체명을 입력해주세요.");
			$("input[name=companyname]").focus();
			return false;
		} else if ($("input:checkbox[name=serviceCategory]:checked").length == 0) {
			alert("서비스 가능한 형태를 하나 이상 체크해주세요.");
			$("#sc").focus();
			return false;
		} else if ($("input:checkbox[name=foodCategory]:checked").length == 0) {
			alert("서비스 가능한 음식 카테고리를 하나 이상 체크해주세요.");
			$("#fc").focus();
			return false;
		} else if ($("input:checkbox[name=serviceLocation]:checked").length == 0) {
			alert("서비스 가능한 지역을 하나 이상 체크해주세요.");
			$("#sl").focus();
			return false;
		}
		
	}
//-->
</script>
</c:forEach>
<br>
<br>

<div class="row  card">
	<div class="col s12  ">
		<div class="col s1"></div>
		<div class="col s2">
			<br>
			<h5>판매자 마이페이지 </h5>
			<br>	
			<br>
		</div>
	</div>
	<div class="col s1"></div>
	<div class="col s6  ">
		<ul class="tabs ">
			<li class="tab col s3"><a class="" href="#test1">매칭리스트 조회</a></li>
			<li class="tab col s3"><a class="active" href="#test2">메뉴 추가
					및 수정</a></li>
			<li class="tab col s3"><a class="" href="#test3">후기 조회 및 관리</a></li>
			<li class="tab col s3"><a class="" href="#test4">홈페이지 관리</a></li>
		</ul>
		<br>
	</div>
</div>
<div class="row">
	<div class="col s12">
		<div class="col s1"></div>
		<div class="col s2">
			<div class="collection">
				<a href="/supplier/modifyDefaultInfo.do" class="collection-item active">기본정보 수정</a> <a href="#!"
					class="collection-item ">판매 카테고리 수정</a> <a href="#!"
					class="collection-item ">메뉴 추가 및 수정</a> <a href="#!"
					class="collection-item">Alvin</a>
			</div>
		</div>
<c:forEach var="SupplierDto" items="${supplier_info}">
<div class="col s7">		
<div class="row">
	<div class="col s10">
		<div class="col s10"></div>
		<div class="col s10 card-panel">
			<p class="header">&nbsp;&nbsp;&nbsp;기본정보 수정  </p>
			<form name="modifysupplierForm" method="post" enctype="multipart/form-data"
				action="/supplier/modifyDefaultInfoPro.do" 
				onsubmit="return supplierinput() ">
				<div id="supplierForm" >
					<div class="col s12">
						<div class="input-field col s12">
							<input name="companyname" id="companyname" type="text" 
								class="validate" data-length="13" value="${SupplierDto.name}"> <label
								for="companyname">*업체 이름</label> <span class="helper-text"
								id="companynamecheck"></span>
						</div>
					</div>
					<div class="col s12">
						<div class="input-field col s12">
							<input name="regist_num" id="regist_num" type="number"
								class="validate" placeholder="-를 제외한 숫자만 입력해주세요." value="${SupplierDto.regist_num}" disabled="disabled"> <label
								for="regist_num">*사업자번호</label> <span class="helper-text"
								id="supplierlicensNumval" ></span>
						</div>
					</div>
					<div class="col s12">
						<div class="input-field col s12">
							<textarea name="explanation" id="explanation"
								class="validate materialize-textarea" data-length="130">${SupplierDto.explanation}</textarea>
							<label for="explanation">업체 소개</label> <span class="helper-text"
								id="explanationcheck"></span>
						</div>
					</div>

					<div class="col s12 ">
						<p>서비스 가능 인원 범위</p>
						<br>
						<div id="test-slider" class="col s12"></div>
						<div class="input-field col s6">
							<input type="text" name="minimum_seating" 
								class="validate center-align" readOnly> <label
								for="minimum_seating"></label> <span class="helper-text">*최소수용인원</span>

						</div>
						<div class="input-field col s6">
							<input name="maximum_seating" type="text"
								class="validate center-align" readOnly> <label
								for="maximum_seating"></label> <span class="helper-text">*최대수용인원</span>
						</div>
					</div>

					<div class="col s12">
						<p>사업자 등록증</p>
						<center><img src="/file/file-down/${SupplierDto.cert_file_id}" width="400"></center>
						<br>
						<%-- <input name="cert_file_id" type="file" class="dropify"
							data-height="100" data-default-file="/file/file-down/${SupplierDto.cert_file_id}"
							value="/file/file-down/${SupplierDto.cert_file_id}"> --%>
					</div>

					<div class="col s12">
						<br>
						<p>업체 소개 사진</p>
						<c:forEach var="pictures" items="${SupplierDto.picture}">
						<img src="/file/file-down/${pictures}" width="130">
						</c:forEach> 
						<br><br>
						
						
						<!-- <input type='button' value="소개사진 수정하기"  class="btn waves-effect waves-light" name="picture"
						onClick="document.all.tr0.style.display='block';document.all.tr1.style.display='block';document.all.tr2.style.display='block'; picture()">
						<br><br> -->
						<div id="picture">
						<div class="col s4" style="display : none" id="tr0">
							<input name="supplierInfoFile1" type="file" class="dropify"
								data-height="100">
						</div>
						<div class="col s4" style="display : none" id="tr1">
							<input name="supplierInfoFile2" type="file" class="dropify"
								data-height="100">
						</div>
						<div class="col s4" style="display : none" id="tr2">
							<input name="supplierInfoFile3" type="file" class="dropify"
								data-height="100">
						</div>
						</div>
						
						
					</div>
					<div class="col s12 row">
						<br>
						<p id="sc">가능한 서비스 형태</p>
						<c:forEach var="ServiceTypeDto" items="${serviceType}">
							<c:if test="${ServiceTypeDto.getCode() eq 'EVT0000010'}">
								<c:set var="code1" value="true"></c:set>
							</c:if>
							<c:if test="${ServiceTypeDto.getCode() eq 'EVT0000020'}">
								<c:set var="code2" value="true"></c:set>
							</c:if>
							<c:if test="${ServiceTypeDto.getCode() eq 'EVT0000030'}">
								<c:set var="code3" value="true"></c:set>
							</c:if>
							<c:if test="${ServiceTypeDto.getCode() eq 'EVT0000040'}">
								<c:set var="code4" value="true"></c:set>
							</c:if>
						</c:forEach>
						
						<div class="col s6">
								<label> <input type="checkbox" name="serviceCategory"
									<c:if test="${code1 == true}">checked="checked" </c:if> 
									value="EVT0000010"/> <span>뷔페/케이터링</span>
								</label>
							</div>
							
							<div class="col s6">
								<label> <input type="checkbox" name="serviceCategory"
									<c:if test="${code2 == true}">checked="checked" </c:if>
									value="EVT0000020" /> <span>코스음식</span>
								</label>
							</div>
							<div class="col s6">
								<label> <input type="checkbox" name="serviceCategory"
									<c:if test="${code3 == true}">checked="checked" </c:if>
									value="EVT0000030" /> <span>드랍오프</span>
								</label>
							</div>
							<div class="col s6">
								<label> <input type="checkbox" name="serviceCategory"
									<c:if test="${code4 == true}">checked="checked" </c:if>
									value="EVT0000040" /> <span>도시락</span>
								</label>
							</div>
					</div>
					
					
					<div class="col s12 row">
						<br>						
						<p id="fc">음식 카테고리</p>
						<c:forEach var="FoodStyleDto" items="${foodStyle}">
							<c:if test="${FoodStyleDto.getCode() eq 'MMU0000010'}">
								<c:set var="food1" value="true"></c:set>
							</c:if>
							<c:if test="${FoodStyleDto.getCode() eq 'MMU0000020'}">
								<c:set var="food2" value="true"></c:set>
							</c:if>
							<c:if test="${FoodStyleDto.getCode() eq 'MMU0000030'}">
								<c:set var="food3" value="true"></c:set>
							</c:if>
							<c:if test="${FoodStyleDto.getCode() eq 'MMU0000040'}">
								<c:set var="food4" value="true"></c:set>
							</c:if>
							<c:if test="${FoodStyleDto.getCode() eq 'DRT0000010'}">
								<c:set var="food5" value="true"></c:set>
							</c:if>
							<c:if test="${FoodStyleDto.getCode() eq 'DRT0000030'}">
								<c:set var="food6" value="true"></c:set>
							</c:if>
							<c:if test="${FoodStyleDto.getCode() eq 'DRT0000020'}">
								<c:set var="food7" value="true"></c:set>
							</c:if>
							<c:if test="${FoodStyleDto.getCode() eq 'DRT0000040'}">
								<c:set var="food8" value="true"></c:set>
							</c:if>
							<c:if test="${FoodStyleDto.getCode() eq 'MMU0000070'}">
								<c:set var="food9" value="true"></c:set>
							</c:if>
							<c:if test="${FoodStyleDto.getCode() eq 'MMU0000050'}">
								<c:set var="food10" value="true"></c:set>
							</c:if>
							<c:if test="${FoodStyleDto.getCode() eq 'MMU0000060'}">
								<c:set var="food11" value="true"></c:set>
							</c:if>
							<c:if test="${FoodStyleDto.getCode() eq 'MMU0000090'}">
								<c:set var="food12" value="true"></c:set>
							</c:if>														
						</c:forEach>
						
						<div class="col l4 m4 s4">
							<label> <input type="checkbox" name="foodCategory"
								<c:if test="${food1 == true}">checked="checked" </c:if>
								value="MMU0000010" /> <span>한정식</span>
							</label>
						</div>
						<div class="col l4 m4 s4">
							<label> <input type="checkbox" name="foodCategory"
								<c:if test="${food2 == true}">checked="checked" </c:if>
								value="MMU0000020" /> <span>핑거푸드</span>
							</label>
						</div>
						<div class="col l4 m4 s4">
							<label> <input type="checkbox" name="foodCategory"
								<c:if test="${food3 == true}">checked="checked" </c:if>
								value="MMU0000030" /> <span>웨스턴</span>
							</label>
						</div>
						<div class="col l4 m2 s4">
							<label> <input type="checkbox" name="foodCategory"
								<c:if test="${food4 == true}">checked="checked" </c:if>
								value="MMU0000040" /> <span>일식</span>
							</label>
						</div>
						<div class="col l4 m4 s4">
							<label> <input type="checkbox" name="foodCategory"
								<c:if test="${food5 == true}">checked="checked" </c:if>
								value="DRT0000010" /> <span>디저트류</span>
							</label>
						</div>
						<div class="col l4 m4 s4">
							<label> <input type="checkbox" name="foodCategory"
								<c:if test="${food6 == true}">checked="checked" </c:if>
								value="DRT0000030" /> <span>커피</span>
							</label>
						</div>
						<div class="col l4 m4 s4">
							<label> <input type="checkbox" name="foodCategory"
								<c:if test="${food7 == true}">checked="checked" </c:if>
								value="DRT0000020" /> <span>음료</span>
							</label>
						</div>
						<div class="col l4 m4 s4">
							<label> <input type="checkbox" name="foodCategory"
								<c:if test="${food8 == true}">checked="checked" </c:if>
								value="DRT0000040" /> <span>칵티일/와인</span>
							</label>
						</div>
						<div class="col l4 m4 s4">
							<label> <input type="checkbox" name="foodCategory"
								<c:if test="${food9 == true}">checked="checked" </c:if>
								value="MMU0000070" /> <span>피자</span>
							</label>
						</div>
						<div class="col l4 m4 s4">
							<label> <input type="checkbox" name="foodCategory"
								<c:if test="${food10 == true}">checked="checked" </c:if>
								value="MMU0000050" /> <span>아시안퓨전</span>
							</label>
						</div>
						<div class="col l4 m4 s4">
							<label> <input type="checkbox" name="foodCategory"
								<c:if test="${food11 == true}">checked="checked" </c:if>
								value="MMU0000060" /> <span>바베큐파티</span>
							</label>
						</div>
						<div class="col l4 m4 s4">
							<label> <input type="checkbox" name="foodCategory"
								<c:if test="${food12 == true}">checked="checked" </c:if>
								value="MMU0000090" /> <span>기타</span>
							</label>
						</div>
					</div>
					
					
					<div class="col s12 row">
						<p id="sl">서비스 가능지역</p>
						<c:forEach var="ServiceAreaDto" items="${serviceArea}">
							<c:if test="${ServiceAreaDto.getCode() eq 'SLT0000010'}">
								<c:set var="area1" value="true"></c:set>
							</c:if>
							<c:if test="${ServiceAreaDto.getCode() eq 'SLT0000020'}">
								<c:set var="area2" value="true"></c:set>
							</c:if>
							<c:if test="${ServiceAreaDto.getCode() eq 'SLT0000030'}">
								<c:set var="area3" value="true"></c:set>
							</c:if>
							<c:if test="${ServiceAreaDto.getCode() eq 'SLT0000040'}">
								<c:set var="area4" value="true"></c:set>
							</c:if>
							<c:if test="${ServiceAreaDto.getCode() eq 'SLT0000050'}">
								<c:set var="area5" value="true"></c:set>
							</c:if>
							<c:if test="${ServiceAreaDto.getCode() eq 'SLT0000060'}">
								<c:set var="area6" value="true"></c:set>
							</c:if>
							<c:if test="${ServiceAreaDto.getCode() eq 'SLT0000070'}">
								<c:set var="area7" value="true"></c:set>
							</c:if>
						</c:forEach>
						<div class="col s4">
							<label> <input type="checkbox" name="serviceLocation"
								<c:if test="${area1 == true}">checked="checked" </c:if>
								value="SLT0000010" /> <span>서울특별시</span>
							</label>
						</div>
						<div class="col s4">
							<label> <input type="checkbox" name="serviceLocation"
								<c:if test="${area2 == true}">checked="checked" </c:if>
								value="SLT0000020" /> <span>경기도</span>
							</label>
						</div>
						<div class="col s4">
							<label> <input type="checkbox" name="serviceLocation"
								<c:if test="${area3 == true}">checked="checked" </c:if>
								value="SLT0000030" /> <span>충청도</span>
							</label>
						</div>
						<div class="col s4">
							<label> <input type="checkbox" name="serviceLocation"
								<c:if test="${area4 == true}">checked="checked" </c:if>
								value="SLT0000040" /> <span>경상도</span>
							</label>
						</div>
						<div class="col s4">
							<label> <input type="checkbox" name="serviceLocation"
								<c:if test="${area5 == true}">checked="checked" </c:if>
								value="SLT0000050" /> <span>전라도</span>
							</label>
						</div>
						<div class="col s4">
							<label> <input type="checkbox" name="serviceLocation"
								<c:if test="${area6 == true}">checked="checked" </c:if>
								value="SLT0000060" /> <span>강원도</span>
							</label>
						</div>
						<div class="col s4">
							<label> <input type="checkbox" name="serviceLocation"
								<c:if test="${area7 == true}">checked="checked" </c:if>
								value="SLT0000070" /> <span>제주도</span>
							</label>
						</div>
					</div>


					<div class="col s6">
					</div>
					<div class="col s6">
						<button class="btn waves-effect waves-light" type="submit">
							<i class="material-icons right">send</i> 정보수정하기
						</button>
						<br> <br>
					</div>
					<br> <br>
				</div>
			</form>
		</div>
		<!-- 여기까지 -->
	</div>
</div>

</div>
</c:forEach>
</div>
</div>

<!--  form  -->

<!-- Modal Structure -->
<div id="modal1" class="modal">
	<div class="modal-content">
		<div class="row" id="sec_postcode" style="margin-bottom: 0px;">
			<div class="col s12">
				<div id="wrap"
					style="display: none; height: 300px; position: relative">
					<img src="http://t1.daumcdn.net/postcode/resource/images/close.png"
						id="btnFoldWrap"
						style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
						onclick="foldDaumPostcode()" alt="접기 버튼">
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="/include/footer.jsp"%>
</body>

</html>