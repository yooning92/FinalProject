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
                            <a href="single-blog.html">Continue Reading <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
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
$(".townBoard_i.delete").on("click", function(){
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
새글 등록 폼 
*/
$(".townBoard_btn.write_form").on("click", function(){
	let pageno = $(this).attr("pageno");
	location.href = "townboard_write_form?pageno=" + pageno;
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
index=$(e.target).attr("index");
*/

/*
관심목록으로 이동
*/
$(".townBoard_btn.wishlist_add").on("click", function(){
	let t_no = $(this).attr("t_no");
	location.href = `townWishlist`;
});


/*
관심글 전체 조회
*/
/*$(".townBoard_btn.wishlist_add").on("click",function(){
	
}
*/



function townWishList(t_no){
	$.ajax({
		url: "townWishlist",
		method: "post",
		data: {"t_no" :t_no},
		dataType: "json",
		success:function(resultObj){
			console.log(resultObj);
			if(resultObj.errorCode > 0){
				let data = resultObj.data;
				let htmlBuffer = ``;
				data.itemList.forEach(function(notice, i){
					
	                
	                               
					htmlBuffer += `
	                               
	                                `;
	                
                   
				});
				$("#notice_list_tbody").html(htmlBuffer);
			}else{
				Toast.fire({ icon: 'error', title: resultObj.errorMsg });
			}
		}
	});
}



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
	denyButtonText: 'Cancle',
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
        captions: true, // 이미지 위에 텍스트를 넣을 수 있음
    });
});
////////////// 슬라이드쇼 끝 ///////////////

