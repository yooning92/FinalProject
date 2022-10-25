<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="toDay" class="java.util.Date" />
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

     <!-- Title  -->
    <title>우리동네 게시글 수정폼</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">
    
    
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/townBoard.css">
    <link rel="stylesheet" href="css/user.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>
	
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
    
    
    <!-- Breadcumb Area -->
    <div class="breadcumb_area">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <h5>Contact</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="main">흙당근마켓</a></li>
                        <li class="breadcrumb-item"><a href="townBoard_list">우리동네 게시판</a></li>
                        <li class="breadcrumb-item active">게시글 작성</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <!-- Message Now Area -->
                <div class="col-12">
                    <div class="contact_from mb-50">
                        <form name="townBoard_update_form" method="post" enctype="multipart/form-data" id="main_contact_form_townBoard" action="townboard_update_action">
                        <input type="hidden" name="t_no" value="${townBoard.t_no}" />
                            <div class="contact_input_area">
                                <div id="success_fail_info"></div>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="t_title" id="t_title_txt" value="${townBoard.t_title }" placeholder= "제목" required>
                                        </div>
                                    </div>
                                    <!--  
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="l_name" id="l-name" placeholder="Last Name" required>
                                        </div>
                                    </div>
                                    -->
                                    
                                    
                                    
                                    <div class="col-md-6 mb-3">
                                        <div class="form-group">
                                            <select id="t_ctgr_no" name="t_ctgr_no" class="custom-select form-control w-100">
                                                <option value="${townBoard.townCategory.t_ctgr_no }">카테고리 :${townBoard.townCategory.t_ctgr_name}</option>
                                                <option value="1">-동네생활</option>
                                                <option value="2">-같이해요</option>
                                                <option value="3">-동네질문</option>
                                                <option value="4">-동네맛집</option>
                                                <option value="5">-취미생활</option>
                                                <option value="6">-일상</option>
                                                <option value="7">-분실/실종센터</option>
                                                <option value="8">-동네사건사고</option>
                                                <option value="9">-해주세요</option>
                                                <option value="10">-동네사진전</option>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- 
                                    <div class="col-md-6 mb-3">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="p_price" id="p_price" placeholder="가격" required>
                                        </div>
                                    </div>
                                     -->
                                    
                                    <!-- 사진 넣기 임시 -->
                                    <div>
                                    
                                    <div class="col-xl-3">
	                           			 
                                    
	                       			 </div>
									<label for = "img_choose">
                                    	<div class = "town_pic_upload">사진1 </div>
                                    </label>
                                    <input type="file" name="files" id="img_choose"></span>
                                    <label for = "img_choose">
                                    	<div class = "town_pic_upload">사진2 </div>
                                    </label>
                                    <input type="file" name="files" id="img_choose"></span>
                                    <label for = "img_choose">
                                    	<div class = "town_pic_upload">사진3 </div>
                                    </label>
                                    <input type="file" name="files" id="img_choose"></span>
                                    <label for = "img_choose">
                                    	<div class = "town_pic_upload">사진4 </div>
                                    </label>
                                    <input type="file" name="files" id="img_choose"></span>
									
									</div>
									<!-- 사진 넣기 임시 끝-->
									
                                    <div class="col-md-12">
                                        <div class="form-group">
                                           <!--  <textarea name="t_content" class="form-control" id="t_content" cols="30" rows="10" placeholder="내용" required></textarea> -->
                                        	<textarea name="t_content" class="form-control" id="t_content"  cols="30" rows="10"  >${townBoard.t_content }</textarea>
                                        	</div>
                                        </div>
                                        
                                        
                                    </div>
                                    
                                    <!-- 이미지 업로드 부분 시작-->
                                    <!-- 
                                   <div class="img_box">
                                   <ul class="imgul" style="display : flex;">
                                    <li>
                                    	<label for="up_file4" style="display : inline-block; cursor:pointer; position : relative;">
                                    		<input type="file" name="files" id="up_file4"
                                    				style="position : absolue; 
                                    					   top : 0 !important; 
                                    					   left :  0 !important;
                                    					   line-height:  0 !important;
                                    					   font-size:  0 !important;
                                    					   width:  0 !important;
                                    					   height:  0 !important;
                                    					   color : transparent !important;
                                    					   overflow : hidden !important;
                                    					   opacity: 0;">
                                    		<span class="imgspan" style = "display : block;
                                    						width:100px;
                                    						height:100px;
                                    						border:1px solid #ddd;
                                    						position:relative;">
                                    		</span>	   
                                    	</label>
                                    </li>
                                    <li>
                                    	<label for="up_file4" style="display : inline-block; cursor:pointer; position : relative;">
                                    		<input type="file" name="files" id="up_file4"
                                    				style="position : absolue; 
                                    					   top : 0 !important; 
                                    					   left :  0 !important;
                                    					   line-height:  0 !important;
                                    					   font-size:  0 !important;
                                    					   width:  0 !important;
                                    					   height:  0 !important;
                                    					   color : transparent !important;
                                    					   overflow : hidden !important;
                                    					   opacity: 0;">
                                    		<span class="imgspan" style = "display : block;
                                    						width:100px;
                                    						height:100px;
                                    						border:1px solid #ddd;
                                    						position:relative;">
                                    		</span>	   
                                    	</label>
                                    </li>
                                    <li>
                                    	<label for="up_file4" style="display : inline-block; cursor:pointer; position : relative;">
                                    		<input type="file" name="files" id="up_file4"
                                    				style="position : absolue; 
                                    					   top : 0 !important; 
                                    					   left :  0 !important;
                                    					   line-height:  0 !important;
                                    					   font-size:  0 !important;
                                    					   width:  0 !important;
                                    					   height:  0 !important;
                                    					   color : transparent !important;
                                    					   overflow : hidden !important;
                                    					   opacity: 0;">
                                    		<span class="imgspan" style = "display :block;
                                    						width:100px;
                                    						height:100px;
                                    						border:1px solid #ddd;
                                    						position:relative;">
                                    		</span>	   
                                    	</label>
                                    </li>
                                    <li>
                                    	<label for="up_file4" style="display : inline-block; cursor:pointer; position : relative;">
                                    		<input type="file" name="files" id="up_file4"
                                    				style="position : absolue; 
                                    					   top : 0 !important; 
                                    					   left :  0 !important;
                                    					   line-height:  0 !important;
                                    					   font-size:  0 !important;
                                    					   width:  0 !important;
                                    					   height:  0 !important;
                                    					   color : transparent !important;
                                    					   overflow : hidden !important;
                                    					   opacity: 0;">
                                    		<span class="imgspan" style = "display : block;
                                    						width:100px;
                                    						height:100px;
                                    						border:1px solid #ddd;
                                    						position:relative;">
                                    		</span>	   
                                    	</label>
                                    </li>
                                    </ul>
                                    </div>
                                    <input type="hidden" name="pageno" value="${pageno}" />
                                     -->
                                     <!-- 이미지 업로드 부분 끝-->
                                     
                                    <div class="col-12 text-center">
                                        <input type="button" id="btn_townBoard_update_action" class="townBoard_btn update" value="수정하기"  onclick="townBoardUpdateAction()"/>&nbsp; 
                                        <input class="townBoard_btn list" type="button" pageno="${pageno}" value="동네게시글목록"/>
                               		 </div>
                                
                                
                            </div>
                            
                        </form>
                    </div>
                </div>

                
    <!-- Message Now Area -->

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
    <script src="js/townBoard/townBoard.js"></script>
    
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
	<script type="text/javascript" src="js/townBoard/townBoard.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	
	<!-- javaScript -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="js/user/UserHtmlContents.js"></script>
	<script type="text/javascript" src="js/common/CommonHtmlContents.js"></script>
	<script type="text/javascript" src="js/common/user_session_check.js"></script>
	
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