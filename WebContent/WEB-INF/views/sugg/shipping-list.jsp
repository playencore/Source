<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>
<%@ taglib prefix="ui" uri="http://charida.com/paging/ui" %>
<style>
	.modal.modal-fixed-footer {
	    padding: 0;
	    height: 80%;
	}
	.modal {
	    display: none;
	    position: fixed;
	    left: 0;
	    right: 0;
	    background-color: #fafafa;
	    padding: 0;
	    max-height: 80%;
	    width: 55%;
	    margin: auto;
	    overflow-y: auto;
	    border-radius: 2px;
	    will-change: top, opacity;
	}
	.modal2 {
	    display: none;
	    position: fixed;
	    left: 0;
	    right: 0;
	    background-color: #fafafa;
	    padding: 0;
	    max-height: 25%;
	    width: 20%;
	    margin: auto;
	    overflow-y: auto;
	    border-radius: 2px;
	    will-change: top, opacity;
	}
	.z-depth-5, .modal2 {
	   -webkit-box-shadow: 0 24px 38px 3px rgba(0, 0, 0, 0.14), 0 9px 46px 8px rgba(0, 0, 0, 0.12), 0 11px 15px -7px rgba(0, 0, 0, 0.2);
	   box-shadow: 0 24px 38px 3px rgba(0, 0, 0, 0.14), 0 9px 46px 8px rgba(0, 0, 0, 0.12), 0 11px 15px -7px rgba(0, 0, 0, 0.2);
	}
	.modal2.modal-fixed-footer {
	    padding: 0;
	    height: 25%;
	}
	.modal2.modal-fixed-footer .modal-content {
	    position: absolute;
	    height: calc(100% - 56px);
	    max-height: 100%;
	    width: 100%;
	    overflow-y: auto;
	}
	.modal2 .modal-content {
	    padding: 24px;
	}
	.modal2.modal-fixed-footer .modal-footer {
	    border-top: 1px solid rgba(0, 0, 0, 0.1);
	    position: absolute;
	    bottom: 0;
	}
	.modal2 .modal-footer {
	    border-radius: 0 0 2px 2px;
	    background-color: #fafafa;
	    padding: 4px 6px;
	    height: 56px;
	    width: 100%;
	    text-align: right;
	}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=de8fe287458eb09dec8e2437a48ab863&libraries=services"></script>
<script type="text/javascript" src="/js/sugg/shipping-list.js"></script>
<c:if test="${not empty msg }">
	<script type="text/javascript">
	//<!--
		alert('${msg}');	
	//-->
	</script>
</c:if>
<div class="container" style="margin-top:0;margin-bottom: 30px" >
	<div class="row">
		<div class="col m12" style="background-color: white;">
			<div class="row">
				<div class="col m12" style="border: 1px solid #eeeeee">
					<h5 style="margin-bottom: 30px">제안 리스트</h5>
					<%@include file="/include/sugg/sub-menu.jsp" %>
		    		<c:forEach items="${shippingList }" var="item">
		    			
			    		<div class="col m6" style="border: 1px solid #eeeeee; margin-bottom: 20px;">
							<ul class="collection with-header">
								<li class="collection-header">
									<h5 class="task-card-title mb-3" style="text-align: right;">
										${item.NAME } 님께한 제안
									</h5>
									<p class="task-card-date" style="text-align: right;">${item.SUGG_DATE }</p>
								</li>
								<li class="collection-item dismissable">
									<span class="width-100" style="font-size: 14px">상태</span>
									<span class="secondary-content"><span > ${item.PROGRESS_CODE eq "STU0050001"?"배송중":"배송완료" } </span></span>
								</li>
								<li class="collection-item dismissable">
									<span class="width-100" style="font-size: 14px">제안번호</span>
									<span  class="secondary-content"><span class="">${item.SUGG_ID }</span></span>
								</li>
								<li class="collection-item dismissable">
									<span class="width-100" style="font-size: 14px">서비스 제공일시</span>
									<span class="secondary-content"><span class="task-card-date"> ${item.SERV_DATE } </span></span>
								</li>
								<li class="collection-item dismissable">
									<span class="width-100" style="font-size: 14px">배송 시작일시</span>
									<span  class="secondary-content"><span class="">${item.START_DATE}</span></span>
								</li>
								<li class="collection-item dismissable">
									<span class="width-100" style="font-size: 14px">서비스 제공장소</span>
									<span  class="secondary-content"><span class="">${item.ADDR}</span></span>
								</li>
								
								<li class="collection-item dismissable center">
									<a class="waves-effect waves-light btn-small" style="border-radius: 25px;" onclick="showDetail('${item.SUGG_ID}')">상세보기</a>
								</li>
							</ul>
						</div>
					</c:forEach>
					<c:if test="${empty shippingList}">
						<div class="col m12" style="border: 1px solid #eeeeee; margin-bottom: 20px;">
							<ul class="collection with-header">
								<li class="collection-header">
									<h5 class="task-card-title mb-3" style="text-align: center;">
										조회된 내용이 없습니다.
									</h5>
								</li>
							</ul>
						</div>
					</c:if>
				</div>
				<div class="col m12 center">
					<ui:pagination paginationInfo = "${paging }" jsFunction="movePage"/>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="modal1" class="modal modal-fixed-footer">
	<div class="modal-content">
		<ul class="collection with-header">
			<li class="collection-header">
				<h5 class="task-card-title mb-3" style="text-align: right;" id="sugg_title">
				</h5>
				<p class="task-card-date" style="text-align: right;" id="sugg_date"></p>
			</li>
			<li class="collection-item dismissable">
				<span class="width-100" style="font-size: 14px">신청자 이름</span>
				<span class="secondary-content"><span id="sup_name"></span></span>
			</li>
			<li class="collection-item dismissable">
				<span class="width-100" style="font-size: 14px">전화번호</span>
				<span class="secondary-content"><span id="sup_tel"></span></span>
			</li>
			<li class="collection-item dismissable">
				<span class="width-100" style="font-size: 14px">상태</span>
				<span class="secondary-content"><span class="" id="choose_yn"></span></span>
			</li>
		</ul>
		<ul class="collection with-header" id ="ul_serv">
			
		</ul>
		<ul class="collection with-header" id ="ul_supp">
			
		</ul>
		<ul class="collection with-header" id="ul_app">
			
		</ul>
		<ul class="collection with-header" id="ul_pay">
			
		</ul>
		
		
	</div>
	<div class="modal-footer">
		<a href="#modal2" class="waves-effect waves-green btn-flat modal-trigger" 
			style="background-color: #2bbbad;" id ="ship">배송 완료</a>
		<a href="#!" class="modal-close waves-effect waves-green btn-flat">닫기</a>
	</div>
</div>
<div id="modal2" class="modal2 modal-fixed-footer">
	<div class="modal-content">
		<p class="center">배송 완료하시겠습니까?</p>
	</div>
	<div class="modal-footer">
		<a href="#!" class="waves-effect waves-green btn-flat" onclick="dataSubmit()">확인</a>
		<a href="#!" class="modal-close waves-effect waves-green btn-flat">취소</a>
	</div>
</div>
<form name="dForm" method="post">
	<input type="hidden" name ="servId">
	<input type="hidden" name ="pageNo"value="${pageNo}">
</form>
<%@include file="/include/footer.jsp" %>
</body>
</html>