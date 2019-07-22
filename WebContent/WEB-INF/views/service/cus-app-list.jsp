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
<script type="text/javascript" src="/js/appli/application-list.js"></script>
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
		    		<c:forEach items="${appliList }" var="appli">
		    			
			    		<div class="col m6" style="border: 1px solid #eeeeee; margin-bottom: 20px;">
							<ul class="collection with-header">
								<li class="collection-header">
									<h6 class="task-card-title mb-3" style="text-align: right;">
										<%-- 현재 제안  : ${appli.SUGG_CNT} 건 --%>   <br>신청장소  : ${appli.ADDRESS}
									</h6>
									<p class="task-card-date" style="text-align: right;">${appli.APP_DATE }</p>
								</li>
								<li class="collection-item dismissable">
									<span class="width-100" style="font-size: 14px">상태</span>
									<c:if test="${appli.SUGG_CNT gt 0}">
										<span class="secondary-content"><span > ${appli.SUGG_CNT} 건 </span></span>
									</c:if>
									<c:if test="${appli.SUGG_CNT eq 0}">
										<span class="secondary-content"><span class="red-text text-lighten-1"> 제안없음 </span></span>
									</c:if>
								</li>
								<li class="collection-item dismissable">
									<span class="width-100" style="font-size: 14px">신청번호</span>
									<span  class="secondary-content"><span class="">${appli.SERV_ID }</span></span>
								</li>
								<li class="collection-item dismissable">
									<span class="width-100" style="font-size: 14px">1인당 제안 금액</span>
									<span  class="secondary-content"><span class="">${appli.PER_BUD } 원</span></span>
								</li>
								<li class="collection-item dismissable">
									<span class="width-100" style="font-size: 14px">서비스 제공일</span>
									<span class="secondary-content"><span class="task-card-date"> ${appli.SERV_DATE} </span></span>
								</li>
								<li class="collection-item dismissable center">
									<a class="waves-effect waves-light btn-small" style="border-radius: 25px;" onclick="showDetail('${appli.SERV_ID}')">상세보기</a>
								</li>
							</ul>
						</div>
					</c:forEach>
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
				<!-- 신청번호 -->
				<h5 class="task-card-title mb-3" style="text-align: right;" id="app_title">
				</h5>
				<!-- 작성일 -->
				<p class="task-card-date" style="text-align: right;" id="app_date"></p>
			</li>
			<li class="collection-item dismissable">
				<!-- 신청자 -->
				<span class="width-100" style="font-size: 14px">신청자 이름</span>
				<span class="secondary-content"><span id="app_name"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 최종수정일 -->
				<span class="width-100" style="font-size: 14px">최종 수정일</span>
				<span class="secondary-content"><span id="modified_date"></span></span>
			</li>
		</ul>
		
		<!-- 업체선정 -->
		<ul class="collection with-header">
			<li class="collection-header" style="background-color: #eee">
				<h6 class="task-card-title mb-3" style="text-align: center;">
					업체 선정
				</h6>
			</li>
			
		</ul>
		
		<!-- 일정정보 -->
		<ul class="collection with-header">
			<li class="collection-header" style="background-color: #eee">
				<h6 class="task-card-title mb-3" style="text-align: center;">
					일정 정보
				</h6>
			</li>
			<li class="collection-item dismissable">
				<!-- 서비스 제공일 -->
				<span class="width-100" style="font-size: 14px">서비스 제공일</span>
				<span class="secondary-content"><span id="serv_date"></span></span>
			</li>
		</ul>
		<!-- 현장정보 -->
		<ul class="collection with-header">
			<li class="collection-header" style="background-color: #eee">
				<h6 class="task-card-title mb-3" style="text-align: center;">
					현장 정보
				</h6>
			</li>
			<li class="collection-item dismissable">
				<!-- 1주소 : 서울 도봉구 xx동 산23-2 -->
				<span class="width-100" style="font-size: 14px">주소</span>
				<span class="secondary-content"><span id="address"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 1상세주소 : oo빌라 3층  -->
				<span class="width-100" style="font-size: 14px">상세주소</span>
				<span class="secondary-content"><span id="address_detail"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 2공간 : 실내/실외  -->
				<span class="width-100" style="font-size: 14px">공간</span>
				<span class="secondary-content"><span id="interior_yn"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 2주차장 : 유/무  -->
				<span class="width-100" style="font-size: 14px">주차장 유무</span>
				<span class="secondary-content"><span id="parking_yn"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 2엘리베이터 : 유/무 -->
				<span class="width-100" style="font-size: 14px">엘리베이터 유무</span>
				<span class="secondary-content"><span id="elevator_yn"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 2쓰레기배출 : 가능/불가능 -->
				<span class="width-100" style="font-size: 14px">쓰레기배출 여부</span>
				<span class="secondary-content"><span id="discharge_yn"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 2취사 : 가능/불가능 -->
				<span class="width-100" style="font-size: 14px">취사 여부</span>
				<span class="secondary-content"><span id="cooking_yn"></span></span>
			</li>
			
		</ul>
		<!-- 참석자정보 -->
		<ul class="collection with-header">
			<li class="collection-header" style="background-color: #eee">
				<h6 class="task-card-title mb-3" style="text-align: center;">
					참석자 정보
				</h6>
			</li>
			<li class="collection-item dismissable">
				<!-- 1인원 : 100명 -->
				<span class="width-100" style="font-size: 14px">인원</span>
				<span class="secondary-content"><span id="participant"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 2 1인당 20,000원 -->
				<span class="width-100" style="font-size: 14px">1인당</span>
				<span class="secondary-content"><span id="per_bud"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 2총 2,000,000원 -->
				<span class="width-100" style="font-size: 14px">총 금액</span>
				<span class="secondary-content"><span id="per_totalbud"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 1연령 : 30대~40대 -->
				<span class="width-100" style="font-size: 14px">연령대</span>
				<span class="secondary-content"><span id="age_minmax"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 1성비 : 남 100% / 여 0% -->
				<span class="width-100" style="font-size: 14px">성비 : 남</span>
				<span class="secondary-content"><span id="per_men"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 2성비 : 남 100% / 여 0% -->
				<span class="width-100" style="font-size: 14px">성비 : 여</span>
				<span class="secondary-content"><span id="per_women"></span></span>
			</li>
		</ul>
		<!-- 행사정보 -->
		<ul class="collection with-header">
			<li class="collection-header" style="background-color: #eee">
				<h6 class="task-card-title mb-3" style="text-align: center;">
					행사 정보
				</h6>
			</li>
			<li class="collection-item dismissable">
				<!-- 1서비스 형식(진행형식) 택1:뷔페, 코스, 드랍오프, 도시락 -->
				<span class="width-100" style="font-size: 14px">서비스형식</span>
				<span class="secondary-content"><span id="serv_type_code"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 1행사 형식 택1 : 개인/사교/리셉션/기업/학교/기타 -->
				<span class="width-100" style="font-size: 14px">행사형식</span>
				<span class="secondary-content"><span id="event_type_code"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 2코디네이터 신청 : 유/무 -->
				<span class="width-100" style="font-size: 14px">코디네이터 신청유무</span>
				<span class="secondary-content"><span id="coordinator_yn"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 2추가식기 신청 : 0~ -->
				<span class="width-100" style="font-size: 14px">추가식기 신청</span>
				<span class="secondary-content"><span id="tableware_yn"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 2후식선택 : 0~ -->
				<span class="width-100" style="font-size: 14px">후식 신청</span>
				<span class="secondary-content"><span id="dessert_yn"></span></span>
			</li>
		</ul>
		<!-- 요청사항 -->
		<ul class="collection with-header">
			<li class="collection-header" style="background-color: #eee">
				<h6 class="task-card-title mb-3" style="text-align: center;">
					요청사항
				</h6>
			</li>
			
			<!-- 1내용 -->
			
			<li class="collection-item dismissable">
				<span class="width-100" style="font-size: 14px">추가요청사항</span>
				<span class="secondary-content"><span id="requested_team"></span></span>
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
		<!-- 닫기버튼 -->
		<a href="#!" class="modal-close waves-effect waves-green btn-flat">닫기</a>
	</div>
</div>
<form name="dForm">
<input type="hidden" name ="pageNo"value="${pageNo}">
</form>
<%@include file="/include/footer.jsp" %>
</body>
</html>