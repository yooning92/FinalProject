<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
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

<!-- <script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<!-- toaster -->
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
	<jsp:include page="common/include_common_header.jsp" />
	<!-- include_common_bottom.jsp end-->
	<!-- Header Area End -->

	<!-- Breadcumb Area -->
	<div class="breadcumb_area">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<h5>로그인 &amp; 회원가입</h5>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="main">메인</a></li>
						<li class="breadcrumb-item active">로그인 &amp; 회원가입</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcumb Area -->

	<!-- START!! **************************************************************** -->
	<!-- Login Area -->
	<div class="bigshop_reg_log_area section_padding_100_50">
		<div class="container">
			<div class="row">
				<!-- LOGIN ***************************** -->
				<div class="col-12 col-md-6">
					<div class="login_form mb-50">
						<h5 class="mb-3">로그인</h5>
						<font color="red" id="msg1">${msg1}</font> <font color="red"
							id="msg2">${msg2}</font>

						<form id="user_login_form" action="user_login_action"
							method="post">
							<div class="form-group">
								<!-- <input type="email" class="form-control" id="username" placeholder="Email or Username"> -->
								<input class="form-control" id="login_user_id" name="user_id"
									value="${loginUser.user_id}" placeholder="아이디">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="login_user_pw"
									name="user_pw" value="${loginUser.user_pw}" placeholder="비밀번호">
							</div>
							<div class="form-check">
								<!-- 이것은 어떻게 구현하는 것인가.....  -->
								<div class="custom-control custom-checkbox mb-3 pl-1">
									<input type="checkbox" class="custom-control-input"
										id="customChe"> <label class="custom-control-label"
										for="customChe">아이디 저장</label>
								</div>
							</div>
							<!-- <button type="submit" class="btn btn-primary btn-sm btn_user_login_action" >Login</button> -->
							<!-- <input id="btn_user_login_action" type="button" value="로그인"> &nbsp; -->
							<input type="button" id="btn_user_login_action"
								style="width: 222px; height: 54px; font-size: 1rem;"
								class="btn btn-primary btn-sm" value="로그인">
						</form>
						<!-- Forget Password -->
						<div class="forget_pass mt-15">
							<i class="icofont-lock"></i> <a href="user_find_idpw" id="findIdPw">아이디 / 비밀번호 찾기</a>
						</div>
						<hr>
						<br>
						<div>
							<!-- <a id="kakao-login-btn" href="javascript:loginWithKakao()"> width="222"-->
							<a id="kakao-login-btn" href="javascript:loginWithKakao()"> <img
								src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
								width="222" alt="카카오 로그인 버튼" />
							</a>
							<p id="token-result"></p>
						</div>
					</div>
				</div>

				<!-- REGISTER ***************************** -->

				<div class="col-12 col-md-6">
					<div class="login_form mb-50">
						<h5 class="mb-3">회원가입</h5>
						<font color="red" id="msg3"></font>

						<form id="user_write_form" action="my-account.html" method="post">
							<div class="form-group">
								<input type="text" class="form-control" id="user_id"
									name="user_id" value="${fuser.user_id}" placeholder="아이디">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="user_pw"
									name="user_pw" value="${fuser.user_pw}" placeholder="비밀번호">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="user_pw2"
									name="user_pw2" value="${fuser.user_pw}" placeholder="비밀번호 확인">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="user_name"
									name="user_name" value="${fuser.user_name}" placeholder="이름">
							</div>
							<div class="form-group">
								<input type="email" class="form-control" id="user_email"
									name="user_email" value="${fuser.user_email}"
									placeholder="이메일주소">
							</div>
							<div class="form-group">
								<input type="text" class="form-control phone_number"
									id="user_phone" name="user_phone" value="${fuser.user_phone}"
									placeholder="핸드폰번호">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="address_name"
									name="address_name" value=""
									placeholder="위치접근을 '허용'해주세요. 나중에 입력가능" readonly>
							</div>
							<div class="form-group">
								<input type="hidden" class="form-control" id="address_lat"
									name="address_lat" value="0.0" placeholder="위도">
							</div>
							<div class="form-group">
								<input type="hidden" class="form-control" id="address_lng"
									name="address_lng" value="0.0" placeholder="경도">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="invi_email"
									name="invi_email" value="" placeholder="초대코드">
							</div>
							<!-- <input type="button" id="btn_user_write_action"
								class="btn btn-primary btn-sm" value="회원가입"> -->
							<input type="button" id="btn_user_write_action"
								style="width: 222px; height: 54px; font-size: 1rem;"
								class="btn btn-primary btn-sm" value="회원가입">
						</form>
					</div>
				</div>


			</div>
		</div>
	</div>
	<!-- Login Area End -->
	<!-- END!! **************************************************************** -->

	<!-- Footer Area -->
	<!-- include_common_bottom.jsp start-->
	<jsp:include page="common/include_common_footer.jsp" />
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


<!-- 회원가입 Validate -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
<!-- kakao map api -->
<script type="text/javascript"
	src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=a7c7231db91ae56cfc5e3c6ea06f73c6&libraries=services"></script>
<script type="text/javascript" src="js/common/CommonHtmlContents.js"></script>
<script type="text/javascript" src="js/user/UserHtmlContents.js"></script>
<script type="text/javascript" src="js/common/user_session_check.js"></script>
<script type="text/javascript" src="js/user/user_login.js"></script>
<!-- kakao Login api -->
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js"
	integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL"
	crossorigin="anonymous"></script>
	
<!-- toastr -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<script type="text/javascript">
	$(function() {
		toastr.options.positionClass = "toast-top-right";
		/* validator객체변수선언 */
		var validator = null;
		var validator2 = validator;
		
		// validate 전화번호 형식 추가
		$.validator.addMethod("phone", function(phone_number, element) {
			    phone_number = phone_number.replace(/\s+/g, ""); 
			    return this.optional(element) || phone_number.length > 10 &&
							phone_number.match(/^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/)
							|| this.optional(element) || phone_number.length > 10 &&
							phone_number.match(/^\d{2,3}-\d{3,4}-\d{4}$/)
							|| this.optional(element) || phone_number.length > 10 &&
							phone_number.match(/^(?:(010\d{4})|(01[1|6|7|8|9]\d{3,4}))(\d{4})$/)
							|| this.optional(element) || phone_number.length > 10 &&
							phone_number.match(/^\d{2,3}\d{3,4}\d{4}$/)
							;
		}, "핸드폰번호를 끝까지 입력해주세요.");
		
		/*validator객체 디폴트속성 설정*/
		$.validator.setDefaults({
			rules : {
				user_id : {
					required : true
				},
				user_pw : {
					required : true
				},
				user_pw2 : {
					required : true,
					equalTo : "#user_pw"
				},
				user_name : {
					required : true
				},
				user_email : {
					required : true,
					email : true
				},
				user_phone:{
					required: true,
					phone : true
				}
			},
			messages : {
				user_id : {
					required : '아이디를 입력하세요'
				},
				user_pw : {
					required : '비밀번호를 입력하세요'
				},
				user_pw2 : {
					required : '비밀번호확인을 입력하세요',
					equalTo : '비밀번호와 비밀번호확인은 일치하여야 합니다'
				},
				user_name : {
					required : '이름을 입력하세요'
				},
				user_email : {
					required : '이메일을 입력하세요',
					email : '이메일형식이 잘못되었습니다.'
				},
				user_phone : {
					required : '핸드폰번호를 입력하세요',
					phone : '핸드폰번호형식이 잘못되었습니다'
				}
			},
			errorClass : 'error',
			validClass : 'valid'
		});
/*
		$(document)
				.on(
						"click",
						"#address_name",
						function(e) {
							console.log('click!! - #address_name');
							// 주소-좌표 변환 객체를 생성합니다
							var geocoder = new kakao.maps.services.Geocoder();

							// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
							if (navigator.geolocation) {

								// ***GeoLocation을 이용해서 접속 위치를 얻어옵니다
								navigator.geolocation
										.getCurrentPosition(function(position) {

											var lat = position.coords.latitude, // 위도
											lon = position.coords.longitude; // 경도

											var locPosition = new kakao.maps.LatLng(
													lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
											message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

											console.log("locPosition: "
													+ locPosition.getLat(),
													locPosition.getLng());
											console.log(message);
											$("#address_lat").val(lat);
											$("#address_lng").val(lon);

											//좌표->주소 변환
											searchDetailAddrFromCoords(
													locPosition,
													function(result, status) {
														if (status === kakao.maps.services.Status.OK) {
															//console.log('도로명주소 : ' + result[0].road_address.address_name);
															//console.log('지번 주소 : ' + result[0].address.address_name);
															//var detailAddr = !!result[0].road_address ? result[0].road_address.address_name  : '';
															var detailAddr = result[0].address.address_name;

															//주소를 동까지만 자릅니다.
															subStr = detailAddr
																	.lastIndexOf(" ");
															detailAddr = detailAddr
																	.substring(
																			0,
																			subStr);
															$("#address_name")
																	.val(
																			detailAddr);
														}
													});
										});
							} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

								var locPosition = new kakao.maps.LatLng(
										33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'
								$("#address_name").val(message);
							}
							// 좌표->주소 변환
							function searchAddrFromCoords(coords, callback) {
								// 좌표로 행정동 주소 정보를 요청합니다
								geocoder.coord2RegionCode(coords.getLng(),
										coords.getLat(), callback);
							}
							function searchDetailAddrFromCoords(coords,
									callback) {
								// 좌표로 법정동 상세 주소 정보를 요청합니다
								geocoder.coord2Address(coords.getLng(), coords
										.getLat(), callback);
							}

						});
*/
		/************ save_login_data -> Cookie에 id저장(노골적 저장중..) ***********************/
		var cookie_user_id = getLogin(); //Cookie값 가져오기
		/* Cookie값 존재시, id에 Cookie에서 가져온 id할당 -> 체크박스 상태 체크로 변경*/
		if (cookie_user_id) {
			$("#login_user_id").val(cookie_user_id);
			$("customChe").attr("checked", true);
		}
		/* id저장 체크시 */
		$("#customChe").on("click",function() {
			var _this = this;
			var isRemember;
			if ($(_this).is(":checked")) {
				isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? PC방등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.");
				if (!isRemember) {
					$(_this).attr("checked", false);
				}
			}
		});
		/* 로그인 버튼 클릭시 -> login_action에 기술*/
		/* 로그인 정보 저장 */
		function saveLogin(id) {
			if (id != "") {
				setSave("user_id", id, 7);
			} else {
				setSave("user_id", id, -1);
			}
		}
		/* Cookie에 user_id 저장 */
		function setSave(name, value, expiredays) {
			var today = new Date();
			today.setDate(today.getDate() + expiredays);
			document.cookie = name + "=" + escape(value) + ";path=/;expires="
					+ today.toGMTString() + ";"
		}
		/* Cookie값 가져오기 */
		function getLogin() {
			var cook = document.cookie + ";";
			var idx = cook.indexOf("user_id", 0);
			var val = "";

			if (idx != -1) {
				cook = cook.substring(idx, cook.length);
				begin = cook.indexOf("=", 0) + 1;
				end = cook.indexOf(";", begin);
				val = unescape(cook.substring(begin, end));
			}
			return val;
		}
		/*****************************************/

		validator2 = $('#user_login_form').validate();
		/* user_login_action ************************************/
		$(document).on("click", "#btn_user_login_action", function(e) {
			   // 로그인 정보 저장 
			   if($("#customChe").is(":checked")){	//저장 체크시
				   saveLogin($("#login_user_id").val());
			   }else {	//체크 해제시
					saveLogin("");
				}
			//console.log($('#user_login_form').serialize());
			if (validator2.form()) {
				$.ajax({
					url : 'user_login_action_json',
					method : 'POST',
					dataType : 'json',
					data : $('#user_login_form').serialize(),
					success : function(jsonResult) {
						if (jsonResult.code == 0) {
							console.log(jsonResult);
							//$('#msg1').html(jsonResult.msg);
							
							//toastr.options.positionClass = "toast-top-right";
						      toastr['warning'](jsonResult.msg);
							
						} else if (jsonResult.code == 1) {
							//console.log(jsonResult);
							//toastr.options.positionClass = "toast-top-right";
						      toastr['warning'](jsonResult.msg);
							//$('#msg2').html(jsonResult.msg);
						} else if (jsonResult.code == 2) {
							var referrer = document.referrer;

							if (referrer.indexOf("user_login") != -1) {
								window.location.href = "main";
							} else {
								window.location.href = referrer;
							}
							//location.href = "user_my_account";	//(수정필요)main으로 보내야 할듯
						}
					}
				});

			}
			e.preventDefault();
		});

		validator=$('#user_write_form').validate();
		/****************user_write_action******************/
		$(document).on('click', '#btn_user_write_action', function(e) {
			console.log('click!! - #btn_user_write_action');
			if(validator.form()){
			console.log($('#user_write_form').serialize());
			$.ajax({
				url : 'user_write_action_json',
				method : 'POST',
				dataType : 'json',
				data : $('#user_write_form').serialize(),
				success : function(jsonResult) {
					if (jsonResult.code == 1) {
						//회원가입 부분 clear
						$('#user_write_form')[0].reset();
						
				      	toastr['success']("회원가입성공! 로그인해보세요!");
						//$('#msg1').html("회원가입성공! 로그인해보세요!");
						$("#login_user_id").focus();
						//console.log(">>>>>>> 성공!!:"+jsonResult.msg);
					} else if (jsonResult.code == 0) {
						//console.log(">>>>>>> 아이디중복!!:"+jsonResult.msg);
						//$('#msg3').html(jsonResult.msg);
						toastr['error'](jsonResult.msg);
					} else if (jsonResult.code == 2) {
						//console.log(">>>>>>> 포인트적립!!:"+jsonResult.msg);
						$('#user_write_form')[0].reset();
						//$('#msg3').html(jsonResult.msg);
						toastr.success(jsonResult.msg+' 500point가 적립되었습니다.');
						$("#login_user_id").focus();
						//alert('500point가 적립되었습니다.');
					} else if (jsonResult.code == 3) {
						//console.log(">>>>>>> 포인트적립!!:"+jsonResult.msg);
						$('#user_write_form')[0].reset();
						$("#login_user_id").focus();
						toastr.success('회원가입 성공. 존재하지않는 추천코드입니다.');
						//$('#msg3').html(jsonResult.msg);
						//alert('회원가입 성공. 존재하지않는 추천코드입니다.');
					}
					console.log(jsonResult);
				}
			});
			}    
			e.preventDefault();
		});

		$(document).on('click', '#kakao-login-btn', function(e) {
			console.log('click!');

			//e.preventDefault();
		});

	});
	/*************************************************/
</script>




	<script>
		Kakao.init('a7c7231db91ae56cfc5e3c6ea06f73c6'); // 사용하려는 앱의 JavaScript 키 입력
	</script>

	<script>
		function loginWithKakao() {
			Kakao.Auth
					.authorize({
						redirectUri : 'http://119.207.178.242/brown_carrot_market/user_kakaologin',
						prompts : 'login'
					});
		}
		/*
			function createHiddenLoginForm(kakaoId){
				
				var frm = document.createElement('form');
				frm.setAttribute('method', 'post');
				frm.setAttribute('action', '/user_kakaologin_action_json');
				var hiddenInput = document.createElement('input');
				hiddenInput.setAttribute('type','hidden');
				hiddenInput.setAttribute('name','user_id');
				hiddenInput.setAttribute('value',kakaoId);
				frm.appendChild(hiddenInput);
				document.body.appendChild(frm);
				frm.submit();
				
			}
		 */
	</script>
	
	

</body>

</html>