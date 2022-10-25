<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Brown Carrot Market</title>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
	
	
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>
	
<script type="text/javascript">
		
	
	$(document).on('click','#TransferSubmit',function(e){
		var action = confirm("정말 송금하시겠습니까?");
		if(action){
			location.href="transfer_action?p_no="+${product.p_no}
		}else {
			alert("송금을 취소하셨습니다.");
		}
		
	});
	
	$(document).on('click','#TransferCancel',function(e){
		window.close();
	});
	</script>
<!-- 내 js -->
<script src="js/chat/chat_appointment.js"></script>

</head>
<body>
   <img src="img/core-img/logo.png" alt="logo">
<hr>
<br><br><br><br>
	<div>
		<label>상 품 명</label>
			${product.p_title}
	</div>
	<br>
  	<br>
	<div>
		<label>판매자 ID</label> 
			${product.userInfo.user_id}
  	</div>
  	<br>
  	<br>
	<div>
		<label>상품 가격</label> 
			${product.p_price}
	</div>
<br>
<br>
<br>
	
	<input type="hidden" id="chatApp_lat" value="">
	<input type="hidden" id="chatApp_lng" value="">
	
	</form>
	<br>
	<br>
		<div>
			<button type="button" id="TransferSubmit">송금하기</button>
			<button type="button" id="TransferCancel">취소</button>
		</div>
	<style type="text/css">
	
	#TransferSubmit{
	position: fixed;
    left: 0;
    bottom: 0;
    margin: 1 auto;
    width: 45%;
    height: 44px;
    display:block;
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
    padding: 0 px;
	}
	#TransferCancel{
	position: fixed;
    right: 0;
    bottom: 0;
    margin: 1 auto;
    width: 45%;
    height: 44px;
    display:inline-block;
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
    padding: 0 px;
	}
	
	#TransferSubmit:hover{
	color:orange;
	 background-color:white;
	 border-color:orange;
	 border: 2px solid ;
	}
	#TransferCancel:hover{
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
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<style>
#pop {
	position: absolute;
	z-index: 1;
	top: 0;
	width: 100%;
	height: 100%;
	display: none;
}
#pop>article {
	width: 700px;
	height: 400px;
	position: relative;
	z-index: 2;
	background: white;
	box-shadow: 3px 3px 5px black;
	margin: auto;
	cursor: pointer;
	text-align: center;
}
.black {
	background: rgba(0, 0, 0, 0.6);
} */
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
</style>
	<script>
	$(document).ready(function() {
		$("#list>button:first-of-type").click(function() {
			$("#pop").fadeIn();
			$("#pop").addClass("black");
		});
	});
	$(document).ready(function() {
		$("#list>button:last-of-type").click(function() {
			location.href="main";
		});
	});
	</script>
	<script type="text/javascript">
	function moveComplate() {
	  location.href="transfer_complate";
	  self.close();
	}
	</script>
	<script type="text/javascript">
	function moveClose() {
	  location.href="transfer_page";
	  self.close();
	}
	</script>
</head>
<body>
 <div id="pop">
			<article>
				<h1>결제</h1>
				<input type="button" value="송금" onclick="moveComplate();" />
				<input type="button" value="취소" onclick="moveClose();" />
			</article>
		</div>
	<section id="list">
		<button>송금</button>
		<button>메인으로</button>
	</section>
</body>
</html> --%>