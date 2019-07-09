<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차리다</title>
<!--  -->
<script src = "/js/jquery-3.4.1.js"></script>
<script src = "/js/nouislider.js"></script>
<script src = "/js/materialize.js"></script>
<script src = "/js/dropify.js"></script>

<!-- material css-->
<link rel = "stylesheet" type = "text/css" href ="/css/nouislider.css" />
<link rel = "stylesheet" type = "text/css" href ="/css/materialize.css" />
<link rel = "stylesheet" type = "text/css" href ="/css/dropify.css" />
<!-- icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script type="text/javascript">
//<!--
 	$(document).ready(
 		function(){
 			$("input:hidden[name=mem_id]").val("test") ;
 			$("input[name=regist_num]").on(
 				"keyup",
 				function( event ){
 					var regist_num = $("input[name=regist_num]").val() ;
 					$.ajax(
 						{
 							type : "POST",
 							url: "/joinUser/checkRegist_num.do",
 							data : {"regist_num" : regist_num },
 							dataType:"json",
 							success:function(data){
 								$("#supplierlicensNumval").html(data.result).attr("style",data.color) ;
 							},
 							error: function(data){
 								$("#supplierlicensNumval").html("다시 시도해주세요.").attr("style","color:red") ;
 							}
 						}		
 					);
 				}
 			); // 업체넘버 중복 방지 ajax
 			
 			var slider = document.getElementById('test-slider');
 			  noUiSlider.create(slider, {
 			   start: [20, 80],
 			   connect: true,
 			   step: 1,
 			   orientation: 'horizontal', // 'horizontal' or 'vertical'
 			   range: {
 			     'min': 0,
 			     'max': 100
 			   },
 			   format: wNumb({
 			     decimals: 0
 			   })
 			  }); // range
 			  
 			 slider.noUiSlider.on('update', function(values, handle) {
 			    // value for updated handle is in values[handle]
 			   	$("input[name=minimum_seating]").val(values[0]);
 			 	$("input[name=maximum_seating]").val(values[1]);
 			});
 			  
 			$('.dropify').dropify(); //파일 업로드
 			
 			
 		}//ready function	
 	);//ready
 	
 	function supplierinput(){
			if( $("input[name=name]").val() == null || $("input[name=name]").val() == ""   ){
				 alert( "업체명을 입력해주세요." ) ;
				 $("input[name=name]").focus() ;
				return false;
			}else if( $("#supplierlicensNumval").css("color") !="rgb(0, 128, 0)" ){
				alert("사업자 번호를 확인해주세요.") ;
				$("input[name=regist_num]").focus() ;
				return false ;
			}else if( $("input:checkbox[name=serviceCategory]:checked").length == 0 ){
				alert("서비스 가능한 형태를 하나 이상 체크해주세요.");
				$("#sc").focus();
				return false ;
			}else if( $("input:checkbox[name=foodCategory]:checked").length == 0 ){
				alert("서비스 가능한 음식 카테고리를 하나 이상 체크해주세요.");
				$("#fc").focus();
				return false ;
			}else if( $("input:checkbox[name=serviceLocation]:checked").length == 0 ){
				alert("서비스 가능한 지역을 하나 이상 체크해주세요.");
				$("#sl").focus();
				return false ;
			}else if( $("input:file[name=cert_file_id]").val() =="" || $("input:file[name=cert_file_id]").val() == null  ){
				alert("사업자 등록증을 입력해주세요") ;
				return false ;
			}
		}
 	
//-->
</script>


</head>

<body class = "grey lighten-2">
	<br><br>
	<div class ="row">
		<div class = "col s12">
			<div class = "col s4"></div>
			<div class = "col s4 card-panel">
			<p class ="header">&nbsp;&nbsp;&nbsp;회원가입</p>
				<form name = "joinSupplierInput"  method = "post" action = "/joinUser/joinSupplierPro.do" onsubmit = "return supplierinput()" >
					<input type = "hidden" value = "0"  name ="mem_id">
					<div class = "col s12">
						<div class="input-field col s12">
				          <input name="name" id="name" type="text" class="validate">
				          <label for="name">*업체 이름</label>
				          <span class="helper-text" id="name"></span>
				        </div>
			        </div>
			        <div class = "col s12">
						<div class="input-field col s12">
				          <input name="regist_num" id="regist_num" type="number" class="validate" placeholder="-를 제외한 숫자만 입력해주세요.">
				          <label for="regist_num">*사업자번호</label>
				          <span class="helper-text" id="supplierlicensNumval"></span>
				        </div>
			        </div>
			        <div class = "col s12">
						<div class="input-field col s12">
				        	<textarea name="explanation" id="explanation" class="validate materialize-textarea" row = "2"></textarea>
          					<label for="explanation">업체 소개</label>
          					<span class="helper-text" id="supplierInfoval"></span>
				        </div>
			        </div>
			        
			         <div class = "col s12 ">
			         	<p> 서비스 가능 인원 범위 </p>
			         	<br>
			         	<div id="test-slider" class = "col s12"></div>
						<div class="input-field col s6">
							<input type="text" name="minimum_seating"   value="1"  class="validate center-align" readOnly >
				          	<label for="minimum_seating"></label>
				          	<span class="helper-text">*최소수용인원</span>
				          	
				        </div>
				        <div class="input-field col s6">
							<input name="maximum_seating"  type="text" class="validate center-align" readOnly >
				          	<label for="maximum_seating"></label>
				          	<span class="helper-text" >*최대수용인원</span>
				        </div>
			        </div>
			        
			        <div class = "col s12">
			        <p> 사업자 등록증 </p>
					      <input name ="cert_file_id" type="file"  class="dropify" data-height="100"> 
			        </div>
			        
			        <div class = "col s12">
			        <br>
			        	<p> 업체 소개 사진</p>
			        	<div class = "col s4">
			        		<input name ="supplierInfoFile1" type="file"  class="dropify" data-height="100"> 
			        	</div>
			        	<div class = "col s4">
			        		<input name ="supplierInfoFile2" type="file"  class="dropify" data-height="100"> 
			        	</div>
			        	<div class = "col s4">
			        		<input name ="supplierInfoFile3" type="file"  class="dropify" data-height="100"> 
			        	</div>
			        </div>
			        <div class = "col s12 row">
			        <br>
			        	<p id ="sc" >가능한 서비스 형태</p>
			        	<div class = "col s6">
			        		<label>
        						<input type="checkbox" name = "serviceCategory" value = "ST00000001" />
        						<span>뷔페/케이터링</span>
      						</label>
			        	</div>
			        	<div class = "col s6">
			        		<label>
        						<input type="checkbox" name = "serviceCategory" value = "ST00000002" />
        						<span>코스음식</span>
      						</label>
			        	</div>
			        	<div class = "col s6">
			        		<label>
        						<input type="checkbox" name = "serviceCategory" value = "ST00000003" />
        						<span>드랍오프</span>
      						</label>
			        	</div>
			        	<div class = "col s6">
			        		<label>
        						<input type="checkbox" name = "serviceCategory" value = "ST00000004" />
        						<span>도시락</span>
      						</label>
			        	</div>
			        </div>
			        <div class = "col s12 row">
			        	<p id ="fc">음식 카테고리</p>
			        	<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "FT00000001" />
        						<span>한정식</span>
      						</label>
			        	</div>
			        	<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "FT00000002" />
        						<span>핑거푸드</span>
      						</label>
			        	</div>
      					<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "FT00000003" />
        						<span>웨스턴</span>
      						</label>
			        	</div>
			        	<div class = "col l4 m2 s4">
			        		<label>
		      					<input type="checkbox" name = "foodCategory" value = "FT00000004" />
		      					<span>일식</span>
		    				</label>
			        	</div>
			        	<div class = "col l4 m4 s4">
			        		<label>
		      					<input type="checkbox" name = "foodCategory" value = "FT00000005" />
		      					<span>디저트류</span>
		    				</label>
			        	</div>
		    			<div class = "col l4 m4 s4">
			        		<label>
		      					<input type="checkbox" name = "foodCategory" value = "FT00000006" />
		      					<span>커피/음료</span>
		    				</label>
			        	</div>
			        	<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "FT00000007" />
        						<span>칵티일/와인</span>
      						</label>
			        	</div>
			        	<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "FT00000008" />
        						<span>피자</span>
      						</label>
			        	</div>
      					<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "FT00000009" />
        						<span>아시안퓨전</span>
      						</label>
			        	</div>
			        	<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "FT00000010" />
        						<span>베지터리안</span>
      						</label>
			        	</div>
			        	<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "FT00000011" />
        						<span>바베큐파티</span>
      						</label>
			        	</div>
      					<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "FT00000012" />
        						<span>기타</span>
      						</label>
			        	</div>
			        </div>
			         <div class = "col s12 row">
			        	<p id = "sl">서비스 가능지역</p>
			        	<div class = "col s4">
			        		<label>
        						<input type="checkbox" name = "serviceLocation" value = "SLT0000001" />
        						<span>서울특별시</span>
      						</label>
			        	</div>
			        	<div class = "col s4">
			        		<label>
        						<input type="checkbox" name = "serviceLocation" value = "SLT0000002" />
        						<span>경기도</span>
      						</label>
			        	</div>
			        	<div class = "col s4">
			        		<label>
        						<input type="checkbox" name = "serviceLocation" value = "SLT0000003" />
        						<span>충청도</span>
      						</label>
			        	</div>
			        	<div class = "col s4">
			        		<label>
        						<input type="checkbox" name = "serviceLocation" value = "SLT0000004" />
        						<span>경상도</span>
      						</label>
			        	</div>
			        	<div class = "col s4">
			        		<label>
        						<input type="checkbox" name = "serviceLocation" value = "SLT0000005" />
        						<span>전라도</span>
      						</label>
			        	</div>
			        	<div class = "col s4">
			        		<label>
        						<input type="checkbox" name = "serviceLocation" value = "SLT0000006" />
        						<span>강원도</span>
      						</label>
			        	</div>
			        	<div class = "col s4">
			        		<label>
        						<input type="checkbox" name = "serviceLocation" value = "SLT0000007" />
        						<span>제주도</span>
      						</label>
			        	</div>
			        </div>
			       	 	 <button class="btn waves-effect waves-light" type="submit"  >
    						<i class="material-icons left">send</i>
    						판매자회원가입
  						</button>
  					<br>
  					<br>
				</form>
					
					
			</div> <!-- 여기까지 -->
		</div>
	</div> <!--  form  -->
</body>
</html>



