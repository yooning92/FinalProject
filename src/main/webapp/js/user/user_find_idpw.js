$(document).ready(function(){
	//<i class="icofont-spinner icofont-spin"></i>
	$(this).ajaxStart(function(){
      $("#preloader").show();
	});
	$(this).ajaxStop(function() {
   		$("#preloader").fadeOut();
	});
	
	
	/* validator객체변수선언 */
	var validator = null;
	
	/*validator객체 디폴트속성 설정*/
	$.validator.setDefaults({
		rules : {
			user_id : {
				required : true
			},
			user_name : {
				required : true
			},
			user_email : {
				required : true,
				email : true
			}
		},
		messages : {
			user_id : {
				required : '아이디를 입력하세요'
			},
			user_name : {
				required : '이름을 입력하세요'
			},
			user_email : {
				required : '이메일을 입력하세요',
				email : '이메일형식이 잘못되었습니다.'
			},
		},
		errorClass : 'error',
		validClass : 'valid'
	});
	
	validator = $('#find_id_form').validate();
	
	//아이디 찾기 action
	$('#btn_find_id_action').on('click',function(e){
		console.log("click: "+e.target.id);
		
		if (validator.form()) {
			$("#btn_find_id_action").attr("data-target","#findIdModalCenter");
			$.ajax({
					url : 'user_find_id_action_json',
					method : 'POST',
					dataType : 'json',
					data : $('#find_id_form').serialize(),
					success : function(jsonResult) {
							console.log(jsonResult);
							if(jsonResult.code==2){
								$("#find_id_h6").text("고객님의 정보와 일치하는 아이디입니다");
								$("#find_id_modal_body").text(jsonResult.data);
								$(".find_pw").show();
							}else if(jsonResult.code==1){
								$("#find_id_h6").text("고객님의 정보와 일치하는 아이디가 없습니다.");
								$("#find_id_modal_body").text("");
								$(".find_pw").hide();
							}
					}
				});
		}
		e.preventDefault();
	});
	
	//비밀번호 찾기 action
	$('#btn_find_pw_action').on('click',function(e){
		console.log("click: "+e.target.id);

		if (validator.form()) {
			
			$.ajax({
					url : 'user_find_pw_action_json',
					method : 'POST',
					dataType : 'json',
					data : $('#find_pw_form').serialize(),
					success : function(jsonResult) {
							console.log(jsonResult);
							//$("#btn_find_pw_action").attr("data-target","#findPwModalCenter");
							if(jsonResult.code==2){
									//일치하는 회원이 존재하면 비밀번호변경&메일발송
									$.ajax({
											url : 'springMail/findPw',
											method : 'POST',
											dataType : 'json',
											data : $('#find_pw_form').serialize(),
											beforeSend:function(e){
												//수정필요
												$('.add_progress').append("<div class='progress' style='margin-top:16px'><div class='progress-bar progress-bar-striped progress-bar-animated' role='progressbar' aria-valuenow='10' aria-valuemin='0' aria-valuemax='100' style='width: 10%'></div></div>");
												//$('.form-group').append("<div class='progress'><div class='bar'></div ><div class='percent'>0%</div ></div>");
												 var curIdx = $(".progress-bar").attr("aria-valuenow");
												  curIdx = parseInt(curIdx);
												     $(".progress-bar").animate({
												        "width": (10 * (curIdx+1))+"%"
												     },1000);
											},
											complete : function(jsonResult) {
												$('.progress').remove();
													if(jsonResult.responseJSON.code==1){//성공
														$("#find_pw_h6").text("고객님의 이메일로 임시비밀번호를 발급해드렸습니다. 이메일을 확인해주세요.");
														//$("#find_pw_modal_body").text(jsonResult.data);
														$(".go_login").show();
														$("#btn_find_pw_action2").trigger("click");
													}else {
														alert('메일전송 error');
													}
											}
									});
							}else if(jsonResult.code==1){
								$("#find_pw_h6").text("입력하신 정보와 일치하는 회원이 없습니다.\n 다시 확인해주세요.");
								$(".go_login").hide();
								$("#btn_find_pw_action2").trigger("click");
							}
					}
				});
		}
		e.preventDefault();
	});
	
	
});

//[radio버튼 토글]아이디-비밀번호찾기
function find_form_check(num) {
			
	$("input[name=radio_taag]").attr("checked",false);
	
	if (num == '1') {	//아이디 찾기
		$('#find_id').show();
		$('#find_pw').hide();
		$('#radio_find_id').attr('checked',true);
	} else {	//비밀번호 찾기
		$('#find_id').hide();
		$('#find_pw').show();
		$('#radio_find_pw').attr('checked',true);
	}
}

