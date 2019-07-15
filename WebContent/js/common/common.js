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
		}
	});
}
function activeSubItem(txt){
	$('.tabs-transparent').find('a').each(function(i,e){
		if($(e).text()==txt){
			$(e).addClass("active");	
			$(e).parent().addClass("active");	
		}
	});
}
$(function(){
	$('.dropdown-trigger').dropdown();
});