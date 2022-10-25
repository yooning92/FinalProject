function ReviewHtmlContents(){
}




/*
	[기준]구매목록: 구매자(buyer)가 작성하는 review -> orders.user_id = review.user_id
						=> 상대방id(your_id) = product.user_id (seller)
	[기준]판매목록: 판매자(seller)가 작성하는 review -> product.user_id = review.user_id
						=> 상대방id(your_id) = orders.user_id (buyer)
*/
ReviewHtmlContents.review_write_form=function(orders_no,your_id) {
	
	return `<div class="submit_a_review_area col-12" style="border: 1px solid #d6e6fb; padding:30px;">
                        <h4>후기작성</h4>
                        <!-- [Start]review_write_form -->
                        <form id="review_write_form" name="review_write_form" action="review_write_action" method="post">
                                <div class="form-group">
                                    <span>별점주기</span>
                                    <input type="hidden" id="review_point" name="review_point" class="" value="">
                                    <input type="hidden" id="review_image" name="review_image" class="" value="test">
                                    <div class="stars">
                                        <input type="radio" name="star" class="star-0_5" id="star-0_5" onclick='setPoint(this.id);'>
                                        <label class="star-0_5" for="star-0_5">0.5</label>
                                        <input type="radio" name="star" class="star-1" id="star-1" onclick='setPoint(this.id);'>
                                        <label class="star-1" for="star-1">1</label>
                                        <input type="radio" name="star" class="star-1_5" id="star-1_5" onclick='setPoint(this.id);'>
                                        <label class="star-1_5" for="star-1_5">1.5</label>
                                        <input type="radio" name="star" class="star-2" id="star-2" onclick='setPoint(this.id);'>
                                        <label class="star-2" for="star-2">2</label>
                                        <input type="radio" name="star" class="star-2_5" id="star-2_5" onclick='setPoint(this.id);'>
                                        <label class="star-2_5" for="star-2_5">2.5</label>
                                        <input type="radio" name="star" class="star-3" id="star-3" onclick='setPoint(this.id);'>
                                        <label class="star-3" for="star-3">3</label>
                                        <input type="radio" name="star" class="star-3_5" id="star-3_5" onclick='setPoint(this.id);'>
                                        <label class="star-3_5" for="star-3_5">3.5</label>
                                        <input type="radio" name="star" class="star-4" id="star-4" onclick='setPoint(this.id);'>
                                        <label class="star-4" for="star-4">4</label>
                                        <input type="radio" name="star" class="star-4_5" id="star-4_5" onclick='setPoint(this.id);'>
                                        <label class="star-4_5" for="star-4_5">4.5</label>
                                        <input type="radio" name="star" class="star-5" id="star-5" onclick='setPoint(this.id);'>
                                        <label class="star-5" for="star-5">5</label>
                                        <span></span>
                                    </div>
                                </div>
                                
                                <!--
                                <div class="form-group">
                                    <label for="name">Nickname</label>
                                    <input type="email" class="form-control" id="name" placeholder="Nazrul">
                                </div>
                                <div class="form-group">
                                    <label for="options">Reason for your rating</label>
                                    <select class="form-control small right py-0 w-100" id="options">
                                        <option>Quality</option>
                                        <option>Value</option>
                                        <option>Design</option>
                                        <option>Price</option>
                                        <option>Others</option>
                                    </select>
                                </div>
                                -->
                                <div class="form-group">
                                    <label for="review_desc">내용</label>
                                    <textarea class="form-control" id="review_desc" name="review_desc" rows="5" data-max-length="150"></textarea>
                                </div>
                                
                                <!-- 이미지 업로드 -->
                                <div class="form-group">
	                                <label for="drop">사진 첨부 <span style="color:dimgray;font-size:10px"> (하단에 drag & drop 해주세요)</span></label>
									<div id="drop" class="form-control"
										style="height: 220px; padding: 3px">
										
										<div id="thumbnails" ></div>
									</div>
								</div>
                                <input type="button" id="btnSubmit" class="btn btn-primary" value="Submit Review" />
                                
                            </form>
                        <!-- [END]review_write_form -->
                	</div>`;
}

ReviewHtmlContents.review_view=function(review) {
	console.log(review.reviewImageList.length);
	const star = 20 * review.review_point;
	const showHeight = 220 * parseInt(review.reviewImageList.length/2+1);
	//$('#show').style("height",showHeight+"px");
	
	function reviewImage_item(review_img){
		return`
			<img class="thumb" src="img/review_img/${review_img.review_img_name}" onerror="this.src='img/user_profile/newCarrot.jpg'">
		`;
	}
	
	return `<div class="submit_a_review_area col-12" style="border: 1px solid #d6e6fb; padding:30px;">
                        <h4>작성한 후기</h4>
                        <!-- [Start]review_write_form -->
                        <form id="review_write_form" name="review_write_form" action="review_write_action" method="post">
                                <div class="form-group">
                                    <span>별점</span>
                                    <div class="stars">
                                        <input type="radio" name="star" class="star-${review.review_point}" id="star-${review.review_point}" checked>
                                        <label class="star-${review.review_point}" for="star-${review.review_point}">${review.review_point}</label>
                                        <span style="width:${star}%"></span>
                                    </div>
                                </div>
                                    <!--review_image(다른data활용예정): "${review.review_image}"-->
                                
                                <!--
                                <div class="form-group">
                                    <label for="name">Nickname</label>
                                    <input type="email" class="form-control" id="name" placeholder="Nazrul">
                                </div>
                                <div class="form-group">
                                    <label for="options">Reason for your rating</label>
                                    <select class="form-control small right py-0 w-100" id="options">
                                        <option>Quality</option>
                                        <option>Value</option>
                                        <option>Design</option>
                                        <option>Price</option>
                                        <option>Others</option>
                                    </select>
                                </div>
                                -->
                                <div class="form-group">
                                    <label for="review_desc">내용</label>
                                    <textarea class="form-control" id="review_desc" name="review_desc" rows="5" data-max-length="150">${review.review_desc}</textarea>
                                </div>
                                
                                <!-- 이미지 업로드 -->
                                <div class="form-group">
	                                <label for="drop">첨부 사진</label>
									<div id="show" class="form-control"
										style="height: ${showHeight}px; padding: 3px">
										<div id="thumbnails">
										
										${
											review.reviewImageList.map(reviewImage_item).join('')
										}
										
										</div>
									</div>
								</div>
                                <!--<input type="button" id="btnSubmit" class="btn btn-primary" value="Submit Review" />-->
                                <input type="button" id="btn_review_edit" class="btn btn-primary" value="Edit Review" />
                                <input type="button" id="btn_review_remove" class="btn btn-primary" value="Delete Review" />
                            </form>
                        <!-- [END]review_write_form -->
                	</div> `;
}