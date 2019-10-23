/**
 * 
 */
$(function(){
	activeItem('마이 페이지');
	showExtendedMenu('#nav_mypage');
	activeSubItem('제안 리스트',0);
	activeSubItem('결제 대기',1);
	$('.modal').modal();
});
	
function showDetail(num){
	
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
	$('#choose_yn').text("구매자 결제 대기중");
	
	var li_pay ="";
	var ratio =(data.payInfos.AMOUNT/100) * data.payInfos.RATIO;
	var vat = (data.payInfos.AMOUNT/100) * 10;
	li_pay += createHeader('금액');
	//결제마감일
	li_pay += createBody('결제 총액 ',numbeComma(data.payInfos.AMOUNT)+" 원");
	li_pay += createBody('수수료액( '+data.payInfos.RATIO+'% )',numbeComma(Math.round(ratio)) + " 원");
	li_pay += createBody('VAT ',numbeComma(Math.round(vat)) + " 원");
	li_pay += createBody('예상 매출액 ',numbeComma(Math.round(data.payInfos.AMOUNT -ratio -vat))+ " 원");
	
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
	
	
	li += createBody('선호 메뉴',premenuToName( data.prefList.toString() ));
	
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

function premenuToName(premenu){
	var bmenu =  premenu.substring(0,3)
	var mmenu = premenu.substring(3,6)
	var smenu = premenu.substring(6,9)
	var menuname = "" ;
	
	switch (bmenu){
	    case 'L01' :
	    	menuname+="한식"
	        break;
	    case 'L02' :
	    	menuname+="일식"
	        break;
	    case 'L03' :
	    	menuname+="중식"
	        break;
	    case 'L04' :
	    	menuname+="웨스턴"
	        break;
	    case 'L05' :
	    	menuname+="퓨전"
	        break;
	    default :
	}
	switch (mmenu){
	    case 'M01' :
	    	menuname+=",육류"
	        break;
	    case 'M02' :
	    	menuname+=",해산물"
	        break;
	    case 'M03' :
	    	menuname+=",밥류"
	        break;
	    case 'M04' :
	    	menuname+=",면류"
	        break;
	    case 'M05' :
	    	menuname+=",채소"
	        break;
	    case 'M06' :
	    	menuname+=",두류"
	        break;
	    case 'M07' :
	    	menuname+=",빵류"
	        break;
	    default :
	}
	switch (smenu){
		case 'S01' :
			menuname+=",국류"
		    break;
		case 'S02' :
			menuname+=",볶음"
		    break;
		case 'S03' :
			menuname+=",찜"
		    break;
		case 'S04' :
			menuname+=",구이"
		    break;
		case 'S05' :
			menuname+=",튀김"
		    break;
		case 'S06' :
			menuname+=",날것(샌드위치)"
		        break;
		   
		    default :
	}
	
	return menuname ;
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