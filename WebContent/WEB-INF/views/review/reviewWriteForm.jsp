<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기</title>

<!-- js -->
<script src = "/js/jquery-3.4.1.js"></script>
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
 			$('.dropify').dropify(); //파일 업로드
			
			
		}// ready function
	);//ready
	
	function reviewinput(){
		if($("input[name=servRoot]").val()==null || $("input[name=servRoot]").val() == ""){
			alert("서비스 이용경로를 입력해주세요.");
			$("input[name=servRoot]").focus();
			return false;
		}else if($("input[name=title]").val()==null || $("input[name=title]").val() == ""){
			alert("제목을 입력해주세요.");
			$("input[name=title]").focus();
			return false;
		}else if($("textarea[name=content]").val()==null || $("textarea[name=content]").val() == ""){
			alert("후기내용을 입력해주세요.");
			$("textarea[name=content]").focus();
			return false;
		}else if( $("input:radio[name=menuScore]:checked").length == 0 ){
			alert("음식만족도를 체크해주세요.");
			return false ;
		}else if( $("input:radio[name=priceScore]:checked").length == 0 ){
			alert("가격만족도를 체크해주세요.");
			return false ;
		}else if( $("input:radio[name=serviceScore]:checked").length == 0 ){
			alert("서비스만족도를 체크해주세요.");
			return false ;
		}else if( $("input:radio[name=recommend]:checked").length == 0 ){
			alert("지인 추천항목을 체크해주세요..");
			return false ;
		}
	}
	//-->
	
</script>
</head>
<body>

<div class="section"></div>
<div class="section"></div>

<form method="post" onsubmit="return reviewinput()" action="/review/setReview.do" enctype="multipart/form-data">

<div class="container">
	<table border="1">
		<tr>
			<th colspan="2" align="center">서비스 후기등록</th>			
		</tr>
		<tr>
			<th>서비스 형태</th>
			<td>제공받은 서비스 형태를 여기에 출력Dao(수정불가)</td>
		</tr>
		<tr>
			<th>이용 경로</th>
			<td><input type="text" name="servRoot"
			placeholder="서비스를 이용하게 된 경로를 기입해주세요. ex) 인터넷 검색, 지인추천, 광고 등">
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" placeholder="제목을 입력해주세요. (100자 이내)"></td>
		</tr>
		<tr>
			<th>후기</th>
			<td>
				<textarea style="width:290; height:100%" name="content" rows="5"
				placeholder="2000자 이내로 작성해 주세요."></textarea>
			</td>
		</tr>
	</table>
	
	<br>
	<h6>만족도 평가</h6>
	<hr color="gray">
	<div id="menu_score" class="row">
		<div class="col s12">
			<p id="food"> * 음식 만족도</p>	
			<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "menuScore" value = "1" />
		    		<span>0.0 점</span>
				</label>
	       	</div>	
			<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "menuScore" value = "1" />
		    		<span>1.0 점</span>
				</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "menuScore" value = "2" />
		    		<span>2.0 점</span>
	  			</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "menuScore" value = "3" />
		    		<span>3.0 점</span>
	  		</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "menuScore" value = "4" />
		    		<span>4.0 점</span>
	  			</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "menuScore" value = "5" />
		    		<span>5.0 점</span>
	  			</label>
	       	</div>       	
       	</div>
	</div>
	<hr color="gray">
	<div id="price_score" class="row">
		<div class="col s12">
			<p id="price"> * 가격 만족도</p>		
			<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "priceScore" value = "1" />
		    		<span>0.0 점</span>
				</label>
	       	</div>

			<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "priceScore" value = "1" />
		    		<span>1.0 점</span>
				</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "priceScore" value = "2" />
		    		<span>2.0 점</span>
	  			</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "priceScore" value = "3" />
		    		<span>3.0 점</span>
	  		</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "priceScore" value = "4" />
		    		<span>4.0 점</span>
	  			</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "priceScore" value = "5" />
		    		<span>5.0 점</span>
	  			</label>
	       	</div>       	
       	</div>
	</div>
	<hr color="gray">
	<div id="service_score" class="row">
		<div class="col s12">
			<p id="serv"> * 서비스 만족도</p>		
			<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "serviceScore" value = "1" />
		    		<span>0.0 점</span>
				</label>
	       	</div>

			<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "serviceScore" value = "1" />
		    		<span>1.0 점</span>
				</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "serviceScore" value = "2" />
		    		<span>2.0 점</span>
	  			</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "serviceScore" value = "3" />
		    		<span>3.0 점</span>
	  		</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "serviceScore" value = "4" />
		    		<span>4.0 점</span>
	  			</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "serviceScore" value = "5" />
		    		<span>5.0 점</span>
	  			</label>
	       	</div>       	
       	</div>
	</div>
	<hr color="gray">
	<div class="row">
		<div class="col s12">
			<p id="recommand"> * 지인에게 '차리다' 서비스를 추천하실 의향이 있으신가요?</p>		
			<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "recommend" value = "1" />
		    		<span>있다</span>
				</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "recommend" value = "0" />
		    		<span>없다</span>
	  			</label>
	       	</div>	       	
       	</div>
	</div>
	<hr color="gray">
	
	<div class="row">
		 <div class = "col s12">
	        <br>
	        	<p> 서비스 사진 </p>
	        	<div class = "col s4">
	        		<input name ="servicePicture1" type="file"  class="dropify" data-height="100"> 
	        	</div>
	        	<div class = "col s4">
	        		<input name ="servicePicture2" type="file"  class="dropify" data-height="100"> 
	        	</div>
	        	<div class = "col s4">
	        		<input name ="servicePicture3" type="file"  class="dropify" data-height="100"> 
	        	</div>
	       </div><br>
	       <div class = "col s12">
	        <br>
	        	<div class = "col s4">
	        		<input name ="servicePicture4" type="file"  class="dropify" data-height="100"> 
	        	</div>
	        	<div class = "col s4">
	        		<input name ="servicePicture5" type="file"  class="dropify" data-height="100"> 
	        	</div>
	        	<div class = "col s4">
	        		<input name ="servicePicture6" type="file"  class="dropify" data-height="100"> 
	        	</div>
	      </div>
	</div>
	<br>
	<hr color="gray">
	<br>
	<div>
	 <button class="btn waves-effect waves-light" type="submit"  >
    <i class="material-icons left">send</i>후기 등록하기
  	</button>
	</div>
	
	<div class="section"></div>
	<div class="section"></div>
	<div class="section"></div>	
</div>

</form>
</body>
</html>
