/**
 *  application.js
 */

function foldDaumPostcode() {
	var element_wrap = document.getElementById('wrap');
	document.getElementById('sec_addr').style.display="block";
	document.getElementById('sec_postcode').style.display="none";
    element_wrap.style.display = 'none';
}

function daumPostcode() {
	var element_wrap = document.getElementById('wrap');
    // 현재 scroll 위치를 저장해놓는다.
    var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
    new daum.Postcode({
        oncomplete: function(data) {
            // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
           /*  if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample3_extraAddress").value = extraAddr;

            } else {
                document.getElementById("sample3_extraAddress").value = '';
            } */

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("addr").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();

            // iframe을 넣은 element를 안보이게 한다.
            // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
            element_wrap.style.display = 'none';
            document.getElementById('sec_addr').style.display="block";
            document.getElementById('sec_postcode').style.display="none";
            // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
            document.body.scrollTop = currentScroll;
        },
        // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
        onresize : function(size) {
            element_wrap.style.height = size.height+'px';
        },
        width : '100%',
        height : '100%'
    }).embed(element_wrap);

    // iframe을 넣은 element를 보이게 한다.
    element_wrap.style.display = 'block';
    document.getElementById('sec_addr').style.display="none";
    document.getElementById('sec_postcode').style.display="block";
}
// Or with jQuery
var elems = null;
var instances = null;
$(document).ready(function(){
	elems = document.querySelectorAll('.datepicker');
	instances = M.Datepicker.init(elems, {
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
	$('.timepicker').timepicker({
		i18n:{
			cancel:'닫기'
			,clear:'초기화'
			,done:'확인'
		}
	});
	
	var slider = document.getElementById('percent');
	  noUiSlider.create(slider, {
	   start: [50],
	   connect: true,
	   step: 1,
	   orientation: 'horizontal', // 'horizontal' or 'vertical'
	   range: {
	     'min': 0,
	     'max': 100
	   },
	   format: wNumb({
	     decimals: 0
	   }),
	   pips: {
	        mode: 'range',
	        density: 3
	    }
	  });
	  
	  var slider2 = document.getElementById('age');
	  noUiSlider.create(slider2, {
	   start: [20,60],
	   connect: true,
	   step: 1,
	   orientation: 'horizontal', // 'horizontal' or 'vertical'
	   range: {
	     'min': 0,
	     'max': 100
	   },
	   format: wNumb({
	     decimals: 0
	   }),
	   pips: {
	        mode: 'range',
	        density: 3
	    }
	  });
});
function prev(){
	var cStep = $('input:hidden[name=step]').val();
	if(cStep =="2"){
		$('#step1_1').css('display','block');
		$('#step1_2').css('display','block');
		
		$('#step2_1').css('display','none');
		$('#step2_2').css('display','none');
		$('#step2_3').css('display','none');
		$('#btn_prev').addClass('disabled');
	}else if(cStep == "3"){
		$('#step2_1').css('display','block');
		$('#step2_2').css('display','block');
		$('#step2_3').css('display','block');
		
		$('#step3_1').css('display','none');
		$('#step3_2').css('display','none');
		$('#step3_3').css('display','none');
	}
	$('input:hidden[name=step]').val(parseInt(cStep) - 1);
}
function next(){
	var cStep = $('input:hidden[name=step]').val();
	if(cStep=="1"){
		$('#step1_1').css('display','none');
		$('#step1_2').css('display','none');
		
		$('#step2_1').css('display','block');
		$('#step2_2').css('display','block');
		$('#step2_3').css('display','block');
		$('#btn_prev').removeClass('disabled');
	}else if (cStep == "2"){
		$('#step2_1').css('display','none');
		$('#step2_2').css('display','none');
		$('#step2_3').css('display','none');
		
		$('#step3_1').css('display','block');
		$('#step3_2').css('display','block');
		$('#step3_3').css('display','block');
		
	}
	
	$('input:hidden[name=step]').val(parseInt(cStep) +1);
}

function changeColor( obj ){
	var flag = $(obj).is(':checked');
	if(flag){
		$(obj).parent().parent().css('background-color','#26a69a');
		$(obj).parent().filter(':last-child').css('color','white');
	}else{
		$(obj).parent().parent().css('background-color','#e4e4e4');
		$(obj).parent().filter(':last-child').css('color','#545353');		
	}
	
}

function changeColorByRadio( name ){
	var objs = eval("'input:radio[name="+name +"]'");
	$(objs).each(function(i,e){
		if($(e).is(':checked')){
			$(e).parent().parent().css('background-color','#26a69a');
			$(e).parent().filter(':last-child').css('color','white');
		}else{
			$(e).parent().parent().css('background-color','#e4e4e4');
			$(e).parent().filter(':last-child').css('color','#545353');
		}
	});
}
function updateAmount( obj ){
	var one = $(obj).val();
	var partic = $('#participant').val();
	var amount = parseInt(one) * parseInt(partic);
	if(isNaN(amount)){
		amount = 0;
	}
	$('#amount').val( numbeComma(amount) +" 원");
}
function numbeComma(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


