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

var attr = "";
var attrval = "";
var attr2 = "";
var attrval2 = "";
var result = "";

function getval(attr) {
	return $('input[name=' + attr + ']').val();
}
function outresult(attr, check, result) {
	if (check == false) {
		$('#' + attr + '_comment').html(
			"<span style='color:red'>" + result + "</span>");
	} else {
		$('#' + attr + '_comment').html(
			"<span style='color:blue'>" + result + "</span>");
	}
	return check;
}
function ckempty(attrval) {
	if (attrval == "") { // 아이디 입력여부 검사
		result = "값이 입력되지 않았습니다.";
		return false;
	} else if (attrval.indexOf(" ") >= 0) { // 아이디에 공백 사용하지 않기
		result = "공백을 사용할 수 없습니다.";
		return false;
	} else {
		return true;
	}
}
function cklength(attrval, min, max) {
	if (attrval.length < min || attrval.length > max) { // 아이디 길이 체크
		result = "글자수는 " + min + "~" + max + "자 사이어야 합니다.";
		return false;
	} else {
		return true;
	}
}
// 오직 숫자로만 구성되었는지 검사
function isOnlyNumber(attrval) {
	var reg = /[^0-9]/g;
	if( !reg.test(attrval) ){
		return true;
	} else {
		result = "숫자만 입력 가능합니다.";
		return false;
	}
}

var name_mem_id = 'mem_id';
var name_passwd = 'passwd';
var name_passwdcheck = 'passwdcheck';
var name_name = 'name';
var name_email = 'email';
var name_emailcheck = 'emailcheck';
var name_zipcode = 'zipcode';
var name_address = 'address';
var name_address_detail = 'address_datail';
var name_tel = 'tel';
var name_birth_date = 'birth_date';
var name_gender = 'gender';
var name_job = 'job';

$(function() {
	var check = false;
	var check2 = false;
	// 아이디 입력란에서 keyup 이벤트 감지
	$("input[name="+name_mem_id+"]").on('keyup', function() {
		attr = name_mem_id;
		attr2 = name_passwd;
		result = "";
		check = false;
		check2 = false;

		var attrval = getval(attr);
		var attrval2 = getval(attr2);

		var Reg1 = /^[a-z]/g; // 소문자로 시작해야합니다.
		var Reg2 = /^[a-z0-9]{6,20}/g; // 소문자로 시작해야합니다. 6자리 이상이어야합니다.
		var Reg = /^[a-z]+[a-z0-9]{5,19}$/g;

		// 첫글자는 영문 소문자로 시작할 것
		var reg1 = /^[a-z]/g;
		// 영문 소문자와 숫자만 사용 할 것
		var reg2 = /^[a-z]+[a-z0-9]/g;
		// 6자리 이상일 것
		var reg3 = /^[a-z]+[a-z0-9]/g;
		// 20자리 이하일 것
		var reg4 = /^[]{5,19}$/g;
		
		
		
		
		
		
		
		
		
		// mem_id 란에 출력할 내용을 결정
		if (!ckempty(attrval)) { // null과 공백 검사

		} else if (!Reg1.test(attrval)) { // 아이디 첫글자 검사
			result = "아이디는 영문 소문자로 시작해야합니다.";
		} else if (!Reg.test(attrval)) { // 아이디 유효성 검사
			result = "아이디는 영문 소문자, 숫자만 입력가능합니다.";
		} else if (!Reg2.test(attrval)) { // 아이디 최소길이 검사
			result = "아이디는 6자 이상이어야 합니다.";
		} else if (attrval.length < 6 || attrval.length > 20) { // 아이디 길이 체크
			result = "아이디를 6~20자까지 입력해주세요.";
		} else {
			$.ajax({
				type : "post", // HTTP 요청 방식(GET, POST)
				url : "/join/join-basic/checkid.do", // 클라이언트가 HTTP 요청을 보낼
				// 서버의 URL 주소
				async : false,
				data : {
					id : attrval
				}, // HTTP 요청과 함께 서버로 보낼 데이터(URL뒤에 붙이는 내용)
				error : function(cntid) {
					alert("error: " + cntid);
				},
				success : function(cntid) {
					if (cntid == 0) {
						result = "사용 가능한 아이디 입니다.";
						check = true;
					} else {
						result = "동일한 아이디가 이미 사용중입니다.";
					}
				}
			});
		}
		memidable = outresult(attr, check, result);

		// passwd 란에 출력할 내용 결정
		if( attrval2 == "" ){
			result = "";
		} else if (attrval == attrval2) { // 아이디와 비밀번호가 동일한지 체크
			result = "아이디와 비밀번호를 다르게 입력해주세요.";
		} else if (attrval != attrval2) {
			result = "";
			check2 = true;
		}
		// passwd 란에 출력
		passwdable = outresult(attr2, check2, result);
	});

	// 비밀번호 입력란에서 keyup 이벤트 감지
	$('input[name='+name_passwd+']').on('keyup', function() {
		result = "";
		check = false;
		check2 = false;
		var attr = name_passwd;
		var attr2 = name_passwdcheck;
		var attr3 = name_mem_id;
		var attrval = $('input[name=' + attr + ']').val();
		var attrval2 = $('input[name=' + attr2 + ']').val();
		var attrval3 = $('input[name=' + attr3 + ']').val();

		if (attrval.length < 4) { // 비밀번호란이 비어있는지 체크
			result = "비밀번호를 4자 이상 입력해주세요.";
		} else if (attrval == attrval3) { // 아이디와 비밀번호가 동일한지 체크
			result = "아이디와 비밀번호가 동일합니다.";
		} else if (attrval.length > 20) { // 최대글자수를 넘었는지 검사
			result = "최대길이를 초과하였습니다.";
		} else {
			result = "사용가능한 비밀번호입니다.";
			check = true;
		}
		// passwd 란에 출력
		passwdable = outresult(attr, check, result)

		// passwdcheck 란에 출력할 내용 결정
		if (attrval != attrval2) { // 비밀번호와 비밀번호확인이 일치하는지 검사
			result = "비밀번호가 일치하지 않습니다.";
		} else { // 비밀번호와 비밀번호확인이 일치하는지 검사
			result = "비밀번호가 일치합니다.";
			check2 = true;
		}
		// passwdcheck 란에 출력
		repasswdable = outresult(attr2, check2, result)
	});

	// passwdcheck 관련 keyup 이벤트 감지
	$('input[name='+name_passwdcheck+']').on('keyup', function() {
		check = false;
		attr = name_passwdcheck;
		attr2 = name_passwd;
		attrval = getval(attr);
		attrval2 = getval(attr2);

		if (!ckempty(attrval)) { // null과 공백 검사

		} else if (!cklength(attrval, 4, 20)) { // 글자 수 검사

		} else if (attrval != attrval2) {
			result = "비밀번호가 일치하지 않습니다.";
		} else {
			result = "비밀번호가 일치합니다.";
			check = true;
		}
		repasswdable = outresult(attr, check, result)
	});

	// name 관련 keyup 이벤트 감지
	$('input[name='+name_name+']').on('keyup', function() {
		check = false;
		attr = name_name;
		attrval = getval(attr);
		// 검사
		if (!ckempty(attrval)) { // null과 공백 검사

		} else if (!cklength(attrval, 2, 20)) { // 글자 수 검사

		} else {
			result = "";
			check = true;
		}
		// 출력
		nameable = outresult(attr, check, result);
	});

	// email 관련 keyup 이벤트 감지
	$('input[name='+name_email+']').on('keyup',function() {
		check = false;
		attr = name_email;
		attrval = getval(attr);
		var emailReg = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		// 검사
		if (!ckempty(attrval)) { // null과 공백 검사

		} else if (!cklength(attrval, 6, 30)) { // 글자 수 검사

		} else if (emailReg.test(attrval) == false) {
			result = "잘못된 이메일 형식입니다.";
		} else {
				result = "올바른 이메일 형식입니다.";
				check = true;
		}

				// 출력
		emailable = outresult(attr, check, result);
	});
	// emailcheck란에 keyup 이벤트 감지
	$('input[name='+name_emailcheck+']').on('keyup', function() {
		check = false;
		attr = name_emailcheck;
		attrval = getval(attr);
		// 검사
		if (!ckempty(attrval)) { // null과 공백 검사

		} else if(!isOnlyNumber(attrval)) {
		} else if ( !cklength(attrval, 4, 4) ) { // 글자 수 검사
			result = "4자리의 숫자를 입력해주세요."
		} else {
			result = "[인증번호 확인]버튼을 눌러주세요";
			check = true;
		}
		// 출력
		emailcodeable = outresult(attr, check, result);
	});
	// address란에 keyup 이벤트 감지
	$('input[name='+name_address+']').on('keyup', function() {
		check = false;
		attr = name_address;
		attrval = getval(attr);
		// 검사
		if (!ckempty(attrval)) { // null과 공백 검사

		} else if (!cklength(attrval, 2, 30)) { // 글자 수 검사

		} else {
			result = "";
			check = true;
		}
		// 출력
		addressable = outresult(attr, check, result);
	});
	// address_detail란에 keyup 이벤트 감지
	$('input[name='+name_address_detail+']').on('keyup', function() {
		check = false;
		attr = name_address_detail;
		attrval = getval(attr);
		// 검사
		if (!ckempty(attrval)) { // null과 공백 검사

		} else if (!cklength(attrval, 2, 40)) { // 글자 수 검사

		} else {
			result = "";
			check = true;
		}
		// 출력
		addressdetailable = outresult(attr, check, result);
	});
	// tel란에 keyup 이벤트 감지
	$('input[name='+name_tel+']').on('keyup', function() {
		check = false;
		attr = name_tel;
		attrval = getval(attr);
		// 검사
		if (!ckempty(attrval)) { // null과 공백 검사
		} else if(!isOnlyNumber(attrval)) {
		} else if (!cklength(attrval, 13, 13)) { // 글자 수 검사
		} else {
			result = "";
			check = true;
		}
		// 출력
		telable = outresult(attr, check, result);
	});
	// birth_date란에 keyup 이벤트 감지
	$('input[name='+name_birth_date+']').on('keyup', function() {
		check = false;
		attr = name_birth_date;
		attrval = getval(attr);
		// 검사
		if (!ckempty(attrval)) { // null과 공백 검사
		} else if(!isOnlyNumber(attrval)) {
		} else if (!cklength(attrval, 8, 8)) { // 글자 수 검사
		} else {
			result = "";
			check = true;
		}
		// 출력
		birthdateable = outresult(attr, check, result);
	});
	// job 란에 keyup 이벤트 감지
	$('input[name='+name_job+']').on('keyup', function() {
		check = false;
		attr = name_job;
		attrval = getval(attr);
		// 검사
		if ( attrval == "" ) { // null과 공백 검사
			"직업을 선택하지 않았습니다.";
		} else {
			result = "";
			check = true;
		}
		// 출력
		jobable = outresult(attr, check, result);
	});

	// 최종 확인버튼을 클릭했을 경우 실행 되는 부분
	$("input[name=tableok]").click(function() {
		alert("확인버튼 클릭을 감지해서 가입진행 여부를 검사합니다.");
		var form = document.dForm;
		check = false;

		if (memidable == false) {
			document.dForm.memid.focus();
			document.dForm.memid.select();
		} else if (passwdable == false) {
			document.dForm.passwd.focus();
			document.dForm.passwd.select();
		} else if (repasswdable == false) {
			document.dForm.repasswd.focus();
			document.dForm.repasswd.select();
		} else if (nameable == false) {
			document.dForm.name.focus();
			document.dForm.name.select();
		} else if (emailable == false) {
			document.dForm.email.focus();
			document.dForm.email.select();
		} else if (emailcodeable == false) {
			document.dForm.emailcode.focus();
			document.dForm.emailcode.select();
		} else if (codecheckcommentable == false) {
			document.dForm.codecheckcomment.focus();
			document.dForm.codecheckcomment.select();
		} else if (zipcodeable == false) {
			document.dForm.zipcode.focus();
			document.dForm.zipcode.select();
		} else if (telable == false) {
			document.dForm.tel.focus();
			document.dForm.tel.select();
		} else if (birthdateable == false) {
			document.dForm.birthdate.focus();
			document.dForm.birthdate.select();
		} else if (addressable == false) {
			document.dForm.address.focus();
			document.dForm.address.select();
		} else if (addressdetailable == false) {
			document.dForm.addressdetail.focus();
			document.dForm.addressdetail.select();
		} else if (genderable == false) {
			document.dForm.gender.focus();
			document.dForm.gender.select();
		} else if (jobable == false) {
			document.dForm.job.focus();
			document.dForm.job.select();
		} else if (authorityable == false) {
			document.dForm.authority.focus();
			document.dForm.authority.select();
	//	} else {
		} 
		alert("유효성 모두 통과 함");
		if (true) {
			dForm.action = "/join/join-enda.do"; // 구매자 회원가입 기능 페이지
			dForm.submit();
			// 모든 유효성 검사를 통과한 경우에만 회원가입을 진행한다.
			/*if (jointype == "1") {
				alert("구매자 회원가입을 시도합니다.");
				
				dForm.action = "/join/join-end.do"; // 구매자 회원가입 기능 페이지
				dForm.submit();
			} else if (jointype == "2") {
				alert("판매자 회원가입을 시도합니다.");
				dForm.action = "/join/join-end.do"; // 판매자 회원가입 기능 페이지
			} else {
				alert("오류 : 구매자, 판매자 구분 불가");
			}*/
		}
	});
});