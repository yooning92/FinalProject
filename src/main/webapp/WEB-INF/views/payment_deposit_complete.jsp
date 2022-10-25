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
		
	
	/* $(document).on('click','#TransferSubmit',function(e){
		var action = confirm("정말 송금하시겠습니까?");
		if(action){
			location.href="transfer_action?p_no="+${product.p_no}
		}else {
			alert("송금을 취소하셨습니다.");
		}
		
	}); */
	
	$(document).on('click','#btn-close',function(e){
		window.close();
	});
	</script>
<!-- 내 js -->
<script src="js/chat/chat_appointment.js"></script>

</head>
<body>
   <img src="img/core-img/logo.png" alt="logo">
<hr>
<br>
	<div>
		<h1>포인트 충전 성공</h1>
		<h3>포인트 충전을 성공하였습니다.</h3>
		<br>
		<hr>
		<br><br>
		<h4>충전 포인트 : <label>${payment_amount} 포인트</label></h4>
		<br><br>
		<h4>현재 포인트 잔액 : <label>${userInfo.user_point} 포인트</label></h4>
	</div>
	<div>
	</div>
<%-- 	<br>
  	<br>
	<div>
		<label>판매자 ID</label> 
			${product.userInfo.user_id}
  	</div>
  	<br>
  	<br>
	<div>
		<label>구매 상품 금액</label> 
			${product.p_price}
	</div> --%>
<br>
<br>
<br>
	
	<input type="hidden" id="chatApp_lat" value="">
	<input type="hidden" id="chatApp_lng" value="">
	
	</form>
	<br>
	<br>
		<div>
			<button type="button" id="btn-close">팝업 닫기</button>
		</div>
	<style type="text/css">
	
	
	#btn-close{
	position: absolute;
	left: 25%;
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
	
	}
	#btn-close:hover{
	color:orange;
	 background-color:white;
	 border-color:orange;
	 border: 2px solid ;
	}
	
	hr{
	color:orange;
	border:1px solid orange;
	 }
	
	}
	
	h1{
		color: #7f3808;	
		text-align: center;
	}
	
	h3{
		color: #7f3808;
		text-align: center;
	}
	h4{
		color: #7f3808;
		text-align: center;
	}
	
	label{
	font-size: 15px;
    font-weight: normal;
    color: #7f3808;
    text-decoration: underline;
    text-decoration-color: orange;
    text-decoration-style: wavy;
    text-underline-position: under;
    /* margin: 0 auto; */
	}

</body>
</html>
