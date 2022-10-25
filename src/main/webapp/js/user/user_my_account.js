$(document).ready(function(){
	toastr.options.positionClass = "toast-top-right";
	/* [마이페이지]user_view *********************************/
	$(document).on('click', '#user_account_details, #a_account_details',function(e){
		//console.log("click!! >> "+e.target);
		//console.log("click!! >> "+$(e.target).closest('ul>li').attr('class'));
		$('.my-account-navigation > ul li').removeClass('active');
		$(e.target).closest('li').addClass('active');
		    $.ajax({
				url:'user_view_json',
				method:'POST',
				dataType:'json',
				success:function(jsonResult){
				    $('#my-account-content').html(UserHtmlContents.user_view_content(jsonResult.data[0]));
				}
			});
	    e.preventDefault();
	});
	
	/* [초대코드 발송]Send_Mail ********************************/
	$(document).on('click', '#btn_invi', function(e) {
		console.log($("#invi_email").val());
		
		var bar = $('.bar');
    	var percent = $('.percent');
		
		$.ajax({
			url : 'springMail',
			method : 'POST',
			data:{
				"invi_email":$("#invi_email").val()
			},
			beforeSend:function(e){
				//수정필요
				$('.form-group').append("<div class='progress'><div class='progress-bar progress-bar-striped progress-bar-animated' role='progressbar' aria-valuenow='10' aria-valuemin='0' aria-valuemax='100' style='width: 10%'></div></div>");
				//$('.form-group').append("<div class='progress'><div class='bar'></div ><div class='percent'>0%</div ></div>");
				 var curIdx = $(".progress-bar").attr("aria-valuenow");
				  curIdx = parseInt(curIdx);
				     $(".progress-bar").animate({
				        "width": (10 * (curIdx+1))+"%"
				     },1000);
			},
			success : function(e) {
				console.log("success");
				$('.progress').remove();
				toastr['success']($("#invi_email").val()+" 님에게 초대장이 전송되었습니다.");
				//alert($("#invi_email").val()+" 님에게 초대장이 전송되었습니다.");
				$("#invi_email").val("");
			}
		});

		e.preventDefault();
	});
	/*******************************************/
	
	
});


