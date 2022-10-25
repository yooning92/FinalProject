<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 	<!-- Title  -->
	<title>동네생활 검색</title>

	<!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

<link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/townBoard.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">
    
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
    	<!-- include_common_header.jsp start-->
			<jsp:include page="common/include_common_header.jsp"/>
		<!-- include_common_header.jsp end-->

    <!-- Breadcumb Area -->
    <div class="breadcumb_area">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <h5>Blog</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item active">Blog</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <!-- Blog Area -->
    <section class="blog_area section_padding_100">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-5 col-lg-4">
                    <div class="blog_sidebar">
                      <!-- Catagory -->
                    
                        <div class="widget-area catagory_section mb-30">
                        <div id = "category_list">
                            <h6>Catagory</h6>
                            <ul>
                              <li>
                              
	                              <input type="hidden" class="townBoardCtgrNo" name="t_ctgr_no1" value=1>
	                              <a href="#" onclick="changeQnaList(1,1)">동네생활 <span class="text-muted"></span></a>

                              </li>
                              <li>
	                              <input type="hidden" class="townBoardCtgrNo" name="t_ctgr_no2" value=2>
	                              <a href="#" onclick="changeQnaList(1,2)">같이해요<span class="text-muted"></span></a>
                              </li>
                              <li>
	                              <input type="hidden" class="townBoardCtgrNo" name="t_ctgr_no3" value=3>
	                              <a href="#" onclick="changeQnaList(1,3)">동네질문<span class="text-muted"></span></a>
                              </li>
                              <li>
	                              <input type="hidden" class="townBoardCtgrNo" name="t_ctgr_no4" value=4>
	                              <a href="#" onclick="changeQnaList(1,4)">동네맛집<span class="text-muted"></span></a>
                              </li>
                              <li>
	                              <input type="hidden" class="townBoardCtgrNo" name="t_ctgr_no5" value=5>
	                              <a href="#" onclick="changeQnaList(1,5)">취미생활<span class="text-muted"></span></a>
                              </li>
                              <li>
	                              <input type="hidden" class="townBoardCtgrNo" name="t_ctgr_no6" value=6>
	                              <a href="#" onclick="changeQnaList(1,6)">일상<span class="text-muted"></span></a>
                              </li>
                              <li>
	                              <input type="hidden" class="townBoardCtgrNo" name="t_ctgr_no7" value=7>
	                              <a href="#" onclick="changeQnaList(1,7)">분실/실종센터<span class="text-muted"></span></a>
                              </li>
                              <li>
	                              <input type="hidden" class="townBoardCtgrNo" name="t_ctgr_no8" value=8>
	                              <a href="#" onclick="changeQnaList(1,8)">동네사건사고<span class="text-muted"></span></a>
                              </li>
                              <li>
	                              <input type="hidden" class="townBoardCtgrNo" name="t_ctgr_no9" value=9>
	                              <a href="#" onclick="changeQnaList(1,9)">해주세요<span class="text-muted"></span></a>
                              </li>
                              <li>
	                              <input type="hidden" class="townBoardCtgrNo" name="t_ctgr_no10" value=10>
	                              <a href="#" onclick="changeQnaList(1,10)"s>동네사진전<span class="text-muted"></span></a>
                              </li>
                                
                               
                            </ul>
                        </div>
                    </div>
                   
                    
                    <!-- Search Post -->
                        <div class="widget-area search_post mb-30">
                            <h6>게시글 검색</h6>
                            <form action="#" method="get">
                                <input type="search" class="form-control" id="townBoardSearch" placeholder="검색">
                                <button type="submit" class="btn d-none">Submit</button>
                            </form>
                        </div>
                    
                    
                    
                </div>
                </div>
                
                
                <div class="col-12 col-md-7 col-lg-8">
                    <!-- Single News Area -->
                    
                    <div class="single_blog_area">
                    <div id="townBoard_list_tbody_all">
                    <c:forEach var="townBoard" items="${searchList.itemList}">
                        <div class="blog_post_thumb">
                        <input type="hidden" value=${param.search_keyword} id="search_keywordTown">
                        
                       	<c:if test="${townBoard.townImageList.size() != 0}">
                            <a href="townboard_view?t_no=${townBoard.t_no}&pageno=${townBoardList.pageMaker.curPage}" t_no="${townBoard.t_no}"><img src="img/townBoard-img/${townBoard.townImageList[0].t_img_name}" alt="blog-post-thumb"></a>
                            </c:if>
                            
                        </div>
                        <div class="blog_post_content">
                        <!-- Post Date -->
                            <div class="post-date">
                                <a href="#">${townBoard.townCategory.t_ctgr_name}</a>
                                <span>조회수 : ${townBoard.t_count}</span>
                            </div>
                            <a href="townboard_view?t_no=${townBoard.t_no}&pageno=${searchList.pageMaker.curPage}" t_no="${townBoard.t_no}" pageno="${pageno}" class="blog_title">${townBoard.t_title}</a>
                            <p>${townBoard.t_content}</p>
                            <a href="single-blog.html">Continue Reading <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                        </div>
                   </c:forEach>
                    </div>
                    </div>
					
					
				<%-- 	<input type="button" class="townBoard_btn write_form" pageno="${pageno}" value="게시글작성" /> --%>
					
                </div>
                
                
            </div>

            <div class="row">
                <div class="col-12 col-lg-8 ml-lg-auto">
                    <!-- Shop Pagination Area -->
                    
                    <div class="shop_pagination_area mt-5">
                        <nav aria-label="Page navigation">
                            <ul class="pagination pagination-sm justify-content-center">

                            	<c:if test="${searchList.pageMaker.prevPage > 0}">  
	            					<li class="page-item">
	                                    <button class="page-link" onclick="changeTownList(${data.pageMaker.prevPage},'${param.search_keyword}');"><i class="fa fa-angle-left" aria-hidden="true"></i></button>
	                               	 </li>
                                </c:if>
                                <c:forEach var="no" begin="${searchList.pageMaker.blockBegin}" end="${searchList.pageMaker.blockEnd}">
									<c:if test="${searchList.pageMaker.curPage == no}">
										<li class="page-item active"><button class="page-link" href="#">${no}</button></li>
									</c:if>
									<c:if test="${searchList.pageMaker.curPage != no}">
										<li class="page-item"><button class="page-link page" onclick="changeTownList(${no},'${param.search_keyword}')">${no}</button></li>
									</c:if>
                                </c:forEach>
                                <c:if test="${searchList.pageMaker.curPage < searchList.pageMaker.totPage}">  
	                                <li class="page-item">
				                        <button class="page-link" onclick="changeTownList(${data.pageMaker.nextPage},'${param.search_keyword}')"><i class="fa fa-angle-right" aria-hidden="true"></i></button>
			                    	 </li>
                                </c:if>

                            </ul>
                        </nav>
                    </div>
                    
                    
                    
                    
                </div>
            </div>
          <!--  페이징끝 -->
            
        </div>
    </section>
    <!-- Blog Area End -->

    <!-- Footer Area -->
    	<!-- include_common_bottom.jsp start-->
			<jsp:include page="common/include_common_footer.jsp"/>
		<!-- include_common_bottom.jsp end-->
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>
	<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
	
   
	
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>  
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
    
    
   
    <script type="text/javascript" src="js/user/UserHtmlContents.js"></script>
	<script type="text/javascript" src="js/common/CommonHtmlContents.js"></script>
	<script type="text/javascript" src="js/common/user_session_check.js"></script>
	 <script type="text/javascript" src="js/common/search.js"></script>
	  <script src="js/townBoard/townBoard.js"></script>
	
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

.shop_pagination_area .page-item.active .page-link { /* 페이징 버튼 색 변경 */
    background-color: orange;
    color: #ffffff;
}
	
</body>
</html>