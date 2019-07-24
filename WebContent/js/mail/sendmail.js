
// 인증번호 생성
function makeRandom(min, max){
	var RandVal = Math.floor(Math.random()*(max-min+1)) + min;
	return RandVal;
}
// 메일 내용
function insertcode(authNum){
	return "인증번호는 [ "+authNum+" ] 입니다.";
}

function sendemail() {
	
	if( emailable == true ) {
		var email = $("input[name=email]").val();
		var code = makeRandom(1000, 9999);
		
		$("input[name=emailcode]").val(code);	
		var codeval = $("input[name=code]").val();
		alert("input[name=emailcode].val(); : " + codeval );
		
		var content = insertcode(code);

		$.ajax({
			type : "post",
			url : "/mail/send-mail.do",
			async : false,
			data : {
				content : content,
				mail : email
			}, // HTTP 요청과 함께 서버로 보낼 데이터(URL뒤에 붙이는 내용)
			error : function(result) {
				alert("error: " + result);
			},
			success : function(result) {
				alert("success : " + result );
			}
		});
		
	}
}
function codecompare(){
	
	targetcode = $("input[name=emailcode]").val();
	enteredcode = $("input[name=emailcheck]").val();
	
	if( targetcode == enteredcode ){
//	if( true ){
		
		$("#bt_sendemail").click(function () {return false;});
		$("#emailcheck_comment").html(
				"<span style='color:blue'>" + "인증되었습니다." + "</span>");
	} else {
		
		$("#emailcheck_comment").html(
				"<span style='color:red'>" + "인증에 실패하였습니다." + "</span>");
	}
}