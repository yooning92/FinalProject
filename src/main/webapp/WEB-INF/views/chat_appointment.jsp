<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>










<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약속 잡기</title>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
	
	
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>

<!-- 지도scipt -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7c7231db91ae56cfc5e3c6ea06f73c6&libraries=services,clusterer,drawing"></script>

<!-- 내 js -->
<script src="js/chat/chat_appointment.js"></script>



</head>
<body>
   <img src="img/core-img/logo.png" alt="logo">
<hr>
<br>
 <form id="chatAppDateTimeSpot">
	<div>
		<label>약속 날짜</label> 
		<p><input type="text" id="datePicker" ></p>
	</div>
	
	<br>
	
	<div>
	<label>약속 시간</label> 

  <p><input type="time" id="chatAppTime"></p>
  </div>
</form>
	
	
	<br>
	
	<div>
	<label>약속 장소</label> 
	
	
	<p>
	<div>
	<div class="textSpot">
	<input type="text" id="searchChatAppSpot" placeholder="장소를 입력하세요" >
	</div>
	<div class="btnSpot">
	<button type="button" id="btnChatAppSpot">찾기</button>
	</div>
	</div>
<br>
<br>
<br>
	
	<div id="map" style="width:300px;height:300px;"></div>
	</div>
	
	<input type="hidden" id="chatApp_lat" value="">
	<input type="hidden" id="chatApp_lng" value="">
	
	</form>
	<br>
	<br>
	
	<button type="button" id="chatAppFinalSubmit">약속 잡기!</button>
	
	
	<style type="text/css">
	
	#chatAppFinalSubmit{
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
	
	#chatAppFinalSubmit:hover{
	color:orange;
	 background-color:white;
	 border-color:orange;
	 border: 2px solid ;
	}
	
	hr{
color:orange;
border:1px solid orange;
 }
	
	
	#map{
	border-radius: 8px;
    display: block;
    margin: 0 auto;
    border: 3px solid orange;
	
	}
	
	label{
	    font-size: 15px;
    font-weight: normal;
    margin-left: 40px;
    color: #7f3808;
    text-decoration: underline;
    text-decoration-color: orange;
    text-decoration-style: wavy;
    text-underline-position: under;
    /* margin: 0 auto; */
	}
	
	input[type="time" i]{
		    border-color: orange;
    background-color: white;
    border: 2px solid orange;
    border-radius: 8px;
    padding: 4px 6px;
    display: block;
    margin: 0 auto;
		
	}
	#searchChatAppSpot{
	 border-color: orange;
    background-color: white;
    border: 2px solid orange;
    border-radius: 8px;
    padding: 4px 6px;
    width:90%;
    height:20px;
 
	}
	
	#datePicker{
	 border-color: orange;
    background-color: white;
    border: 2px solid orange;
    border-radius: 8px;
    padding: 4px 6px;
    display: block;
    margin: 0 auto;
	}
	
	.textSpot{
	width: 40%;
    float: left;
    margin-left: 27%;
	}
	
	.btnSpot{
	float:left;
	/*margin-left: 30px;*/
	}
	
	#btnChatAppSpot{
	left: 0;
    bottom: 0;
    margin: 0 auto;
    width: 100%;
    height: 33px;
    display: inline-block;
    border-radius: 20px;
    background-color: orange;
    border-color: orange;
    cursor: pointer;
    color: white;
    border: 1px solid;
    font-weight: 700;
    font-size: 10pt;
    padding: 0 14px;
	}
	
	#btnChatAppSpot:hover{
	color:orange;
	 background-color:white;
	 border-color:orange;
	 border: 2px solid ;
	}
	
</body>
</html>