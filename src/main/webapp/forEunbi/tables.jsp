<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="toDay" class="java.util.Date" />
<fmt:formatDate var="to_date" value='${toDay}' pattern='yyyy-MM-dd' />
<fmt:formatDate var="q_date" value='${qna.q_date}' pattern='yyyy-MM-dd' />

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- include_common_top -->
	<jsp:include page="common/include_common_top.jsp"/>
    <!-- include_common_top -->
    <link rel="stylesheet" href="css/shop/board.css">

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
                    <h5>Board</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item active">Board</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <div class="shortcodes_area section_padding_100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="shortcodes_title mb-30">
                        <h4>QnA board</h4>
                    </div>
                    <div class="shortcodes_content">
                        <div class="table-responsive">
                            <table class="table mb-0 table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col" class="board_no">번호</th>
                                        <th scope="col" class="board_title">제목</th>
                                        <th scope="col" class="board_writer">작성자</th>
                                        <th scope="col" class="board_date">날짜</th>
                                        <th scope="col" class="board_count">조회수</th>
                                    </tr>
                                </thead>
                                <tbody id="qna_list_tbody">
                                
                                	<!-- board start -->
                                	<c:forEach var="qna" items="${qnaList.itemList}">
	                                    <tr>
	                                        <th scope="row">${qna.q_no}</th>
	                                        <td>
	                                        	<a href="qna_view?q_no=${qna.q_no}&pageno=${qnaList.pageMaker.curPage}">
	                                        		${qna.q_title}
	                                        		<c:if test="${to_date eq qna.q_date}">
	                                        			&nbsp;&nbsp;<span class="badge badge-danger">new</span>
	                                        		</c:if>
	                                        	</a>
	                                        </td>
	                                        <td>${qna.m_id}</td>
	                                        <td>${qna.q_date}</td>
	                                        <td>${qna.q_count}</td>
	                                    </tr>
                                    </c:forEach>
                                   <!-- board end -->
                 
                                </tbody>
                            </table>
						
                        </div>
                    </div>
					<input type="button" class="qna_btn write_form" pageno="${pageno}" value="게시글작성" />
                </div>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-12 col-lg-9">
                    <!-- Shop Pagination Area -->
                    <div class="shop_pagination_area mt-5">
                        <nav aria-label="Page navigation">
                            <ul class="pagination pagination-sm justify-content-center">

                            	<c:if test="${qnaList.pageMaker.prevPage > 0}">  
	            					<li class="page-item">
	                                    <button class="page-link" onclick="changeQnaList(${data.pageMaker.prevPage});"><i class="fa fa-angle-left" aria-hidden="true"></i></button>
	                               	 </li>
                                </c:if>
                                <c:forEach var="no" begin="${qnaList.pageMaker.blockBegin}" end="${qnaList.pageMaker.blockEnd}">
									<c:if test="${qnaList.pageMaker.curPage == no}">
										<li class="page-item active"><button class="page-link" href="#">${no}</button></li>
									</c:if>
									<c:if test="${qnaList.pageMaker.curPage != no}">
										<li class="page-item"><button class="page-link page" onclick="changeQnaList(${no})">${no}</button></li>
									</c:if>
                                </c:forEach>
                                <c:if test="${qnaList.pageMaker.curPage < qnaList.pageMaker.totPage}">  
	                                <li class="page-item">
				                        <button class="page-link" onclick="changeQnaList(${qnaList.pageMaker.nextPage});"><i class="fa fa-angle-right" aria-hidden="true"></i></button>
			                    	 </li>
                                </c:if>

                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            
            
            
         </div>
    </div>     
            
    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<script src="js/shop/board.js" defer></script>

</body>

</html>