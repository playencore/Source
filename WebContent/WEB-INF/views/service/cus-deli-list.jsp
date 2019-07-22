<!-- 
배송현황을 보여주는 페이지
배송상태는 배송대기중, 배송완료 2가지 이다.
결제가 완료된 서비스아이디만 페이지에 목록으로 보여준다.
상세페이지는 모달로 보여준다
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

<script type= "text/javascript">
	//<!--
	$(function(){
	activeItem('마이 페이지');
	showExtendedMenu('#nav_mypage');
	activeSubItem('제안 리스트',0);
	activeSubItem('결제 대기',1);
	$('.modal').modal();
});

function shipcomplete(num){
	$.ajax({
	    type : "post",
	    url : "/shipstatus/complete.do",
	    data:{
	    	suggId:num
	    },
	    dataType : "json",
	    error : function(result){
	        alert('배송완료가 취소되었습니다. 다시 시도해주세요') ;
	    },
	    success : function(result){
	    	if(result == '0'){
	    		alert('배송완료가 취소되었습니다. 다시 시도해주세요') ;
	    	}else{
	    		alert('최종 승인 되었습니다.') ;
	    		location.reload()
	    	}
	    }     
	});
}	
	
function showDetail(num,shipstatus){
	$.ajax({
	    type : "post",
	    url : "/sugg/getWaitInfo.do",
	    data:{
	    	suggId:num
	    },
	    dataType : "json",
	    error : function(data){
	        alert('상세정보 조회를 실패하셨습니다.')
	    },
	    success : function(data){
	    	updateUi(data,num,shipstatus);
	    	viewMap(data.ADDRESS);
	    	$('.modal').modal('open');
	    }     
	});
	
}

function updateUi(data,suggId,shipstatus){
	
	$('#sugg_title').text(suggId + "상세 내역");
	$('#sugg_date').text(data.SUGG_DATE);
	$('#sup_name').text(data.NAME);
	var shipst = "" ;
	if(shipstatus == 'STU0040001'){
		shipst = "준비중(결제완료)" ;
	}else if(shipstatus == 'STU0050001'){
		shipst = "배송중(준비완료)" ;
	}else if(shipstatus == 'STU0050002'){
		shipst = "배송완료" ;
	}
	$('#choose_yn').text(shipst);
	
	var li_pay ="";
	//var ratio =(data.payInfos.AMOUNT/100) * data.payInfos.RATIO;
	//var vat = (data.payInfos.AMOUNT/100) * 10;
	li_pay += createHeader('금액');
	//결제마감일
	//li_pay += createBody('결제 총액 ',numbeComma(data.payInfos.AMOUNT)+" 원");
	//li_pay += createBody('수수료액( '+data.payInfos.RATIO+'% )',numbeComma(ratio) + " 원");
	//li_pay += createBody('VAT ',numbeComma(vat) + " 원");
	//li_pay += createBody('예상 매출액 ',numbeComma(data.payInfos.AMOUNT -ratio -vat)+ " 원");
	
	$('#ul_pay').html(li_pay);
	
	$('#per_bud').text(data.PER_BUD+" 원");
	var menuBody = "";
	if(data.menuInfo != null){
		$('#li_menu').css('display','block');
		data.menuInfo.forEach((function(e,i){
			menuBody += "<tr>";
			menuBody += "<td>" +e.NAME+ "</td>";
			menuBody += "<td>" +numbeComma(e.WEIGHT)+ "</td>";
			menuBody += "<td>" 
				+ "<img alt='' src='/file/file-down/" 
				+ e.FILE_ID
				+ "' width='75px' height='75px'>"
				+ "</td>";
			
			
			menuBody += "</tr>";
		}));
		$('#menu_info').html(menuBody);
	}else{
		$('#li_menu').css('display','none');
	}
	
	var li ="";
	li += createHeader('신청 내용');
	li += createBody('행사형식',data.SERV_TYPE_NAME);
	li += createBody('진행형식',data.EVENT_TYPE_NAME);
	li += createBody('서비스 제공일',data.SERV_DATE);
	li += createBody('참가자 수',numbeComma(data.PARTICIPANT) + " 명");
	li += createBody('참여 연령(남녀 비율)',data.AGE_MIN +" ~ " +data.AGE_MAX 
			+"( " +data.PER_MEN + " : " +(10-data.PER_MEN) + " )");
	
	
	li += createBody('선호 메뉴',data.prefList.toString());
	
	if(data.DESSERT_YN == 'Y'){
		var title;
		var content ="";
		
		data.drtList.forEach(function(e,i){
			if(i==0){
				title = e;
			}else{
				content += e + ",";
			}
		});
		content = content.substring(0,content.lastIndexOf(','));
		li +=createBody(title,content);
	}
	
	if(data.TABLEWARE_YN == 'Y'){
		var title;
		var content ="";
		
		data.tbwList.forEach(function(e,i){
			if(i==0){
				title = e;
			}else{
				content += e+ ",";
			}
		});
		content = content.substring(0,content.lastIndexOf(','));
		li +=createBody(title,content);
	}
	
	if(data.OTHER_ORDER_YN == 'Y'){
		var title;
		var content ="";
		
		data.rtlList.forEach(function(e,i){
			if(i==0){
				title = e;
			}else{
				content += e+ ",";
			}
		});
		content = content.substring(0,content.lastIndexOf(','));
		li +=createBody(title,content);
	}
	li += createBody('코디네이터 신청여부',data.COORDINATOR_YN);
	li += createBody('실내여부',data.INTERIOR_YN);
	li += createBody('취사여부',data.COOKING_YN);
	li += createBody('쓰레기 배출여부',data.DISCHARGE_YN);
	li += createBody('주차가능여부',data.PARKING_YN);
	li += createBody('엘레베이터 유무',data.ELEVATOR_YN);
	li += createBody('요청사항',data.REQUESTED_TERM);
	li += createMap(data.ADDRESS,data.ADDRESS_DETAIL,data.ZIPCODE);
	$('#ul_app').html(li);
}
function createMap(adr1,adr2,zipcode){
	var ui ='<li class="collection-item dismissable">'
		+'<span class="width-100" style="font-size: 14px">서비스 제공위치</span>'
		+'<p class="secondary-content">'
		+'<table class="highlight centered">'
		+'<thead>'
		+'<tr>'
		+'<th>주소</th>'
		+'<th>상세주소</th>'
		+'<th>우편번호</th>'
		+'</tr>'
		+'</thead>'
		+'<tbody>'
		+'<tr>'
		+'<td>'+adr1+'</td>'
		+'<td>'+adr2+'</td>'
		+'<td>'+zipcode+'</td>'
		+'</tr>'
		+'</tbody>'
		+'</table>'
		+'<br>'
		+'<div id="map" style="height:200px;"></div>'
		+'</p>'
		+'</li>';
	
	return ui;
}
function createHeader(data){
	return '<li class="collection-header" style="background-color: #eee">'
		 + '<h6 class="task-card-title mb-3" style="text-align: center;">'
		 + data
		 +'</h6>'
		 +'</li>';
}

function createBody(title,content){
	return '<li class="collection-item dismissable">'
		 + '<span class="width-100" style="font-size: 14px">'
		 + title
		 +'</span>'
		 + '<span class="secondary-content">'
		 + content
		 +'</span>'
		 + '</li>';
}


function viewMap(addr){
	$('#map').html('<div id="mapInstance" style="width:100%;height:100%;"></div>');
	var container = document.getElementById('mapInstance'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(33.450701, 126.570667),
        map: map
    });
    
    geocoder.addressSearch(addr, function(results, status) {
        // 정상적으로 검색이 완료됐으면
        if (status === daum.maps.services.Status.OK) {

            var result = results[0]; //첫번째 결과의 값을 활용

            // 해당 주소에 대한 좌표를 받아서
            var coords = new daum.maps.LatLng(result.y, result.x);
            // 지도를 보여준다.
            container.style.display = "block";
            map.relayout();
            // 지도 중심을 변경한다.
            map.setCenter(coords);
            // 마커를 결과값으로 받은 위치로 옮긴다.
            marker.setPosition(coords)
        }
    });
}

function numbeComma(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function movePage(pageNo){
	document.dForm.pageNo.value = pageNo;
	document.dForm.submit();
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
					<h5 style="margin-bottom: 30px">신청 리스트</h5>
					<div class="nav-content center" style="background-color: #eeeeee;margin-bottom: 20px;">
				      <ul class="tabs tabs-transparent">
				        <li class="tab"><a href="/service/cus-app-list.do">신청한 서비스</a></li>
				        <li class="tab"><a href="/service/cus-pay-list.do">결제 현황</a></li>
				        <li class="tab"><a href="/service/cus-deli-list.do" class="active">배송 현황</a></li>
				      </ul>
		    		</div>
		    		<c:forEach items="${result}" var="shiplist">
		    			
			    		<div class="col m6" style="border: 1px solid #eeeeee; margin-bottom: 20px;">
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
									<span class="width-100" style="font-size: 14px">배송상태</span>
									<c:if test="${shiplist.PROGRESS_CODE eq 'STU0040001'}">
										<span class="secondary-content"><span > 준비중(결제완료) </span></span>
									</c:if>
									<c:if test="${shiplist.PROGRESS_CODE eq 'STU0050001' }">
										<span class="secondary-content"><span class="red-text text-lighten-1"> 배송중(준비완료) </span></span>
									</c:if>
									<c:if test="${shiplist.PROGRESS_CODE eq 'STU0050002' }">
										<span class="secondary-content"><span class="red-text text-lighten-1"> 배송완료 </span></span>
									</c:if>
								</li>
								<li class="collection-item dismissable">
									<span class="width-100" style="font-size: 14px">행사장소</span>
									<span  class="secondary-content"><span class="">${shiplist.ADDRESS }</span></span>
								</li>
								<li class="collection-item dismissable">
									<span class="width-100" style="font-size: 14px">세부 장소</span>
									<span  class="secondary-content"><span class="">${shiplist.ADDRESS_DETAIL } 원</span></span>
								</li>
								<li class="collection-item dismissable">
									<span class="width-100" style="font-size: 14px">서비스 제공일</span>
									<span class="secondary-content"><span class="task-card-date"> ${shiplist.SERV_DATE } </span></span>
								</li>
								<li class="collection-item dismissable center">
									<a class="waves-effect waves-light btn-small" style="border-radius: 25px;" onclick="showDetail('${shiplist.SUGG_ID}','${shiplist.PROGRESS_CODE}')">상세보기</a>
									<c:if test="${shiplist.PROGRESS_CODE eq 'STU0050002' }">
										<a class="waves-effect waves-light btn-small" style="border-radius: 25px;" onclick="shipcomplete('${shiplist.SERV_ID}')">배송완료</a>
									</c:if>
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
		<ul class="collection with-header" id="ul_pay">
			
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
<form name="dForm" method="post">
	<input type="hidden" name ="pageNo"value="${pageNo}">
</form>
<%@include file="/include/footer.jsp" %>
</body>
</html>