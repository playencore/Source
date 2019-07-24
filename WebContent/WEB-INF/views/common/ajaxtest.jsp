<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
//<!--
	var params = "param1=aa&param2=bb";
	$.ajax({
	    
	    type : "post",
	    url : "/test/testApi2.do",
	    data:params,
	    dataType : "text",
	    error : function(data){
	        alert('결제 실패 : '+data.msg);
	        console.log(data);
	    },
	    success : function(data){
	     	alert(data);
	    	//alert(data.test + data.test2);
	    }     
	});
//-->
</script>
</head>
<body>
	<form action="/test/fileUpload.do" id="fileUpload" name="fileUpload" method="post" enctype="multipart/form-data"> 
		이름 : <input type="text" name="name" id="cmd" value="namevla"><br> 
		파일 : <input type="file" name="file1"><br>
		파일 : <input type="file" name="file2"><br>
		<input type="submit" value="제출"><br>
	</form>
</body>
</html>