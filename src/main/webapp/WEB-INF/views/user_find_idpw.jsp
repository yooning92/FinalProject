<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title  -->
<title>Brown Carrot Market</title>

<!-- Favicon  -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Style CSS -->
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="css/user.css">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 회원가입 Validate -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>

<script type="text/javascript" src="js/common/CommonHtmlContents.js"></script>
<script type="text/javascript" src="js/user/UserHtmlContents.js"></script>
<script type="text/javascript" src="js/common/user_session_check.js"></script>

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
	<jsp:include page="common/include_common_header.jsp" />
	<!-- include_common_bottom.jsp end-->
	<!-- Header Area End -->

	<!-- Breadcumb Area -->
	<div class="breadcumb_area">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<h5>아이디 &amp; 비밀번호찾기</h5>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="main">Home</a></li>
						<li class="breadcrumb-item"><a href="user_login">로그인
								&amp; 회원가입</a></li>
						<li class="breadcrumb-item active">아이디 &amp; 비밀번호찾기</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcumb Area -->

	<!-- START!! **************************************************************** -->
	<div class="bigshop_reg_log_area section_padding_100_50">
		<div class="container">
			<div class="row" style="justify-content: center;">
				<!-- div ***************************** -->
				<div class="col-12 col-md-6" >
					<!-- <div class="login_form mb-50"> -->
	<!-- FindIdPW Area -->
						<div class="shortcodes_content"  style="background-color: #f8f8ff">
							<div class="mb-6" style="text-align:center">
								<h5 class="mb-6">
									<img src="img/core-img/favicon.ico" style="height:40px">회원정보&nbsp;&nbsp;&nbsp;&nbsp;<br/>
								</h5>
								<h6>
									<input type="radio" class="" id="radio_find_id" name="radio_tag" onclick="find_form_check(1)" checked="checked">
									 <label class="" for="radio_find_id">아이디 찾기</label> &nbsp;&nbsp;
									<input type="radio"  class="" id="radio_find_pw" name="radio_tag" onclick="find_form_check(2)">
									 <label class="" for="radio_find_pw">비밀번호 찾기</label>
							 	</h6>
							</div>
							<hr>
							<!-- (START)Find_id -->
							<div id="find_id">
								<form id="find_id_form" action="find_id_action" method="post">
									<div class="form-group">
										<label class="" for="user_name">이름</label>
										<input class="form-control" id="user_name" name="user_name" value="" placeholder="">
									</div>
									<div class="form-group">
										<label class="" for="user_email1">이메일주소</label>
										<input type="email" class="form-control" id="user_email1" name="user_email" value="" placeholder="">
									</div>
									<input type="button" id="btn_find_id_action" style="width: 222px; height: 54px; font-size: 1rem;"
										class="btn btn-carrot btn-sm" value="다음"
										data-toggle="modal" data-target="">
<!-- 										data-toggle="modal" data-target="#exampleModalCenter"> -->
								</form>
							</div>
							<!-- (END)Find_id -->
	
							<!-- (START)Find_pw -->
							<div id="find_pw" style="display: none">
								<form id="find_pw_form" action="find_pw_action" method="post">
									<div class="form-group">
										<label class="" for="user_id">아이디</label>
										<input class="form-control" id="user_id" name="user_id" value="" placeholder="">
									</div>
									<div class="form-group add_progress">
										<label class="" for="user_email2">이메일주소</label>
										<input type="email" class="form-control" id="user_email2" name="user_email" value="" placeholder="">
									</div>
									<!-- <button type="submit" class="btn btn-primary btn-sm btn_user_login_action" >Login</button> -->
									<!-- <input id="btn_user_login_action" type="button" value="로그인"> &nbsp; -->
									<input type="button" id="btn_find_pw_action" style="width: 222px; height: 54px; font-size: 1rem;"
										class="btn btn-carrot btn-sm" value="다음" >
									<input type="hidden" id="btn_find_pw_action2" class="btn btn-primary" data-toggle="modal" data-target="#findPwModalCenter">
								</form>
							</div>
							<!-- (END)Find_pw -->
							<!-- Button trigger modal -->
			                <!-- 
			                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
			                        Launch demo modal
			                    </button>
							-->
		                    <!-- Modal -->
							<!-- +++++++++++++++++++
			                Bootstrap Default Modals
			                ++++++++++++++++++++ -->
							<div class="modal fade" id="findIdModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		                        <div class="modal-dialog modal-dialog-centered" role="document">
		                            <div class="modal-content">
		                                <div class="modal-header">
		                                    <h5 class="modal-title" id="exampleModalCenterTitle"><img src="img/core-img/logo.png" style="height:30px;"></h5>
		                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                                        <span aria-hidden="true">&times;</span>
		                                    </button>
		                                </div>
		                                <div class="modal-body" style="text-align:center">
		                                	<h6 id="find_id_h6">고객님의 정보와 일치하는 아이디입니다</h6>
		                                    <p class="mb-0" id="find_id_modal_body" ></p>
		                                </div>
		                                <div class="modal-footer">
		                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		                                    <button type="button" class="btn btn-primary find_pw" data-dismiss="modal" onclick="find_form_check(2)">비밀번호찾기</button>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
			                <!-- +++++++++++++++++++
			                Bootstrap Default Modals
			                ++++++++++++++++++++ -->
							<!-- +++++++++++++++++++
			                Bootstrap Default Modals
			                ++++++++++++++++++++ -->
							<div class="modal fade" id="findPwModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		                        <div class="modal-dialog modal-dialog-centered" role="document">
		                            <div class="modal-content">
		                                <div class="modal-header">
		                                    <h5 class="modal-title" id="exampleModalCenterTitle"><img src="img/core-img/logo.png" style="height:30px;"></h5>
		                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                                        <span aria-hidden="true">&times;</span>
		                                    </button>
		                                </div>
		                                <div class="modal-body" style="text-align:center">
		                                	<h6 id="find_pw_h6">고객님의 정보로 임시비밀번호를 발급해드렸습니다.</h6>
		                                    <p class="mb-0" id="find_pw_modal_body" ></p>
		                                </div>
		                                <div class="modal-footer">
		                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		                                    <button type="button" class="btn btn-primary go_login" data-dismiss="modal" onclick="location.href='user_login'">로그인하러가기</button>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
			                <!-- +++++++++++++++++++
			                Bootstrap Default Modals
			                ++++++++++++++++++++ -->
						</div>
	<!-- FindIdPW Area End -->
					<!-- </div> -->
                </div>
			</div>
		</div>
	</div>
	<!-- END!! **************************************************************** -->

	<!-- Footer Area -->
	<!-- include_common_bottom.jsp start-->
	<jsp:include page="common/include_common_footer.jsp" />
	<!-- include_common_bottom.jsp end-->
	<!-- Footer Area -->


	<!-- jQuery (Necessary for All JavaScript Plugins) -->
	<!-- <script src="js/jquery.min.js"></script> -->
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
	<!--  -->
	<script src="js/user/user_find_idpw.js"></script>
	
	<script type="text/javascript">
		
	</script>

</body>

</html>