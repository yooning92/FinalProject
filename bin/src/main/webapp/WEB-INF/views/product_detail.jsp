<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
 
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>물건 상세</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Style CSS -->
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/product.css">
  
	
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
                    <h5>물건 상세</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">흙당근마켓</a></li>
                        <li class="breadcrumb-item"><a href="#">동네물건</a></li>
                        <li class="breadcrumb-item active">물건 상세</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <!-- Single Product Details Area -->
    <section class="single_product_details_area section_padding_100">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-6">
                    <div class="single_product_thumb">
                        <div id="product_details_slider" class="carousel slide" data-ride="carousel">

                            <!-- Carousel Inner -->
                           
                            <div class="carousel-inner">
                                
                               <div class="carousel-item active">
                                
	                                <c:set var = "image_name" value = "${product.productImagesList[0].pi_name}"/>
	                                <c:choose>
										<c:when test="${fn:startsWith(image_name, 'http')}">
		                                    <a class="gallery_img" href="${product.productImagesList[0].pi_name}" title="First Slide">
		                                        <img class="d-block w-100" src="${product.productImagesList[0].pi_name}" alt="First slide">
		                                    </a>
	                                       </c:when>
										<c:otherwise>
		                                    <a class="gallery_img" href="img/product_img/${product.productImagesList[0].pi_name}" title="First Slide">
		                                        <img class="d-block w-100" src="img/product_img/${product.productImagesList[0].pi_name}" alt="First slide">
		                                    </a>
										</c:otherwise>
									</c:choose>	
                                
                                    <!-- Product Badge -->
                                    <div class="product_badge">
                                        <%-- <span class="badge-new">New</span> --%>
                                    </div>
                                </div> 
                                <c:forEach items="${product.productImagesList}" var="productImages" varStatus="status" begin="1">
                                <div class="carousel-item">
                                
	                                <c:set var = "image_name" value = "${productImages.pi_name}"/>
	                                <c:choose>
										<c:when test="${fn:startsWith(image_name, 'http')}">
		                                    <a class="gallery_img" href="${image_name}" title="First Slide">
		                                        <img class="d-block w-100" src="${image_name}" alt="First slide">
		                                    </a>
	                                       </c:when>
										<c:otherwise>
		                                    <a class="gallery_img" href="img/product_img/${image_name}" title="First Slide">
		                                        <img class="d-block w-100" src="img/product_img/${image_name}" alt="First slide">
		                                    </a>
										</c:otherwise>
									</c:choose>	
                                
                                    <!-- Product Badge -->
                                    <div class="product_badge">
                                        <%-- <span class="badge-new">New</span> --%>
                                    </div>
                                </div>
                              </c:forEach>
                             <%-- 
                                <div class="carousel-item">
                                    <a class="gallery_img" href="img/product-img/pd-big-thumb-2.png" title="Second Slide">
                                        <img class="d-block w-100" src="img/product-img/pd-big-thumb-2.png" alt="Second slide">
                                    </a>
                                    <!-- Product Badge -->
                                    <div class="product_badge">
                                        <span class="badge-new">Sale</span>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <a class="gallery_img" href="img/product-img/pd-big-thumb-3.png" title="Third Slide">
                                        <img class="d-block w-100" src="img/product-img/pd-big-thumb-3.png" alt="Third slide">
                                    </a>
                                    <!-- Product Badge -->
                                    <div class="product_badge">
                                        <span class="badge-new">-20%</span>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <a class="gallery_img" href="img/product-img/pd-big-thumb-4.png" title="Fourth Slide">
                                        <img class="d-block w-100" src="img/product-img/pd-big-thumb-4.png" alt="Fourth slide">
                                    </a>
                                    <!-- Product Badge -->
                                    <div class="product_badge">
                                        <span class="badge-new">Hot</span>
                                    </div>
                                </div>
						 --%>
                            </div>
                            <!-- Carosel Indicators -->
                            <ol class="carousel-indicators">
                       			
                                <%-- <li class="active" data-target="#product_details_slider" data-slide-to="0" style="background-image: url(img/product_img/${product.productImagesList[i].pi_name});">
                                </li> --%>
                               <c:forEach items="${product.productImagesList}" var="productImages" varStatus="status">
                               
                              		<c:set var = "image_name" value = "${productImages.pi_name}"/>
	                                <c:choose>
										<c:when test="${fn:startsWith(image_name, 'http')}">
	     		                        	<li data-target="#product_details_slider" data-slide-to="${status.index}+1" style="background-image: url(${productImages.pi_name});"></li>
	                                    </c:when>
										<c:otherwise>
	     		                        	<li data-target="#product_details_slider" data-slide-to="${status.index}+1" style="background-image: url(img/product_img/${productImages.pi_name});"></li>
										</c:otherwise>
									</c:choose>	
                               
                               </c:forEach>
                               <%-- 
                                <li data-target="#product_details_slider" data-slide-to="1" style="background-image: url(img/product_img/${product.productImagesList[i+1].pi_name});">
                                </li>
                                <li data-target="#product_details_slider" data-slide-to="2" style="background-image: url(img/product-img/pd-big-thumb-3.png);">
                                </li>
                                <li data-target="#product_details_slider" data-slide-to="3" style="background-image: url(img/product-img/pd-big-thumb-4.png);">
                                </li>
                               --%>
                            </ol>
                        </div>
                    </div>
                </div>

                <!-- Single Product Description -->
                <div class="col-12 col-lg-6">
                    <div class="single_product_desc"><div style="display:inline;">
                    
                        <img style="max-width: 8%;
   						 border-radius: 400px;"alt="" src="img/user_profile/${product.userInfo.user_profile}"> ${product.userInfo.user_id}
   						 </div>
    					<div style="display: inline-block;
    					width: 70%;"> <p style="margin-left: 85%;"> ${product.userInfo.user_freshness} &nbsp;<i style="color:orange;"class="fa fa-thermometer"></i></p>
    					
    					</div>
                       <!-- 신선도 해결
                        <div class="form-group">
                                    <span>신선도</span>
                                    <div class="stars">
                                        <input type="radio" name="star" class="star-${product.userInfo.user_freshness}" id="star-${product.userInfo.user_freshness}" checked>
                                        <label class="star-${product.userInfo.user_freshness}" for="star-${product.userInfo.user_freshness}">${product.userInfo.user_freshness}</label>
                                        <span style="width:${star}%"></span>
                                    </div>
                                </div>
                             -->     
                        <hr>
                        <h3 class="title mb-2" style="text-align:left; display: inline-block;" >${product.p_title}</h3>
                        <p style="font-size:10px;">${product.productCategory.p_ctgr_name}</p>
                        <a class="add_to_wishlist" id="addWishListBtn" style="position: relative; left: 440px; display: inline-block;"><i class="fa fa-heart" aria-hidden="true"></i> 찜하기</a>
                        <hr>
                       
                         <div class="short_overview mb-4">
                        <h5 align="right" >
                        	<c:if test="${product.p_sell eq 1}">
		                                        		<c:out value="판매중"></c:out>
		                                        	</c:if>
		                                        	<c:if test="${product.p_sell eq 2}">
		                                        		<c:out value="예약중"></c:out>
		                                        	</c:if>
		                                        	<c:if test="${product.p_sell eq 3}">
		                                        		<c:out value="판매완료"></c:out>
		                                        	</c:if>
                        </h5>
                       <h4 align="right"  ><i class="fa fa-money"></i> ${product.p_price} 원 </h4>
                        
                        <!-- Overview -->
                        <%-- <div class="short_overview mb-4">
                            <h5>설명</h5>
                            <h6>${product.p_desc}</h6>
                        </div> --%>
                         <p style="margin-left: 83%"><i class="icofont-eye-alt"></i>조회수  ${product.p_count}</p>
                         </div>

                        <!-- Color Option -->
                       

                        <!-- Size Option -->
                       

                        <!-- Add to Cart Form -->
                        <form  method="post" name="chatStart">
                           
                             
                            <input type="hidden" name="loginId" id="loginId" value="${sUser.user_id}" />
                            <input type="hidden" name="p_userId" id="p_userId" value="${product.userInfo.user_id}" />
                            <input type="hidden" name="p_no" id="p_no" value="${product.p_no}" />
                            <input type="hidden" name="p_title" value="${product.p_title}" />
                            <input type="hidden" name="p_desc" value="${product.p_desc}" />
                            <input type="hidden" name="p_price" value="${product.p_price}" />
                            <input type="hidden" name="p_ctgr_no" value="${product.productCategory.p_ctgr_no}" />
                            <input type="hidden" name="user_id" value="${product.userInfo.user_id}" />
                        </form>
                        
                        
                        <div class="others_info_area mb-3 d-flex flex-wrap">
                            <button type="button" name="btnCreate" class="btn btn-primary mt-1 mt-md-0 ml-1 ml-md-3" style="position: relative; left: 350px" id="btnCreate">채팅하기</button>
                       
                        <!-- Others Info 
                            <a class="add_to_wishlist" id="addWishListBtn" style="position: relative; right: 110px"><i class="fa fa-heart" aria-hidden="true"></i> 찜하기</a>
                            -->
                           <!--  
                            <a class="" href="product_modify_form?p_no=${product.p_no}" p_no="${product.p_no}" id="product_modify_form"><i class="fa fa-th" aria-hidden="true"></i> 수정하기</a>
                            <a class="share_with_friend" href="product_delete_action"><i class="fa fa-share" aria-hidden="true"></i> 삭제하기</a>
                        	-->
                        </div>

                        <!-- Size Guide -->
                      </div>
                      <div class="single_product_desc">
                      <p style="text-align:left; display: inline-block;">${product.p_address_name}</p>
                      <br><p>${product.p_desc}</p><br></div>
</div>
</div>
</div>
        <!-- <div class="container">
            <div class="row">
                <div class="col-12"> -->
               
    </section>
    <!-- Single Product Details Area End -->
 
<section class="you_may_like_area section_padding_0_100 clearfix">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section_heading new_arrivals" style="background-color: #FFA500">
                        <h5>이웃의 상품</h5>
                    </div>
                </div>
                </div>
                <div class="row">
                
                <div class="col-12">
                <div class="you_make_like_slider owl-carousel">
                
                <c:forEach items="${userProductList}" var="product">
                <!-- Single Product -->
                        <div class="single-product-area">
                            <div class="product_image">
                                <!-- Product Image -->
                                
								<c:choose>
                                        <c:when test="${!empty product.productImagesList[0].pi_name}">
                                        <c:set var = "image_name" value = "${product.productImagesList[0].pi_name}"/>
                                        <c:choose>
											<c:when test="${fn:startsWith(image_name, 'http')}">
		                                        <img class="normal_img" style="width:300px; height:300px;" src="${product.productImagesList[0].pi_name}"  alt="">
		                                        <img class="hover_img" style="width:300px; height:300px;" src="${product.productImagesList[0].pi_name}" alt="">
	                                        </c:when>
											<c:otherwise>
		                                        <img class="normal_img_test" style="width:300px; height:300px;" src="img/product_img/${product.productImagesList[0].pi_name}"  alt="">
		                                        <img class="hover_img" style="width:300px; height:300px;" src="img/product_img/${product.productImagesList[0].pi_name}" alt="">
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

                                <!-- Wishlist -->
                               

                                <!-- Compare -->
                                
                            </div>

                            <!-- Product Description -->
                            <div class="product_description">
                                <!-- Add to cart -->
                                

                                <!-- Quick View -->
                                

                                <p class="brand_name">
                                <c:if test="${product.p_sell eq 1}">
		                                        		<c:out value="판매중"></c:out>
		                                        	</c:if>
		                                        	<c:if test="${product.p_sell eq 2}">
		                                        		<c:out value="예약중"></c:out>
		                                        	</c:if>
		                                        	<c:if test="${product.p_sell eq 3}">
		                                        		<c:out value="판매완료"></c:out>
		                                        	</c:if>
                                </p>
                                <a href="product_detail?p_no=${product.p_no}" p_no="${product.p_no}">${product.p_title}</a>
                                <h6 class="product-price">${product.p_price} 원</h6>
                            </div>
                        </div>
               
                </c:forEach>
                         
                   </div>
                </div>
            </div>
        </div>
    </section>
  
    <!-- Related Products Area -->
    
    <!-- Related Products Area -->

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
    <script src="js/wow.min.js"></script>
    <script src="js/default/active.js"></script>
    
    <!-- javaScript -->
	<script type="text/javascript" src="js/common/CommonHtmlContents.js"></script>
	<script type="text/javascript" src="js/common/user_session_check.js"></script>
	<script type="text/javascript" src="js/product/product.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>  
	
	
<style type="text/css">




#addWishListBtn{
 font-size:24px;
}

#addWishListBtn:hover{
	cursor:pointer;
	font-size:30px;
}


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

#toast-container > .toast-info:before {
content: "\f004";
}


	
</body>

</html>

