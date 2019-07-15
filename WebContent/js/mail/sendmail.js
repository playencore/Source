
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
	alert("[인증번호 발송] 버튼이 클릭이 감지되었습니다.");
	if( emailable == true ) {
		var email = $("input[name=email]").val();
		var code = makeRandom(1000, 9999);
		alert("생성된 인증번호 : " + code );
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
		alert( "sendmail 호출이 완료되었습니다." );
	}
}
function codecompare(){
	alert("인증번호 일치여부를 진행합니다.");
	targetcode = $("input[name=emailcode]").val();
	enteredcode = $("input[name=emailcheck]").val();
	alert(targetcode + ", " + enteredcode);
	if( targetcode == enteredcode ){
//	if( true ){
		alert("일치");
		$("#bt_sendemail").click(function () {return false;});
		$("#emailcheck_comment").html(
				"<span style='color:blue'>" + "인증되었습니다." + "</span>");
	} else {
		alert("불일치");
		$("#emailcheck_comment").html(
				"<span style='color:red'>" + "인증에 실패하였습니다." + "</span>");
	}
}