<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
    <!--  All snippets are MIT license http://bootdey.com/license -->
    <title>chat</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
     <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">
    
    <!-- Style CSS -->
    <link rel="stylesheet" href="style.css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
	
	<link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>

	
	
	
	
	
	
	<script type="text/javascript"></script>
	
	
    
	
	
</head>

<body>


    <!-- Header Area -->
   		<!-- include_common_bottom.jsp start-->
		<jsp:include page="common/include_common_header.jsp"/>
		<!-- include_common_bottom.jsp end-->
    <!-- Header Area End -->
    
    
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

<div class="container" style="border-top:1px solid #f4f7f6;">
<div class="row clearfix">
    <div class="col-lg-12">
        <div class="card chat-app">
            <div id="plist" class="people-list" style="overflow-y: auto; height:860px">
              <!--  
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-search"></i></span>
                    </div>
                    <input type="text" class="form-control" placeholder="Search...">
                </div>
                -->

				<input name="loginId" id="loginId" type="hidden" value=${loginId}>
                <ul class="list-unstyled chat-list mt-2 mb-0" id="chatRoomList">
                <c:forEach var="list" items="${chatList}">
               
                <li class="clearfix" id="btnCall${list.c_room_no}" value=${list.c_room_no}>
                        <img src="img/user_profile/${list.you_image}" alt="avatar">
                        
                        <c:set var = "image_name" value = "${list.p_img}"/>
                      
                        
                        <div class="about">
							<input name="chatRoomNo" type="hidden" value=${list.c_room_no}/>
					<!--	<button type="button" class="btn btn-default" id="btnCall${list.c_room_no}" value=${list.c_room_no}>${list.c_room_no}</button>-->
                            <div class="name" >${list.you_id}</div> 
                            <div class="content"> <i class="fa fa-circle offline"></i>${list.c_content}</div>                                            
                            
                        </div>
                          <c:choose>
							<c:when test="${fn:startsWith(image_name, 'http')}">
                                 <img class="chatPimg" src="${list.p_img}" style="border-radius: 5px; margin: 0 auto; margin-top: 10px;">
                            </c:when>
							<c:otherwise>
                                 <img class="chatPimg" src="img/product_img/${list.p_img}" style="border-radius: 5px; margin: 0 auto; margin-top: 10px;">
							</c:otherwise>
						</c:choose>
                 </li>
                </c:forEach>
              
                </ul>
                
            </div>
            
            <div class="chat" id="chat">

						<div class="chat-header clearfix" id="chatHead">
							<div class="row">
								<div class="col-lg-4">
									<a href="javascript:void(0);" data-toggle="modal"
										data-target="#view_info"> <img
										src="img/user_profile/carrot3.png"
										alt="avatar" style="float:left;">
									</a>
									<div class="chat-about">
										<input name="myId" id="myId" type="hidden" value=${loginId}>
										<input name="path" id="path" type="hidden" value=${path}>
										<input name="newChatRoomNo" id="newChatRoomNo" type="hidden" value=${chat_room_no}>
										<h6 class="m-b-0" style="margin-bottom:2px;"><b>대장 토끼</b></h6>
										<small>자주 묻는 질문</small>
										
										
									</div>
								</div>
								<div class="col-lg-4">

								 </div>	
								 
								
								<div class="col-lg-4 hidden-sm text-right">

    							 </div>
							</div>
						</div>
						<div class="chat-history" id="chat-history" >
							<ul class="m-b-0" id="chat_history">

								<li class="clearfix">
									<div class="message-data"><img
											src="img/chat-img/logo_carrot.png"
											alt>
										<span class="message-data-adminGongji">흙토끼</span>
									</div>
									
									<div class="message my-message">
									<h6><b>기본매너</b></h6>
									<p>기본적으로 지켜야하는 매너에는 무엇이 있을까요?</p>
									<p>· 서로 존중해요. 우리 존댓말로 대화해요.<br>
									   · 모두의 시간은 소중합니다. 시간 약속을 꼭 지켜주세요.<br>
									   · 절대로 중간에 연락 끊기는 일이 없도록 해요.<br>
									   · 따듯한 감사 인사로 마무리를 지어요.<br>
									   · 늦은 시간 채팅은 부담스러울 수 있어요.<br>
									</p>
</div>
								</li>
								
								<li class="clearfix">
									<div class="message-data text-right"><img
											src="img/chat-img/logo_carrot.png"
											alt>
										<span class="message-data-adminGongji">금토끼</span>
									</div>
									<div class="message other-message float-right">
									<h6><b>이런 행동은 할 수 없어요.</b></h6>
									<p><br>
									   · 판매 금지 물품 거래.<br>
									   · 중고거래 사기 등 이웃에게 손해를 입히는 행위.<br>
									   · 허위 정보게시 등 이웃을 속이거나 기만하는 행위.<br>
									   · 불쾌감, 성적 수치심 등을 주는 행위.<br>
									   · 이웃을 배제하거나 소외시키는 행위.<br>

									</p>
</div>
								</li>
								
								
								

							</ul>
						</div>
						<div class="chat-message clearfix">
							<div class="input-group mb-0">
							<!-- 전송 버튼 -->
								<div class="input-group-prepend" id="btnChatSend">
									<span class="input-group-text"><i class="fa fa-send" ></i></span>
								</div>
								<input type="text" class="form-control" id="chat_content_msg"
									placeholder="Enter text here...">
							</div>
						</div>


            </div>
  
        </div>
    </div>
</div>
</div>

 <!-- Footer Area -->
   		<!-- include_common_bottom.jsp start-->
		<jsp:include page="common/include_common_footer.jsp"/>
		<!-- include_common_bottom.jsp end-->
    <!-- Footer Area -->
    
  

<style type="text/css">
body{
    background-color: #fff;
    margin-top:0px;
}

a{
color:#070a57;
}


.content{
  width        : 120px;     /* 너비는 변경될수 있습니다. */
  text-overflow: ellipsis;  /* 위에 설정한 100px 보다 길면 말줄임표처럼 표시합니다. */
  white-space  : nowrap;    /* 줄바꿈을 하지 않습니다. */
  overflow     : hidden;    /* 내용이 길면 감춤니다 */
  display      : block;     /* ie6이상 현재요소를 블럭처리합니다. */
}
/*     삭제하기.... */

.card {
    background: #fff;
    transition: .5s;
    border: 0;
    margin-bottom: 30px;
    border-radius: .55rem;
    position: relative;
    width: 100%;
    box-shadow: 0 1px 2px 0 rgb(0 0 0 / 10%);
}
.chat-app .people-list {
    width: 280px;
    position: absolute;
    left: 0;
    top: 0;
    padding: 20px;
    z-index: 7
}

.chat-app .chat {
    margin-left: 280px;
    border-left: 1px solid #eaeaea
}

.people-list {
    -moz-transition: .5s;
    -o-transition: .5s;
    -webkit-transition: .5s;
    transition: .5s
}

.people-list .chat-list li {
/*상품이미지 추가 우측 여백 수정*/
/*    padding: 10px 15px; */
    padding: 10px 0px;
    
    list-style: none;
    border-radius: 3px
}

.people-list .chat-list li:hover {
    background: #efefef;
    cursor: pointer
}

.people-list .chat-list li.active {
    background: #efefef
}

.people-list .chat-list li .name {
    font-size: 15px
}

.people-list .chat-list img {
    width: 45px;
    border-radius: 50%
}

.people-list img {
    float: left;
    border-radius: 50%
}

.people-list .about {
    float: left;
    padding-left: 8px
}

.people-list .status {
    color: #999;
    font-size: 13px
}

.chat .chat-header {
    padding: 15px 20px;
    border-bottom: 2px solid #f4f7f6
}

.chat .chat-header img {
    /* 헤더 프로덕트 부분 가운데 맞춤을 위해..*/
    /*float: left;*/
    border-radius: 40px;
    width: 40px
}


.chat .chat-header .chat-about {
    float: left;
    padding-left: 10px
}

.chat .chat-history {
    padding: 20px;
    border-bottom: 2px solid #fff;
        /*스크롤 하단 고정*/
    height:700px;
    overflow-y: auto;
	display:block;
    flex-direction: column-reverse;
}

.chat .chat-history ul {
    padding: 0
}

.chat .chat-history ul li {
    list-style: none;
    margin-bottom: 30px
}

.chat .chat-history ul li:last-child {
    margin-bottom: 0px
}

.chat .chat-history .message-data {
    margin-bottom: 15px
}

.chat .chat-history .message-data img {
    border-radius: 40px;
    width: 40px
}

.chat .chat-history .message-data-time {
    color: #434651;
    padding-left: 6px
}

.chat .chat-history .message {
    color: #444;
    padding: 18px 20px;
    line-height: 26px;
    font-size: 16px;
    border-radius: 7px;
    display: inline-block;
    position: relative
}
/******* 가운데 정렬 *******/
.chat .chat-history .admin-message {
    color: gray;
    padding: 18px 20px;
    line-height: 26px;
    font-size: 13px;
    border-radius: 7px;
    display: inline-block;
    position: relative;
	left:50%;
	transform:translateX(-50%);
    
    
    
}
/*************/

.chat .chat-history .message:after {
    bottom: 100%;
    left: 7%;
    border: solid transparent;
    content: " ";
    height: 0;
    width: 0;
    position: absolute;
    pointer-events: none;
    border-bottom-color: #fff;
    border-width: 10px;
    margin-left: -10px
}

.chat .chat-history .my-message {
    background: #fdf2d0
}

.chat .chat-history .my-message:after {
    bottom: 100%;
    left: 30px;
    border: solid transparent;
    content: " ";
    height: 0;
    width: 0;
    position: absolute;
    pointer-events: none;
    border-bottom-color: #fdf2d0;
    border-width: 10px;
    margin-left: -10px
}

.chat .chat-history .other-message {

    background: orange;  
	/* 내 메시지 오른쪽 정렬 
    text-align: right
    */
    text-align: left;
}

.chat .chat-history .other-message:after {
   
    border-bottom-color: orange; 

    left: 73%
}

.chat .chat-message {
    padding: 20px
}

.online,
.offline,
.me {
    margin-right: 2px;
    font-size: 8px;
    vertical-align: middle
}

.online {
    color: #86c541
}

.offline {
    color: #e47297
}

.me {
    color: #1d8ecd
}

.float-right {
    float: right
}

.clearfix:after {
    visibility: hidden;
    display: block;
    font-size: 0;
    content: " ";
    clear: both;
    height: 0
}

@media only screen and (max-width: 767px) {
    .chat-app .people-list {
        height: 465px;
        width: 100%;
        overflow-x: auto;
        background: #fff;
        left: -400px;
        display: none
    }
    .chat-app .people-list.open {
        left: 0
    }
    .chat-app .chat {
        margin: 0
    }
    .chat-app .chat .chat-header {
        border-radius: 0.55rem 0.55rem 0 0
    }
    .chat-app .chat-history {
        height: 300px;
        overflow-x: auto
    }
}

@media only screen and (min-width: 768px) and (max-width: 992px) {
    .chat-app .chat-list {
        height: 650px;
        overflow-x: auto
    }
    .chat-app .chat-history {
        height: 600px;
        overflow-x: auto
    }
}

@media only screen and (min-device-width: 768px) and (max-device-width: 1024px) and (orientation: landscape) and (-webkit-min-device-pixel-ratio: 1) {
    .chat-app .chat-list {
        height: 480px;
        overflow-x: auto
    }
    .chat-app .chat-history {
        height: calc(100vh - 350px);
        overflow-x: auto
    }
}
.dropdown-menu button{
	font-size:13px;
	
}
.dropdown-menu {
	width:240px;
	box-shadow:
	0 0 8px 0 rgb(47 91 234 / 15%);
	border-radius: 6px;
	
	
}

.chat_read_check{
	color: orange;
    font-size: 13px;
    display: inline-block;
    vertical-align: bottom;
    padding-left: 3px;
}

.chat_read_check_right{
	color: orange;
    font-size: 13px;
    display: inline-block;
    float: right;
    padding-right: 10px;
    padding-top: 40px;
}
</style>


<script type="text/javascript">

</script>

<!-- 	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
 -->	
    <!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
    
    <script src="js/jquery.easing.min.js"></script>
    <script src="js/jquery.countdown.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
  <!-- <script src="js/popper.min.js"></script>--> 
  <!-- <script src="js/bootstrap.min.js"></script>--> 
    <script src="js/default/classy-nav.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/default/scrollup.js"></script>
    <script src="js/waypoints.min.js"></script>
  <!-- <script src="js/jarallax.min.js"></script>--> 
  <!-- <script src="js/jarallax-video.min.js"></script>--> 
    <script src="js/wow.min.js"></script>
    <script src="js/default/active.js"></script>
    
    
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.10.7/dayjs.min.js"></script>

	<!-- toastr -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>   
    
	

<!-- js -->
	<script type="text/javascript" src="js/common/CommonHtmlContents.js"></script>
<!-- 	<script type="text/javascript" src="js/common/user_session_check.js"></script>
 -->	
	<script src="js/chat/chat_room.js"></script>
	<script src="js/orders/orders.js"></script>
	<script type="text/javascript"></script>
    
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

.people-list .chat-list li .name {
    font-size: 15px;
    font-weight: 700;
}



    
</body>
</html>