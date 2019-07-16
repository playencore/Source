<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>

<script>
	//<!--

$(document).ready(function(){
	if(${servlist} !=null || ${servlist} ==""}){
		showServList(${serlist});
	}
	
	
	
	setDatePicker() ;
});
	
function showServeList(list){
	var cards = "" ;	
	for(var i = 0 ; i < Object.keys(list).length ; i++){
		cards = cards 
		+"<div class='card col s12'>"
		+ "<div class='card-content black-text'>"
		+	"<span class='card-title'>"
		+    list[i].SERVID
		+     "</span>"
		+	"<p>"
		+		"행사날짜" + list[i].SERV_DATE +"<br>"
		+		"행사장소" + list[i].ADDRESS + "<br>"
		+		"참여인원수" + list[i].PARTICIPANT +"<br>"
		+		"1인당 금액" + list[i].PER_BUD+"<br>"
		+	"</p>"
		+"</div>"
		+"<div class='card-action'>"
		+	"<a class = 'waves-effect waves-light modal-trigger' href='#servModal"+i+"' >상세보기</a>"
		+"</div>"
		+"</div>"
		+"<div class = 'modallist'>"
		+"<div id='servModal"+i+"' class='modal'>"
		+	"<div class='modal-content'>"
		+		"<h4>업체 상세보기</h4>"
		+		"<p>"
		+			"서비스 아이디 : "+list[i].SERV_ID+" <br>"
		+			"신청자 아이디 : "+list[i].CUSTOMER_ID+" <br>"
		+			"서비스제공 우편번호: "+list[i].+"<br>"
		+		"</p>"
		+	"</div>"
		+	"<div class='modal-footer'>"
		+		"<a href='#!' class='modal-close waves-effect waves-green btn-flat'>창닫기</a>"
		+	"</div>"
		+"</div>"
		+"</div>" ;
	}
	$("#showcard").html(cards);
}

function setDatePicker(){
	var deoption = {
		   minDate:new Date(moment().add(1,'days').format())
		  ,format:'yyyy-mm-dd'
		  ,i18n:{
	  		  cancel:'닫기',
	  		  clear:'초기화',
	  		  done:"확인",
	  		  months:[
	  			  '1 월',
	  			  '2 월',
	  			  '3 월',
	  			  '4 월',
	  			  '5 월',
	  			  '6 월',
	  			  '7 월',
	  			  '8 월',
	  			  '9 월',
	  			  '10 월',
	  			  '11 월',
	  			  '12 월'
	  		  ],
	  		  monthsShort:[
	  			  '1 월',
	  			  '2 월',
	  			  '3 월',
	  			  '4 월',
	  			  '5 월',
	  			  '6 월',
	  			  '7 월',
	  			  '8 월',
	  			  '9 월',
	  			  '10 월',
	  			  '11 월',
	  			  '12 월'
	  		  ],
	  		  weekdaysShort:[
	  			  '일요일',
	  			  '월요일',
	  			  '화요일',
	  			  '수요일',
	  			  '목요일',
	  			  '금요일',
	  			  '토요일'
	  		  ],
	  		  weekdaysAbbrev:['일','월','화','수','목','금','토']
	  	  }
	    } ;
		$('#startdate').datepicker(deoption);
		$("#enddate").datepicker(deoption) ;
		
	  
		//////////////////////////////////////////////////////////////////////////
		$('#startdate').on({change:function(){
			$('#enddate')[0].M_Datepicker.options.minDate = $('#startdate')[0].M_Datepicker.date
		}});
		$('#enddate').on({change:function(){
			$('#enddate')[0].M_Datepicker.options.maxDate = $('#startdate')[0].M_Datepicker.date
		}});
}

	//-->
</script>
<div class = "row ">
	<div class = "col s3">
		<br><br><br><br><br>
		행사 날짜 검색
		 <div class="card">
		 	<div class = "card-content">
				<form method="post" action="" name = "serchdate" onsubmit="">
					<p>검색 시작 날짜를 입력해주세요.</p>
					<input id = "startdate" name = "startdate" type="text" class="datepicker" readonly>
					<p>검색 종료 날짜를 입력해주세요.</p>
					<input id = "enddate" name = "enddate" type="text" class="datepicker" readonly>
				</form>
			</div>
		</div>
	</div>
	<div class = "col s7">
	<br><br><br><br><br>
	<c:if test="${empty servlist}">
		아직 신청이 없습니다.
	</c:if>
	<div id = "servlist">
		
	</div>
	</div>
</div>
</body>
</html>