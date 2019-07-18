/**
 * 
 */
var showFlag = false;
function showExtendedMenu(id){
	if(showFlag){
		$(id).css("display","none");
		showFlag= false;
	}else{
		$(id).css("display","block");
		showFlag= true;
	}
	
}
function activeItem(txt){
	$('#navbar').find('a').each(function(i,e){
		if($(e).text()==txt){
			$(e).parent().addClass("active");	
		}else{
			$(e).parent().removeClass("active");	
		}
	});
}
function activeSubItem(txt,idx){
	$($('.tabs-transparent')[idx]).find('a').each(function(i,e){
		if($(e).text()==txt){
			$(e).addClass("active");	
			$(e).parent().addClass("active");	
		}else{
			$(e).removeClass("active");	
			$(e).parent().removeClass("active");	
		}
	});
}
$(function(){
	$('.dropdown-trigger').dropdown();
});