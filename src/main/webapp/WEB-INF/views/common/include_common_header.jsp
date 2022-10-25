<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header class="header_area">
	<!-- Top Header Area -->
	<div class="top-header-area">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-6">
					<div class="welcome-note">
						<span class="popover--text" data-toggle="popover"
							data-content="동네 주민들과 가깝고 따뜻한 거래를 지금 경험해보세요."><i
							class="icofont-info-square"></i></span> <span class="text">동네
							주민들과 가깝고 따뜻한 거래를 지금 경험해보세요.</span>
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
									aria-expanded="false"> Korean </a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="dropdownMenu1">
									<a class="dropdown-item" href="#">English</a>
								</div>
							</div>
						</div>

						<!-- Currency Dropdown -->
						<div class="currency-dropdown">
							<div class="dropdown">
								<a class="btn btn-sm dropdown-toggle" href="#" role="button"
									id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> ₩ KRW </a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="dropdownMenu2">
									<a class="dropdown-item" href="#">$ USD</a>
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
					<a href="main" class="nav-brand"><img
						src="img/core-img/logo.png" alt="logo"></a>

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
                                    <!-- <li><a href="#">Home</a></li> -->
                                    <li><a href="product_list">동네물건</a>
                                        <ul class="dropdown">
                                            <li><a href="product_list">- 전체보기</a></li>
                                            <li><a href="product_category?category_no=1">- 가전제품</a></li>
                                            <li><a href="product_category?category_no=2">- 가구</a></li>
                                            <li><a href="product_category?category_no=3">- 의류</a></li>
                                            <li><a href="product_category?category_no=4">- 생활용품</a></li>
                                            <li><a href="product_category?category_no=5">- 취미/게임/음반/도서</a></li>
                                            <li><a href="product_category?category_no=6">- 기타</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="townBoard_list">동네생활</a>
                                    	<ul id="townBoard_list"  class="dropdown">
                                            <li><a href="townBoard_list">- 전체보기</a></li>
                                            <li><a href="single-blog.html">- 동네소식</a></li>
                                            <li><a href="single-blog.html">- 같이해요</a></li>
                                            <li><a href="single-blog.html">- 동네질문</a></li>
                                            <li><a href="single-blog.html">- 동네맛집</a></li>
                                            <li><a href="single-blog.html">- 취미생활</a></li>
                                            <li><a href="single-blog.html">- 일상</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">흙당근페이</a>
                                        <ul id="brown_carrot_pay" class="dropdown">
                                            <li><a href="payment_deposit">포인트 충전</a></li>
                                            <li><a href="point_list">페이내역</a></li>
                                            <li><a href="payment_withdraw">포인트 출금</a></li>		
                                        </ul>
                                    </li>
                                    <li><a href="faq">자주하는질문</a></li>
                                    <li><a href="notice_list">공지사항</a></li>
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
								<input type="search" class="form-control" id="searchKey" placeholder="검색">
								<input type="submit" class="d-none" value="검색">
							</div>
						</div>

                            <!-- Wishlist -->
                            <div id="wishlist-area" class="wishlist-area" >
                                <a href="wishList" class="wishlist-btn"><i class="icofont-heart"></i></a>
                            </div>
                            
                            <!-- transaction list -->
                              <div id="transaction-area" class="account-area transaction-area" style="margin-right:8px">
                                <div class="user-thumbnail">
                                    <i class="icofont-bag"></i>
                                </div>
                                <ul id="transaction-dropdown" class="user-meta-dropdown" style="width:150px">
                                    <li><a href="orders_list">구매내역</a></li>
                                    <li><a href="sell_list">판매내역</a></li>
                                </ul>
                            </div>

                            <!-- Chat -->
                            <div id="chat-area" class="cart-area chat-area" >
                                <a href="chat_room" class="cart--btn" style="display:block;background-color:#fbf8ef"><i class="icofont-chat"></i> <span style="background-color:orange;" class="cart_quantity">1</span></a>

                                <!-- Cart Dropdown Content -->
                                <!--  
                                <div class="cart-dropdown-content">
                                    <ul class="cart-list">
                                        <li>
                                            <div class="cart-item-desc">
                                                <a href="#" class="image">
                                                    <img src="img/product-img/top-1.png" class="cart-thumb" alt="">
                                                </a>
                                                <div>
                                                    <a href="#">Kid's Fashion</a>
                                                    <p>1 x - <span class="price">$32.99</span></p>
                                                </div>
                                            </div>
                                            <span class="dropdown-product-remove"><i class="icofont-bin"></i></span>
                                        </li>
                                        <li>
                                            <div class="cart-item-desc">
                                                <a href="#" class="image">
                                                    <img src="img/product-img/best-4.png" class="cart-thumb" alt="">
                                                </a>
                                                <div>
                                                    <a href="#">Headphone</a>
                                                    <p>2x - <span class="price">$49.99</span></p>
                                                </div>
                                            </div>
                                            <span class="dropdown-product-remove"><i class="icofont-bin"></i></span>
                                        </li>
                                    </ul>
                                    <div class="cart-pricing my-4">
                                        <ul>
                                            <li>
                                                <span>Sub Total:</span>
                                                <span>$822.96</span>
                                            </li>
                                            <li>
                                                <span>Shipping:</span>
                                                <span>$30.00</span>
                                            </li>
                                            <li>
                                                <span>Total:</span>
                                                <span>$856.63</span>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="cart-box">
                                        <a href="checkout-1.html" class="btn btn-primary d-block">Checkout</a>
                                    </div>
                                </div>
                                -->
                            </div>
<!-- [nav] Account Start!!!!! **************************************** -->
                            <!-- Account -->
                            <div id="account-area" class="account-area">
                                <div class="user_account user-thumbnail">
				    			<i class="fa fa-user-circle"></i>
	                            </div>
	                            <ul class="user-meta-dropdown">
	                                <li><a href="user_login"><i class="icofont-ui-user"></i> 회원가입</a></li>
	                                <li><a href="user_login"><i class="icofont-login"></i> 로그인</a></li>
	                            </ul>
                            </div>
<!-- [nav] Account END!!!!! **************************************** -->
                        </div>
                    </nav>
                </div>
            </div>
        </div>
</header>