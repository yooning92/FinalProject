<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>내 물건 팔기</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Style CSS -->
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/product.css">
    
    <!-- java script -->
    <script type="text/javascript">
    function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
    function readURL1(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview1').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview1').src = "";
	  }
	}
    function readURL2(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview2').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview2').src = "";
	  }
	}
    function readURL3(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview3').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview3').src = "";
	  }
	}
    </script>   
    
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
                    <h5>내 물건 팔기</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="main">흙당근마켓</a></li>
                        <li class="breadcrumb-item"><a href="product_list">동네물건</a></li>
                        <li class="breadcrumb-item active">내 물건 팔기</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <!-- Message Now Area -->
                <div class="col-12">
                    <div class="contact_from mb-50">
                        <form name="product_write_form" action="product_write_action" 
                        	method="post" enctype="multipart/form-data" id="main_contact_form">
                            <div class="contact_input_area">
                                <div id="success_fail_info"></div>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="p_title" id="p_title" placeholder= 제목 required>
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
                                            <input type="text" class="form-control" name="p_price" id="p_price" placeholder="가격" required>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-6 mb-3">
                                        <div class="form-group">
                                            <select id="p_ctgr_no" name="p_ctgr_no" class="custom-select form-control w-100">
                                                <option selected disabled="disabled">카테고리</option>
                                                <option value="1">-가전제품</option>
                                                <option value="2">-가구</option>
                                                <option value="3">-의류</option>
                                                <option value="4">-생활용품</option>
                                                <option value="5">-취미/게임/음반/도서</option>
                                                <option value="6">-기타</option>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- 사진 넣기 임시--> 
                                    <div class="form-group" style="margin-left: 50px">
                                    
                                   	<img id ="preview" src="img/chat-img/logo_carrot.png" style="width:50px; height:50px;"/>
                                    <span><input type="file" onchange="readURL(this);" name="files" style="width: 80px"></span> 
                                   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img id ="preview1" src="img/chat-img/logo_carrot.png" style="width:50px; height:50px;"/>
                                    <span><input type="file" name="files" onchange="readURL1(this);" style="width: 80px"></span> 
                                   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img id ="preview2" src="img/chat-img/logo_carrot.png" style="width:50px; height:50px;"/>
                                    <span><input type="file" name="files" onchange="readURL2(this);" style="width: 80px"></span> 
                                   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img id ="preview3" src="img/chat-img/logo_carrot.png" style="width:50px; height:50px;"/>
                                    <span><input type="file" name="files" onchange="readURL3(this);" style="width: 80px"></span> 

									</div>
									<!-- 사진 넣기 임시 끝 -->
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <textarea name="p_desc" class="form-control" id="p_desc" cols="30" rows="10" placeholder="물건 설명" required></textarea>
                                        	</div>
                                        </div>
                                    </div>
                                    <!-- 이미지 업로드 부분 시작
                                   <div class="img_box">
                                   <ul class="imgul" style="display : flex;">
                                    <li>
                                    	<label for="up_file4" style="display : inline-block; cursor:pointer; position : relative;">
                                    		<input type="file" name="files" 
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
                                    		<input type="file" name="files" 
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
                                    		<input type="file" name="files" 
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
                                    		<input type="file" name="files" 
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
                                     이미지 업로드 부분 끝-->
                                    <div class="col-12 text-center">
                                        <input type="button" id="btn_product_write_action" class="btn btn-primary w-40" style="margin-bottom: 30px" value="물건 올리기" onclick="productCreate()">&nbsp; 
                                        <input type="button" class="btn btn-primary w-40" style="margin-bottom: 30px" value="동네물건목록" onclick="productList()">
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
    <script src="js/wow.min.js"></script>
    <script src="js/default/active.js"></script>
    
    <!-- javaScript -->
 <!--    <script type="text/javascript"
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

