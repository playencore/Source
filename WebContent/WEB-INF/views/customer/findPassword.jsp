<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>

<script type = "text/javascript">
	//<!--
	function makeRandom(min, max){
		var RandVal = Math.floor(Math.random()*(max-min+1)) + min;
		return RandVal;
	}
	// 메일 내용
	function insertcode(authNum){
		return "인증번호는 [ "+authNum+" ] 입니다.";
	}

	function sendemail(email){
			var code = makeRandom(1000, 9999);
			$("input[name=emailcode]").val(code);	
			var content = insertcode(code);
			$.ajax({
				type : "post",
				url : "/mail/send-mail.do",
				async : false,
				data : {
					content : content,
					mail : email
				}, // HTTP 요청과 함께 서버로 보낼 데이터(URL뒤에 붙이는 내용)
				success : function(result) {
					alert("이메일이 요청 되었습니다." );
				},
				error : function(result) {
					alert("이메일 요청이 취소되었습니다. 방어벽 확인해주세요.");
				}
			});
	}
	
	function codecompare(){
		targetcode = $("input[name=emailcode]").val();
		enteredcode = $("input[name=emailcheck]").val();
		if( targetcode == enteredcode ){
			if( true ){
				$("#bt_sendemail").click(function () {return false;});
				$("#emailcheck_comment").html("<span style='color:green'>" + "인증되었습니다." + "</span>");
				$("input[name=emailkeycheck]").val("1");
				$("#email_comment").text("이메일 인증이 완료되었습니다.").css("color", "green");
				showpasswd() ;
				
			}
		}else {
			alert("인증번호가 틀렸습니다. 다시 입력해주세요.");
		}
	}
	
	function showpasswd(){
		var mem_id = $("input[name=mem_id ]").val() ;
		$.ajax(
				{
					type : "post",
					url : "/member/getpasswd.do",
					data : {
						inmem_id : mem_id
					}, 
					dataType : "json",
					success : function(data) {
						$("#resultPasswd").show();
						$("#memPasswd").html("비밀번호 : " + data.PASSWD ) ;

					},
					error : function(data) {
						alert("패스워드 찾기에 문제가 발생했습니다. 관리자에게 연락주세요.");
					}
				}
			);
	}
	
	function getEmail(mem_id){
		$.ajax({
			type : "post",
			url : "/member/getEmail.do",
			async : false,
			data : {
				mem_id : mem_id 
			}, // HTTP 요청과 함께 서버로 보낼 데이터(URL뒤에 붙이는 내용)
			success : function(result) {
				sendemail(result.EMAIL);
			},
			error : function(result) {
				alert("이메일 요청이 취소되었습니다. 관리자에게 문의해주세요.");
			}
		});
	}
	
	
	function mem_idcheckDB(){
		var mem_id = $("input[name=mem_id ]").val() ;
		if(mem_id == "" || mem_id == null){
			alert("아이디를 입력해주세요.") ;
			$("input[name=mem_id]").focus(); 
			return false ;
		}else{
			$.ajax(
					{
						type : "post",
						url : "/member/checkMem_idDB.do",
						data : {
							inmem_id : mem_id
						}, 
						dataType : "json",
						success : function(data) {
							if(data.flag == 1){
								getEmail(mem_id);
								$("#inputemail").show();
							}
							
						},
						error : function(data) {
							alert("이메일 체크에 문제가 발생했습니다. 관리자에게 연락주세요.");
						}
					}
				);
		}
	}
	
	//-->
</script>

<br><br>
<div class = "row">
	<div class = "col s2"></div>
	<div class = "col s10">
		<h4>비밀번호 찾기</h4>
		<hr size="5" color="black" width = "80%" align="left">
		<div class ="col s12">
		<p>이메일을 통해 찾습니다.</p>
			<div class = "col s8 card-panel">
				<div style = "margin :5%" id = "inputId" >
					<div class= "col s12">
						<div class="input-field col s8">
							<input name="mem_id" id="mem_id" type="text" class=""> 
							<label for="mem_id">*아이디</label>
							<span class="helper-text" id="mem_id_comment"></span>
						</div>
						<div class="col s4">
							<a class="waves-effect waves-light btn" style="margin-top: 20px"
								onclick=" mem_idcheckDB()"> 아이디확인 </a>
						</div>
					</div>
				</div>
				<div style = "display: none; margin:5%" id = "inputemail">
					<br><br>
					<div class="col s12">
						<div class="input-field col s8">
							<input type="hidden" name="emailcode" value=""> 
							<input name="emailcheck" id="emailcheck" type="text" class="">
							<label for="emailcheck">*이메일 인증번호 입력</label> 
							<span class="helper-text" id="emailcheck_comment"></span>
						</div>
						<div class="col s4">
							<a id="bt_sendemail" class="waves-effect waves-light btn"
								style="margin-top: 20px" onclick="codecompare()">인증번호 확인</a>
						</div>
					</div>
					<div class = "col s12">
						<div class = "col s8">
							<div id = "resultPasswd" style="display:none">
								<div id = "memPasswd">
									
								</div>
								<a style="margin-top:5% ; margin-bottom:5%" href="/login/loginForm.do" class="waves-effect waves-light btn">로그인하기</a>
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>