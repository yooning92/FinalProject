<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드</title>

<!-- javaScript -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>

	<h3>파일 업로드 POST 요청: Multipart 인코딩</h3>
	<p>
		입력폼의 method를 POST으로 지정하고,<br> enctype 속성의 값을 multipart/form-data로
		설정합니다.
	</p>
	<form name="fileForm" action="requestupload2" method="post" enctype="multipart/form-data">
		<input multiple="multiple" type="file" name="file" />
		<input type="text" name="src" />
		<input type="submit" value="전송" />
	</form>
	
	
	<form id="image_form"  name="image_form" 
		enctype="multipart/form-data">
		사진1: <input multiple="multiple" type="file" name="files" id="chooseF"><br> 
		사진2: <input type="file" name="files"><br> 
		사진3: <input type="file" name="files"><br> 
		사진4: <input type="file" name="files"><br> 
		설명:
		<textarea name="description" cols="50" rows="3"></textarea>
	</form>
		<br> <input id="btn_submit" type="submit" value="추가"><br>
	<hr>
	<div class="image-show" id="image-show"></div>
<script type="text/javascript">
$(function() {
	console.log(0);
	$(document).on('submit', '#image_form',function(e){
		console.log(e.target.id);
		console.log(1111);
		const formData = new FormData($('#image_form')[0]);
		//formData.append('attachment', $('[name="files"]').files[0]);
		console.log(2222);
		 $.ajax({
			url:'upload',
			type:'POST',
			processData:false,	//파일전송시 반드시 false
			contentType:false,
			data:formData,
			success:function(jsonResult){
				 console.log('성공!!');
			}
		 });  
		 console.log(3333);
		e.preventDefault();
	   
	});
	
	 function showImage() { 
		$('#image-show:last-child').css("visibility","visible");
		$('#image-upload').css("visibility","hidden");
		$('#fileName').text("");
		console.log('showImage() function 실행!!');
	}
	
	//이미지가 업로드 되면
	$(document).on('change','#chooseF',function(e){

		console.log($('input[type=file]')[0].files[0]);	//파일정보
		console.log($('input[type=file]')[0].files[0].name);	//파일이름

		loadFile($('input[type=file]')[0]);	//첫번째 파일 로드
		
		e.preventDefault();
	});
	
	//화면에 load하기 위해 img태그 만들어서 삽입
	function loadFile(input) {
		var file = input.files[0];
		
	    var name = input.files[0].name;

	    var newImage = document.createElement("img");
	    newImage.setAttribute("class", 'img');

	    newImage.src = URL.createObjectURL(file);   

	    newImage.style.width = "70%";
	    newImage.style.height = "70%";
	    //newImage.style.visibility = "hidden";   //버튼을 누르기 전까지는 이미지 숨기기
	    newImage.style.objectFit = "contain";

	    var container = document.getElementById('image-show');
	    container.appendChild(newImage);
	}
	
	
});
</script>
</body>
</html>
