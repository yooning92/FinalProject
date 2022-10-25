<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채팅 사진 전송</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
<script src="js/chat/chat_photo.js"></script>

</head>
<body>
<img src="img/core-img/logo.png" alt="logo">
<hr>
<!-- <h5>사진 전송</h5> -->
<p></p>
<br>
<form action="upload" method="post"
		enctype="multipart/form-data" id="chat_image_form">
		<label for="img_choose">
      <div class="chat_pic_upload">사진 업로드</div>
       </label>
		<input type="file" name="files" id="img_choose"  ><br> 
	
		<input type="submit" value="전송하기" id="btnchatImgSubmit"><br>
	</form>

<style type="text/css">

hr{
color:orange;
border:1px solid orange;
}

#img_choose {
display:none;
/* margin: 0 auto;
text-align:center;
	display:block;
	cursor:pointer; */
}


.chat_pic_upload{
    width: 150px;
    background: orange;
    border: 1px solid orange;
    border-radius: 15px;
    font-weight: 800;
    color: floralwhite;
    font-size: 16px;
    cursor: pointer;
    display: block;
    text-align: center;
    margin: 0 auto;
    justify-content: center;
    padding: 15px 24px;
  
}

.chat_pic_upload:hover{
	color:orange;
	background-color:white;
	 border-color:white;
	 border: 2px solid ;
}

#btnchatImgSubmit{
position: fixed;
    left: 0;
    bottom: 0;
    margin: 0 auto;
    width: 100%;
    height: 44px;
    display: block;
    /* text-align: center; */
    /* position: relative; */
    border-radius: 8px;
    background-color: orange;
    border-color: orange;
    cursor: pointer;
    color: white;
    border: 1px solid;
    font-weight: 700;
    font-size: 14pt;
    padding: 0 24px;
}

#btnchatImgSubmit:hover{
	color:orange;
	 background-color:white;
	 border-color:orange;
	 border: 2px solid ;
}

</style>
</body>
</html>