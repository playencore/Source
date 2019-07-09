$(function(){
	var memidable = false;
	var passwdable = false;
	var repasswdable = false;
	var nameable = false;
	var emailable = false;
	var emailcheckcommentable = false;
	var emailcodeable = false;
	var codecheckcommentable = false;
	var zipcodeable = false;
	var telable = false;
	var birthdateable = false;
	var addressable = false;
	var addressdetailable = false;
	var genderable = false;
	var jobable = false;
	var authorityable = false;
	
	// 아이디 입력란에서 keyup 이벤트 감지
	$('input[name=memid]').on('keyup', function() {
		var idReg1 = /^[a-z]/g;	// 소문자로 시작해야합니다.
		var idReg2 = /^[a-z]{6,20}/g;	// 소문자로 시작해야합니다. 6자리 이상이어야합니다.
		var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
		var id = $('input[name=memid').val();
		var ps = $('input[name=passwd]').val();
		var result ="";
		
		// memid 란에 출력할 내용을 결정하는 부분
		memidable = false;
		if( id == "" ){ // 아이디 입력여부 검사
			result = "아이디를 입력하지 않았습니다.";
		} else if ( id.indexOf(" ") >= 0) { // 아이디에 공백 사용하지 않기
			result = "아이디에 공백을 사용할 수 없습니다.";
		} else if( !idReg1.test( id ) ){ // 아이디 첫글자 검사
			result = "아이디는 영문 소문자로 시작해야합니다.";
		} else if( !idReg2.test( id ) ){ // 아이디 최소길이 검사
			result = "아이디는 6자 이상이어야 합니다.";
		} else if( !idReg.test( id ) ){ // 아이디 유효성 검사
			result = "아이디는 영문 대소문자, 숫자만 입력가능합니다.";
		} else if( id.length<6 || id.length>20 ) { // 아이디 길이 체크
			result = "아이디를 6~20자까지 입력해주세요.";
		} else {
			$.ajax({
				type : "post",							// HTTP 요청 방식(GET, POST)
				url : "/join/join-basic/checkid.do",	// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				async: false,
				data : {
					id:$("input[name=memid]").val()
				},								// HTTP 요청과 함께 서버로 보낼 데이터(URL뒤에 붙이는 내용)
				error : function(cntid){			
					alert("error: " + cntid);
				},
				success : function(cntid){
					if( cntid == 0){
						result = "사용 가능한 아이디 입니다.";
						memidable = true;
					} else {
						result = "동일한 아이디가 이미 사용중입니다.";
					}
				}
			});
		}
		// id 란에 출력해주는 부분
		if(memidable == false) {
//			alert("d : result" + result);
			$('span[name=idcomment]').html("<span style='color:red'>"+result+"</span>");
		} else {
//			alert("e : result" + result);
			$('span[name=idcomment]').html("<span style='color:blue'>"+result+"</span>");
		}
		
		// passwd 란에 출력
		if( id == ps ){ // 아이디와 비밀번호가 동일한지 체크
			result = "아이디와 비밀번호를 다르게 입력해주세요.";
			$('span[name=passwdcomment]').html("<span style='color:red'>"+result+"</span>");
		}
	});
	
	
	// 비밀번호 입력란에서 keyup 이벤트 감지
	$('input[name=passwd]').on('keyup', function() {
		var id = $('input[name=memid').val();
		var ps = $('input[name=passwd]').val();
		var rps = $('input[name=repasswd]').val();
		var result = " ";
		var passwd = $('#passwd').val();
		if( passwd.length < 4 ) { // 비밀번호란이 비어있는지 체크
			result = "비밀번호를 4자 이상 입력해주세요.";
			$('span[name=passwdcomment]').html("<span style='color:red'>"+result+"</span>");
		} else if( id == passwd ) { // 아이디와 비밀번호가 동일한지 체크	
			result = "아이디와 비밀번호가 동일합니다.";
			$('span[name=passwdcomment]').html("<span style='color:red'>"+result+"</span>");
		} else if( passwd.length > 20 ) { // 최대글자수를 넘었는지 검사
			result = "최대길이를 초과하였습니다.";
			$('span[name=passwdcomment]').html("<span style='color:red'>"+result+"</span>");
		} else {
			result = "사용가능한 비밀번호입니다.";
			$('span[name=passwdcomment]').html("<span style='color:blue'>"+result+"</span>");
		}
		if( ps != rps ) { // 비밀번호와 비밀번호확인이 일치하는지 검사
			result = "비밀번호가 일치하지 않습니다.";
			$('span[name=repasswdcomment]').html("<span style='color:red'>"+result+"</span>");
		} else if( ps == rps ) { // 비밀번호와 비밀번호확인이 일치하는지 검사
			result = "비밀번호가 일치합니다.";
			$('span[name=repasswdcomment]').html("<span style='color:blue'>"+result+"</span>");
		}
		
	});
	
	// 비밀번호 확인란에서 keyup 이벤트 감지
	$('input[name=repasswd]').on('keyup', function() {
//			alert("repasswd keyup 이벤트 감지됨");
		var ps = $('input[name=passwd]').val();
		var rps = $('input[name=repasswd]').val();
		
//		if(  )
//		else 
			if( ps != rps ) {
			result = "비밀번호가 일치하지 않습니다.";
			$('span[name=repasswdcomment]').html("<span style='color:red'>"+result+"</span>");
		} else {
			result = "비밀번호가 일치합니다.";
			$('span[name=repasswdcomment]').html("<span style='color:blue'>"+result+"</span>");
		}
	});
	
	// 최종 확인버튼을 클릭했을 경우 실행 되는 부분
	$("input[name=tableok]").click(function(){
		alert("확인버튼을 클릭을 감지해서 가입진행 여부를 검사합니다.");
		var form = document.dForm; 
		var check = false;
		var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		
		
		
        
      	// 비밀번호 입력여부 체크
        if (document.dForm.passwd.value == "") {
            alert("비밀번호를 입력하지 않았습니다.")
            document.dForm.passwd.focus();
            return false;
        }
      	
        // 비밀번호 길이 체크(4~20자 까지 허용)
        if (document.dForm.passwd.value.length<4 || document.dForm.passwd.value.length>20) {
            alert("비밀번호를 4~20자까지 입력해주세요.")
            document.dForm.passwd.focus();
            document.dForm.passwd.select();
            return false;
        }
        // 비밀번호와 비밀번호 확인 일치여부 체크
        if (document.dForm.passwd.value != document.dForm.repasswd.value) {
            alert("비밀번호가 일치하지 않습니다")
            document.dForm.repasswd.value = ""
            document.dForm.repasswd.focus();
            return false;
        }
        // 이름 입력여부 체크
        if (document.dForm.name.value == "") {
            alert("이름을 입력하지 않았습니다.")
            document.dForm.name.focus();
            return false;
        }
        // 이메일 입력여부 체크
        if (document.dForm.email.value == "") {
            alert("이메일을 입력하지 않았습니다.")
            document.dForm.email.focus();
            return false;
        }
        if (regex.test(email) === false) {
            alert("잘못된 이메일 형식입니다.");
            document.dForm.email.value=""
            document.dForm.email.focus();
            return false;
        }
 
        
        
        for (var i = 0; i < document.dForm.email.value.length; i++) {
            chm = document.dForm.email.value.charAt(i)
            if (!(chm >= '0' && chm <= '9') && !(chm >= 'a' && chm <= 'z')&&!(chm >= 'A' && chm <= 'Z')) {
                alert("이메일은 영문 대소문자, 숫자만 입력가능합니다.")
                document.dForm.email.focus();
                document.dForm.email.select();
                return false;
            }
        }
        
        if(	memidable == false ) {
        	document.dForm.memid.focus();
            document.dForm.memid.select();
        } else if( passwdable == false ) {
        	document.dForm.passwd.focus();
            document.dForm.passwd.select();
        } else if( repasswdable == false ) {
        	document.dForm.repasswd.focus();
            document.dForm.repasswd.select();
        } else if( nameable == false ) {
        	document.dForm.name.focus();
            document.dForm.name.select();
        } else if( emailable == false ) {
        	document.dForm.email.focus();
            document.dForm.email.select();
        } else if( emailcheckcommentable == false ) {
        	document.dForm.emailcheckcomment.focus();
            document.dForm.emailcheckcomment.select();
        } else if( emailcodeable == false ) {
        	document.dForm.emailcode.focus();
            document.dForm.emailcode.select();
        } else if( codecheckcommentable == false ) {
        	document.dForm.codecheckcomment.focus();
            document.dForm.codecheckcomment.select();
        } else if( zipcodeable == false ) {
        	document.dForm.zipcode.focus();
            document.dForm.zipcode.select();
        } else if( telable == false ) {
        	document.dForm.tel.focus();
            document.dForm.tel.select();
        } else if( birthdateable == false ) {
        	document.dForm.birthdate.focus();
            document.dForm.birthdate.select();
        } else if( addressable == false ) {
        	document.dForm.address.focus();
            document.dForm.address.select();
        } else if( addressdetailable == false ) {
        	document.dForm.addressdetail.focus();
            document.dForm.addressdetail.select();
        } else if( genderable == false ) {
        	document.dForm.gender.focus();
            document.dForm.gender.select();
        } else if( jobable == false ) {
        	document.dForm.job.focus();
            document.dForm.job.select();
        } else if( authorityable == false ) {
        	document.dForm.authority.focus();
            document.dForm.authority.select();
        } else {
        	// 모든 유효성 검사를 통과한 경우에만 회원가입을 진행한다.
        	if(jointype == "1" ){
        		alert("구매자 회원가입을 시도합니다.");
        		dForm.action = "/join/join-end.do";
        	}
        	else if( jointype == "2" ){
        		alert("판매자 회원가입을 시도합니다.");
        		dForm.action = "/join/join-end.do";
        	}
        }
	});
});