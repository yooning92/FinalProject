<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>

<section class="you_may_like_area section_padding_0_100 clearfix">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="section_heading new_arrivals">
					<h5>You May Also Like</h5>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="you_make_like_slider owl-carousel">

					<!-- Single Product -->
					<c:forEach var="s_product" items="${productList}">
						<div class="single-product-area">
							<div class="product_image">
								<!-- Product Image -->
								<img class="normal_img" src="img/p_img/${s_product.imageList[0].im_name}"
									alt=""> <img class="hover_img"
									src="img/p_img/${s_product.imageList[1].im_name}" alt="">

								<!-- Product Badge -->
								<div class="product_badge">
									<span>${s_product.p_concept}</span>
								</div>

								<!-- Wishlist -->
								<div class="product_wishlist">
									<a href="" class="related_product_add_wishList" p_no="${s_product.p_no}"><i class="icofont-heart"></i></a>
								</div>

							<!-- Product Description -->
							<div class="product_description">
								<!-- Add to cart -->
								<div class="product_add_to_cart">
									<a href="" class="related_product_add_cart" p_no="${s_product.p_no}"><i class="icofont-shopping-cart"></i> Add to
										Cart</a>
								</div>

								<!-- Quick View -->
								<div class="product_quick_view">
									<a href="#" data-toggle="modal" data-target="#quickview" p_no="${s_product.p_no}"><i
										class="icofont-eye-alt"></i> Quick View</a>
								</div>

								<p class="brand_name">${s_product.p_brand}</p>
								<a href="product_detail?p_no=${s_product.p_no}" p_no="${s_product.p_no}">${s_product.p_name}</a>
								<h6 class="product-price">&#8361;<s:eval expression="new java.text.DecimalFormat('#,###').format(s_product.p_price)"/></h6>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- Single Product end -->

				</div>
			</div>
		</div>
	</div>
</section>