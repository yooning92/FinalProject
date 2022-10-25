<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!doctype html>
<html lang="ko">

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
                        <li class="breadcrumb-item active">후기수정</li>
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
                        <h4>후기 수정</h4>
                        <!-- [Start]review_write_form -->
                        <form id="review_modify_form" name="review_modify_form" action="review_modify_action" method="post">
                                <div class="form-group">
                                    <input type="hidden" id="orders_no" name="orders_no" class="" value="${review.orders.orders_no}">
                                    <input type="hidden" id="your_id" name="your_id" class="" value="${review.your_id}">
                                    <input type="hidden" id="review_no" name="review_no" class="" value="${review.review_no}">
                                    <input type="hidden" id="review_point" name="review_point" class="" value="">
                                    <input type="hidden" id="review_point_prev" name="review_point_prev" class="" value="${review.review_point}">
                                    <span>별점주기</span>
                                    <div class="stars">
                                       <script type="text/javascript">
                                       setPoint('#star-'+${review.review_point});
                                       $(".stars>span").css("width","20*"+${review.review_point}+"%");
                                       </script>
                                        <input type="radio" name="star" class="star-0_5" id="star-0_5" onclick='changeStar();changeStar();setPoint(this.id);'>
                                        <label class="star-0_5" for="star-0_5">0.5</label>
                                        <input type="radio" name="star" class="star-1" id="star-1" onclick='changeStar();setPoint(this.id);'>
                                        <label class="star-1" for="star-1">1</label>
                                        <input type="radio" name="star" class="star-1_5" id="star-1_5" onclick='changeStar();setPoint(this.id);'>
                                        <label class="star-1_5" for="star-1_5">1.5</label>
                                        <input type="radio" name="star" class="star-2" id="star-2" onclick='changeStar();setPoint(this.id);'>
                                        <label class="star-2" for="star-2">2</label>
                                        <input type="radio" name="star" class="star-2_5" id="star-2_5" onclick='changeStar();setPoint(this.id);'>
                                        <label class="star-2_5" for="star-2_5">2.5</label>
                                        <input type="radio" name="star" class="star-3" id="star-3" onclick='changeStar();setPoint(this.id);'>
                                        <label class="star-3" for="star-3">3</label>
                                        <input type="radio" name="star" class="star-3_5" id="star-3_5" onclick='changeStar();setPoint(this.id);'>
                                        <label class="star-3_5" for="star-3_5">3.5</label>
                                        <input type="radio" name="star" class="star-4" id="star-4" onclick='changeStar();setPoint(this.id);'>
                                        <label class="star-4" for="star-4">4</label>
                                        <input type="radio" name="star" class="star-4_5" id="star-4_5" onclick='changeStar();setPoint(this.id);'>
                                        <label class="star-4_5" for="star-4_5">4.5</label>
                                        <input type="radio" name="star" class="star-5" id="star-5" onclick='changeStar();setPoint(this.id);'>
                                        <label class="star-5" for="star-5">5</label>
                                        <span style="width:${20 * review.review_point}%"></span>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="review_desc">내용</label>
                                    <textarea class="form-control" id="review_desc" name="review_desc" rows="5" data-max-length="150">${review.review_desc}</textarea>
                                </div>
                                
                                <!-- 이미지 업로드 -->
                                <div class="form-group">
	                                <label for="drop">첨부 사진 <span style="color:dimgray;font-size:10px"> (하단에 drag & drop 해주세요)</span></label>
									<div id="drop" class="form-control"
										style="height: 220px; padding: 3px">
										<c:if test="${review.reviewImageList.size() != 0}">
											<script type="text/javascript">
											var existingFiles = [];
											</script>
										
											<div id="thumbnails">
											<c:forEach items="${review.reviewImageList}" var="reviewImage" varStatus="status">
												<input type="hidden" class="existing_img" img-idx="${status.index}" review_img_name="${reviewImage.review_img_name}">
												<div class="thumb">
													<div class="delete" data-idx="${status.index}" review_img_no="${reviewImage.review_img_no}" review_img_name="${reviewImage.review_img_name}">X</div>
													<img class="" src="img/review_img/${reviewImage.review_img_name}" onerror="this.src='img/user_profile/newCarrot.jpg'">
												</div>
											</c:forEach>
											</div>
												<script type="text/javascript">
													$(".existing_img").each(function(){
														existingFiles.push($(this).attr("review_img_name"));
													});
													console.log(existingFiles);
												</script>
										</c:if>
										 
									</div>
								</div>
                                <input type="button" id="btn_review_modify_action" class="btn btn-primary" value="수정하기" />
                                <input type="button" id="btn_backto_review_view" class="btn btn-primary" onclick="javascript:history.back();" value="뒤로가기" />
                                <input type="button" id="btn_backto_orderslist" class="btn btn-primary" value="구매목록" />
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