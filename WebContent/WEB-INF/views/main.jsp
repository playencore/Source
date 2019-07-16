<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>
메인입니다.
<input id="serv_date" name="serv_date" type="text" class="datepicker" readonly="readonly">
<input id="serv_date" name="serv_date" type="text" class="datepicker2" readonly="readonly">
asdad
<script type="text/javascript">
//<!--
$(function(){
	var elems = document.querySelectorAll('.datepicker');
	var instances = M.Datepicker.init(elems, {
	   minDate:new Date(moment().add(7,'days').format())
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
	});
	var elems2 = document.querySelectorAll('.datepicker2');
	var instances2 = M.Datepicker.init(elems2, {
	   minDate:new Date(moment().add(7,'days').format())
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
	});
	
	$('.datepicker').on({change:function(){
		$('.datepicker2')[0].M_Datepicker.options.minDate = $('.datepicker')[0].M_Datepicker.date
	}});
	$('.datepicker2').on({change:function(){
		$('.datepicker')[0].M_Datepicker.options.maxDate = $('.datepicker2')[0].M_Datepicker.date
	}});
	
});

//-->
</script>
<%@include file="/include/footer.jsp" %>