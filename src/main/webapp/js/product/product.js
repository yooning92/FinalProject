/**
 * 
 */
 var p_no=null;
 function productCreateForm() {
   
   window.location.href='product_write_form';
}

function productList() {
   window.location.href='product_list';
}

$('#deleteProductBtn').click(function(e){
	
	e.preventDefault();
	e.stopPropagation();
	
	$.ajax({
		url:'deleteProduct',
		method:'POST',
		data:{
			"p_no":$("#p_no").val()
		},
		dataType:"json",
		success:function(result){
			console.log("삭제 여부 :"+ result.data);
			window.location.href="product_list";
			}
	});
});



function productCreate() {
   if (document.product_write_form.p_title.value == "") {
      alert("제목을 입력하십시요.");
      document.product_write_form.p_title.focus();
      return false;
   }
   if (document.product_write_form.p_price.value == "") {
      alert("가격을 입력하십시요.");
      document.product_write_form.p_price.focus();
      return false;
   }

   if (document.product_write_form.p_desc.value == "") {
      alert("내용을 입력하십시요.");
      document.product_write_form.p_desc.focus();
      return false;
   }
   
   //사진 리스트 업로드
   const formData1 = new FormData($('#main_contact_form')[0]);
   /*
   formData1.append('files',$('#files')[0]); //이게 맞나?
   formData1.append('files',$('#files')[1]); 
   formData1.append('files',$('#files')[2]); 
   formData1.append('files',$('#files')[3]); 
   */
   $.ajax({
      url:'product_write_action_json',
      type:'POST',
      processData:false,   //파일전송시 반드시 false
      contentType:false,
      data:formData1,
      success:function(jsonResult){
      console.log(jsonResult);
      window.location.href=jsonResult.url;
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
   /*
   const formData2 = new FormData();
   formData2.append('p_title',$("p_title"));
   formData2.append('p_price',$("p_price"));
   formData2.append('p_desc',$("p_desc"));
   formData2.append('p_ctgr_no',$("p_ctgr_no"));
   */
   
   /*
   document.product_write_form.action = "product_write_action_json";
   document.product_write_form.method='POST';
   document.product_write_form.submit();
}
   */



function productUpdateAction(){
	if (document.product_modify_form.p_title.value == "") {
      alert("제목을 입력하십시요.");
      document.product_modify_form.p_title.focus();
      return false;
   }
   if (document.product_modify_form.p_price.value == "") {
      alert("가격을 입력하십시요.");
      document.product_modify_form.p_price.focus();
      return false;
   }

   if (document.product_modify_form.p_desc.value == "") {
      alert("내용을 입력하십시요.");
      document.product_modify_form.p_desc.focus();
      return false;
   }
 
   
   const formData1 = new FormData($('#main_contact_form')[0]);
   var p_no = formData1.p_no;
   /*
   formData1.append('files',$('#files')[0]); //이게 맞나?
   formData1.append('files',$('#files')[1]); 
   formData1.append('files',$('#files')[2]); 
   formData1.append('files',$('#files')[3]); 
   */
      
   $.ajax({
      url:'product_modify_action_json',
      type:'POST',
      processData:false,   //파일전송시 반드시 false
      contentType:false,
      data:formData1,
      success:function(jsonResult){
      console.log(jsonResult);
      window.location.href=jsonResult.url;
   
   /*
   document.product_modify_form.action = "product_modify_action";
   document.product_modify_form.method='POST';
   document.product_modify_form.submit();
	*/
  		}
   	});
   }
/**********페이징************/
function changeProductList(pageno,p_ctgr_no){
	$.ajax({
		url:"product_list_rest",
		method:"post",
		data:{
			"pageno":pageno,
			"p_ctgr_no":p_ctgr_no
		},
		dataType:"json",
		success:function(resultObj){
			console.log(resultObj.data);
				let data = resultObj.data;
				let htmlBuffer = ``;
				data.itemList.forEach(function(product, i){
				
				  htmlBuffer += `<div class="col-12">
                                <div class="single-product-area mb-30">
                                    `;
	               if(product.productImagesList[0].pi_name!=null && product.productImagesList[0].pi_name!="" ){
						//이미지 종류에 따라
						if(product.productImagesList[0].pi_name.startsWith('http')){
							htmlBuffer += `
							 <div class="product_image">
	                                        <!-- Product Image -->
	                                        <img class="normal_img" style="width:300px; height:300px;" src="${product.productImagesList[0].pi_name}" alt="">
	                                        <img class="hover_img" style="width:300px; height:300px;" src="${product.productImagesList[0].pi_name}" alt="">
	                                    `;
                        }else{
							htmlBuffer += `
							 <div class="product_image">
	                                        <!-- Product Image -->
	                                        <img class="normal_img" style="width:300px; height:300px;" src="img/product_img/${product.productImagesList[0].pi_name}" alt="">
	                                        <img class="hover_img" style="width:300px; height:300px;" src="img/product_img/${product.productImagesList[0].pi_name}" alt="">
	                                    `;
						}
						htmlBuffer += `

                                        <!-- Product Badge -->
                                       <div class="product_badge">
                                            <span>`;
                       if(product.p_sell == 1){
						htmlBuffer += `판매중`;
						}else if(product.p_sell == 2){
						htmlBuffer += `예약중`;	
						}else if(product.p_sell == 3){
						htmlBuffer += `판매완료`;	
						}                     
                        htmlBuffer += ` </span>
                                        </div> 

                                        <!-- Wishlist -->
                                        

                                        <!-- Compare -->
                                        
                                    </div>`					}
                                    else{
	                               htmlBuffer += ` <div class="product_image">
                                        <!-- Product Image -->
                                        <img class="normal_img" style="width:300px; height:300px;" src="img/chat-img/logo_carrot.png" alt="">
                                        <img class="hover_img" style="width:300px; height:300px;" src="img/chat-img/logo_carrot.png" alt="">

                                        <!-- Product Badge -->
                                        `;
                                            if(product.p_sell == 1){
											htmlBuffer += `<div class="product_badge">
                                            				<span>
															판매중
															</span>
															</div>`;
											}else if(product.p_sell == 2){
											htmlBuffer += `<div class="product_badge1">
                                            				<span>
															예약중
															</div>
                                            				</span>`;	
											}else if(product.p_sell == 3){
											htmlBuffer += `<div class="product_badge2">
                                            				<span>
															판매완료
                                            				</span>
                                            				</div>`;	
												}                     
						                        htmlBuffer += `
                                            

                                        <!-- Wishlist -->
                                        

                                        <!-- Compare -->
                                        
                                    </div>`
	
									}
	               
					htmlBuffer += `
	                        <div class="product_description">
                                        
                                       

                                       <p class="brand_name">`;
                          
                          if(product.productCategory.p_ctgr_no == 1){
							htmlBuffer += `가전제품`;
							}else if(product.productCategory.p_ctgr_no == 2){
							htmlBuffer += `가구`;	
							}else if(product.productCategory.p_ctgr_no == 3){
							htmlBuffer += `의류`;	
												                     
							}else if(product.productCategory.p_ctgr_no == 4){
							htmlBuffer += `생활용품`;	
												                     
							}else if(product.productCategory.p_ctgr_no == 5){
							htmlBuffer += `취미/게임/음반/도서`;	
							}else if(product.productCategory.p_ctgr_no == 6){
							htmlBuffer += `기타`;	
						}                     
                                       
                                       
                         htmlBuffer += `</p>
                                       <a href="product_detail?p_no=${product.p_no}" p_no="${product.p_no}">${product.p_title}</a>
										<h6 class="product-price">가격: ${product.p_price} 원</h6>
										<p class="product-short-desc">${product.p_address_name}</p>
                                        <p class="product-short-desc">${product.p_desc}</p>
                                    </div>
                                </div>
                            </div>        
                        
                        `;
                     
				});
				$(".shop_list_product_area" ).html(htmlBuffer);
				
				let paginationBuffer = ``;
				if(data.pageMaker.prevPage > 0){
					paginationBuffer += `<li class="page-item">
		                                    <button class="page-link" onclick="changeProductList(${data.pageMaker.prevPage},'${p_ctgr_no}')"><i class="fa fa-angle-left" aria-hidden="true"></i></button>
		                               	 </li>`;
				}
				for(let no = data.pageMaker.blockBegin; no <= data.pageMaker.blockEnd; no++){
					if(data.pageMaker.curPage == no){
						paginationBuffer += `<li class="page-item active"><button class="page-link" href="#">${no}</button></li>`;
					}
					if(data.pageMaker.curPage != no){
						paginationBuffer += `<li class="page-item"><button class="page-link" onclick="changeProductList(${no},'${p_ctgr_no}');">${no}</button></li>`;
					}
				}
				if(data.pageMaker.curPage < data.pageMaker.totPage){
					paginationBuffer += `<li class="page-item">
					                        <button class="page-link" onclick="changeProductList(${data.pageMaker.nextPage},'${p_ctgr_no}');"><i class="fa fa-angle-right" aria-hidden="true"></i></button>
				                    	 </li>`;
				}
				$(".pagination.pagination-sm.justify-content-center").html(paginationBuffer);	
		}
		
	});
}
function productSell(){
	
	if(document.chatStart.p_userId.value==document.chatStart.loginId.value){ 
	document.statePopup.action = "product_modify_sell_action";
	document.statePopup.method='POST';
	document.statePopup.submit();}
	else{
		alert("본인 상품만 상태수정 가능합니다.");
		
	}
}


function checkWish(){
		$.ajax({
		url:'checkWish',
		method:'POST',
		data:{
			"p_no":$("#p_no").val()
		},
		dataType:"json",
		success:function(result){
			console.log("찜하기 여부 :"+ result.data);
			if(result.data=="1"){
				$("#addWishListBtn").html(`<i class="fa fa-heart" aria-hidden="true" style="color:red;"></i>`);
			}else{
				$("#addWishListBtn").html(`<i class="fa fa-heart" aria-hidden="true" style="color:gray;"></i>`);
			}
		}
		
		
	});
}

/********************채팅하기!!**************************/
$(document).ready(function(){
	
checkWish();
	
	
	
	
	$('#btnCreate').click(function(){
		if(document.chatStart.p_userId.value==document.chatStart.loginId.value){
			alert("본인 상품과는 채팅할 수 없습니다.");
			
			
			
		}else{
		console.log('채팅방 생성 버튼 클릭');
		document.chatStart.action="create_room";
		document.chatStart.method='POST';
		document.chatStart.submit();
		}
	});
	
	
	/******************팝업*********************/

$('#btn_popup').click(function(){
	console.log("클릭");
	p_no=document.statePopup.p_no.value;
	console.log(p_no);
	window.open("change_product_state?p_no="+document.statePopup.p_no.value+"&user_id="+document.statePopup.user_id.value,"판매상태변경","width = 470, height = 600, top = 100, left = 200, location = no,  resizable=no");

});	




$('#addWishListBtn').click(function(e){
	
	e.preventDefault();
	e.stopPropagation();
	
	
	
	
	
	$.ajax({
		url:'checkWish',
		method:'POST',
		data:{
			"p_no":$("#p_no").val()
		},
		dataType:"json",
		success:function(result){
			console.log("찜하기 여부 :"+ result.data);
			if(result.data=="1"){
				console.log("이미 찜했음 -- > 찜하기 해제 ");
				
				$.ajax({
					url:"wishDeletePD",
					method:"POST",
					data:{
						"p_no":$("#p_no").val()
					},
					dataType:"json",
					success:function(result){
						toastr.options.positionClass = 'toast-top-full-width' ;
	                    toastr['info']("관심 해제");
	                    $("#addWishListBtn").html(`<i class="fa fa-heart" aria-hidden="true" style="color:gray;"></i>`);
					}
				});
				
			}else{
				console.log("새롭게 찜하기");
				
				$.ajax({
					url:"wishInsert",
					method:"POST",
					data:{
						"p_no":$("#p_no").val()
					},
					dataType:"json",
					success:function(result){
						toastr.options.positionClass = 'toast-top-full-width' ;
	                    toastr['info']("관심 추가");
	                    $("#addWishListBtn").html(`<i class="fa fa-heart" aria-hidden="true" style="color:red;"></i>`);
					}
				});
				
			}
		}
		
		
	});
});
	
	
	
	});



	
