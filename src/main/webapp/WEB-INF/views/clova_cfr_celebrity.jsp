<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>clova_cfr_celebrity</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(function(){
		$("#uploadForm").submit(function(){
			event.preventDefault();
			let data = new FormData($("#uploadForm")[0]); // 폼이 한 개 밖에 없어서
			$.ajax({
				type:"post",
				dataType:"text",
				url:"/cfrCelebrity",
				processData:false,
				contentType:false,
				data:data,
				success:function(result){
					$("#text").val(result);
				}
			});
		});
	});
</script>
</head>
<body>
<form method="post" id="uploadForm" enctype="multipart/form-data" >
	이미지 선택 : <input type="file" id="image" name="image"/><br/>
	<button>확인</button>
</form><br/>
<textarea id="text" rows="10" cols="100"></textarea>
</body>
</html>