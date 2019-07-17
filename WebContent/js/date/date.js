/**
 *  date.js
 */

// Or with jQuery
var elems = null;
var instances = null;
$(document).ready(function(){
	elems = document.querySelectorAll('.datepicker');
	instances = M.Datepicker.init(elems, {
	  format:'yyyy-mm-dd'
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
	   start: [5],
	   connect: true,
	   step: 1,
	   orientation: 'horizontal', // 'horizontal' or 'vertical'
	   range: {
	     'min': 0,
	     'max': 10
	   },
	   format: wNumb({
	     decimals: 0
	   }),
	   pips: {
	        mode: 'range',
	        density: 3
	    }
	  });
	  
	  percent.noUiSlider.on('change',function(){
			$('input[name=percent]').val(percent.noUiSlider.get());
	  });
	  $('input[name=percent]').val(percent.noUiSlider.get());
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
	  age.noUiSlider.on('change',function(){
			$('input[name=age_min]').val(age.noUiSlider.get()[0]);
			$('input[name=age_max]').val(age.noUiSlider.get()[1]);
	  });
	  $('input[name=age_min]').val(age.noUiSlider.get()[0]);
	  $('input[name=age_max]').val(age.noUiSlider.get()[1]);
	  
	  $('textarea#req_term,input#addr2').characterCounter();
});
function prev(){
	var cStep = $('input:hidden[name=step]').val();
	if(cStep =="2"){
		mod_display('#step1_',2,'block');
		mod_display('#step2_',3,'none');
		
		$('#btn_prev').addClass('disabled');
	}else if(cStep == "3"){
		mod_display('#step2_',3,'block');
		mod_display('#step3_',3,'none');
		
	}else if(cStep == "4"){
		mod_display('#step3_',3,'block');
		mod_display('#step4_',5,'none');
		$('#sub_title').text('기본정보 입력');
	
	}else if(cStep == "5"){
		mod_display('#step4_',5,'block');
		mod_display('#step5_',3,'none');
	}else if(cStep == "6"){
		$('#btn_next').css('display','block');
		$('#btn_submit').css('display','none');
		mod_display('#step5_',3,'block');
		mod_display('#step6_',2,'none');
	}
	
	$('input:hidden[name=step]').val(parseInt(cStep) - 1);
}
function next(){
	var cStep = $('input:hidden[name=step]').val();
	if(cStep=="1"){
		if(!valid_step1()){
			return;
		}
		
		mod_display('#step1_',2,'none');
		mod_display('#step2_',3,'block');
		$('#btn_prev').removeClass('disabled');
	}else if (cStep == "2"){
		if(!valid_step2()){
			return;
		}
		mod_display('#step2_',3,'none');
		mod_display('#step3_',3,'block');
		
	}else if(cStep == "3"){
		if(!valid_step3()){
			return;
		}
		mod_display('#step3_',3,'none');
		mod_display('#step4_',5,'block');
		$('#sub_title').text('부가정보 입력');
	}else if(cStep == "4"){
		if(!valid_step4()){
			return;
		}
		mod_display('#step4_',5,'none');
		mod_display('#step5_',3,'block');
	}else if(cStep == "5"){
		makeReq2();
		$('#btn_next').css('display','none');
		$('#btn_submit').css('display','block');
		mod_display('#step5_',3,'none');
		mod_display('#step6_',2,'block');
	}
	
	$('input:hidden[name=step]').val(parseInt(cStep) +1);
}

function mod_display( obj_name, leng,attr ){
	leng= leng+1;
	for(var i = 1 ;i<leng;++i){
		var obj =obj_name+i;
		$(obj).css('display',attr);
	}
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

function makeReq2(){
	var req = "";
	var step ="step";
	var count = 1;
	
	req += "<p class='p-inline'>"+ count++ +". 행사위치</p> : "
		+$('#addr').val() +' / ' + $('#addr2').val() +"<br>";
	
	req +="<p class='p-inline'>"+ count++ +". 행사일시</p> : "
		+$('#serv_date').val() + ' ' +$('#serv_time').val() +"<br>";
	
	req +="<p class='p-inline'>"+ count++ +". 참여 인원</p> : "
		+$('#participant').val() +" 명  "
		+"(" +age.noUiSlider.get()[0]+"-" + age.noUiSlider.get()[1]+"대" 
		+" / " +percent.noUiSlider.get() +":"+ (10-percent.noUiSlider.get())+" 남:여 비율"
		+")<br>";
	req +="<p class='p-inline'>"+ count++ +". 1인당 금액</p> : "
	+numbeComma($('#per_bud').val())+" 원(총액 : " + $('#amount').val()+")"+"<br>";
	
	for(var i = 2;i<7;++i){
		var j= 1;
		while(true){
			
			if($('#step'+i+'_'+j).length == 0){
				j = 1;
				break;
			}
			
			var content=null;
			if($('#step'+i+'_'+j).find('input').is('[type=checkbox]')){
				
				content = getValByCb($('#step'+i+'_'+j).find('input'));
			
			}else if ($('#step'+i+'_'+j).find('input').is('[type=radio]')){
				content = $('#step'+i+'_'+j).find('input').filter(':checked').next().text();
			}
			
			if(content){
				var text = "<p class='p-inline'>"+ count++ +". "+ $('#step'+i+'_'+j).find('h5').text() +"</p> : ";
				req += text + content+"<br>";
			}
			j++;
		}
	}
	
	$('#req_data').html(req);
}
function getValByCb( obj ){
	var content="";
	$(obj).each(function(i,o){
		if($(o).is(':checked')){
			content += $(o).next().text() +", ";
		}
	});
	if(content){
		content = content.substring(0,content.length -2);
	}
	return content;
}


function showToast(msg){
	 M.toast({html: msg, classes: 'rounded',displayLength:3000});
	 $('#toast-container').css({left:(window.outerWidth - $('#toast-container').width())/2});
}

