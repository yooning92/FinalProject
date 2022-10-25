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
	
	
 <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css"> -->
<%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> --%>
<%-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script> --%>
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
</head>
<body>
   <img src="img/core-img/logo.png" alt="logo">
<hr>
<br>
	<div>
		<h1>포인트 충전 취소</h1>
		<h3>포인트 충전이 취소 되었습니다.</h3>
		<br>
		<hr>
		<br>
		<!-- 
		<h4>상품 가격 : <label>${product.p_price}</label></h4>
		-->
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
	
	.textSpot{
	width: 40%;
    float: left;
    margin-left: 27%;
	}
	
	.btnSpot{
	float:left;
	/*margin-left: 30px;*/
	}
	
</body>
</html>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title  -->
<title>Brown Carrot Market</title>

<!-- Favicon  -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Style CSS -->
<link rel="stylesheet" href="style.css">

</head>

<body>
	<!-- Preloader -->
	<div id="preloader">
		<div class="spinner-grow" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>

	<!-- Header Area -->
	<jsp:include page="common/include_common_header.jsp" />
	<!-- Header Area End -->

	<!-- Breadcumb Area -->
	<div class="breadcumb_area">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<h5></h5>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Home</a></li>
						<li class="breadcrumb-item active">Checkout</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcumb Area -->

	<!-- Checkout Area -->
	<div class="checkout_area section_padding_100">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="order_complated_area clearfix">
						<h5>송금 완료</h5>
						<p>상 품 명 : ${product.p_title}</p>
						<p class="orderid mb-0"> ${product.userInfo.user_id}님께 ${product.p_price}포인트가 송금 되었습니다.</p>
						<div class="col-12">
							<div class="checkout_pagination mt-50">
								<button class="btn btn-primary" onclick="location.href = 'orders_list'">구매내역</button>
								&emsp;
								<button class="btn btn-primary" onclick="location.href = 'main'">메인으로</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Checkout Area End -->

	<!-- Footer Area -->
	<jsp:include page="common/include_common_footer.jsp" />
	<!-- Footer Area -->

	<!-- jQuery (Necessary for All JavaScript Plugins) -->
	<script src="js/jquery.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.min.js"></script>
	<script src="js/default/classy-nav.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/default/scrollup.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/jquery.countdown.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jarallax.min.js"></script>
	<script src="js/jarallax-video.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/default/active.js"></script>
</body>
</html> --%>