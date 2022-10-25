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
    <title>판매 내역</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Style CSS -->
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/user.css">
    
    <!-- toast -->
 <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
   

     <!-- javaScript -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="js/common/user_session_check.js"></script>
	<script type="text/javascript" src="js/common/CommonHtmlContents.js"></script>
	<script type="text/javascript" src="js/review/review.js"></script>
	<script type="text/javascript" src="js/sells/sell_list.js"></script>
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>  
  


	<!-- 탭 기능 자바스크립트 -->
	
	
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
                    <h5>판매내역</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="main">Home</a></li>
                        <li class="breadcrumb-item">거래내역</li>
                        <li class="breadcrumb-item active">판매내역</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Tab ready -->
    <div class="container">
    <div class="row">
    <div class="col-12">
    <div class="product_details_tab section_padding_100_0 clearfix">
    <!-- tabs -->
    <ul class="nav nav-tabs" role="tablist" id="product-details-tab">
         <li class="nav-item">
             <a href="#" class="nav-link active" onclick="sellStatus(0)" data-toggle="tab" role="tab">전체 내역</a>
          </li>
          <li class="nav-item">
             <a href="#" class="nav-link" onclick="sellStatus(1)" data-toggle="tab" role="tab">판매중</a>
          </li>
          <li class="nav-item">
             <a href="#" class="nav-link" onclick="sellStatus(2)" data-toggle="tab" role="tab">예약중</a>
          </li>
          <li class="nav-item">
             <a href="#" class="nav-link" onclick="sellStatus(3)" data-toggle="tab" role="tab">거래 완료</a>
          </li>
    </ul>
    <!-- tab content -->
    <div class="tab-content">
    <div role="tabpanel" class="tab-pane fade show active" id="all">
    <div class="description_area">
    <!-- Cart Area -->
	    <div class="cart_area section_padding_100_70 clearfix">
	        <div class="container">
	            <div id="container_contents" class="row justify-content-between">
	                <div class="col-12">
	                    <div class="cart-table">
	                        <div class="table-responsive">
	                           
	                           
	                           
	                            <table class="table table-bordered mb-30">
	                                <thead>
	                                    <tr>
	                                       
	                                        <th scope="col">판매일자</th>
	                                        <th scope="col">상품 이미지</th>
	                                        <th scope="col">상품 이름</th>
	                                        <th scope="col">상품 가격</th>
	                                        <th scope="col">판매상태</th>
	                                        <th scope="col">후   기</th>
	                                    </tr>
	                                </thead>
	                <!-- 시작? --> 
	                                <tbody id="sell_list_start">
	                                
									    <c:forEach items="${productList}" var="product" varStatus="status">
		                                    <tr>
		                                       
		                                        <td>
				                                    <input type="hidden" class="" name="p_no_${status.index}" value="${product.p_no}" >
		                                        	<c:set var="product_date" value="${product.p_date}"/>
		                                        	${fn:substring(product_date,0,10)}
		                                        </td>
		                                        <td>
		                                        	<c:set var = "image_name" value = "${product.productImagesList[0].pi_name}"/>
			                                        <c:choose>
														<c:when test="${fn:startsWith(image_name, 'http')}">
				                                            <img src="${product.productImagesList[0].pi_name}" >
				                                        </c:when>
														<c:otherwise>
				                                            <img src="img/product_img/${product.productImagesList[0].pi_name}" onerror="this.src='img/user_profile/newCarrot.jpg'">
														</c:otherwise>
													</c:choose>
		                                        </td>
		                                        <td>
		                                            <a href="product_detail?p_no=${product.p_no}">${product.p_title}</a>
		                                        </td>
		                                        <td>
		                                        	${product.p_price} 원
		                                        </td>
		                                        <td>
		                                        	<c:if test="${product.p_sell eq 1}">
		                                        		<c:out value="판매중"></c:out>
		                                        	</c:if>
		                                        	<c:if test="${product.p_sell eq 2}">
		                                        		<c:out value="예약중"></c:out>
		                                        		
		                                        	</c:if>
		                                        	<c:if test="${product.p_sell eq 3}">
		                                        		<c:out value="판매완료"></c:out>
		                                        	</c:if>
		                                        </td>
		                                        <td>
		                                          	<div id="sell_list">
		                                            <script>check_isExisted_orders($('input[name=p_no_${status.index}]').val())</script>
		                                            <a href="#" class="badge ${product.p_no}" id="" seller_id="" p_title="${product.p_title}" style="height:20px;font-size:1rem"></a>
		                                            </div>
		                                        </td>
		                                    </tr>
										</c:forEach> 
										 
	                                </tbody>
	                            </table>
									</div>	
	                        </div>
	                        <!-- 끝? -->
	                        
	                        
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    </div>
	    </div>
	    </div>
	    </div>
	    </div>
	    </div>
	 
	    
    <!-- Cart Area End -->

    <!-- Footer Area -->
   	<jsp:include page="common/include_common_footer.jsp"/>
    <!-- jQuery (Necessary for All JavaScript Plugins) -->
    <%-- <script src="js/jquery.min.js"></script> --%>
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