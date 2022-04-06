<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>clova_cfr_recognition</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- CFRecognition
입력받은 이미지로부터 얼굴을 감지하고 입력된 이미지에서 얼마나 많은 얼굴이 감지되었고 각 얼굴이
어디에 어떤 크기로 위치하며 어떤 모습을 하고 있는지 반환 -->
<script>
	$(function(){
	
		$("#uploadForm").submit(function(){
			event.preventDefault(); // submit이 발생해서 action으로 가면 안되서 기본이벤트 제거
			
			const image = $("#image")[0];
			if(image.files.length===0){ // 데이터타입과 데이터가 같을 때
				alert("파일을 선택해주세요");
				return;
			}
			
			// 선택한 파일이 있는 경우
			let url = "http://localhost:8050/cfr";
			let data = new FormData($("#uploadForm")[0]); // form 데이터가 객체로
			
			$.ajax({
				type:"post",
				dataType:"text",
				url: url, // PostMapping("/cfr")
				processData:false,
				contentType:false,
				data: data,
				success:function(data, textStatus){
					console.log('textStatus : ', textStatus);
					$("#text").val(data);
				},error:function(){
					console.log("fail");
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