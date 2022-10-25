<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Brown Carrot Market</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Style CSS -->
	<link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/user.css">
	
		<!-- toast -->
 <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
   
	
	
	
	
</head>

<body>
    <!-- Preloader -->
    <div id="preloader">
        <div class="spinner-grow" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>

    <!-- Header Area -->
    <jsp:include page="common/include_common_header.jsp"/>
    <!-- Header Area End -->
    
    <!-- Breadcumb Area -->
    <div class="breadcumb_area">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <h5>흙당근페이</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item active">페이내역</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Checkout Steps Area -->
    <div class="checkout_steps_area">
		<a href="/brown_carrot_market/payment_deposit"><i class="icofont-check-circled"></i> 페이 충전</a> 
		<a class="active" href="/brown_carrot_market/point_list"><i class="icofont-check-circled"></i> 페이 내역</a> 
		<a href="/brown_carrot_market/payment_withdraw"><i class="icofont-check-circled"></i> 페이 출금</a>
	</div>
    <!-- Checkout Area End -->
    
    <!-- Breadcumb Area -->
    <div class="shortcodes_area section_padding_100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="shortcodes_title mb-30">
                    </div>
                    <div class="shortcodes_content">
                        <div class="table-responsive">
                            <table class="table mb-0 table-bordered" name="list">
                                <thead>
                                    <tr>
                                        <th scope="col">입 / 출금일</th>
                                        <th scope="col">입금액</th>
                                        <th scope="col">출금액</th>
                                        <th scope="col">잔 액</th>
                                        <th scope="col">비 고</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${transferList}" var="transfer">
	                                    <tr>
	                                        <td>${transfer.transfer_date}</td>
	                                        <td>${transfer.transfer_deposit}</td>
	                                        <td>${transfer.transfer_withdraw}</td>
	                                        <td>${transfer.t_balance}</td>
	                                        <td>
	                                        	<c:choose>
 	                                        		<c:when test="${transfer.orders.orders_no > 0}">
	 	                                        		<c:choose>
	 	                                        			<c:when test="${transfer.transfer_deposit == 0}">
	 	                                        				송금
	 	                                        			</c:when>
	 	                                        			<c:otherwise>
	 															입금	                                        				
	 	                                        			</c:otherwise>
	 	                                        		</c:choose>
 	                                        		</c:when>
	 	                                        	<c:otherwise>
	 	                                        	<c:choose>
	 	                                        			<c:when test="${transfer.transfer_withdraw != 0}">
	 	                                        				포인트 출금
	 	                                        			</c:when>
	 	                                        			<c:otherwise>
	 															포인트 충전                                       				
	 	                                        			</c:otherwise>
	 	                                        		</c:choose>
	 														                                        				
	 	                                        	</c:otherwise>
 	                                        	</c:choose>
	                                        </td>
	                                    </tr>
                                   </c:forEach> 
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	

    <!-- Footer Area -->
	<jsp:include page="common/include_common_footer.jsp"/>
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
    
    <!-- javaScript -->
<%-- 	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script> --%>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="js/common/user_session_check.js"></script>
	<script type="text/javascript" src="js/common/CommonHtmlContents.js"></script>
	<script type="text/javascript" src="js/user/UserHtmlContents.js"></script>
	
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>  
	
<style type="text/css">
#toast-container > .toast {
    background-image: none !important;
}

 #toast-container > .toast:before {
    position: relative;
    font-family: FontAwesome;
    font-size: 24px;
    line-height: 18px;
    float: left;
    color: #FFF;
    padding-right: 0.5em;
    margin: auto 0.5em auto -1.5em;
}       
    #toast-container > .toast-warning:before {
     content: "\f27a"; 
 
} 

 #toast-container > .toast-success:before {
     content: "\f2b5"; 
 
} 
</body>

</html>