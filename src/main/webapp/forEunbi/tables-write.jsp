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
                        <h4>QnA Write</h4>
                    </div>
                    <div class="shortcodes_content">
                        <div class="table-responsive">
                        	<form id="qna_write_form" method="post">
	                            <table class="table mb-0 table-bordered">
	                                <thead>
	                                    <tr>
	                                        <th scope="col" class="board_title">
	                                        	<input type="text" name="q_title" id="q_title_txt" placeholder=" title" />
	                                        </th>
	                                        <th scope="col" class="board_writer">${sM_id}</th>
	                                        <th scope="col" class="board_date"><fmt:formatDate value='${toDay}' pattern='yyyy-MM-dd' /></th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <tr>
	                                        <td id="qna_content_td" colspan="3">
	                                        	<textarea name="q_content" id="q_content_area" placeholder=" content"></textarea>
	                                        </td>
	                                    </tr>
	                                </tbody>
	                            </table>
                      				<input type="hidden" name="pageno" value="${pageno}" />
                      				<input type="hidden" name="m_id" value="${sM_id}" />
                			</form>
                        </div>
                    </div>
                    	<div id="qna_btn_container">
							<input class="qna_btn new_write" type="button" value="등록" />
							<input class="qna_btn list" type="button" pageno="${pageno}" value="목록" />
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
	<script src="js/shop/board.js"></script>

</body>

</html>