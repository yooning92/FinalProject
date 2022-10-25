function UserHtmlContents(){
}

UserHtmlContents.user_view_content=function(sUser) {
	return `<h5 class="mb-3">회원정보수정</h5>
                        <form action="#" method="post" id="user_modify_form">
                            <div class="row">
                                <div class="col-12 col-lg-6">
                                    <div class="form-group">
                                        <label for="user_id">아이디 *</label>
                                        <input type="text" class="form-control" name="user_id" value="${sUser.user_id}" readonly>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="currentPass">현재 비밀번호 </label>
                                        <input type="password" class="form-control" id="user_pw" name="user_pw" value="${sUser.user_pw}" readonly>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="newPass">신규 비밀번호 (빈칸으로 두시면, 현재 비밀번호로 유지됩니다.)</label>
                                        <input type="password" class="form-control" id="user_pw_new" name="user_pw_new">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="confirmPass">신규 비밀번호 확인</label>
                                        <input type="password" class="form-control" id="user_pw_new2" name="user_pw_new_confirm">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="user_name">이름 *</label>
                                        <input type="text" class="form-control" id="user_name" name="user_name" value="${sUser.user_name}">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="user_email">이메일주소 *</label>
                                        <input type="email" class="form-control" id="user_email" name="user_email" value="${sUser.user_email}">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="user_phone">핸드폰번호 *</label>
                                        <input type="text" class="form-control" id="user_phone" name="user_phone" value="${sUser.user_phone}">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <!-- <button type="submit" class="btn btn-primary">변경사항 저장</button> -->
                                    <input type="button" id="btn_user_modify_action" class="btn btn-primary" value="Save Change">
                                </div>
                            </div>
                        </form>`;
}

UserHtmlContents.user_view_addresses=function(addressList){
	return `<p>지역은 최소 1개 이상 최대 2개까지 설정할 수 있어요.</p>
                        <div class="row">
                            <div class="col-12 col-lg-6 mb-5 mb-lg-0">
                                <!--<input type='radio' name='rd_address_no' class='rd_adress1' value="${addressList[0].address_no}" style='margin-bottom:16px'>-->
                                
                                <address>
                                <input type="hidden" name="address_no" value="${addressList[0].address_no}">
                                <input type="hidden" name="address_lat" value="${addressList[0].address_lat}">
                                <input type="hidden" name="address_lng" value="${addressList[0].address_lng}">
                                
                                <input type="button" id="btn_address_first" class="btn btn-outline-primary mb-1" name="address_name" value="${addressList[0].address_name}" >
                                <a href="#" id="btn_remove_first" class="btn btn-secondary mb-1 remove"><i class="icofont-ui-delete"></i></a><br/>
								
								<input id='range1' name="address_range" type="range" value="${addressList[0].address_range}" min="0" max="10" disabled>
                                <label for='range1' class = "range_val bigshop-label bigshop-label-info bigshop-label-pill" value="">${addressList[0].address_range}</label><br/>
                                </address>
                                
                                <!--<a href="#" id="btn_address_first" class="btn btn-primary btn-sm update">주소 수정</a>-->
                            </div>
                            <div class="col-12 col-lg-6 mb-5 mb-lg-0">
                                <address>
                                <input type="hidden" name="address_no" value="${addressList[1].address_no}">
                                <input type="hidden" name="address_lat" value="${addressList[1].address_lat}">
                                <input type="hidden" name="address_lng" value="${addressList[1].address_lng}">
                                
                                <input type="button" id="btn_address_second" class="btn btn-outline-primary mb-1" name="address_name"  value="${addressList[1].address_name}">
                                <a href="#" id="btn_remove_second" class="btn btn-secondary mb-1 remove"><i class="icofont-ui-delete"></i></a><br/>
                                
								<input id='range2' name="address_range" type="range" value="${addressList[1].address_range}" min="0" max="10" disabled>
                                <label for='range2' class = "range_val bigshop-label bigshop-label-info bigshop-label-pill" value="">${addressList[1].address_range}</label><br/>
                                </address>
                                
                                <!--<a href="#" id="btn_address_second" class="btn btn-primary btn-sm update">주소 수정</a>-->
                            
                            </div>
                            <!--<button type="button" class="btn btn-primary mb-1 btn-sm">저장</button>-->
                        </div>`;
}
UserHtmlContents.user_view_addresses_one=function(addressList){
	return `<p>지역은 최소 1개 이상 최대 2개까지 설정할 수 있어요.</p>
                        <div class="row">
                            <div class="col-12 col-lg-6 mb-5 mb-lg-0">
                                <address>
                                <input type="hidden" name="address_no" value="${addressList[0].address_no}">
                                <input type="hidden" name="address_lat" value="${addressList[0].address_lat}">
                                <input type="hidden" name="address_lng" value="${addressList[0].address_lng}">
                                
                                <input type="button" id="btn_address_first" class="btn btn-outline-primary mb-1 selected_addressNo" name="address_name" value="${addressList[0].address_name}" style="background:#0f99f3; color:#fff">
                                <a href="#" id="btn_remove_first" class="btn btn-secondary mb-1 remove"><i class="icofont-ui-delete"></i></a><br/>
                                
								<input id='range1' name="address_range" type="range" value="${addressList[0].address_range}" min="0" max="10">
                                <label for='range1' class = "range_val bigshop-label bigshop-label-info bigshop-label-pill" value="">${addressList[0].address_range}</label><br/>
                                </address>
                                <!--<a href="#" id="btn_address_first" class="btn btn-primary btn-sm update">주소 수정</a>-->
                            </div>
                            <div class="col-12 col-lg-6">
                                <!--<input type='radio' name='rd_address_no' class='rd_adress2' value="" disabled style='margin-bottom:16px'>-->
                                <address>
                                <input type="hidden" name="address_lat" value="">
                                <input type="hidden" name="address_lng" value="">
                                <input type="hidden" name="address_name" value="">

                                <input type="button" id="btn_address_new1" class="btn btn-outline-secondary mb-1 insert" name="" value="주소추가 +" style='border-color:#6c757d'>
                                </address>
                                <!--<a href="#" id="btn_address_new1" class="btn btn-primary btn-sm insert">주소 입력</a>-->
                            </div>
                        </div>`;
}
UserHtmlContents.user_view_addresses_zero=function(addressList){
	return `<p>지역은 최소 1개 이상 최대 2개까지 설정할 수 있어요.</p>
                        <div class="row">
                            <div class="col-12 col-lg-6 mb-5 mb-lg-0">
                                <address>
                               	<input type="hidden" name="address_lat" value="">
                                <input type="hidden" name="address_lng" value="">
                                <input type="hidden" name="address_name" value="">

                                <input type="button" id="btn_address_new1" class="btn btn-outline-secondary mb-1 insert" name="" value="주소추가 +" style='border-color:#6c757d'>
                                </address>
                                <!--<a href="#" id="btn_address_new1" class="btn btn-primary btn-sm insert">주소 입력</a>-->
                            </div>
                        </div>`;
}

UserHtmlContents.user_profile_edit=function(sUser){
	
  		if(sUser.user_profile.startsWith('http')){
         sUser.user_profile= sUser.user_profile;
      }else{
         sUser.user_profile= 'img/user_profile/'+sUser.user_profile;
      }
	
	return `<h5 class="mb-3">프로필 수정</h5>
                   <profile>
      	               <div class="mb-100" style="margin-bottom: 0px;height:200px;text-align:center">
	                        <div class="" style="display:inline-block">
	                            <img id="user_profile" class="img-circle" src='${sUser.user_profile}' alt="" user_profile='${sUser.user_profile}' style="width:200px; height:200px" >
	                        </div>
                        	<form id="image_form"  name="image_form" enctype="multipart/form-data" style="margin:0 auto 0 200px">
	                        	<input type="hidden" name="user_id" id="user_id" value="${sUser.user_id}"><br>
	                        	<input type="file" name="files" id="chooseF" hidden><br>
							</form> 
                        </div>
						<div class="shortcodes_content mb-100" style="margin-bottom: 0px;text-align:right">
		                        <input type="submit" id="btn_submit" class="btn-carrot btn mb-1 edit_profile" value="사진 선택">
		                        <input type="button" class="btn-carrot btn mb-1 remove_profile" value="사진 삭제">
						</div>
					</profile>`;
}

UserHtmlContents.user_remove_form=function(msg){
	return `<div class="shortcodes_content mb-100">
				<h5 class="mb-4">회원 탈퇴</h5>
                        <form id="user_remove_pw_form" name="user_remove_form">
                            <div class="form-group">
                                <label for="exampleInputPassword1">비밀번호 확인</label>
                                <font color="red" id="msg">${msg}</font>
                                <input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="비밀번호">
                            </div>
                            <div class="form-group form-check">
                                <input type="checkbox" class="form-check-input" id="chk_remove">
                                <label class="form-check-label" for="exampleCheck1">정말로 흙당근 마켓에서 탈퇴하시겠습니까?</label>
                            </div>
                            <button type="submit" id="btn_user_remove" class="btn btn-primary">탈퇴하기</button>
                        </form>
                    </div>`;
}

UserHtmlContents.user_received_reviewList2=function(reviewList){
	function review_item_content2(review){
		return `<li class="single_comment_area">
                    <div class="comment-wrapper clearfix" style="margin-bottom:40px">
                        <div class="comment-meta">
                            <div class="comment-author-img">
                                <img class="review-img-circle" src="img/user_profile/${review.userInfo.user_profile}" alt="">
                            </div>
                        </div>
                        <div class="comment-content submit_a_review_area " style="padding-left:20px">
                            <h5 class="comment-author"><strong>${review.userInfo.user_id}</strong></h5>
                            <form>
                            <div class="stars">
                                    <input type="radio" name="star" class="star-${review.review_point}" id="star-${review.review_point}" checked>
                                    <label class="star-${review.review_point}" for="star-${review.review_point}">${review.review_point}</label>
                                    <span style="width:${20 * review.review_point}%"></span>
            				</div>
                          </form>  
                            <h6 style="display:inline;color: #747794;">${review.orders.product.p_address_name}&nbsp;&nbsp;${review.orders.orders_date}</h6>
                            <p style="color: #070a57">${review.review_desc}</p>
                            <!--<a href="#" class="reply">Reply</a>-->
                        </div>
                    </div>
                    <!--
                    <div class="accordion bigshop-accordian-with-icon" id="bigshopAccordianIcon" >
                    	<div class="card">
                                <div class="card-header" id="bigshopWithIconAccordian1">
                                    <button class="btn" type="button" data-toggle="collapse" data-target="#bswicollapseOne" aria-expanded="true" aria-controls="bswicollapseOne">
                                        <div class="comment-author-img" style="display:inline-block">
			                                <img class="review-img-circle" src="img/user_profile/${review.userInfo.user_profile}" alt="">
			                            </div>
			                            <div class="comment-content" style="padding-left:70px;display:inline-block">
				                            <h5 class="comment-author"><strong>${review.userInfo.user_id}</strong></h5>
				                            <h6 style="display:inline;color: #747794;">${review.orders.product.p_address_name}&nbsp;&nbsp;${review.orders.orders_date}</h6>
				                            <p style="color: #070a57">${review.review_desc}</p>
				                        </div>
                                    </button>
                                </div>

                                <div id="bswicollapseOne" class="collapse show" aria-labelledby="bigshopWithIconAccordian1" data-parent="#bigshopAccordianIcon">
                                    <div class="card-body">
                                        <p class="mb-0">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</p>
                                    </div>
                                </div>
	                    </div>
                    </div>
                    -->
                </li>`;
	}
	var sellerList= new Array();
	reviewList.filter(function(item){
		return item.userInfo.user_id == item.orders.product.userInfo.user_id;
	}).forEach(
		function(item){
			sellerList.push(item);
			console.log("reviewer: "+item.userInfo.user_id+", 판매자: "+item.orders.product.userInfo.user_id);
		}	
	);
	var buyerList = new Array();
	reviewList.filter(function(item){
		return item.userInfo.user_id != item.orders.product.userInfo.user_id;
	}).forEach(
		function(item){
			buyerList.push(item);
			console.log("reviewer: "+item.userInfo.user_id+", 구매자: "+item.orders.product.userInfo.user_id);
		}	
	);
		return `<h5>받은 거래 후기</h5>
				<div class="product_details_tab section_padding_100_0 clearfix" style="padding-top:10px">
                        <!-- Tabs -->
                        <ul class="nav nav-tabs" role="tablist" id="product-details-tab">
                            <li class="nav-item">
                                <a href="#description" class="nav-link active" data-toggle="tab" role="tab">전체후기</a>
                            </li>
                            <li class="nav-item">
                                <a href="#reviews" class="nav-link" data-toggle="tab" role="tab">판매자 후기 <span class="text-muted">(${sellerList.length})</span></a>
                            </li>
                            <li class="nav-item">
                                <a href="#addi-info" class="nav-link" data-toggle="tab" role="tab">구매자 후기 <span class="text-muted">(${buyerList.length})</span></a>
                            </li>
                        </ul>
                        <!-- Tab Content -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade show active" id="description">
                                <!--
                                <div class="description_area">
                                    <h5>Description</h5>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ex cum dolore, adipisci vitae quidem. Quaerat tenetur explicabo tempore beatae dolor. Quo ipsa labore, itaque ea ratione. Ratione labore quae corporis.</p>
                                    <div class="embed-responsive embed-responsive-16by9 mb-3">
                                        <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/tjvOOKx7Ytw?ecver=1" allowfullscreen></iframe>
                                    </div>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Hic facere quos repudiandae ratione maiores accusantium suscipit, quod fugiat. Fugit quod laborum quidem, quos adipisci harum aspernatur, repudiandae, beatae expedita rerum ipsam dicta molestias et quis sapiente maiores amet laudantium minus nostrum. Nobis amet veritatis autem illo neque voluptas culpa vero iusto distinctio perspiciatis.</p>
                                    <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima animi ab, quis atque, sed nulla veniam quisquam amet perspiciatis, aliquam dolore tempora, consequuntur beatae quae dolor rem repellendus! Vitae architecto sequi quo eaque iusto impedit suscipit non maxime sint totam, nesciunt necessitatibus iste nulla ab, veritatis assumenda.</p>
                                </div>
                                -->
		                        <div class="comment_area mb-50 clearfix">
		                            <h5 class="mb-4">후기 ${reviewList.length}개</h5>
		                            <ol>
		                                <!-- Single Comment Area -->
		                                ${
										reviewList.map(review_item_content2).join('')	
										}
		                            </ol>
		                        </div>
                                
                            </div>

                            <div role="tabpanel" class="tab-pane fade" id="reviews">
                                <div class="reviews_area">
	                                <h5 class="mb-4">후기 ${sellerList.length}개</h5>
		                            <ol>
		                                <!-- Single Comment Area -->
		                                ${
										sellerList.map(review_item_content2).join('')	
										}
		                            </ol>
                                </div>
                            </div>

                            <div role="tabpanel" class="tab-pane fade" id="addi-info">
                                <div class="additional_info_area">
	                                <h5 class="mb-4">후기 ${sellerList.length}개</h5>
		                            <ol>
		                                <!-- Single Comment Area -->
		                                ${
										buyerList.map(review_item_content2).join('')	
										}
		                            </ol>
                                </div>
                            </div>

                        </div>
                    </div>
		`;
}