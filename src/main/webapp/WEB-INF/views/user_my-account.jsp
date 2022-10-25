<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c"  uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" href="css/user.css">

<!-- javaScript -->
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=a7c7231db91ae56cfc5e3c6ea06f73c6&libraries=services"></script>
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
		<jsp:include page="common/include_common_header.jsp"/>
		<!-- include_common_bottom.jsp end-->
	<!-- Header Area End -->

	<!-- Breadcumb Area -->
	<div class="breadcumb_area">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<h5>마이페이지</h5>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="main">메인</a></li>
						<li class="breadcrumb-item active">마이페이지</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcumb Area -->

	<!-- My Account Area -->
	<section class="my-account-area section_padding_100_50">
		<div id="container" class="container">
			<div class="row">
				<div class="col-12 col-lg-3">
					<div class="my-account-navigation mb-50">
						<ul>
							<!-- (수정필요)활성화에 따라서, active를 넣는 작업 해야함! -->
							<li class="active"><a href="user_my_account" id="user_my_account">마이페이지</a></li>
							<li class=""><a href="#" id="user_account_details">회원정보수정</a></li>
							<li class=""><a href="" id="user_view_addresses">내 동네설정</a></li>
							<li class=""><a href="#" id="">흙당근 포인트 내역</a></li>
							<li class=""><a href="#" id="user_received_reviewList">받은 거래 후기</a></li>
							<li class=""><a href="user_logout_action">로그아웃</a></li>
							<li class=""><a href="#" id="user_remove_form" style="color:#6c757d">회원탈퇴</a></li>
						</ul>
					</div>
				</div>
				<div class="col-12 col-lg-9">
		<!-- START!! ************************************************ -->
					<div id="my-account-content" class="my-account-content mb-50" style="margin-bottom: 20px">
						<div class="shortcodes_content mb-100" style="margin-bottom:0px">
	                        <div class="col-12 col-lg-9" style="text-align:center;max-width:100%">
		                        <!-- 더나은 방법을 찾고싶다! -->
		                        <div class="circle" style="display:inline-block;height:120px">
		                        	<div class="" style="position:relative">
			                        <c:set var="string" value="${sUser.user_profile}"/>
									<c:choose>
										<c:when test="${fn:startsWith(string,'http://')}">
				                            <img class="img-circle" src="${sUser.user_profile}" onerror="this.src='img/user_profile/newCarrot.jpg'">
										</c:when>
										<c:otherwise>
				                            <img class="img-circle" src="img/user_profile/${sUser.user_profile}" onerror="this.src='img/user_profile/newCarrot.jpg'" >
										</c:otherwise>
									</c:choose>
										<div class="img-edit" style="position:absolute;padding-top:77px;padding-left:77px">
										<i class="icofont-edit" style="font-size:20px;color:#747794"></i>
										<!-- <span style="background-color: #f8f8ff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><i class="icofont-ui-edit" ></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> -->
										</div>
									</div>
									<!-- 프로필 이미지 -->
								</div>
								<br>
								<div>
									<p class="my-user">
										<span style="color:#212529"><strong >${sUser.user_id}</strong> 님, 안녕하세요?</span><br>
										<i class="icofont-ui-rating" style="font-size:10pt;color:orange"></i><span>${sUser.user_freshness}</span>&nbsp;&nbsp;
										<i class="icofont-money-bag" style="font-size:10pt;color:orange"></i><span><fmt:formatNumber value="${sUser.user_point}" type="number"/></span>
									</p>
									<p>
									</p>
								</div>
	                        </div>
						</div>
	                    <div class="shortcodes_content mb-100" style="margin-bottom: 20px;border:1px solid #d6e6fb">
	                        <form class="invi_form">
	                            <div class="form-group">
	                                <label for="invi_email">흙당근마켓에 친구를 초대해보세요!</label>
	                                <input type="email" class="form-control" id="invi_email" name="invi_email" aria-describedby="emailHelp" placeholder="이메일 주소">
	                                <small id="emailHelp" class="form-text text-muted">초대받은 친구가 회원가입시, 500point를 드립니다!.</small>
	                            </div>
	                        </form>
	                        <div style="text-align:right">
	                        	<button type="submit" class="btn btn-primary" id="btn_invi">메일전송</button>
	                        </div>
						</div>
                    </div>
		<!-- END!! ************************************************** -->
				</div>
			</div>
		</div>
	</section>
	<!-- My Account Area -->

	<!-- Footer Area -->
		<!-- include_common_bottom.jsp start-->
		<jsp:include page="common/include_common_footer.jsp"/>
		<!-- include_common_bottom.jsp end-->
	<!-- Footer Area -->

	<!-- jQuery (Necessary for All JavaScript Plugins) -->
	<script src="js/jquery.min.js"></script>
<<<<<<< HEAD
	<!-- <script src="js/popper.min.js"></script> -->
=======
	<script src="js/popper.min.js"></script>
>>>>>>> branch 'master' of https://github.com/2022-05-JAVA-DEVELOPER/final-project-team3-brown_carrot_market.git
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

<!-- 회원정보수정 Validate -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>


<script type="text/javascript" src="js/common/user_session_check.js"></script>
<script type="text/javascript" src="js/common/CommonHtmlContents.js"></script>
<script type="text/javascript" src="js/user/UserHtmlContents.js"></script>

<script type="text/javascript" src="js/user/user_my_account.js"></script>

<!-- toastr -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<script type="text/javascript">
		$(function() {
			/* [회원정보수정]user_modify_form ******************************************/
			/*
			// validator객체변수선언 
			var validator = null;
			//validator객체 디폴트속성 설정
			$.validator.setDefaults({
					rules : {
						user_pw_new : {
							required : false
						},
						user_pw_new2 : {
							required : false,
							equalTo : "#user_pw_new2"
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
						user_pw : {
							//required : '비밀번호를 입력하세요'
						},
						user_pw2 : {
							//required : '비밀번호확인을 입력하세요',
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
			 validator = $('#user_modify_form').validate();
			 */
			 /****************user_modify_action******************/
				$(document).on('click',	'#btn_user_modify_action',function(e) {
					console.log("click!! >> "+e.target);
					//if(validator.form()){
					if($("#user_pw_new").val() != ""){
						if ($("#user_pw_new2").val() == "") {
							//alert("비밀번호확인을 입력하십시요.");
							toastr['error']("비밀번호확인을 입력하십시요.");
							$("#user_pw_new").focus();
							return false;
						}
						if ($("#user_pw_new").val() != $("#user_pw_new2").val()) {
							//alert("비밀번호와 비밀번호확인은 일치하여야합니다.");
							toastr['error']("비밀번호와 비밀번호확인은 일치하여야합니다.");
							$("#user_pw_new").focus();
							$("#user_pw_new").select();
							return false;
						}
						$('#user_pw').val($('#user_pw_new').val());
					}
				    var param = $('#user_modify_form').serialize();
				    console.log(param);
				    $.ajax({
						url : 'user_modify_action_json',
						method : 'POST',
						dataType : 'json',
						data : param,
						success : function(jsonResult) {
						    if (jsonResult.code == 1) {
							 	$('#my-account-content').html(UserHtmlContents.user_view_content(jsonResult.data[0]));
						    } else if (jsonResult.code == 2) {
								location.href='main';
						    }
						    console.log(jsonResult);
						}
				    });
					//}
					e.preventDefault();
				});
			/****************user_view_addresses******************/
			$(document).on('click',	'#user_view_addresses',function(e) {
				console.log("click!! >> #user_view_addresses");
				$('.my-account-navigation > ul li').removeClass('active');
				$(e.target).closest('li').addClass('active');
				
			    $.ajax({
					url : 'user_view_json',
					method : 'POST',
					dataType : 'json',
					success : function(jsonResult) {
							//주소의 갯수를 확인해보자
							var addressCount=jsonResult.data[0].addressList.length;
							
							if(addressCount==0){
								$('#my-account-content').html(UserHtmlContents.user_view_addresses_zero(jsonResult.data[0].addressList));
							}else if (addressCount==1) {
								$('#my-account-content').html(UserHtmlContents.user_view_addresses_one(jsonResult.data[0].addressList));
							}else if (addressCount==2) {
								$('#my-account-content').html(UserHtmlContents.user_view_addresses(jsonResult.data[0].addressList));
								if(jsonResult.data[0].addressList[0].address_range > 0){
									$('#btn_address_first').parent($("address")).addClass("selected_Address");
									$('#btn_address_first').css("background","#0f99f3");
									$('#btn_address_first').css("color","#fff");
									$(".selected_Address > input[name=address_range]").attr("disabled",false);
									
								}else{
									$('#btn_address_second').parent($("address")).addClass("selected_Address");
									$('#btn_address_second').css("background","#0f99f3");
									$('#btn_address_second').css("color","#fff");
									$(".selected_Address > input[name=address_range]").attr("disabled",false);
									
									/*
									$('#btn_address_second').addClass("selected_sAddress");
									$(e.target).addClass("selected_sAddress");
									$(".selected_sAddress").css("background","#0f99f3");
									$(".selected_sAddress").css("color","#fff");
									$(".selected_sAddress").parent($("address")).children("input[name=address_range]").attr("disabled",false);
									*/
								}
							}
					    }
				});
				e.preventDefault();
			});
			
		 /****************remove_address******************/
			$(document).on('click',	'#btn_remove_first,#btn_remove_second',function(e) {
			//$(document).on('click',	'.remove',function(e) {
				console.log('click!!'+$(e.target).parent($("address")).children("input[name=address_name]").val());
				$.ajax({
					url : 'user_remove_address_json',
					method : 'POST',
					data: $(e.target).parent($("address")).children().serialize(),
					dataType : 'json',
					success : function(jsonResult) {
						    console.log(jsonResult);
						    $( "#user_view_addresses" ).trigger( "click" );
					    }
				});
				e.preventDefault();
			});
			
		 /****************change_selected_address[type='radio']******************/
			$(document).on('click', "#btn_address_first,#btn_address_second",function(e) {
				console.log('click!!'+e.target.id);
				console.log($(e.target).parent($("address")).hasClass('selected_Address'));
				
				//if(!$(e.target).parent($("address")).hasClass('selected_Address')){
					//선택 해제
					$(".selected_Address>input[name=address_name]").css("background","");
					$(".selected_Address>input[name=address_name]").css("color","");
					$(".selected_Address>input[name=address_range]").attr("disabled",true);
					$(".selected_Address>input[name=address_range]").val(0);
					$(".selected_Address>.range_val").text(0);
					//$(".selected_Address>input[name=address_range]").trigger( "change" );
					//$(".selected_sAddress").parent($("address")).children("input[name=address_range]").trigger( "change" );
					
					$.ajax({
						url : 'user_update_address_range_json',
						method : 'POST',
						data: $(".change_Address > *").serialize(),
						dataType : 'json',
						success : function(jsonResult) {
							    console.log(jsonResult);
							    //$('.change_Address').removeClass("change_Address");
							    //$( "#user_view_addresses" ).trigger( "click" );
								$(".selected_Address").removeClass("selected_Address");
								
								//선택
								$(e.target).parent($("address")).addClass("selected_Address");
								$(".selected_Address>input[name=address_name]").css("background","#0f99f3");
								$(".selected_Address>input[name=address_name]").css("color","#fff");
								$(".selected_Address>input[name=address_range]").attr("disabled",false);
								//$(".selected_Address>input[name=address_range]").val(3);
								//$(".selected_Address>.range_val").text(3);
						    }
					});
				//}
				e.preventDefault();
			});
		 
			 /****************update_address_range******************/
			$(document).on('change', "[type='range']",function(e) {
				
				var selectedAddress = $(e.target).parent($("address"));
				selectedAddress.addClass("change_Address");
				
				$.ajax({
					url : 'user_update_address_range_json',
					method : 'POST',
					data: $(".change_Address > *").serialize(),
					dataType : 'json',
					success : function(jsonResult) {
						    console.log(jsonResult);
						    $('.change_Address').removeClass("change_Address");
						    $( "#user_view_addresses" ).trigger( "click" );
					    }
				});
				e.preventDefault();
			});
			 /****************user_insert_addresses******************/
			//(Step_1) Getting a address
			$(document).on('click',	'#btn_address_new1,#btn_address_new2',function(e) {
				var selectedAddress = $(e.target).parent($("address"));
				selectedAddress.addClass("selected_address");
				$(e.target).addClass("selected");
				
				$(".selected_address > input[name=address_name] ").val('서울시 서초구 역삼동');
				$(".selected_address > input[name=address_lat] ").val(37.50082663);
				$(".selected_address > input[name=address_lng] ").val(127.0366527);
				
		    /**********************************************************/
		    	// 주소-좌표 변환 객체를 생성합니다
		    	var geocoder = new kakao.maps.services.Geocoder();
				// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
				if (navigator.geolocation) {
				    // ***GeoLocation을 이용해서 접속 위치를 얻어옵니다
				    navigator.geolocation.getCurrentPosition(function(position) {
				        var lat = position.coords.latitude, // 위도
				            lon = position.coords.longitude; // 경도
				        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				            message = '여기에 계신가요?!'; // 인포윈도우에 표시될 내용입니다
				            console.log("locPosition: "+locPosition.getLat(),locPosition.getLng());
				            console.log(message);
							/*좌표->주소 변환*********************************************************/
							 //searchDetailAddrFromCoords(locPosition, function(result, status) {
							 //if (status === kakao.maps.services.Status.OK) {
							    	//console.log('도로명주소 : ' + result[0].road_address.address_name);
							    	//console.log('지번 주소 : ' + result[0].address.address_name);
							            //var detailAddr = !!result[0].road_address ? result[0].road_address.address_name  : '';
							           // var detailAddr = result[0].address.address_name;
							           		//주소를 동까지만 자릅니다.
							           	//	subStr = detailAddr.lastIndexOf(" ");
							           	//	detailAddr=detailAddr.substring(0,subStr);
											/*
							           		$(".selected_address > input[name=address_name] ").val(detailAddr);
											$(".selected_address > input[name=address_lat] ").val(lat);
											$(".selected_address > input[name=address_lng] ").val(lon);
											confirm("[ "+detailAddr+"] "+message);
											*/
							           		$(".selected_address > input[name=address_name] ").val('서울시 서초구 역삼동');
											$(".selected_address > input[name=address_lat] ").val(37.50082663);
											$(".selected_address > input[name=address_lng] ").val(127.0366527);
											confirm("[ 서울시 서초구 역삼동 ] "+message);
											
											$.ajax({
												url : 'user_insert_address_json',
												method : 'POST',
												data: $(".selected_address > *").serialize(),
												dataType : 'json',
												success : function(jsonResult) {
													    console.log(jsonResult);
													    if(jsonResult.code==0) toastr['error']("동일한 주소는 1개만 등록가능합니다.");
													    $( "#user_view_addresses" ).trigger( "click" );
												    }
											});
							       // }
							 //});
							/**********************************************************/
				      });
				} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
				    //var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
				        message = 'geolocation을 사용할수 없어요..'
			        	$("._selected").val(message);
				}
			/**********************************************************/
				/*좌표->주소 변환*********************************************************/
				function searchAddrFromCoords(coords, callback) {
				    // 좌표로 행정동 주소 정보를 요청합니다
				    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
				}
				function searchDetailAddrFromCoords(coords, callback) {
				    // 좌표로 법정동 상세 주소 정보를 요청합니다
				    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
				}
		/**********************************************************/
				e.preventDefault();
			});

			
			
			/* View_user_profile********************************/
			$(document).on('click', '.img-circle, .img-edit', function(e) {
				 $.ajax({
						url:'user_view_json',
						method:'POST',
						dataType:'json',
						success:function(jsonResult){
							$('#my-account-content').html(UserHtmlContents.user_profile_edit(jsonResult.data[0]));
							if(jsonResult.data[0].user_profile=='newCarrot.jpg'){
								$('.remove_profile').attr('type','hidden');
								$('.edit_profile').val('사진 추가');
							}
						}
					});
				e.preventDefault();
			});
			/*******************************************/
			
			/* Edit_user_profile********************************/
			$(document).on('click', '.edit_profile', function(e) {
				$("#chooseF").trigger('click');
				e.preventDefault();
			});
			/*******************************************/
			
			/* Save_user_profile********************************/
			$(document).on('click', '.save_profile', function(e) {
				
				const formData = new FormData($('#image_form')[0]);
					 $.ajax({
							url:'user/upload',
							type:'POST',
							processData:false,	//파일전송시 반드시 false
							contentType:false,
							data:formData,
							success:function(jsonResult){
								 console.log(jsonResult);
								 $.ajax({
										url : 'user_update_profile_json',
										method : 'POST',
										data: {
											"user_id":$("input[name='user_id']").val(),
											"user_profile": jsonResult.newFileName 
										},
										dataType : 'json',
										success : function(jsonResult) {
											 console.log(jsonResult.msg);
											 //수정필요
											 $("#user_my_account").get(0).click();
									    }
									});
							}
						 });
					e.preventDefault();
			
			});
			/*******************************************/
			
			/* Remove_user_profile********************************/
			$(document).on('click', '.remove_profile', function(e) {
			
				console.log($("#user_profile").attr('user_profile'));
				 $.ajax({
						url : 'user/delete',
						method : 'POST',
						data: {
							"user_profile":$("#user_profile").attr('user_profile')
						},
						dataType : 'json',
						success : function(jsonResult) {
							 console.log('파일 delete 성공!!');
							 $.ajax({
									url : 'user_update_profile_json',
									method : 'POST',
									data: {
										"user_id":$("input[name='user_id']").val(),
										"user_profile": "newCarrot.jpg"
									},
									dataType : 'json',
									success : function(jsonResult) {
										 console.log('성공!!');
										//수정필요
										 $("#user_my_account").get(0).click();
								    }
								});
					    }
					});
				
				e.preventDefault();
			});
			/*******************************************/
			
			//이미지가 업로드 되면
			$(document).on('change','#chooseF',function(e){
				//console.log($.isEmptyObject($('input[type=file]')[0].files[0]));	//파일정보
				loadFile($('input[type=file]')[0]);	//첫번째 파일 로드
				
				$(".edit_profile").addClass("save_profile");
				 $(".edit_profile").removeClass("edit_profile");
				 $(".save_profile").val("사진 저장");
				
				 $('.remove_profile').attr('type','hidden');
				e.preventDefault();
			});
			
			//화면에 load하기 위해 blob 만들어서 삽입
			function loadFile(input) {
				var file = input.files[0];
			    document.getElementById('user_profile').src=URL.createObjectURL(file);
			}
			
			/* user_received_reviewList********************************/
			$(document).on('click', '#user_received_reviewList', function(e) {
				$('.my-account-navigation > ul li').removeClass('active');
				$(e.target).closest('li').addClass('active');
				 $.ajax({
						url:'user_received_reviewList_json',
						method:'POST',
						/*dataType:'json',*/
						success:function(jsonResult){
							//console.log(jsonResult);
							$('#my-account-content').html(UserHtmlContents.user_received_reviewList2(jsonResult.data));
						}
					});
				e.preventDefault();
			});
			
			
			/* user_remove_form ********************************/
			$(document).on('click', '#user_remove_form', function(e) {
				console.log('user_remove_form');
				$('.my-account-navigation > ul li').removeClass('active');
				$(e.target).closest('li').addClass('active');
				$('#my-account-content').html(UserHtmlContents.user_remove_form(""));
				e.preventDefault();
			});
			
			/* user_remove_action ********************************/
			$(document).on('click', '#btn_user_remove', function(e) {
				console.log('btn_user_remove');
				console.log($('#user_pw').val());
				if(!$('#user_pw').val()){
					//alert('비밀번호 입력해주세요');
					toastr['error']('비밀번호 입력해주세요');
					return false;
				}
				if(!$('#chk_remove').is(':checked')){
					//alert('checkbox를 체크해주세요');
					toastr['error']('checkbox를 체크해주세요');
					return false;
				} 
				 $.ajax({
						url:'user_remove_action_json',
						method:'POST',
						data: {"user_pw":$("#user_pw").val()},
						success:function(jsonResult){
							if(jsonResult.code==20){
								location.href='main';
							}else{
								$('#my-account-content').html(UserHtmlContents.user_remove_form(jsonResult.msg));
							}
						}
					});
				e.preventDefault();
			});
			
		});//END
</script>



</body>

</html>