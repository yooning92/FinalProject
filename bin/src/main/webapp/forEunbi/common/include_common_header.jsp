<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<!-- Header Area -->
<header class="header_area">
	<!-- Top Header Area -->
	<div class="top-header-area">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-6">
					<div class="welcome-note">
						<span class="popover--text" data-toggle="popover"
							data-content="Welcome to Bigshop ecommerce template."><i
							class="icofont-info-square"></i></span> <span class="text">Welcome
							to tomorrowHome.</span>
					</div>
				</div>
				<div class="col-6">
					<div
						class="language-currency-dropdown d-flex align-items-center justify-content-end">
						<!-- Language Dropdown -->
						<div class="language-dropdown">
							<div class="dropdown">
								<a class="btn btn-sm dropdown-toggle" href="#" role="button"
									id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> English </a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="dropdownMenu1">
									<a class="dropdown-item" href="#">Bangla</a> <a
										class="dropdown-item" href="#">Arabic</a>
								</div>
							</div>
						</div>

						<!-- Currency Dropdown -->
						<div class="currency-dropdown">
							<div class="dropdown">
								<a class="btn btn-sm dropdown-toggle" href="#" role="button"
									id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> $ USD </a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="dropdownMenu2">
									<a class="dropdown-item" href="#">à§³ BDT</a> <a
										class="dropdown-item" href="#">â¬ Euro</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Main Menu -->
	<div class="bigshop-main-menu">
		<div class="container">
			<div class="classy-nav-container breakpoint-off">
				<nav class="classy-navbar" id="bigshopNav">

					<!-- Nav Brand -->
					<a href="index.html" class="nav-brand">
						<img src="img/core-img/logo.jpg" alt="logo" id="logo_img" style="width:190px;height:50px;">
					</a>

					<!-- Toggler -->
					<div class="classy-navbar-toggler">
						<span class="navbarToggler"><span></span><span></span><span></span></span>
					</div>

					<!-- Menu -->
					<div class="classy-menu">
						<!-- Close -->
						<div class="classycloseIcon">
							<div class="cross-wrap">
								<span class="top"></span><span class="bottom"></span>
							</div>
						</div>

						<!-- Nav -->
						<div class="classynav">
							<ul>
								<li><a href="index">Home</a></li>
								<li><a href="product_list?pageno=1" id="shop_main_menu">Shop</a></li>
								<c:if test="${empty sM_id}">
									<li><a href="" class="login_check">Orders</a></li>
								</c:if>
								<c:if test="${!empty sM_id}">
									<li><a href="order_list">Orders</a></li>
								</c:if>
								<li><a href="faq">FAQ</a></li>
								<c:if test="${empty sM_id}">
									<li><a href="" class="login_check">Board</a></li>
								</c:if>
								<c:if test="${!empty sM_id}">
									<li><a href="qna_list">Board</a></li>
								</c:if>
								
							</ul>
						</div>
					</div>

					<!-- Hero Meta -->
					<div
						class="hero_meta_area ml-auto d-flex align-items-center justify-content-end">
						<!-- Search -->
						<div class="search-area">
							<div class="search-btn">
								<i class="icofont-search"></i>
							</div>
							<!-- Form -->
							<div class="search-form">
								<input type="search" class="form-control" placeholder="Search">
								<input type="submit" class="d-none" value="Send">
							</div>
						</div>

						<!-- Wishlist -->
						<div class="wishlist-area">
						<c:if test="${empty sM_id}">
							<a href="#" class="wishlist-btn login_check""><i class="icofont-heart"></i></a>
						</c:if>	
						<c:if test="${!empty sM_id}">
							<a href="wishlist_view" class="wishlist-btn"><i class="icofont-heart"></i></a>
						</c:if>
						</div>

						<!-- Cart -->
						
						<div class="cart-area">
							<div class="cart--btn">
							<c:if test="${empty sM_id}">
								<a href="#" class="login_check"><i class="icofont-cart"></i></a>
							</c:if>
							<c:if test="${!empty sM_id}">
								<a href="cart_view"><i class="icofont-cart"></i><span class="cart_quantity">${cartList.size()}</span></a>
							</c:if>
							</div>
 
							<!-- Cart Dropdown Content -->
							<c:if test="${!empty sM_id}">
								<div class="cart-dropdown-content">
									<ul class="cart-list">
										<c:set var="tot_price" value="0" />
										<c:forEach var="cart" items="${cartList}">
										<c:set var="tot_price" value="${tot_price + cart.product.p_price * cart.c_qty}" />
											<li id="header_cart_item_${cart.c_no}">
												<div class="cart-item-desc">
													<a href="product_detail?p_no=${cart.product.p_no}" class="image"> <img
														src="img/p_img/${cart.product.imageList[0].im_name}" class="cart-thumb" alt="">
													</a>
													<div>
														<a href="product_detail?p_no=${cart.product.p_no}">${cart.product.p_name}</a>
														<p>
															<c:set var="item_total" value="${cart.c_qty * cart.product.p_price}" />
															${cart.c_qty} x - <span class="price">&#8361;<s:eval expression="new java.text.DecimalFormat('#,###').format(item_total)"/></span>
														</p>
													</div>
												</div> 
												<span class="dropdown-product-remove" c_no="${cart.c_no}"><i class="icofont-bin"></i></span>
											</li>
										</c:forEach>
									</ul>
									<div class="cart-pricing my-4">
										<ul>
											<li><span>Sub Total:</span> 
												<%-- <span>&#8361;<s:eval expression="new java.text.DecimalFormat('#,##0').format(tot_price)"/></span> --%>
												<span id="header_cart_sub_tot">&#8361;${tot_price}</span> 
											</li>
											<li><span>Shipping:</span> 
												<span id="header_cart_shipping">
			                                       	<c:if test="${tot_price < 50000 && tot_price > 0}">
			                                        	&#8361;<s:eval expression="new java.text.DecimalFormat('#,##0').format(2500)"/>
			                                        	<c:set var="shipping_price" value="2500" />
			                                        </c:if>
			                                        <c:if test="${(tot_price >= 50000) || tot_price == 0}">
			                                        	&#8361;0
			                                        	<c:set var="shipping_price" value="0" />
			                                        </c:if>
												</span>
											</li>
											<c:set var="all_total" value="${tot_price + shipping_price}" />
											<li><span>Total:</span> <span id="header_cart_tot">&#8361;<s:eval expression="new java.text.DecimalFormat('#,##0').format(all_total)"/></span></li>
										</ul>
									</div>
									<div class="cart-box">
										<a href="" id="header_checkout_btn" class="btn btn-primary d-block" size="${cartList.size()}">Checkout</a>
										<form id="header_order_create_form" method="post">
											<input type="hidden" name="buyType" value="cart" />
										</form>
									</div>
								</div>
							</c:if>
						</div>

						<!-- Account -->
						<div class="account-area">
							<div class="user-thumbnail">
							<c:if test="${empty sM_id}">
								<a href="login_form">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
										  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
									</svg>
								</a>
							</c:if>
							<c:if test="${!empty sM_id}">
								<a href="#"><img src="img/bg-img/bono.jpeg" alt=""></a>
							</c:if>
							</div>
							<c:if test="${!empty sM_id}">
								<ul class="user-meta-dropdown">
									<li class="user-title"><span>Hello,</span> ${sMember.m_name} 🙂</li> 
									<li><a href="my_account">My Account</a></li>
									<li><a href="order_list">Orders List</a></li>
									<li><a href="wishlist_view">Wishlist</a></li>
									<li><a href="member_logout"><i class="icofont-logout"></i>
											Logout</a></li>
								</ul>
							</c:if>
						</div>
					</div>
				</nav>
			</div>
		</div>
	</div>
</header>
<!-- Header Area End -->
