<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기</title>

<!--  -->
<script src = "/js/jquery-3.4.1.js"></script>
<script src = "/js/materialize.js"></script>
<script src = "/js/dropify.js"></script>

<!-- material css-->
<link rel = "stylesheet" type = "text/css" href ="/css/nouislider.css" />
<link rel = "stylesheet" type = "text/css" href ="/css/materialize.css" />
<link rel = "stylesheet" type = "text/css" href ="/css/dropify.css" />


<script type="text/javascript">
	//<!--
	$(document).ready(
		function(){
 			$('.dropify').dropify(); //파일 업로드
			
			
		}// ready function		
	);//ready
	//-->
</script>
</head>
<body>

<div class="section"></div>
<div class="section"></div>


<div class="container">




	<table border="1">
		<tr>
			<th colspan="2" align="center">서비스 후기등록</th>			
		</tr>
		<tr>
			<th>서비스 형태</th>
			<td>제공받은 서비스 형태를 여기에 출력(수정불가)</td>
		</tr>
		<tr>
			<th>이용 경로</th>
			<td><input type="text" name="servRoot" 
			placeholder="서비스를 이용하게 된 경로를 기입해주세요. ex) 인터넷 검색, 지인추천, 광고">
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
				placeholder="2000자 이내로 작성해주세요."></textarea>
			</td>
		</tr>
	</table>
	
	<br>
	<h6>만족도 평가</h6>
	
	<div id="service_score" class="row">
		<div class="col s12">
			<p> * 음식 만족도</p>	
			<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "foodScore" value = "1" />
		    		<span>0.0 점</span>
				</label>
	       	</div>	
			<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "foodScore" value = "1" />
		    		<span>1.0 점</span>
				</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "foodScore" value = "2" />
		    		<span>2.0 점</span>
	  			</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "foodScore" value = "3" />
		    		<span>3.0 점</span>
	  		</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "foodScore" value = "4" />
		    		<span>4.0 점</span>
	  			</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "foodScore" value = "5" />
		    		<span>5.0 점</span>
	  			</label>
	       	</div>       	
       	</div>
	</div>
	
	<div id="service_score" class="row">
		<div class="col s12">
			<p> * 가격 만족도</p>		
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

	<div id="service_score" class="row">
		<div class="col s12">
			<p> * 서비스 만족도</p>		
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
	
	<div id="service_score" class="row">
		<div class="col s12">
			<p> * 지인에게 '차리다' 서비스를 추천하실 의향이 있으신가요?</p>		
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
	
</div>


</body>
</html>















