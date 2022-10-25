<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>

<div class="modal fade" id="quickview" tabindex="-1" role="dialog"
	aria-labelledby="quickview" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered"
		role="document">
		<div class="modal-content">
			<button type="button" class="close btn" data-dismiss="modal"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<div class="modal-body">
				<div class="quickview_body">
					<div class="container">
						<div class="row">
							<div class="col-12 col-lg-5">
								<div class="quickview_pro_img">
									<img class="first_img" src="img/product-img/new-1-back.png"
										alt=""> <img class="hover_img"
										src="img/product-img/new-1.png" alt="">
									<!-- Product Badge -->
									<div class="product_badge">
										<span class="badge-new"></span>
									</div>
								</div>
							</div>
							<div class="col-12 col-lg-7">
								<div class="quickview_pro_des">
									<h4 class="title"></h4>
									<div class="top_seller_product_rating mb-15">
										<i class="fa fa-star" aria-hidden="true"></i>
									</div>
									<h5 class="price">
										 <span></span>
									</h5>
									<p class="p_desc"></p>
									<a class="p_detail_link" href="">View Full Product Details</a>
								</div>
								<!-- Add to Cart Form -->
								<form class="cart" id="q_view_cart_add_form" method="post">
									<input type="hidden" name="p_no" id="p_no"/>	
									<div class="quantity">
										<input type="number" class="qty-text" id="qty" step="1"
											min="1" max="12" name="qty" value="1">
									</div>
									<button type="submit" name="addtocart" value="5"
										class="cart-submit">Add to cart</button>
									<!-- Wishlist -->
									<div class="modal_pro_wishlist">
										<a href="" class="q_view_to_wish_btn"><i class="icofont-heart"></i></a>
									</div>
								</form>
								<!-- Share -->
								<div class="share_wf mt-30">
									<p>Share with friends</p>
									<div class="_icon">
										<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
										<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
										<a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
										<a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
										<a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
										<a href="#"><i class="fa fa-envelope-o" aria-hidden="true"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
