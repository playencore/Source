<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>
<script type="text/javascript">
//<!--
  $(document).ready(function(){
    for( var i = 0 ; i < ${listsize} ; i++){
    	$('#infomodal'+i).modal();
    	$('#permissionmodal'+i).modal() ;
    }
  });

//-->
</script>
	<br><br>
	<div class = "row  card" >
		<div class = "col s12 " style="margin:1%">
			<div class = "col s1"></div>
			<div class = "col s2">
				<h5>
					판매자 승인/반려
				</h5>
			</div>
		</div>
	</div>
	<br>
	<div class = "row" >
		<div class = "col s12" >
			<div class = "col s2"></div>
			
			<div class = "col s8 " id = "permissionlist" >
			
				<div class = "row grey lighten-2" >
					<c:set var = "count" value = "${0}" />
					<c:forEach var="notPermissionSupplier" items="${notPermissionSuppliers}" >
					<div class = "col s6">
						<div class="card  ">
							<div class="card-content black-text ">
								<span class="card-title">${notPermissionSupplier.COMPANYNAME}  </span>
								<p>
									판매자 이름 : ${notPermissionSupplier.NAME} <br>
									판매자 아이디 : ${notPermissionSupplier.MEM_ID} <br>
									판매자 사업자 등록번호 : ${notPermissionSupplier.REGIST_NUM} <br>
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
							<ul class = "collection with-header">
								<li class="collection-header" style="background-color: #eee">
									<h6 class="task-card-title mb-3" style="text-align: center;">
											-업체 상세보기-
									</h6>
								</li>
								<li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	판매자 이름
									 </span>
									 <span class="secondary-content">
										${notPermissionSupplier.NAME}
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	판매자 아이디
									 </span>
									 <span class="secondary-content">
										${notPermissionSupplier.MEM_ID}
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	판매자 전화번호
									 </span>
									 <span class="secondary-content">
										${notPermissionSupplier.MEM_ID}
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	판매자 이메일
									 </span>
									 <span class="secondary-content">
										${notPermissionSupplier.EMAIL }
									 </span>
								 </li>
								  <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	판매자 사업자 등록번호
									 </span>
									 <span class="secondary-content">
										${notPermissionSupplier.REGIST_NUM}
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	가입 신청일 
									 </span>
									 <span class="secondary-content">
										${notPermissionSupplier.JOIN_DATE }
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	최소 수용인원
									 </span>
									 <span class="secondary-content">
										${notPermissionSupplier.MINIMUM_SEATING }
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	최대 수용인원
									 </span>
									 <span class="secondary-content">
										${notPermissionSupplier.MAXIMUM_SEATING}
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	텔레그램 아이디
									 </span>
									 <span class="secondary-content">
										${notPermissionSupplier.TELEGRAM_ID }
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	승인 상태
									 </span>
									 <span class="secondary-content">
										N
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	판매자 소개
									 </span>
									 <span class="secondary-content">
										${notPermissionSupplier.EXPLANATION}
									 </span>
								 </li>
							</ul>
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
								<ul class="collection with-header">
									<li class="collection-header">
										<h5 class="task-card-title mb-3" style="text-align: right;">
											${shiplist.SERV_ID}의 배송상태
										</h5>
										<h6 class="task-card-title mb-3" style="text-align: right;">
										 	${shiplist.COMPANY_NAME}의 제안
										</h6>
										<p class="task-card-date" style="text-align: right;">${shiplist.SERV_DATE }</p>
									</li>
									<li class="collection-item dismissable">
										<span class="width-100" style="font-size: 14px">
											행사장소
										</span>
										<span  class="secondary-content">
											<span class="">
												${shiplist.ADDRESS }
											</span>
										</span>
									</li>
								</ul>
								<h4>승인 상태 변경하기</h4>
								<br><br>
								<p>
									판매자 이름 : ${notPermissionSupplier.NAME} <br>
									업체이름 : ${notPermissionSupplier.COMPANYNAME} <br>
									판매자 사업자 등록번호 : ${notPermissionSupplier.REGIST_NUM} <br>
									<c:if test="${notPermissionSupplier.PERMISSION_SEQ>0}">
									기존 반려 사유 : ${notPermissionSupplier.DISALLOWANCE_REASON} <br>
									마지막 반려 일자 : ${notPermissionSupplier.MODIFICATION_DATE} <br>
									</c:if>
								</p>
								<br><br>
								허가여부 / 반려사유
								<div class="row">
									<form  name  = "permissionupdateform"  method = "post" action = "/admin/updatepermissionSupplier.do"  class="col s12">
										<input type = "hidden" name = "mem_id" value = "${notPermissionSupplier.MEM_ID}">
										<input type = "hidden" name = "permission_seq" value = "${notPermissionSupplier.PERMISSION_SEQ+1}">
										<div class = "row">
											<div class = "col s2">
												<p>
													<label>
														<input class="with-gap" name="permission_yn" type="radio" value = "0" checked />
														<span>반려</span>
													</label>
												</p>
												<p>
													<label>
														<input class="with-gap" name="permission_yn" type="radio" value ="1" />
														<span>승인</span>
													</label>
												</p>
											</div>
										</div>
										<div class="row">
											<div class="input-field col s12">
												<textarea name = "disallowance_reason" id="textarea" class="materialize-textarea"></textarea>
												<label for="textarea1">허가/반려사유</label>
											</div>
										</div>
										<button class="btn waves-effect waves-light" type="submit"  >
    										<i class="material-icons left">send</i>
    											판매자 승인/반려 반영
  										</button>
									</form>
								</div>
							</div>
							<div class="modal-footer">
								<a href="#!" class="modal-close waves-effect waves-green btn-flat">창닫기</a>
							</div>
						</div>
					</div>
					<c:set var = "count" value = "${count=count+1}" />
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
<br><br><br><br><br><br><br><br><br><br>	
<%@include file="/include/footer.jsp" %>
</body>
</html>
