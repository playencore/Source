/**
 * application-list.js
 */


$(function(){
	activeItem('마이 페이지');
	showExtendedMenu('#nav_mypage');
	activeSubItem('신청 리스트',0);
	activeSubItem('신청 목록',1);
	$('.modal').modal();
	$('.modal2').modal();
});
// 상세보기 버튼 클릭시 동작(모달)
function showDetail(SERV_ID){
	$.ajax({
	    
	    type : "post",
	    url : "/appli/getDetailInfoList.do",
	    data:{
	    	appliId:SERV_ID
	    },
	    dataType : "json",
	    error : function(data){
	        alert('상세정보 조회를 실패하셨습니다.');
	    },
	    success : function(data){
	    	updateUi(data,SERV_ID);
	    	viewMap(data.ADDRESS);
	    	var lists = [];
	    	$('.modal').modal('open');
	    	suggCompareListPro(lists);
	    }
	});
}
//제안비교 기능(체크박스 감지)
function suggCompareListPro(lists){
	$("input[name='checksuggid']").change(function(){
//		alert("lists에서 조회 : [ " + lists.indexOf($(this).val()) + "]번째 요소                        (-1은 없음)");
		if(lists.indexOf($(this).val()) == -1){
//            alert("주문번호 [ " +$(this).val()+ " ] 를 등록합니다!");
    		lists.push($(this).val());
            //	});
        }else{
//        	alert(" [ " +lists.indexOf($(this).val())+ " ] 번째 요소인 주문번호 [ " +$(this).val()+ " ] 를 삭제합니다!");
            lists.splice(lists.indexOf($(this).val()), 1);
        }
        alert("List 목록 결과 : " + lists + "EOF");
    });
}

function updateUi(data,appliId){
	$('#app_title').text("신청번호 " + appliId);
	$('#app_date').text(data.APP_DATE);	// APP_DATE: 2019-07-17 17:59:50
	$('#app_name').text(data.NAME);
	$('#modified_date').text(data.MODIFIED_DATE);	// MODIFIED_DATE: 2019-07-17 17:59:50
	
	// 일정정보
	$('#serv_date').text(data.SERV_DATE);	// 서비스 제공일 SERV_DATE: 2019-07-25 20:30:00
	
	// 현장정보
	$('#address').text(data.ADDRESS);	// 주소 ADDRESS: "서울 서초구 서초대로46길 3"
	$('#address_detail').text(data.ADDRESS_DETAIL);	// ADDRESS_DETAIL: "앤코앙23호"
	$('#interior_yn').text(data.INTERIOR_YN);	// INTERIOR_YN: "Y"
	$('#parking_yn').text(data.PARKING_YN);	// PARKING_YN: "Y"
	$('#elevator_yn').text(data.ELEVATOR_YN);	// ELEVATOR_YN: "Y"
	$('#discharge_yn').text(data.DISCHARGE_YN);	// DISCHARGE_YN: "Y"
	$('#cooking_yn').text(data.COOKING_YN);	// COOKING_YN: "Y"
	
	//참석자정보
	$('#participant').text(data.PARTICIPANT+" 명");	// 참가인원 PARTICIPANT: 100
	$('#per_bud').text(data.PER_BUD+" 원");	// 1인당 금액 PER_BUD: "30,000"
	var str_per_bud = data.PER_BUD;
	var int_per_bud = str_per_bud.replace(",","");
	var total = data.PARTICIPANT * int_per_bud;
	total = numbeComma(total);
	$('#per_totalbud').text(total+" 원");
	
	$('#age_max').text(data.AGE_MAX);	// AGE_MAX: 60
	$('#age_min').text(data.AGE_MIN);	// AGE_MIN: 26
	$('#age_minmax').text(data.AGE_MIN+" ~ "+data.AGE_MAX+" 세");
	var men = data.PER_MEN * 10
	$('#per_men').text(men+" %");	// 남자성비 PER_MEN: 3
	var women = (10 - data.PER_MEN) * 10;
	$('#per_women').text(women+" %");	// 남자성비 PER_MEN: 3
	
	//행사정보
	$('#serv_type_code').text(data.SERV_TYPE_NAME);	//진행(서비스)형식 타입코드 SERV_TYPE_CODE: "SER0000010"
	$('#event_type_code').text(data.EVENT_TYPE_NAME);	// 행사형식코드 EVENT_TYPE_CODE: "EVT0000010"
	$('#coordinator_yn').text(data.COORDINATOR_YN);	// 코디네이터 COORDINATOR_YN: "Y"
	$('#tableware_yn').text(data.TABLEWARE_YN);	// 추가식기 TABLEWARE_YN: "Y"
	$('#dessert_yn').text(data.DESSERT_YN);	// 후식 DESSERT_YN: "Y"

	// 추가요청사항
	$('#requested_team').text(data.REQUESTED_TERM);	// REQUESTED_TERM: "추가 요청사항은 없습니다."
	
	$('#customer_id').text(data.CUSTOMER_ID);	// CUSTOMER_ID: "gggggg"
	$('#other_order_yn').text(data.OTHER_ORDER_YN);	// OTHER_ORDER_YN: "Y"
	$('#progress_code').text(data.PROGRESS_CODE);	// PROGRESS_CODE: "00010001  "
	$('#serv_id').text(data.SERV_ID);	// SERV_ID: "S190717-0001"
	$('#zipcode').text(data.ZIPCODE);	// ZIPCODE: "06646"
	$('#end_date').text(data.END_DATE);	// END_DATE: "[null]"
	
	var sugglist = data.suggInfo;
	
	var suggListHead = "";
	var suggListBody = "";
	var suggListCompare = "";
	if(sugglist.length != 0){
		$('#suggListNull').css('display','none');
		$('#suggListNotNull').css('display','block');
			suggListHead += "<tr>";
			suggListHead += "<th>제안일</th>";
			suggListHead += "<th>업체명</th>";
			suggListHead += "<th>메뉴상세</th>";
			suggListHead += "<th>제안비교</th>";
			suggListHead += "</tr>";
		sugglist.forEach((function(suggMap,i){
			var suggTotal = suggMap.PER_BUD * data.PARTICIPANT;
			suggListBody += "<tr>" +
						"<td>" +suggMap.SUGG_DATE+ "</td>" +
						"<td>" +suggMap.NAME+ "</td>" +
						"<td><a class=\"waves-effect waves-light btn-small\" style=\"border-radius: 25px;\"" +
						" onclick=\"openmenu('"+suggMap.SUGG_ID+"','"+suggTotal+"','"+suggMap.SERV_ID+"');\">메뉴상세</a></td>" +
						"<td>"+
							"<p>"+
								"<label>"+
									"<input type='checkbox' name='checksuggid' class='filled-in' value='" + suggMap.SUGG_ID + "'/>" +
									"<span></span>" +
								"</label>" +
							"</p>" +
						"</td>" +
					"</tr>";
		}))
		
		suggListCompare += "<tr>" ;
					
		$('#sugg_info_compare').html(suggListCompare);
		
		$('#sugg_info_head').html(suggListHead);
		$('#sugg_info_body').html(suggListBody);
		
	} else {
		$('#suggListNull').css('display','block');
		$('#suggListNotNull').css('display','none');
	}


	var li ="";

	li += createMap(data.ADDRESS,data.ADDRESS_DETAIL,data.ZIPCODE);
	$('#ul_app').html(li);
}
function createtable(){
	return '<li class="collection-item dismissable" id="li_menu" align="center">'
	+'<span class="width-100" style="font-size: 20px">제안 메뉴</span>'
	+'</li>'
	+'<li class="collection-item dismissable" id="li_menu">'
	+'<br>'
	+'<p class="secondary-content">'
	+'<table class="highlight centered">'
	+'<thead>'
	+'<tr>'
	+'<th>메뉴명</th>'
	+'<th>1 인분당 중량(g)</th>'
	+'<th>메뉴 사진</th>'
	+'<th>메뉴 설명</th>'
	+'</tr>'
	+'</thead>'
	+'<tbody id="menu_info">'
	+'</tbody>'
	+'</table>'
	+'</p>'
	+'</li>';
}
function openmenu(SUGG_ID, TOTAL, SERV_ID){
	$.ajax({
	    
	    type : "post",
	    url : "/appli/get-menu-info.do",
	    data:{
	    	suggId:SUGG_ID,
	    },
	    dataType : "json",
	    error : function(data){
	        alert('채택에 실패했습니다.');
	    },
	    success : function(data){
	    	var li = "";
	    	li += createtable();
	    	$('#ul_payment').html(li);
	    	var menuBody = "";
	    	data.forEach((function(e,i){
				menuBody += "<tr>";
				menuBody += "<td>" +e.NAME+ "</td>";
				menuBody += "<td>" +numbeComma(e.WEIGHT)+ "</td>";
				menuBody += "<td>" 
					+ "<img alt='' src='/file/file-down/" 
					+ e.FILE_ID
					+ "' width='75px' height='75px'>"
					+ "</td>";
				menuBody += "<td>" +e.EXPLANATION+ "</td>";
				
				menuBody += "</tr>";
			}));
			$('#menu_info').html(menuBody);
			$('#btn_modal2').on({
				click:function(){
					selectCustomer(SUGG_ID,TOTAL,SERV_ID);
				}
			});
			$('.modal2').modal('open');
	    }     
	});
}
//상세리스트에서 업체를 채택 함
function selectCustomer(SUGG_ID, TOTAL, SERV_ID){
	
	$.ajax({
		    
		    type : "post",
		    url : "/appli/selectCustomer.do",
		    data:{
		    	suggId:SUGG_ID,
		    	total:TOTAL,
		    	servId:SERV_ID
		    },
		    dataType : "json",
		    error : function(data){
		        alert('채택에 실패했습니다.');
		    },
		    success : function(data){
		    	alert('채택에 성공했습니다.');
		    	window.location.href = "/service/cus-app-list.do";
		    }     
		});
}


function createMap(adr1,adr2,zipcode){
	var ui ='<li class="collection-item dismissable">'
		+'<li class="collection-header" style="background-color: #eee">'
		+'<h6 class="task-card-title mb-3" style="text-align: center;">'
		+'서비스 제공위치'
		+'</h6>'
		+'</li>'
		
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
