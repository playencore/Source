<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>
<script type="text/javascript">
//<!--
	
	$(function(){
		activeItem('마이 페이지');
		showExtendedMenu('#nav_mypage');
		activeSubItem('제안 리스트');
		$('.modal').modal();
	});
	function showDetail(num){
		$('.modal').modal('open');
	}
//-->
</script>
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
					<h5 style="margin-bottom: 30px">진행중인 리스트</h5>
					<div class="nav-content center" style="background-color: #eeeeee;margin-bottom: 20px;">
				      <ul class="tabs tabs-transparent">
				        <li class="tab"><a href="#test1" class="active">제안 리스트</a></li>
				        <li class="tab"><a href="#test2">결제 대기</a></li>
				        <li class="tab"><a href="#test3">서비스 준비</a></li>
				        <li class="tab"><a href="#test4">서비스 배송</a></li>
				      </ul>
		    		</div>
		    		<c:forEach items="${suggList }" var="sugg">
		    			
			    		<div class="col m6" style="border: 1px solid #eeeeee; margin-bottom: 20px;">
							<ul id="task-card" class="collection with-header">
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
										<a href="#" class="secondary-content"><span > 진행중 </span></a>
									</c:if>
									<c:if test="${ sugg.CHOOSE_YN eq 'N' }">
										<a href="#" class="secondary-content"><span class="red-text text-lighten-1"> 불채택 </span></a>
									</c:if>
								</li>
								<li class="collection-item dismissable">
									<span class="width-100" style="font-size: 14px">1인당 제안 금액</span>
									<a href="#" class="secondary-content"><span class="">${sugg.PER_BUD } 원</span></a>
								</li>
								<li class="collection-item dismissable">
									<span class="width-100" style="font-size: 14px">서비스 제공일</span>
									<a href="#" class="secondary-content"><span class="task-card-date"> ${sugg.SERV_DATE } </span></a>
								</li>
								<li class="collection-item dismissable center">
									<a class="waves-effect waves-light btn-small" style="border-radius: 25px;" onclick="showDetail('${sugg.SUGG_ID}')">상세보기</a>
								</li>
							</ul>
						</div>
					</c:forEach>
					<div class="col m6" style="border: 1px solid #eeeeee; margin-bottom: 20px;">
						<ul id="task-card" class="collection with-header">
							<li class="collection-header">
								<h5 class="task-card-title mb-3" style="text-align: right;"><i class="material-icons left" style="color: red">check_circle</i>가나다 님께한 제안</h5>
								<p class="task-card-date" style="text-align: right;">제안일</p>
							</li>
							<li class="collection-item dismissable">
								<span class="width-100" style="font-size: 14px">상태</span>
								<a href="#" class="secondary-content"><span class="red-text text-lighten-1"> 불채택 </span></a>
							</li>
							<li class="collection-item dismissable">
								<span class="width-100" style="font-size: 14px">1인당 제안 금액</span>
								<a href="#" class="secondary-content"><span class=""> 50,000 원</span></a>
							</li>
							<li class="collection-item dismissable">
								<span class="width-100" style="font-size: 14px">서비스 제공일</span>
								<a href="#" class="secondary-content"><span class="task-card-date"> 2019-09-12 오후 6:00 </span></a>
							</li>
							<li class="collection-item dismissable center">
								<a class="waves-effect waves-light btn-small" style="border-radius: 25px;">상세보기</a>
							</li>
						</ul>
					</div>
					<div class="col m6" style="border: 1px solid #eeeeee; margin-bottom: 20px;">
						<ul id="task-card" class="collection with-header">
							<li class="collection-header">
								<h5 class="task-card-title mb-3">서비스 요청자 이름 님께한 제안</h5>
								<p class="task-card-date">제안일</p>
							</li>
							<li class="collection-item dismissable">
								<span class="width-100" style="font-size: 14px">채택 여부</span>
								<a href="#" class="secondary-content"><span class=""> 불채택 </span></a>
							</li>
							<li class="collection-item dismissable">
								<span class="width-100" style="font-size: 14px">1인당 제안 금액</span>
								<a href="#" class="secondary-content"><span class=""> 50,000 원</span></a>
							</li>
							<li class="collection-item dismissable">
								<span class="width-100" style="font-size: 14px">서비스 제공일</span>
								<a href="#" class="secondary-content"><span class="task-card-date"> 2019-09-12 오후 6:00 </span></a>
							</li>
							<li class="collection-item dismissable center">
								<a class="waves-effect waves-light btn-small" style="border-radius: 25px;">상세보기</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="modal1" class="modal modal-fixed-footer">
  <div class="modal-content">
    <h4>Modal Header</h4>
    <p>A bunch of text</p>
  </div>
  <div class="modal-footer">
    <a href="#!" class="modal-close waves-effect waves-green btn-flat">Agree</a>
  </div>
</div>
<%@include file="/include/footer.jsp" %>
</body>
</html>