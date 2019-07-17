<!-- 
신청한 서비스를 보여주는 페이지
매칭이 완료 되지 않은 서비스 리스트를 보여준다.
신청 서비스 상태는 진행중, 기한만료, 중지 3가지이다. 
 -->
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
	.pagination li.active {
    background-color: #26a69a;
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=de8fe287458eb09dec8e2437a48ab863&libraries=services"></script>
<script type="text/javascript" src="/js/sugg/suggestion-list.js"></script>
<!-- <div class="section" style="background-color: white;">
	<h5 style="padding-left: 40px;">
		제안 리스트
		<small id="sub_title"> 기본정보 입력</small>
	</h5>
	<div class="divider"></div>
</div> -->
<div class="container" style="margin-top:0;margin-bottom: 30px" >
	<div class="row">
		<div class="col m12" style="background-color: white;">
			<div class="row">
				<div class="col m12" style="border: 1px solid #eeeeee">
					<h5 style="margin-bottom: 30px">신청 리스트</h5>
					<div class="nav-content center" style="background-color: #eeeeee;margin-bottom: 20px;">
				      <ul class="tabs tabs-transparent">
				        <li class="tab"><a href="/service/cus-app-list.do" class="active">신청한 서비스</a></li>
				        <li class="tab"><a href="/service/cus-pay-list.do">결제 현황</a></li>
				        <li class="tab"><a href="/service/cus-deli-list.do">배송 현황</a></li>
				      </ul>
		    		</div>
		    		<c:forEach items="${suggList }" var="sugg">
		    			
			    		<div class="col m6" style="border: 1px solid #eeeeee; margin-bottom: 20px;">
							<ul class="collection with-header">
								<li class="collection-header">
									<h5 class="task-card-title mb-3" style="text-align: right;">
										<c:if test="${empty sugg.CHOOSE_YN}">
											<i class="material-icons left" style="color: green">check_circle</i>
										</c:if>
										<c:if test="${ sugg.CHOOSE_YN eq 'N' }">
											<i class="material-icons left" style="color: red">check_circle</i>
										</c:if>
										${sugg.NAME } 님께한 제안
									</h5>
									<p class="task-card-date" style="text-align: right;">${sugg.SUGG_DATE }</p>
								</li>
								<li class="collection-item dismissable">
									<span class="width-100" style="font-size: 14px">상태</span>
									<c:if test="${empty sugg.CHOOSE_YN}">
										<span class="secondary-content"><span > 진행중 </span></span>
									</c:if>
									<c:if test="${ sugg.CHOOSE_YN eq 'N' }">
										<span class="secondary-content"><span class="red-text text-lighten-1"> 불채택 </span></span>
									</c:if>
								</li>
								<li class="collection-item dismissable">
									<span class="width-100" style="font-size: 14px">제안번호</span>
									<span  class="secondary-content"><span class="">${sugg.SUGG_ID }</span></span>
								</li>
								<li class="collection-item dismissable">
									<span class="width-100" style="font-size: 14px">1인당 제안 금액</span>
									<span  class="secondary-content"><span class="">${sugg.PER_BUD } 원</span></span>
								</li>
								<li class="collection-item dismissable">
									<span class="width-100" style="font-size: 14px">서비스 제공일</span>
									<span class="secondary-content"><span class="task-card-date"> ${sugg.SERV_DATE } </span></span>
								</li>
								<li class="collection-item dismissable center">
									<a class="waves-effect waves-light btn-small" style="border-radius: 25px;" onclick="showDetail('${sugg.SUGG_ID}')">상세보기</a>
								</li>
							</ul>
						</div>
					</c:forEach>
				</div>
				<div class="col m12 center">
					<%-- <ui:pagination paginationInfo = "${paging }" jsFunction="movePage"/> --%>
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
				<span class="width-100" style="font-size: 14px">상태</span>
				<span class="secondary-content"><span class="" id="choose_yn"></span></span>
			</li>
		</ul>
		<ul class="collection with-header">
			<li class="collection-header" style="background-color: #eee">
				<h6 class="task-card-title mb-3" style="text-align: center;">
					제안 내용
				</h6>
			</li>
			<li class="collection-item dismissable">
				<span class="width-100" style="font-size: 14px">1인당 제안 금액</span>
				<span  class="secondary-content"><span id="per_bud"></span></span>
			</li>
			<li class="collection-item dismissable" id="li_menu" style="display: none">
				<span class="width-100" style="font-size: 14px">제안 메뉴</span>
				<br>
				<p class="secondary-content">
					<table class="highlight centered">
						<thead>
						<tr>
							<th>메뉴명</th>
							<th>1 인분당 중량(g)</th>
							<th>메뉴 사진</th>
						</tr>
						</thead>
						<tbody id="menu_info">
						</tbody>
					</table>
				</p>
			</li>
		</ul>
		<ul class="collection with-header" id="ul_app">
			
		</ul>
	</div>
	<div class="modal-footer">
		<a href="#!" class="modal-close waves-effect waves-green btn-flat">닫기</a>
	</div>
</div>
<form name="dForm">
<input type="hidden" name ="pageNo"value="${pageNo}">
</form>
<%@include file="/include/footer.jsp" %>
</body>
</html>