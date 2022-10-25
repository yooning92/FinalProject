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
                    <h5>후기</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="main">Home</a></li>
                        <li class="breadcrumb-item">거래내역</li>
                        <li class="breadcrumb-item"><a href="orders_list">구매내역</a></li>
                        <li class="breadcrumb-item active">작성한 후기</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->
    <!-- Cart Area -->
	    <div class="cart_area section_padding_100_70 clearfix">
	        <div class="container">
	            <div id="container_contents" class="row justify-content-between">
	                <div class="submit_a_review_area col-12" style="border: 1px solid #d6e6fb; padding:30px;">
                        <!-- <h4>작성한 후기</h4> -->
                        <h4><strong>${review.your_id} 님에게 따뜻한 후기를 보냈어요.</strong></h4>
                        <hr>
                        <h6 >${review.your_id} 님과 ${review.orders.product.p_title}을 거래했어요.</h6>
                        <br>
                        <!-- [Start]review_write_form -->
                        <form id="review_view_form" name="review_view_form" action="" method="post">
                                 <input type="hidden" id="review_no" name="review_no" class="" value="${review.review_no}">
                                <div class="form-group">
                                    <span style="color:dimgray">별점</span>
                                    <div class="stars">
                                        <input type="radio" name="star" class="star-${review.review_point}" id="star-${review.review_point}" checked>
                                        <label class="star-${review.review_point}" for="star-${review.review_point}">${review.review_point}</label>
                                        <span style="width:${20 * review.review_point}%"></span>
                                    </div>
                                </div>
                                
                                <!--
                                <div class="form-group">
                                    <label for="name">Nickname</label>
                                    <input type="email" class="form-control" id="name" placeholder="Nazrul">
                                </div>
                                <div class="form-group">
                                    <label for="options">Reason for your rating</label>
                                    <select class="form-control small right py-0 w-100" id="options">
                                        <option>Quality</option>
                                        <option>Value</option>
                                        <option>Design</option>
                                        <option>Price</option>
                                        <option>Others</option>
                                    </select>
                                </div>
                                -->
                                <div class="form-group">
                                    <label for="review_desc" style="color:dimgray">내용</label>
                                    <textarea class="form-control" id="review_desc" name="review_desc" rows="5" data-max-length="150" readonly>${review.review_desc}</textarea>
                                </div>
                                
                                <!-- 이미지 업로드 -->
                                <div class="form-group">
	                                <label for="drop" style="color:dimgray">첨부 사진</label>
									<div id="show" class="form-control"
										style="height: ${showHeight}px; padding: 3px">
										<div id="thumbnails">
										
										<c:if test="${review.reviewImageList.size() != 0}">
											<c:forEach items="${review.reviewImageList}" var="reviewImage" varStatus="status">
												<img class="thumb" src="img/review_img/${reviewImage.review_img_name}" onerror="this.src='img/user_profile/newCarrot.jpg'">
											</c:forEach>
										</c:if>  
										
										</div>
									</div>
								</div>
                                <!--<input type="button" id="btnSubmit" class="btn btn-primary" value="Submit Review" />-->
                                <input type="button" id="btn_review_modify_form" class="btn btn-primary" value="수정하기" />
                                <input type="button" id="btn_review_remove" class="btn btn-primary" value="삭제하기" />
                                <input type="button" id="btn_backto_orderslist" class="btn btn-primary" value="뒤로가기" />
                            </form>
                        <!-- [END]review_write_form -->
                	</div> 
	            </div>
	        </div>
	    </div>
    <!-- Cart Area End -->

    <!-- Footer Area -->
   	<jsp:include page="common/include_common_footer.jsp"/>
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
	<%-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script> --%>
	<script type="text/javascript" src="js/common/user_session_check.js"></script>
	<script type="text/javascript" src="js/common/CommonHtmlContents.js"></script>
	<script type="text/javascript" src="js/user/UserHtmlContents.js"></script>
	<script type="text/javascript" src="js/review/review.js"></script>
	<script type="text/javascript" src="js/review/ReviewHtmlContents.js"></script>
	
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