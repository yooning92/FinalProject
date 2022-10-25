<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Brown Carrot Market</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Style CSS -->
    <link rel="stylesheet" href="style.css">
   <link rel="stylesheet" href="css/chat_toast.css">

	<!-- javaScript -->

	
	<!-- toast -->
 <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
   

	
</head>

<body>
  
    <!-- Preloader -->
    <div id="preloader">
        <div class="spinner-grow" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>

    <!-- Header Area -->
   		<!-- include_common_bottom.jsp start-->
		<jsp:include page="common/include_common_header.jsp"/>
		<!-- include_common_bottom.jsp end-->
    <!-- Header Area End -->

    <!-- Welcome Slides Area -->
    <section class="welcome_area">
        <div class="welSlideTwo owl-carousel">
            <!-- Single Slide -->
            <div class="single_slide home-3 bg-img" style="background-image: url(img/bg-img/back1.jpg);">
                
            </div>

            <!-- Single Slide -->
            <div class="single_slide home-3 bg-img" style="background-image: url(img/bg-img/back2-3.jpg);">

            </div>

            <!-- Single Slide -->
            <div class="single_slide home-3 bg-img" style="background-image: url(img/bg-img/bbb.jpg);">
                
            </div>

            <!-- Single Slide -->
            <div class="single_slide home-3 bg-img" style="background-image: url(img/bg-img/16.jpg);">
               
            </div>
        </div>
    </section>
    <!-- Welcome Slides Area -->

    <!-- Shop Catagory Area -->
    <div class="shop_by_catagory_area section_padding_100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading mb-50">
                        <h5>Shop By Catagory</h5>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="shop_by_catagory_slides owl-carousel">
                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="#">
                                <img src="img/product-img/category1-4.png" alt="">
                            </a>
                            <p>가전제품</p>
                        </div>

                        <!-- Single Slide -->
                        
                        <div class="single_catagory_slide">
                            <a href="#">
                                <img src="img/product-img/category2.png" alt="">
                            </a>
                            <p>가구</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="#">
                                <img src="img/product-img/category3.png" alt="">
                            </a>
                            <p>의류</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="#">
                                <img src="img/product-img/category4.png" alt="">
                            </a>
                            <p>생활용품</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="#">
                                <img src="img/product-img/category5.png" alt="">
                            </a>
                            <p>취미/게임/음반</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="#">
                                <img src="img/product-img/category6.png" alt="">
                            </a>
                            <p>도서</p>
                        </div>
                        <div class="single_catagory_slide">
                            <a href="#">
                                <img src="img/product-img/category7.png" alt="">
                            </a>
                            <p>기타</p>
                        </div>

                     
                        


                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Shop Catagory Area -->

    <!-- Quick View Modal Area -->
    <div class="modal fade" id="quickview" tabindex="-1" role="dialog" aria-labelledby="quickview" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <button type="button" class="close btn" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <div class="modal-body">
                    <div class="quickview_body">
                        <div class="container">
                            <div class="row">
                                <div class="col-12 col-lg-5">
                                    <div class="quickview_pro_img">
                                        <img class="first_img" src="img/product-img/new-1-back.png" alt="">
                                        <img class="hover_img" src="img/product-img/new-1.png" alt="">
                                        <!-- Product Badge -->
                                        <div class="product_badge">
                                            <span class="badge-new">New</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-7">
                                    <div class="quickview_pro_des">
                                        <h4 class="title">Boutique Silk Dress</h4>
                                        <div class="top_seller_product_rating mb-15">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                        </div>
                                        <h5 class="price">$120.99 <span>$130</span></h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia expedita quibusdam aspernatur, sapiente consectetur accusantium perspiciatis praesentium eligendi, in fugiat?</p>
                                        <a href="#">View Full Product Details</a>
                                    </div>
                                    <!-- Add to Cart Form -->
                                    <form class="cart" method="post">
                                        <div class="quantity">
                                            <input type="number" class="qty-text" id="qty" step="1" min="1" max="12" name="quantity" value="1">
                                        </div>
                                        <button type="submit" name="addtocart" value="5" class="cart-submit">Add to cart</button>
                                        <!-- Wishlist -->
                                        <div class="modal_pro_wishlist">
                                            <a href="wishlist.html"><i class="icofont-heart"></i></a>
                                        </div>
                                        <!-- Compare -->
                                        <div class="modal_pro_compare">
                                            <a href="compare.html"><i class="icofont-exchange"></i></a>
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
    <!-- Quick View Modal Area -->

    <!-- Best Selling Products -->
    <section class="best-selling-products-area mb-70">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading mb-50">
                        <h5>인기 게시글</h5>
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
                <!-- Single Product -->
                <div class="col-9 col-sm-6 col-md-4 col-lg-3">
                    <div class="single-product-area mb-30">
                        <div class="product_image">
                            <!-- Product Image -->
                            <img class="normal_img" src="img/townBoard-img/itwill.png" alt="" style="width:250px; height:250px;">

                            <!-- Product Badge -->
                            <div class="product_badge">
                                <span>Top</span>
                            </div>

                            <!-- Wishlist -->
                            <div class="product_wishlist">
                                <a href="wishlist.html"><i class="icofont-heart"></i></a>
                            </div>

                            <!-- Compare -->
                            <div class="product_compare">
                                <a href="compare.html"><i class="icofont-exchange"></i></a>
                            </div>
                        </div>

                        <!-- Product Description -->
                        <div class="product_description">
                            <!-- Add to cart -->
                            <div class="product_add_to_cart">
                                <a href="#"><i class="icofont-cart"></i> Add to Cart</a>
                            </div>

                            <!-- Quick View -->
                            <div class="product_quick_view">
                                <a href="#" data-toggle="modal" data-target="#quickview"><i class="icofont-eye-alt"></i> Quick View</a>
                            </div>

                            <a href="#">국내 최고의 IT 교육기관!</a>
                            <h6 class="product-price"><i class="fa fa-heart" style="color:red"></i> 1035</h6>
                        </div>
                    </div>
                </div>

                <!-- Single Product -->
                <div class="col-9 col-sm-6 col-md-4 col-lg-3">
                    <div class="single-product-area mb-30">
                        <div class="product_image">
                            <!-- Product Image -->
                            <img class="normal_img" src="img/product_img/desk.jpg" alt="" style="width:250px; height:250px;">

                            <!-- Product Badge -->
                            <div class="product_badge">
                                <span>Top</span>
                            </div>

                            <!-- Wishlist -->
                            <div class="product_wishlist">
                                <a href="wishlist.html"><i class="icofont-heart"></i></a>
                            </div>

                            <!-- Compare -->
                            <div class="product_compare">
                                <a href="compare.html"><i class="icofont-exchange"></i></a>
                            </div>
                        </div>

                        <!-- Product Description -->
                        <div class="product_description">
                            <!-- Add to cart -->
                            <div class="product_add_to_cart">
                                <a href="#"><i class="icofont-cart"></i> Add to Cart</a>
                            </div>

                            <!-- Quick View -->
                            <div class="product_quick_view">
                                <a href="#" data-toggle="modal" data-target="#quickview"><i class="icofont-eye-alt"></i> Quick View</a>
                            </div>

                            <a href="#">공부가 쉬워지는 책상 후기</a>
                            <h6 class="product-price"><i class="fa fa-heart" style="color:red"></i> 777</h6>
                        </div>
                    </div>
                </div>

                <!-- Single Product -->
                <div class="col-9 col-sm-6 col-md-4 col-lg-3">
                    <div class="single-product-area mb-30">
                        <div class="product_image">
                            <!-- Product Image -->
                            <img class="normal_img" src="https://dnvefa72aowie.cloudfront.net/origin/article/202210/fe5e484165cdc074972885e8af33205f5da157a8f96ce6f26313a71a7dd91b40.webp?q=95&s=1440x1440&t=inside	" alt="" style="width:250px; height:250px;">

                            <!-- Product Badge -->
                            <div class="product_badge">
                                <span>Top</span>
                            </div>

                            <!-- Wishlist -->
                            <div class="product_wishlist">
                                <a href="wishlist.html"><i class="icofont-heart"></i></a>
                            </div>

                            <!-- Compare -->
                            <div class="product_compare">
                                <a href="compare.html"><i class="icofont-exchange"></i></a>
                            </div>
                        </div>

                        <!-- Product Description -->
                        <div class="product_description">
                            <!-- Add to cart -->
                            <div class="product_add_to_cart">
                                <a href="#"><i class="icofont-cart"></i> Add to Cart</a>
                            </div>

                            <!-- Quick View -->
                            <div class="product_quick_view">
                                <a href="#" data-toggle="modal" data-target="#quickview"><i class="icofont-eye-alt"></i> Quick View</a>
                            </div>

                            <a href="#">자취 10일차..이상한 소리가..</a>
                            <h6 class="product-price"><i class="fa fa-heart" style="color:red"></i> 534</h6>
                        </div>
                    </div>
                </div>

                <!-- Single Product -->
                <div class="col-9 col-sm-6 col-md-4 col-lg-3">
                    <div class="single-product-area mb-30">
                        <div class="product_image">
                            <!-- Product Image -->
                            <img class="normal_img" src="img/product_img/toy2.jpg" alt="" style="width:250px; height:250px;">

                            <!-- Product Badge -->
                            <div class="product_badge">
                                <span>Top</span>
                            </div>

                            <!-- Wishlist -->
                            <div class="product_wishlist">
                                <a href="wishlist.html"><i class="icofont-heart"></i></a>
                            </div>

                            <!-- Compare -->
                            <div class="product_compare">
                                <a href="compare.html"><i class="icofont-exchange"></i></a>
                            </div>
                        </div>

                        <!-- Product Description -->
                        <div class="product_description">
                            <!-- Add to cart -->
                            <div class="product_add_to_cart">
                                <a href="#"><i class="icofont-cart"></i> Add to Cart</a>
                            </div>

                            <!-- Quick View -->
                            <div class="product_quick_view">
                                <a href="#" data-toggle="modal" data-target="#quickview"><i class="icofont-eye-alt"></i> Quick View</a>
                            </div>

                            <a href="#">유아용 장난감 만들기!</a>
                            <h6 class="product-price"><i class="fa fa-heart" style="color:red"></i> 327</h6>
                        </div>
                    </div>
                </div>

                

 
            </div>
        </div>
    </section>
    <!-- Best Selling Products -->

    <!-- Offer Area -->
    <!-- Offer Area End -->

    <!-- On Sale Products -->
    <section class="on-sale-products-area mb-70">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading mb-50">
                        <h5>인기 판매글</h5>
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
                <!-- Single Product -->
                <div class="col-9 col-sm-6 col-md-4 col-lg-3">
                    <div class="single-product-area mb-30">
                        <div class="product_image">
                            <!-- Product Image -->
                            <img class="normal_img" src="img/product_img/carrot_dog.jpg"  alt="" style="width:250px; height:250px;">

                            <!-- Product Badge -->
                            <div class="product_badge">
                                <span>Hot</span>
                            </div>

                            <!-- Wishlist -->
                            <div class="product_wishlist">
                                <a href="wishlist.html"><i class="icofont-heart"></i></a>
                            </div>

                            <!-- Compare -->
                            <div class="product_compare">
                                <a href="compare.html"><i class="icofont-exchange"></i></a>
                            </div>
                        </div>

                        <!-- Product Description -->
                        <div class="product_description">
                            <!-- Add to cart -->
                            <div class="product_add_to_cart">
                                <a href="#"><i class="icofont-cart"></i> Add to Cart</a>
                            </div>

                            <!-- Quick View -->
                            <div class="product_quick_view">
                                <a href="#" data-toggle="modal" data-target="#quickview"><i class="icofont-eye-alt"></i> Quick View</a>
                            </div>

                            <a href="#">귀여운 당근 옷</a>
                            <h6 class="product-price">30000원</h6>
                        </div>
                    </div>
                </div>

                <!-- Single Product -->
                <div class="col-9 col-sm-6 col-md-4 col-lg-3">
                    <div class="single-product-area mb-30">
                        <div class="product_image">
                            <!-- Product Image -->
                            <img class="normal_img" src="https://dnvefa72aowie.cloudfront.net/origin/article/202210/f1713907c812125c26dbab59aa2f6edb2ed8286e3cea6499d4afc97d1a85476c.webp?q=95&s=1440x1440&t=inside	" alt="" style="width:250px; height:250px;">

                            <!-- Product Badge -->
                            <div class="product_badge">
                                <span>Hot</span>
                            </div>

                            <!-- Wishlist -->
                            <div class="product_wishlist">
                                <a href="wishlist.html"><i class="icofont-heart"></i></a>
                            </div>

                            <!-- Compare -->
                            <div class="product_compare">
                                <a href="compare.html"><i class="icofont-exchange"></i></a>
                            </div>
                        </div>

                        <!-- Product Description -->
                        <div class="product_description">
                            <!-- Add to cart -->
                            <div class="product_add_to_cart">
                                <a href="#"><i class="icofont-cart"></i> Add to Cart</a>
                            </div>

                            <!-- Quick View -->
                            <div class="product_quick_view">
                                <a href="#" data-toggle="modal" data-target="#quickview"><i class="icofont-eye-alt"></i> Quick View</a>
                            </div>

                            <a href="#">깔끔한 선반</a>
                            <h6 class="product-price">24000원</h6>
                        </div>
                    </div>
                </div>

                <!-- Single Product -->
                <div class="col-9 col-sm-6 col-md-4 col-lg-3">
                    <div class="single-product-area mb-30">
                        <div class="product_image">
                            <!-- Product Image -->
                            <img class="normal_img" src="https://dnvefa72aowie.cloudfront.net/origin/article/202210/e60f0fcd585d832b853baf1dc0506265626dbfb86c03e7b67b21a9fefe96311a.webp?q=95&s=1440x1440&t=inside" alt="" style="width:250px; height:250px;" >

                            <!-- Product Badge -->
                            <div class="product_badge">
                                <span>Hot</span>
                            </div>

                            <!-- Wishlist -->
                            <div class="product_wishlist">
                                <a href="wishlist.html"><i class="icofont-heart"></i></a>
                            </div>

                            <!-- Compare -->
                            <div class="product_compare">
                                <a href="compare.html"><i class="icofont-exchange"></i></a>
                            </div>
                        </div>

                        <!-- Product Description -->
                        <div class="product_description">
                            <!-- Add to cart -->
                            <div class="product_add_to_cart">
                                <a href="#"><i class="icofont-cart"></i> Add to Cart</a>
                            </div>

                            <!-- Quick View -->
                            <div class="product_quick_view">
                                <a href="#" data-toggle="modal" data-target="#quickview"><i class="icofont-eye-alt"></i> Quick View</a>
                            </div>

                            <a href="#">짭쪼름한 스팸</a>
                            <h6 class="product-price">50000원</h6>
                        </div>
                    </div>
                </div>

                <!-- Single Product -->
                <div class="col-9 col-sm-6 col-md-4 col-lg-3">
                    <div class="single-product-area mb-30">
                        <div class="product_image">
                            <!-- Product Image -->
                            <img class="normal_img" src="https://dnvefa72aowie.cloudfront.net/origin/article/202210/32951CDDBA366994F0912D781CA3E876B65DED7932A66AACA4BE45F0AD8CC703.jpg?q=95&s=1440x1440&t=inside" alt="" style="width:250px; height:250px;">

                            <!-- Product Badge -->
                            <div class="product_badge">
                                <span>Sale</span>
                            </div>

                            <!-- Wishlist -->
                            <div class="product_wishlist">
                                <a href="wishlist.html"><i class="icofont-heart"></i></a>
                            </div>

                            <!-- Compare -->
                            <div class="product_compare">
                                <a href="compare.html"><i class="icofont-exchange"></i></a>
                            </div>
                        </div>

                        <!-- Product Description -->
                        <div class="product_description">
                            <!-- Add to cart -->
                            <div class="product_add_to_cart">
                                <a href="#"><i class="icofont-cart"></i> Add to Cart</a>
                            </div>

                            <!-- Quick View -->
                            <div class="product_quick_view">
                                <a href="#" data-toggle="modal" data-target="#quickview"><i class="icofont-eye-alt"></i> Quick View</a>
                            </div>

                            <a href="#">유아용 의자</a>
                            <h6 class="product-price">10000원</h6>
                        </div>
                    </div>
                </div>

                <!-- Single Product -->
                <div class="col-9 col-sm-6 col-md-4 col-lg-3">
                    <div class="single-product-area mb-30">
                        <div class="product_image">
                            <!-- Product Image -->
                            <img class="normal_img" src="https://dnvefa72aowie.cloudfront.net/origin/article/202210/EEAB35A1D3FCEE10A7BDF42B9EFE17F719BA690775E58E9CB3FD471E18E0305D.jpg?q=95&s=1440x1440&t=inside	" alt="" style="width:250px; height:250px;">

                            <!-- Product Badge -->
                            <div class="product_badge">
                                <span>Hot</span>
                            </div>

                            <!-- Wishlist -->
                            <div class="product_wishlist">
                                <a href="wishlist.html"><i class="icofont-heart"></i></a>
                            </div>

                            <!-- Compare -->
                            <div class="product_compare">
                                <a href="compare.html"><i class="icofont-exchange"></i></a>
                            </div>
                        </div>

                        <!-- Product Description -->
                        <div class="product_description">
                            <!-- Add to cart -->
                            <div class="product_add_to_cart">
                                <a href="#"><i class="icofont-cart"></i> Add to Cart</a>
                            </div>

                            <!-- Quick View -->
                            <div class="product_quick_view">
                                <a href="#" data-toggle="modal" data-target="#quickview"><i class="icofont-eye-alt"></i> Quick View</a>
                            </div>

                            <a href="#">고화질 TV</a>
                            <h6 class="product-price">200000원</h6>
                        </div>
                    </div>
                </div>

                <!-- Single Product -->
                <div class="col-9 col-sm-6 col-md-4 col-lg-3">
                    <div class="single-product-area mb-30">
                        <div class="product_image">
                            <!-- Product Image -->
                            <img class="normal_img" src="https://dnvefa72aowie.cloudfront.net/origin/article/202210/0b9e32b9f93deb86ebc99e98b6c25f71df040b4f622319a71f6175b3f8cabeed.webp?q=95&s=1440x1440&t=inside	" alt="" style="width:250px; height:250px;">

                            <!-- Product Badge -->
                            <div class="product_badge">
                                <span>Hot</span>
                            </div>

                            <!-- Wishlist -->
                            <div class="product_wishlist">
                                <a href="wishlist.html"><i class="icofont-heart"></i></a>
                            </div>

                            <!-- Compare -->
                            <div class="product_compare">
                                <a href="compare.html"><i class="icofont-exchange"></i></a>
                            </div>
                        </div>

                        <!-- Product Description -->
                        <div class="product_description">
                            <!-- Add to cart -->
                            <div class="product_add_to_cart">
                                <a href="#"><i class="icofont-cart"></i> Add to Cart</a>
                            </div>

                            <!-- Quick View -->
                            <div class="product_quick_view">
                                <a href="#" data-toggle="modal" data-target="#quickview"><i class="icofont-eye-alt"></i> Quick View</a>
                            </div>

                            <a href="#">공기청정기</a>
                            <h6 class="product-price">5000원</span></h6>
                        </div>
                    </div>
                </div>

                <!-- Single Product -->
                <div class="col-9 col-sm-6 col-md-4 col-lg-3">
                    <div class="single-product-area mb-30">
                        <div class="product_image">
                            <!-- Product Image -->
                            <img class="normal_img" src="https://dnvefa72aowie.cloudfront.net/origin/article/202210/3ec753adf35060dbe15bcb45a77447e424c90c54cb4d243615e51ad363a3ef03.webp?q=95&s=1440x1440&t=inside	" alt="" style="width:250px; height:250px;">

                            <!-- Product Badge -->
                            <div class="product_badge">
                                <span>Hot</span>
                            </div>

                            <!-- Wishlist -->
                            <div class="product_wishlist">
                                <a href="wishlist.html"><i class="icofont-heart"></i></a>
                            </div>

                            <!-- Compare -->
                            <div class="product_compare">
                                <a href="compare.html"><i class="icofont-exchange"></i></a>
                            </div>
                        </div>

                        <!-- Product Description -->
                        <div class="product_description">
                            <!-- Add to cart -->
                            <div class="product_add_to_cart">
                                <a href="#"><i class="icofont-cart"></i> Add to Cart</a>
                            </div>

                            <!-- Quick View -->
                            <div class="product_quick_view">
                                <a href="#" data-toggle="modal" data-target="#quickview"><i class="icofont-eye-alt"></i> Quick View</a>
                            </div>

                            <a href="#">만능 공구세트</a>
                            <h6 class="product-price">10000원</h6>
                        </div>
                    </div>
                </div>

                <!-- Single Product -->
                <div class="col-9 col-sm-6 col-md-4 col-lg-3">
                    <div class="single-product-area mb-30">
                        <div class="product_image">
                            <!-- Product Image -->
                            <img class="normal_img" src="https://dnvefa72aowie.cloudfront.net/origin/article/202210/0c91ef5192b2680c69edd11945116c3c1af12c13b854428c73ada5c5233995de.webp?q=95&s=1440x1440&t=inside	"alt="" style="width:250px; height:250px;">

                            <!-- Product Badge -->
                            <div class="product_badge">
                                <span>Hot</span>
                            </div>

                            <!-- Wishlist -->
                            <div class="product_wishlist">
                                <a href="wishlist.html"><i class="icofont-heart"></i></a>
                            </div>

                            <!-- Compare -->
                            <div class="product_compare">
                                <a href="compare.html"><i class="icofont-exchange"></i></a>
                            </div>
                        </div>

                        <!-- Product Description -->
                        <div class="product_description">
                            <!-- Add to cart -->
                            <div class="product_add_to_cart">
                                <a href="#"><i class="icofont-cart"></i> Add to Cart</a>
                            </div>

                            <!-- Quick View -->
                            <div class="product_quick_view">
                                <a href="#" data-toggle="modal" data-target="#quickview"><i class="icofont-eye-alt"></i> Quick View</a>
                            </div>

                            <a href="#">내앵장고</a>
                            <h6 class="product-price">400000원</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- On Sale Products -->

    <!-- Special Featured Area -->
     
   
  <!-- Special Featured Area -->

    <!-- Footer Area -->
   		<!-- include_common_bottom.jsp start-->
		<jsp:include page="common/include_common_footer.jsp"/>
		<!-- include_common_bottom.jsp end-->
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.easing.min.js"></script>
    <script src="js/default/classy-nav.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/default/scrollup.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/jquery.countdown.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jarallax.min.js"></script>
    <script src="js/jarallax-video.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/default/active.js"></script>
    
    
    	<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
	<script type="text/javascript" src="js/user/UserHtmlContents.js"></script>
	<script type="text/javascript" src="js/common/CommonHtmlContents.js"></script>
	<script type="text/javascript" src="js/common/user_session_check.js"></script>
	
	 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>  

<style type="text/css">

@font-face {

  font-family: 'Noto'; 


  src: url("./css/font/NotoSansKR-Medium.otf"); /* 가는글씨체 웹폰트주소 지정*/
}
@font-face {

  font-family: 'Noto';

  src: url("./css/font/NotoSansKR-Bold.otf"); /* 굵은글씨체 웹폰트주소 지정*/
  font-weight: bold;

}
body{
 font-family: 'Noto',serif;
}




#toast-container > .toast {
    background-image: none !important;
}

 #toast-container > .toast:before {
    position: relative;
    font-family: FontAwesome;
    font-size: 24px;
    line-height: 18px;
    float: left;
    color: #FFF;
    padding-right: 0.5em;
    margin: auto 0.5em auto -1.5em;
}       
    #toast-container > .toast-warning:before {
     content: "\f27a"; 
 
} 

 #toast-container > .toast-success:before {
     content: "\f2b5"; 
 
} 



</body>

</html>