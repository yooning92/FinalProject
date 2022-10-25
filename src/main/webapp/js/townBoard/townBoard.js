function changeQnaList(pageno,t_ctgr_no){
	
	$.ajax({
		url: "townBoard_list_rest",
		method: "post",
		data: {
			"pageno" :pageno,
			"t_ctgr_no":t_ctgr_no
				},
		dataType: "json",
		success:function(resultObj){
			console.log(resultObj);
			if(resultObj.errorCode > 0){
				let data = resultObj.data;
				let htmlBuffer = ``;
				data.itemList.forEach(function(townBoard, i){
				
				   htmlBuffer += `<div class="blog_post_thumb">`;
	               if(townBoard.townImageList.length != 0 ){
						htmlBuffer += `
                            <a href="townboard_view?t_no=${townBoard.t_no}&pageno=${pageno}" t_no="${townBoard.t_no}"><img src="img/townBoard-img/${townBoard.townImageList[0].t_img_name}" alt="blog-post-thumb"></a>`;
					}
	               
					htmlBuffer += `
	                              
                            
                        </div>
                        <div class="blog_post_content">
                        
                        <div class="post-date">
                                <a href="#">${townBoard.townCategory.t_ctgr_name}</a>
                                <span>조회수 : ${townBoard.t_count}</span>
                            </div>
                            <a href="townboard_view?t_no=${townBoard.t_no}&pageno=${pageno}" t_no="${townBoard.t_no}" pageno="${pageno}" class="blog_title">${townBoard.t_title}</a>
                            <p>${townBoard.t_content}</p>
                            <a href="#"><i class="fa fa-location-arrow" aria-hidden="true"></i> ${townBoard.t_address_name }</a>
                        </div>
                        `;
                     
				});
				$("#townBoard_list_tbody_all" ).html(htmlBuffer);
				
				let paginationBuffer = ``;
				if(data.pageMaker.prevPage > 0){
					paginationBuffer += `<li class="page-item">
		                                    <button class="page-link" onclick="changeQnaList(${data.pageMaker.prevPage},'${t_ctgr_no}');"><i class="fa fa-angle-left" aria-hidden="true"></i></button>
		                               	 </li>`;
				}
				for(let no = data.pageMaker.blockBegin; no <= data.pageMaker.blockEnd; no++){
					if(data.pageMaker.curPage == no){
						paginationBuffer += `<li class="page-item active"><button class="page-link" href="#">${no}</button></li>`;
					}
					if(data.pageMaker.curPage != no){
						paginationBuffer += `<li class="page-item"><button class="page-link" onclick="changeQnaList(${no},'${t_ctgr_no}');">${no}</button></li>`;
					}
				}
				if(data.pageMaker.curPage < data.pageMaker.totPage){
					paginationBuffer += `<li class="page-item">
					                        <button class="page-link" onclick="changeQnaList(${data.pageMaker.nextPage},'${t_ctgr_no}');"><i class="fa fa-angle-right" aria-hidden="true"></i></button>
				                    	 </li>`;
				}
				$(".pagination.pagination-sm.justify-content-center").html(paginationBuffer);
			}else{
				Toast.fire({ icon: 'error', title: resultObj.errorMsg });
			}
		}
	});
}


/*
게시글 삭제 
*/
$(".townBoard_btn.delete").on("click", function(){
	let pageno = $(this).attr("pageno");
	let t_no = $(this).attr("t_no");
	ToastConfirm.fire({ icon: 'question', 
						title: "게시글을 삭제하시겠습니까?\n 삭제 후 복구가 불가능합니다"}).then((result) => {
						if(result.isConfirmed){
							$.ajax({
								url: "townBoard_delete_rest",
								method: "post",
								data: {"t_no":t_no},
								dataType: "json",
								success:function(resultObj){
									if(resultObj.errorCode > 0){
										Toast.fire({ icon: 'success', title: resultObj.errorMsg }).then((result) => {
												location.href = "townBoard_list?pageno=" + pageno;
											});
									}else{
										Toast.fire({ icon: 'error', title: resultObj.errorMsg });
									}
								}
							});
						}
	});
});






/*
게시글 목록 이동
*/

$(".townBoard_btn.list").on("click", function(){
	let pageno = $(this).attr("pageno");
	location.href = `townBoard_list?pageno=${pageno}`;
});



/*
게시글 수정 폼 
*/
$(".townBoard_btn.update_form").on("click", function(){
	let t_no = $(this).attr("t_no");
	let pageno = $(this).attr("pageno");
	console.log(t_no);
	console.log(pageno);
	location.href = `townboard_update_form?t_no=${t_no}&pageno=${pageno}`;
});

/* 
게시글 수정 
*/ 
/*
$(".townBoard_btn.update").on("click", function(){ 
	if($("#t_title_txt").val() == "" || CKEDITOR.instances.townBoard_content_area.getData() == ""){
		Toast.fire({ icon: 'warning', title: "필수 입력값을 입력하지 않았습니다.\n 제목과 내용을 모두 입력해주세요" });
		return;
	}
		ToastConfirm.fire({ icon: 'question', 
							title: "게시글을 수정하시겠습니까?"}).then((result) => {
							if(result.isConfirmed){
								let t_no = $(this).attr("t_no"); 
								let pageno = $(this).attr("pageno");
								$("#townBoard_update_form").attr("action", "townboard_update_action"); 
								$("#townBoard_update_form").submit(); 
							}
					});
});
*/

/*
새글 등록 폼 
*/
$(".townBoard_btn.write_form").on("click", function(){
	let pageno = $(this).attr("pageno");
	location.href = "townboard_write_form?pageno=" + pageno;
});




/*
게시글 등록
*/
/*
$(".townBoard_btn.new_write").on("click", function(e){
	e.preventDefault();
	e.stopPropagation();
	var form=$("#townBoard_write_form");
	let pageno = form.find($('input[name="page_no"]')).val();
	let t_no = form.find($('input[name="t_no"]')).val();

	if($("#t_title_txt").val() == "" || CKEDITOR.instances.townBoard_content_area.getData() == ""){
		Toast.fire({ icon: 'warning', title: "필수 입력값을 입력하지 않았습니다.\n 제목과 내용을 모두 입력해주세요" });
		return;
	}
	else{
		ToastConfirm.fire({ icon: 'question', 
							title: "게시글을 작성하시겠습니까?"}).then((result) => {
								if(result.isConfirmed){
								/*	
							$.ajax({
								url: "townReply_wirte_rest",
								method: "post",
								data: form.serialize(),
								dataType: "json",
								success:function(resultObj){
									console.log('성공');
									if(resultObj.errorCode > 0){
										Toast.fire({ icon: 'success', title: resultObj.errorMsg }).then((result) => {
											console.log('페이지이동');
												location.href = "townboard_view?t_no="+t_no+"&pageno=" + pageno;
											});
									}else{
										Toast.fire({ icon: 'error', title: resultObj.errorMsg });
									}
								}
							});////아작스 끝////
							
							   //사진 리스트 업로드
  							 // const formData1 = new FormData($('#main_contact_form_townBoard')[0]);
  							 const formData1 = new FormData($('#main_contact_form_townBoard')[0]);
							  $.ajax({
								      url:'townboard_write_action_json',
								      type:'POST',
								      processData:false,   //파일전송시 반드시 false
								      contentType:false,
								      data:formData1,
								      success:function(jsonResult){
								      console.log(jsonResult);
								      window.location.href="townboard_list";
       
      }
   });
							
						}
							
					});				
	
/////여기 자리
/*	$(".townReply_write_form").attr("action", "townReply_wirte_rest");
	$(".townReply_write_form").submit();	
}	
	
});
*/
//게시글 등록
function townBoardCreate() {
   if (document.townBoard_write_form.t_title.value == "") {
      alert("제목을 입력하십시요.");
      document.townBoard_write_form.t_title.focus();
      return false;
   }
   /*
   if (document.townBoard_write_form.t_content.value == "") {
      alert("내용을 입력하십시요.");
      document.townBoard_write_form.t_content.focus();
      return false;
   }
   */
   //사진 리스트 업로드
   const formData1 = new FormData($('#main_contact_form_townBoard')[0]);
   /*
   formData1.append('files',$('#files')[0]); //이게 맞나?
   formData1.append('files',$('#files')[1]); 
   formData1.append('files',$('#files')[2]); 
   formData1.append('files',$('#files')[3]); 
   */
   
   console.log(formData1);
   
   $.ajax({
      url:'townboard_write_action_json',
      type:'POST',
      processData:false,   //파일전송시 반드시 false
      contentType:false,
      data:formData1,
      success:function(jsonResult){
      console.log(jsonResult);
      window.location.href="townBoard_list";
       /*사진이름받기
       $.ajax({
              url : 'product_write_action_json',
              method : 'POST',
              data: {
                  "p_title":$("input[name='p_title']").val(),
                  "p_price":$("input[name='p_price']").val(),
                  "p_ctgr_no":$("input[name='p_ctgr_no']").val(),
                  "p_desc":$("input[name='p_desc']").val(),
                  "pi_name": jsonResult.newFileName 
                     },
                     dataType : 'json',
                     success : function(jsonResult) {
                        console.log(jsonResult.msg);
         }
        });
        */
      }
   });
   }


//게시글 수정
function townBoardUpdateAction(){
	if (document.townBoard_update_form.t_title.value == "") {
      alert("제목을 입력하십시요.");
      document.townBoard_update_form.t_title.focus();
      return false;
   }

   if (document.townBoard_update_form.t_content.value == "") {
      alert("내용을 입력하십시요.");
      document.townBoard_update_form.t_content.focus();
      return false;
   }
 
   
   const formData1 = new FormData($('#main_contact_form_townBoard')[0]);
   /*
   formData1.append('files',$('#files')[0]); //이게 맞나?
   formData1.append('files',$('#files')[1]); 
   formData1.append('files',$('#files')[2]); 
   formData1.append('files',$('#files')[3]); 
   */
      
   $.ajax({
      url:'townboard_update_action_json',
      type:'POST',
      processData:false,   //파일전송시 반드시 false
      contentType:false,
      data:formData1,
      success:function(jsonResult){
      console.log(jsonResult);
      window.location.href="townBoard_list";
   
   /*
   document.product_modify_form.action = "product_modify_action";
   document.product_modify_form.method='POST';
   document.product_modify_form.submit();
	*/
  		}
   	});
   }






/*
답글 등록
*/
$(".qna_btn.reply_write").on("click", function(){
	if($("#q_title_txt").val() == "" || CKEDITOR.instances.q_content_area.getData() == ""){
		Toast.fire({ icon: 'warning', title: "필수 입력값을 입력하지 않았습니다.\n 제목과 내용을 모두 입력해주세요" });
		return;
	}
	$("#qna_reply_write_form").attr("action", "qna_reply_write");
	$("#qna_reply_write_form").submit();
});



/*
댓글등록
*/
$("#townMainReplyBtn").on("click", function(e){
	e.preventDefault();
	e.stopPropagation();
	var form=$(".townReply_Main_write_form");
	let pageno = form.find($('input[name="page_no"]')).val();
	let t_no = form.find($('input[name="t_no"]')).val();

	if($(".form-group.t_reply_title").val() == "" || $(".t_reply_content").val() == ""){
		Toast.fire({ icon: 'warning', title: "필수 입력값을 입력하지 않았습니다.\n 제목과 내용을 모두 입력해주세요" });
		return;
	}
	else{
		ToastConfirm.fire({ icon: 'question', 
							title: "댓글을 작성하시겠습니까?"}).then((result) => {
								if(result.isConfirmed){
									
							$.ajax({
								url: "townReply_wirte_rest",
								method: "post",
								data: form.serialize(),
								dataType: "json",
								success:function(resultObj){
									console.log('성공');
									if(resultObj.errorCode > 0){
										Toast.fire({ icon: 'success', title: resultObj.errorMsg }).then((result) => {
											console.log('페이지이동');
												location.href = "townboard_view?t_no="+t_no+"&pageno=" + pageno;
											});
									}else{
										Toast.fire({ icon: 'error', title: resultObj.errorMsg });
									}
								}
							});
						}
							
					});				
}	
	
});


/*
대댓글등록
*/
$(".btn.btn-primary.rereply").on("click", function(e){
	e.preventDefault();
	e.stopPropagation();
	/***************수정해야한ㅁ */
	console.log($(e.target).attr("index"));
	console.log($(".townReReply_write_form_"+$(e.target).attr("index")));
	
	//index=$('.content>form').attr("index");
	index=$(e.target).attr("index");
	console.log(index);
	var form=$(".townReReply_write_form_"+index);
	
	/*
	index=$('this').attr("index");
    console.log(index);
     var replyNumber=$('#ReplyNumber').val();
    for(var i=0;i<replyNumber;i++){
	var form=$(".townReReply_write_form_"+i);
	}
	*/
	let pageno = form.find($('input[name="page_no"]')).val();
	let t_no =form.find($('input[name="t_no"]')).val();
	let groupno = form.find($('input[name="groupno"]')).val();
	console.log('t_no'+t_no)
	
	if($(".form-group.t_reply_title").val() == "" || $(".t_reply_content").val() == ""){
		Toast.fire({ icon: 'warning', title: "필수 입력값을 입력하지 않았습니다.\n 제목과 내용을 모두 입력해주세요" });
		return;
	}
	else{
		ToastConfirm.fire({ icon: 'question', 
							title: "댓글을 작성하시겠습니까?"}).then((result) => {
								if(result.isConfirmed){
									console.log()
							$.ajax({
								url: "townReReply_wirte_rest",
								method: "post",
								data: form.serialize(),
								dataType: "json",
								success:function(resultObj){
									console.log('두번쨰까지 성공')
									if(resultObj.errorCode > 0){
										Toast.fire({ icon: 'success', title: resultObj.errorMsg }).then((result) => {
											console.log('페이지이동');
												location.href = "townboard_view?t_no="+t_no+"&pageno=" + pageno;
											});
									}else{
										Toast.fire({ icon: 'error', title: resultObj.errorMsg });
									}
								}
							});
						}
							
					});				
}	
	
});


/*
댓글 삭제 
*/
$(".townReply.delete").on("click", function(){
	let pageno = $(this).attr("pageno");
	let t_reply_no = $(this).attr("t_reply_no");
	let t_no = $(this).attr("t_no");
	ToastConfirm.fire({ icon: 'question', 
						title: "댓글을 삭제하시겠습니까?\n 삭제 후 복구가 불가능합니다"}).then((result) => {
						if(result.isConfirmed){
							$.ajax({
								url: "townReply_delete_rest",
								method: "post",
								data: {"t_reply_no":t_reply_no
										},
								dataType: "json",
								success:function(resultObj){
									if(resultObj.errorCode > 0){
										Toast.fire({ icon: 'success', title: resultObj.errorMsg }).then((result) => {
												location.href = "townboard_view?t_no="+t_no+"&pageno=" + pageno;
											});
									}else{
										Toast.fire({ icon: 'error', title: resultObj.errorMsg });
									}
								}
							});
						}
	});
});



/*
댓글 토글2
*/
/** 게시글의 수정버튼, 삭제버튼 **/
$(document).ready(function() {
  $(".content").hide();
  var loginId=sessionStorage.getItem('sUserId');
  var writeId=$('#viewWriterId').text();
  console.log($(this));
  index=$(this).attr("index");
  
  $('view')
  console.log("댓글 인덱스:"+index);
  
  
  var replyNumber=$('#ReplyNumber').val();
  console.log("댓글수:"+replyNumber);
  
   for(var i=0;i<replyNumber;i++){
	var replyId=$('#viewReplyWriterId_'+i).text();
	var rereplyId=$('#viewReReplyWriterId_'+i).text();
	console.log("댓글 아이디:"+replyId);
	if(replyId==loginId){
		console.log("같은 작성자:"+i);
		$('#townReplyDeletebtn_'+i).show();
	}else{
		console.log("다른 작성자:"+i);
		$('#townReplyDeletebtn_'+i).hide();
	}
	if(rereplyId==loginId){
		$('#reReplyDeleteBtn_'+i).show();
	}else{
		$('#reReplyDeleteBtn_'+i).hide();
	}
	
	
   }
  var replyWriteId=$('#viewReplyWriterId_'+index).text();
 
  var rereplyWriteId=$('#viewReReplyWriterId_'+index).text();
  
/* 게시글 삭제 수정버튼 */
  if(loginId==writeId){
  console.log("게시글 같은 작성자")
	$('.townBoard_btn.update_form').show();
	$('.townBoard_btn.delete').show();
	
}else{
	console.log("게시글 다른 작성자")
	$('.townBoard_btn.update_form').hide();
	$('.townBoard_btn.delete').hide();
}


/* 댓글의 삭제버튼 */
/*
  if(loginId==replyWriteId){
  console.log("댓글 같은 작성자")
	$('.townReply.delete.reply').show();
	
}else if(loginId!=replyWriteId){
	console.log("댓글 다른 작성자")
	$('.townReply.delete.reply').hide();
}
*/

/* 대댓글의 삭제버튼 */
/*
  if(loginId==rereplyWriteId){
  console.log("대댓글 같은 작성자")
	$('.townReply.delete.rereply').show();
	
}else if(loginId!=rereplyWriteId){
	console.log("대댓글 다른 작성자")
	$('.townReply.delete.rereply').hide();
}
*/


  $(".heading").click(function()
  {
    $(this).next(".content").slideToggle(500);
  });
});
/**************** */


/*
$(document).ready(function() {
  var loginId=sessionStorage.getItem('sUserId');
  index=$(this).attr("index");
  var replyWriteId=$('#viewReplyWriterId_'+index).text();


/* 댓글의 삭제버튼 
  if(loginId==replyWriteId){
  console.log("같은 작성자")
	$('.townReply.delete').show();
	
}else{
	console.log("다른 작성자")
	$('.townReply.delete').hide();
}



});

$(document).ready(function() {
  var loginId=sessionStorage.getItem('sUserId');
  index=$(this).attr("index");
  var rereplyWriteId=$('#viewReReplyWriterId_'+index).text();


/* 대댓글의 삭제버튼 
  if(loginId==rereplyWriteId){
  console.log("같은 작성자")
	$('.townReply.delete').show();
	
}else{
	console.log("다른 작성자")
	$('.children>.townReply.delete').hide();
}



});
*/

/*
ckeditor
*/

$(() => {
	if($("#notice_content_area").length != 0){
		 CKEDITOR.replace('notice_content_area', {
						height: 500                                                  
                 	});
	}
});
$(() => {
	if($("#townBoard_content_area").length != 0){
		 CKEDITOR.replace('townBoard_content_area', {
						height: 500                                                  
                 	});
	}
});


/*
alert 세팅
*/
const Toast =  Swal.mixin({ 
	toast: true, 
	position: 'center', 
	showConfirmButton: true, 
	confirmButtonColor: '#3085d6',
	width: '400px'
 });

const ToastConfirm =  Swal.mixin({ 
	toast: true, 
	position: 'center', 
	showConfirmButton: true, 
	confirmButtonColor: '#3085d6',
	showDenyButton: true,
	denyButtonText: 'Cancel',
	width: '400px'
 });

$(function(){
	$("#townBoardSearch").keypress(function(e) {
  if (e.keyCode === 13) {
	location.href="townBoardSearch_list?search_keyword="+$("#townBoardSearch").val();
    e.preventDefault();
  
  }
});
	
})

////////////// 슬라이드쇼 시작 ///////////////
$(document).ready(function () {
    $('.bxslider').bxSlider({
        auto: true, // 자동으로 애니메이션 시작
        speed: 500,  // 애니메이션 속도
        pause: 5000,  // 애니메이션 유지 시간 (1000은 1초)
        mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
        autoControls: true, // 시작 및 중지버튼 보여짐
        pager: true, // 페이지 표시 보여짐
        captions: true,
        slideWidth: 650, // 이미지 위에 텍스트를 넣을 수 있음
    });
});
////////////// 슬라이드쇼 끝 ///////////////

