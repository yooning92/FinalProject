<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>찜한 목록</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Style CSS -->
    <link rel="stylesheet" href="style.css">
    
   
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
                    <h5>관심 목록</h5>
                    <ol class="breadcrumb">
                    <li>관심 있는 물건만 따로 모아보세요!</li>
                       <!--  <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item active">Wishlist</li> -->
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <!-- Wishlist Table Area -->
    <div class="wishlist-table section_padding_100 clearfix">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="cart-table wishlist-table">
                        <div class="table-responsive">
                            <table class="table table-bordered mb-30">
                                <thead>
                                    <tr>
                                        <th scope="col"><i class="icofont-ui-delete"></i></th>
                                        <th scope="col">상품</th>
                                        <th scope="col">제목</th>
                                        <th scope="col">가격</th>
                                        <th scope="col">상태</th>
                                     <!--    <th scope="col"></th> -->
                                    </tr>
                                </thead>
                                <tbody>
                                   
                                  <c:forEach items="${wishList}" var="wish">
                                 
                                    
                                    <tr>
                                        <th scope="row">
<%--                                         	<input type="hidden" id="wishDelete=${wish.wishlist_no}" value="${wish.wishlist_no}">
 --%>                                            <a id="wishDeleteA=${wish.wishlist_no}" ><i class="icofont-close"></i></a>
                                        </th>
                                        <td>
                                        
                                         
                                         
                                        <c:choose>
	                                        <c:when test="${!empty wish.product.productImagesList[0].pi_name}">
		                                        <c:set var = "image_name" value = "${wish.product.productImagesList[0].pi_name}"/>
	                                        	<c:choose>
		                                        <c:when test="${fn:startsWith(image_name, 'http')}">
		                                        	<img src="${wish.product.productImagesList[0].pi_name}" alt="Product_http_image">
			                                    </c:when>
		                                        <c:otherwise>                                                                                       
	                                        	<img src="img/product_img/${wish.product.productImagesList[0].pi_name}" alt="Product">
		                                        </c:otherwise>
	                                        </c:choose>  
	                                        </c:when>
	                                        <c:otherwise>                                                                                       
	                                        	<img src="img/chat-img/logo_carrot.png" alt="Product_nothing">
	                                        </c:otherwise>
                                        </c:choose>  
                                            
                                            
                                            
                                        </td>
                                        <td>
                                            <a href="product_detail?p_no=${wish.product.p_no}"> ${wish.product.p_title} </a>
                                        </td>
                                        <td>${wish.product.p_price}</td>
                                        <td>
                                            <div class="quantity">
                                            <c:choose>
                                            <c:when test="${wish.product.p_sell eq 1}">
                                            판매중
                                            </c:when>
                                            <c:when test="${wish.product.p_sell eq 2}">
                                            예약중
                                            </c:when>
                                            <c:when test="${wish.product.p_sell eq 3}" >
                                            판매완료
                                            </c:when>
                                            
                                            </c:choose>
                                            
<!--                                                 <input type="number" class="qty-text" id="qty6" step="1" min="1" max="99" name="quantity" value="1">
 -->                                            </div>
                                        </td>
                                      <!--   <td><a href="#" class="btn btn-primary btn-sm">Add to Cart</a></td> -->
                                    </tr>
                                    
                                    </c:forEach>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="cart-footer text-right">
                        <div class="back-to-shop">
                           <!--  <a href="#" class="btn btn-primary">Add All Item</a> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Wishlist Table Area -->

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
	<script type="text/javascript" src="js/user/UserHtmlContents.js"></script>
	<script type="text/javascript" src="js/common/CommonHtmlContents.js"></script>
	<script type="text/javascript" src="js/common/user_session_check.js"></script>
	<script type="text/javascript" src="js/product/wishList.js"></script>
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