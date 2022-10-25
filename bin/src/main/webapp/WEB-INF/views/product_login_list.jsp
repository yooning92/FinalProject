<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>동네물건</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Style CSS -->
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/product.css">
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
    <!-- include_common_bottom.jsp start-->
	<jsp:include page="common/include_common_header.jsp"/>
	<!-- include_common_bottom.jsp end-->
    <!-- Header Area End -->
	
    <!-- Quick View Modal Area -->
    
    <!-- Quick View Modal Area -->

    <!-- Breadcumb Area -->
    <div class="breadcumb_area">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <h5>동네물건</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">흙당근마켓</a></li>
                        <li class="breadcrumb-item active">동네물건</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <!-- Shop List Area -->
    <section class="shop_list_area section_padding_100">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-4 col-xl-3">
                    <div class="shop_sidebar_area">
                        <!-- Single Widget -->
           		 <div class="widget-area catagory_section mb-30">
                        <div id = "product_category_list">
                            <h6>Product Categories</h6>
                            <ul>
                              <li>
                              
	                              
	                             <input type="hidden" class="productCtgrNo" name="p_ctgr_no1" value=1>
	                              <a href="#" onclick="changeProductList(1,1)" style="font-weight: normal">- 가전제품</a>
                              </li>
                              <li>
                              		<input type="hidden" class="productCtgrNo" name="p_ctgr_no2" value=1>
	                              <a href="#" onclick="changeProductList(1,2)" style="font-weight: normal" >- 가구</a>
                              </li>
                              <li>
                              	  <input type="hidden" class="productCtgrNo" name="p_ctgr_no3" value=1>
	                              <a href="#" onclick="changeProductList(1,3)" style="font-weight: normal">- 의류</a>
                              </li>
                              <li>
                              	  <input type="hidden" class="productCtgrNo" name="p_ctgr_no4" value=1>
	                              <a href="#" onclick="changeProductList(1,4)" style="font-weight: normal">- 생활용품</a>
                              </li>
                              <li>
                              	  <input type="hidden" class="productCtgrNo" name="p_ctgr_no5" value=1>
	                              <a href="#" onclick="changeProductList(1,5)" style="font-weight: normal">- 취미/게임/음반/도서</a>
                              </li>
                              <li>
                              	  <input type="hidden" class="productCtgrNo" name="p_ctgr_no6" value=1>
	                              <a href="#" onclick="changeProductList(1,6)" style="font-weight: normal">- 기타</a>
                              </li>
                             
                                
                               
                            </ul>
                        </div>
                    </div>

                        <!-- Single Widget -->
                        


                        <!-- Single Widget -->
                        

                        <!-- Single Widget -->
                        

                        <!-- Single Widget -->
                        

                        <!-- Single Widget -->
                        
                    </div>
                </div>

                <div class="col-12 col-md-8 col-xl-9">
                    <!-- Shop Top Sidebar -->
                    <div class="shop_top_sidebar_area d-flex flex-wrap align-items-center justify-content-between">
                        <div class="view_area d-flex">
                            <!--  
                            <div class="grid_view">
                                <a href="shop-grid-left-sidebar.html" data-toggle="tooltip" data-placement="top" title="Grid View"><i class="icofont-layout"></i></a>
                            </div>
                            <div class="list_view ml-3">
                                <a href="shop-list-left-sidebar.html" data-toggle="tooltip" data-placement="top" title="List View"><i class="icofont-listine-dots"></i></a>
                            </div>
                            -->
                        </div>
                        <div class="col-12 text-right">
                        <input type="button" class="btn btn-primary mb-1" value="내 물건 팔기" onClick="productCreateForm();"/>
                    	</div>
                    </div>

                    <div class="shop_list_product_area">
                        <div class="row">
                            
                            <!-- Single Product -->
						
						<c:forEach items="${productLoginList.itemList}" var="product">
                            <div class="col-12">
                                <div class="single-product-area mb-30">
                                    <div class="product_image">
                                        <!-- Product Image -->
                                    <c:choose>
                                    <c:when test="${!empty product.productImagesList[0].pi_name}">   
                                   <c:set var = "image_name" value = "${product.productImagesList[0].pi_name}"/>
                                   <c:choose>
									<c:when test="${fn:startsWith(image_name, 'http')}">
                                        <img class="normal_img" src="${product.productImagesList[0].pi_name}"  alt="">
                                        <img class="hover_img" src="${product.productImagesList[0].pi_name}"  alt="">
									 </c:when>
									<c:otherwise>
										 <img class="normal_img_test" src="img/product_img/${product.productImagesList[0].pi_name}"  alt="">
		                                 <img class="hover_img" src="img/product_img/${product.productImagesList[0].pi_name}"  alt="">
                                        </c:otherwise>
										</c:choose>
										</c:when>
										
										<c:otherwise>
										<img class="normal_img" style="width:300px; height:300px;" src="img/chat-img/logo_carrot.png" alt="">
                                        <img class="hover_img" style="width:300px; height:300px;" src="img/chat-img/logo_carrot.png" alt="">
										
										</c:otherwise>
										</c:choose>
                                        <!-- Product Badge -->
                                        <c:if test="${product.p_sell eq 1}">
                                        				<div class="product_badge">
                                            			<span>
		                                        		<c:out value="판매중"></c:out>
                                            			</span>
                                            			</div>
		                                        	</c:if>
		                                        	<c:if test="${product.p_sell eq 2}">
		                                        		<div class="product_badge1">
                                            			<span>
		                                        		<c:out value="예약중"></c:out>
                                            			</span>
                                            			</div>
		                                        	</c:if>
		                                        	<c:if test="${product.p_sell eq 3}">
		                                        		<div class="product_badge2">
                                            			<span>
		                                        		<c:out value="판매완료"></c:out>
                                            			</span>
                                            			</div>
		                                        	</c:if>

                                        <!-- Wishlist 
                                        <div class="product_wishlist">
                                            <a href="wishlist.html"><i class="icofont-heart"></i></a>
                                        </div>

                                        <!-- Compare 
                                        <div class="product_compare">
                                            <a href="compare.html"><i class="icofont-exchange"></i></a>
                                        </div>
                                        -->
                                    </div>

                                    <!-- Product Description -->
                                    <div class="product_description">
                                        <!-- Add to cart -->
                                        

                                        <!-- Quick View -->
                                        
                                        <p class="brand_name">
                                        <c:if test="${product.productCategory.p_ctgr_no eq 1}">
                                        <c:out value="가전제품"></c:out>
                                        </c:if>
                                        <c:if test="${product.productCategory.p_ctgr_no eq 2}">
                                        <c:out value="가구"></c:out>
                                        </c:if>
                                        <c:if test="${product.productCategory.p_ctgr_no eq 3}">
                                        <c:out value="의류"></c:out>
                                        </c:if>
                                        <c:if test="${product.productCategory.p_ctgr_no eq 4}">
                                        <c:out value="생활용품"></c:out>
                                        </c:if>
                                        <c:if test="${product.productCategory.p_ctgr_no eq 5}">
                                        <c:out value="취미/게임/음반/도서"></c:out>
                                        </c:if>
                                        <c:if test="${product.productCategory.p_ctgr_no eq 6}">
                                        <c:out value="기타"></c:out>
                                        </c:if>
                                        </p>
                                         <a href="product_detail?p_no=${product.p_no}" p_no="${product.p_no}">${product.p_title}</a>
                                        <h6 class="product-price">가격: ${product.p_price} 원</h6>
                                        <p class="product-short-desc">${product.p_address_name}</p>
                                        <p class="product-short-desc">${product.p_desc}</p>
										
                                    </div>
                                </div>
                            </div>
						 </c:forEach> 
						 </div>
						 </div>
					
                           

                    <!-- Shop Pagination Area -->
                    <div class="shop_pagination_area mt-30">
                        <nav aria-label="Page navigation">
                            <ul class="pagination pagination-sm justify-content-center">
                               
                               <c:if test="${productLoginList.pageMaker.prevPage > 0}">  
	            					<li class="page-item">
	                                    <button class="page-link" onclick="changeProductList(${data.pageMaker.prevPage},'0');"><i class="fa fa-angle-left" aria-hidden="true"></i></button>
	                               	 </li>
                                </c:if>
                                
                                <c:forEach var="no" begin="${productLoginList.pageMaker.blockBegin}" end="${productLoginList.pageMaker.blockEnd}">
									<c:if test="${productLoginList.pageMaker.curPage == no}">
										<li class="page-item active"><button class="page-link" href="#">${no}</button></li>
									</c:if>
									<c:if test="${productLoginList.pageMaker.curPage != no}">
										<li class="page-item"><button class="page-link page" onclick="changeProductList(${no},'0')">${no}</button></li>
									</c:if>
                                </c:forEach>
                                
                                <c:if test="${productLoginList.pageMaker.curPage < productLoginList.pageMaker.totPage}">  
	                                <li class="page-item">
				                        <button class="page-link" onclick="changeProductList(${productLoginList.pageMaker.nextPage},'0')"><i class="fa fa-angle-right" aria-hidden="true"></i></button>
			                    	 </li>
                                </c:if>
                            
                            </ul>
                        </nav>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <!-- Shop List Area -->

    <!-- Footer Area -->
		<!-- include_common_bottom.jsp start-->
		<jsp:include page="common/include_common_footer.jsp"/>
		<!-- include_common_bottom.jsp end-->
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
   <!--  <script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
    <script type="text/javascript" src="js/common/CommonHtmlContents.js"></script>
	<script type="text/javascript" src="js/common/user_session_check.js"></script>
	<script type="text/javascript" src="js/product/product.js"></script>
	
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