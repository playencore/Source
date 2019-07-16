/**
 * suggestion-list.js
 */
$(function(){
		activeItem('마이 페이지');
		showExtendedMenu('#nav_mypage');
		activeSubItem('제안 리스트');
		$('.modal').modal();
		
});

function showDetail(num){
	
	$.ajax({
	    
	    type : "post",
	    url : "/sugg/getSuggestInfo.do",
	    data:{
	    	suggId:num
	    },
	    dataType : "json",
	    error : function(data){
	        alert('상세정보 조회를 실패하셨습니다.')
	    },
	    success : function(data){
	    	updateUi(data,num);
	    	viewMap(data.ADDRESS);
	    	$('.modal').modal('open');
	    }     
	});
	
	
	
	
}

function updateUi(data,suggId){
	
	$('#sugg_title').text(suggId + "상세 내역");
	$('#sugg_date').text(data.SUGG_DATE);
	$('#sup_name').text(data.NAME);
	
	var choose_yn = data.CHOOSE_YN;
	if(choose_yn=='N'){
		$('#choose_yn').text("불채택");
		$('#choose_yn').addClass("red-text text-lighten-1");
	}else{
		$('#choose_yn').text("진행중");
	}
	
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
	}else{
		$('#li_menu').css('display','none');
	}
	/*$('#menu_info').html(menuBody);
	$('#serv_type').text(data.SERV_TYPE_NAME);
	$('#event_type').text(data.EVENT_TYPE_NAME);
	$('#serv_date').text(data.SERV_DATE);
	$('#participant').text(numbeComma(data.PARTICIPANT) + " 명");
	$('#addr1').text(data.ADDRESS);
	$('#addr2').text(data.ADDRESS_DETAIL);
	$('#zipcode').text(data.ZIPCODE);
	$('#age').text(data.AGE_MIN +" ~ " +data.AGE_MAX 
			+"( " +data.PER_MEN + " : " +(10-data.PER_MEN) + " )");
	$('#requested_term').text(data.REQUESTED_TERM);*/
	$('#ul_app').append(createMapNode());
}
function createMapNode(){
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
		+'<td id="addr1"></td>'
		+'<td id="addr2"></td>'
		+'<td id="zipcode"></td>'
		+'</tr>'
		+'</tbody>'
		+'</table>'
		+'<br>'
		+'<div id="map" style="height:200px;"></div>'
		+'</p>'
		+'</li>';
	
	return ui;
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
