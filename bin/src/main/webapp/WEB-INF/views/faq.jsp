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
    <title>자주 하는 질문</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Style CSS -->
    <link rel="stylesheet" href="style.css">
    
  
    
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
  	<jsp:include page="common/include_common_header.jsp"/>

    <!-- Breadcumb Area -->
    <div class="breadcumb_area">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <h5>자주 하는 질문</h5>
                    <ol class="breadcrumb">
                        <!-- <li class="breadcrumb-item"><a href="index.html">Home</a></li> -->
                        <li class="breadcrumb-item active">사용자들이 자주 묻는 질문을 확인해보세요.</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <!-- Shortcodes Area -->
    <div class="shortcodes_area section_padding_100">
        <div class="container">
            <!-- Shortcodes Content -->
            <div class="row">
                <div class="col-12">
                    <!-- Shortcodes Title -->
                    <div class="shortcodes_title mb-30">
                        <h5>구매/판매</h5>
                    </div>

                    <!-- +++++++++++++++++++++++
                    Bigshop Accordian With Icon
                    +++++++++++++++++++++++ -->
                    <div class="shortcodes_content mb-100">
                        <div class="accordion bigshop-accordian-with-icon" id="bigshopAccordianIcon">
                            <div class="card">
                                <div class="card-header" id="bigshopWithIconAccordian1">
                                    <button class="btn" type="button" data-toggle="collapse" data-target="#bswicollapseOne" aria-expanded="true" aria-controls="bswicollapseOne">
                                        <i class="icofont-rounded-up"></i><i class="icofont-rounded-down"></i> 당근마켓에서 믿고 거래하세요 <i class="fa fa-handshake-o"></i>
                                    </button>
                                </div>

                                <div id="bswicollapseOne" class="collapse show" aria-labelledby="bigshopWithIconAccordian1" data-parent="#bigshopAccordianIcon">
                                    <div class="card-body">
                                        <p class="mb-0">   <div style="font-weight:900;"><i class="fa fa-home"></i> 동네인증한 사용자만 거래해요</div> <br> 우리 동네에서 거래하려면 동네 인증이 필요해요. 동네인증은 해당 동네에 있어야만 할 수 있어요.<br> GPS로 우리 동네를 인증한 당신 근처의 이웃들과 거래하세요.</p>
                                        <br>
                                        <p class="mb-0">   <div style="font-weight:900;"><i class="fa fa-commenting-o"></i> 1:1 당근채팅으로 대화해요</div> <br> 흙당근마켓 내의 채팅을 통해 거래하는 게 가장 안전해요. 당근채팅에서는 메세지 전송뿐만 아니라 사진도 주고 받고, 약속을 잡을 수도 있어요.</p>
                                   		 <br>
                                        <p class="mb-0">   <div style="font-weight:900;"><i class="fa fa-map-pin"></i> 당신 근처에서 만나요</div> <br> 중고거래 사기의 대부분은 택배거래에서 발생한다는 사실, 알고 계셨나요? 근처 이웃들과 사고 파는 흙당근마켓에서는 직거래를 권장하고 있어요. 직거래할 때는 누구나 찾기 쉽고 안전한 공공장소가 좋아요. 이웃과 따뜻하게 거래하세요.</p>
                                        <br>
                                        <p class="mb-0">   <div style="font-weight:900;"><i class="fa fa-thermometer"></i> 매너온도를 확인하세요</div> <br> 거래하기 전 매너온도를 확인하세요. 온도는 36.5도에서 시작해서 99도까지 올라갈 수 있어요. 신뢰할 수 있는 이웃은 매너온도도 높답니다.</p>
                                   
                                   
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="bigshopWithIconAccordian2">
                                    <button class="btn collapsed" type="button" data-toggle="collapse" data-target="#bswicollapseTwo" aria-expanded="false" aria-controls="bswicollapseTwo">
                                        <i class="icofont-rounded-up"></i><i class="icofont-rounded-down"></i> 어떻게 판매하나요? (판매 방법)
                                    </button>
                                </div>
                                <div id="bswicollapseTwo" class="collapse" aria-labelledby="bigshopWithIconAccordian2" data-parent="#bigshopAccordianIcon">
                                    <div class="card-body">
                                        <p class="mb-0">[홈 화면의 > 동네 상품] 에서 [내 물건 팔기]를 클릭하고 판매글을 자유롭게 작성해주시면 돼요.<br><br>물건의 이름을 포함한 제목, 가격, 종류와 설명을 작성해보세요. 원하는 경우 사진도 여러 장 첨부할 수 있어요! <br>작성 버튼을 누르면 작성자의 동네 정보를 기반으로 같은 동네에 있는 이웃들에게 게시글이 보여져요.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="bigshopWithIconAccordian3">
                                    <button class="btn collapsed" type="button" data-toggle="collapse" data-target="#bswicollapseThree" aria-expanded="false" aria-controls="bswicollapseThree">
                                        <i class="icofont-rounded-up"></i><i class="icofont-rounded-down"></i> 어떻게 구매하나요? (구매 방법)
                                    </button>
                                </div>
                                <div id="bswicollapseThree" class="collapse" aria-labelledby="bigshopWithIconAccordian3" data-parent="#bigshopAccordianIcon">
                                    <div class="card-body">
                                        <p class="mb-0">흙당근마켓에서 사고 싶은 물건을 발견했나요? 구매하는 방법은 간단해요!<br><br> 게시글 하단 [채팅으로 거래하기] 버튼을 눌러보세요. 판매자와 채팅을 할 수 있어요. 구매 전에 궁금한 것이 있다면 직접 물어볼 수도 있어요.
                                        <br>거래 방법은 크게 두 가지가 있어요. <br><br> 첫 번째, 직거래 <br> 직거래할 경우 거래 약속 시간과 장소를 정해야 해요. 채팅방에서 [약속하기] 기능을 통해 시간과 장소를 정해보세요! 약속 시간 1시간 전에 판매자와 사용자에게 알림을 보내주고 있어요.
                                        <br> 직접 만나 물건을 확인한 뒤 거래가 성사되면 현금을 전달하거나, 계좌이체 해주시면 돼요.<br> 채팅방의 [당근페이]를 이용하면 상대방에게 보다 편리하게 송금할 수 있어요.
                                        <br><br>두 번째, 택배 거래 <br> 택배 거래할 경우 보통 입금이 먼저 진행돼요. 입금이 확인되면 판매자가 택배를 보낼 거예요. <br> 다만 택배 거래의 경우 중고거래 특성상 사기 피해가 발생할 수 있으니 유의해주세요. </p>
                                    </div>
                                </div>
                            </div>
                             <div class="card">
                                <div class="card-header" id="bigshopWithIconAccordian2">
                                    <button class="btn collapsed" type="button" data-toggle="collapse" data-target="#bswicollapseTwo" aria-expanded="false" aria-controls="bswicollapseTwo">
                                        <i class="icofont-rounded-up"></i><i class="icofont-rounded-down"></i> 거래 약속 시간 전에 알림을 받고 싶어요
                                    </button>
                                </div>
                                <div id="bswicollapseTwo" class="collapse" aria-labelledby="bigshopWithIconAccordian2" data-parent="#bigshopAccordianIcon">
                                    <div class="card-body">
                                        <p class="mb-0">거래 약속을 잘 지킬 수 있게 도와주는 거래 약속 알림 기능을 이용해보세요! <br>거래 약속 시간이 다가오면 약속 시간 1시간 전에 알림을 받을 수 있어요. <br><br>- 채팅방 위 [악수] 아이콘을 눌러 약속 시간을 설정해주세요.<br><br>우리 모두 거래 약속을 잘 지키는 따뜻한 이웃이 되어요!</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- +++++++++++++++++++++++
                    Bigshop Accordian With Icon
                    +++++++++++++++++++++++ -->
                    
                      <!-- Shortcodes Area -->
    <div class="shortcodes_area section_padding_100">
        <div class="container">
            <!-- Shortcodes Content -->
            <div class="row">
                <div class="col-12">
                    <!-- Shortcodes Title -->
                    <div class="shortcodes_title mb-30">
                        <h5>동네생활</h5>
                    </div>

                    <!-- +++++++++++++++++++++++
                    Bigshop Accordian With Icon
                    +++++++++++++++++++++++ -->
                    <div class="shortcodes_content mb-100">
                        <div class="accordion bigshop-accordian-with-icon" id="bigshopAccordianIcon">
                            <div class="card">
                                <div class="card-header" id="bigshopWithIconAccordian1">
                                    <button class="btn" type="button" data-toggle="collapse" data-target="#bswicollapseOne" aria-expanded="true" aria-controls="bswicollapseOne">
                                        <i class="icofont-rounded-up"></i><i class="icofont-rounded-down"></i> 동네생활 가이드라인
                                    </button>
                                </div>

                                <div id="bswicollapseOne" class="collapse show" aria-labelledby="bigshopWithIconAccordian1" data-parent="#bigshopAccordianIcon">
                                    <div class="card-body">
                                        <p class="mb-0">   <div style="font-weight:900;">다양성을 존중하고 배려해요</div>
                                        <br>• 호칭은<i class="fa fa-circle-o"></i><i class="fa fa-circle-o"></i>님으로 불러요. 나이와 상관없이 서로 존중하고 존댓말로 대화해요.<br>
                                        <br>• 관심사를 중심으로 이야기해요. 개인 정보나 사생활에 대해 지나치게 묻지 않아요.  <br>
                                        <br>• 서로의 다양한 가치관과 생각에 대해 공감하고 배려해요.<br>
                                        <br>• 청소년을 포함하여 다양한 이웃이 자유롭게 이용하는 공간임을 기억해주세요.<br>
                                        <br>• 댓글이나 그룹채팅에서 대화해요. 개인채팅은 서로 원할 때, 서로를 존중하며 시작해요.</p>
                                        <br>
                                        <p class="mb-0">   <div style="font-weight:900;">처음 방문한 이웃도 참여할 수 있는 대화를 해요.</div>
                                        <br>• 친분을 과시하는 행동은 안돼요. <br>
                                        <br>• 특정 누군가를 언급하면서 게시글을 작성하고 대화를 시작하면 안돼요.<br>
                                        <br>• 댓글에서 소통할 때, 게시글 내용에 대해서만 이야기해요.<br></p>
                                   		<br>
                                   		<p class="mb-0">   <div style="font-weight:900;">건강하고 따뜻한 같이해요 문화를 함께 만들어요.</div>
                                        <br>• 누구나 찾기 쉽고 안전한 공공장소에서 모여요.<br>
                                        <br>• 3명 이상의 이웃이 동네에서 함께 해요.<br>
                                        <br>• 당근채팅으로 대화하는 것이 가장 안전해요.<br></p>
                                        <br>
                                        <p class="mb-0">   <div style="font-weight:900;">코로나 추가 확산을 막기 위한 생활 수칙을 실천해요.</div>
                                        <br>• 마스크는 모임 내내 꼭 착용해요. <br>
                                        <br>• 아프면 약속을 취소하고 집에서 쉬어요.<br>
                                        <br>• 실외 모임이나 온라인 모임을 활용해요..<br></p>
                                        <br>
                                        <p class="mb-0">   <div style="font-weight:900;">친절하게 정보를 공유해요.</div>
                                        <br>• 동네 소식이나 정보를 서로 공유해요.<br>
                                        <br>• 동네 가게부터 산책길까지 사소한 정보도 이웃에게는 큰 도움이 돼요.<br>
                                        <br>• 친절하게 답변해준 이웃에게는 감사의 말을 전해요.<br></p>
                                        <br>
                                        <p class="mb-0">   <div style="font-weight:900;">동네 커뮤니티에 어울리는 글을 작성해요.</div>
                                        <br>• 관심주제 혹은 동네와 관련된 이야기를 해요.<br>
                                        <br>• 개인적인 이야기를 반복적으로 올리시는 건 지양해요.<br>
                                        <br>• 초상권은 소중해요. 자신의 얼굴을 담은 사진이나, 초상권 침해 우려가 있는 사진은 제외하고 올려요.<br></p>
                                       
                                   
                                   
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="bigshopWithIconAccordian2">
                                    <button class="btn collapsed" type="button" data-toggle="collapse" data-target="#bswicollapseTwo" aria-expanded="false" aria-controls="bswicollapseTwo">
                                        <i class="icofont-rounded-up"></i><i class="icofont-rounded-down"></i> 안전한 동네생활을 위해 함께해주세요
                                    </button>
                                </div>
                                <div id="bswicollapseTwo" class="collapse" aria-labelledby="bigshopWithIconAccordian2" data-parent="#bigshopAccordianIcon">
                                    <div class="card-body">
                                        <p class="mb-0">흙당근마켓은 모든 사용자의 개인정보를 보호하려 노력해요. 
                                        				<br>이때 <b>모든 사용자는 게시글 작성자의 정보도 포함되어 있어요.</b>
                                        				<br>따라서 타인 혹은 나의 개인정보가 첨부될 경우 게시글이 미노출처리 될 수 있어요.
														<br><br>
														번거로우시겠지만 타인의 얼굴 및 개인정보를 꼼꼼하게 가린 후 게시글을 작성해주시길 부탁드려요.
														<br>얼굴(셀카 등)이 촬영된 사진이 게시되지 않도록 한 번 더 확인해주세요.
														<br>흙당근마켓도 온 힘을 다해 모든 이웃의 개인정보를 지키기 위해 노력할게요.
														<br><br>
														특히, 카드/신분증 분실물을 발견하셨을 때는 번거로우시겠지만 노출되지 않아야 하는 면은 사진을 잘라서 올려주시기를 부탁드려요.
														카드사에 연락하여 분실물 접수를 할 경우, 가장 안전하고 빠르게 전달될 수 있어요.
														<br><br>
														만일, 오신고를 받으셨다면 번거로우시겠지만, 고객센터 문의하기로 문의 남겨주시길 바랍니다.
														<br>빠르게 확인하여 조치 취하도록 할게요.</p>
                                       
 
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="bigshopWithIconAccordian3">
                                    <button class="btn collapsed" type="button" data-toggle="collapse" data-target="#bswicollapseThree" aria-expanded="false" aria-controls="bswicollapseThree">
                                        <i class="icofont-rounded-up"></i><i class="icofont-rounded-down"></i>금전이나 물품을 요구하는 내용은 지양해주세요
                                    </button>
                                </div>
                                <div id="bswicollapseThree" class="collapse" aria-labelledby="bigshopWithIconAccordian3" data-parent="#bigshopAccordianIcon">
                                    <div class="card-body">
                                        <p class="mb-0">중고거래, 동네생활 모두 포함해서 흙당근마켓에서는 <b>금전이나 물품, 헌혈증</b>을 무료로 요구하는 내용은 작성
                                        				할 수 없어요. 이웃의 간단한 도움이 아닌, 전문적인 도움을 무료로 요구하거나 재능 기부를 요구하는 게시글도 작성할 수 없어요.
                                        				<br><br>
                                        				작성하기 어려운 게시글 예시는 다음과 같아요.<br>
                                        				<br>• 헌혈증 주실 분 구해요<br>
                                        				<br>• 영어 회화 재능기부 해주실 분 구해요<br>
                                        				<br>• 안쓰면 저한테 버려주실 분, 기부해주실 분 구해요<br>
                                       					<br>• 조금만 소분해서 나눠주실 분 구해요<br><br>
                                       					
                                       					만일 물품 거래가 필요한 상황이라면, 중고거래 게시판을 이용해보시면 어떨까요?<br>
														거래할 수 있도록 흙당근마켓은 중고거래 게시판 서비스를 제공하고 있어요.
</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- +++++++++++++++++++++++
                    Bigshop Accordian With Icon
                    +++++++++++++++++++++++ -->
                    
                      <!-- Shortcodes Area -->
    <div class="shortcodes_area section_padding_100">
        <div class="container">
            <!-- Shortcodes Content -->
            <div class="row">
                <div class="col-12">
                    <!-- Shortcodes Title -->
                    <div class="shortcodes_title mb-30">
                        <h5>흙당근페이</h5>
                    </div>

                    <!-- +++++++++++++++++++++++
                    Bigshop Accordian With Icon
                    +++++++++++++++++++++++ -->
                    <div class="shortcodes_content mb-100">
                        <div class="accordion bigshop-accordian-with-icon" id="bigshopAccordianIcon">
                            <div class="card">
                                <div class="card-header" id="bigshopWithIconAccordian1">
                                    <button class="btn" type="button" data-toggle="collapse" data-target="#bswicollapseOne" aria-expanded="true" aria-controls="bswicollapseOne">
                                        <i class="icofont-rounded-up"></i><i class="icofont-rounded-down"></i>흙당근하는 새로운 방법을 소개해요
                                    </button>
                                </div>

                                <div id="bswicollapseOne" class="collapse show" aria-labelledby="bigshopWithIconAccordian1" data-parent="#bigshopAccordianIcon">
                                    <div class="card-body">
										<p class="mb-0"><div style="font-weight:900;">흙당근하는 새로운 방법, 흙당근페이</div>
                                        <br>중고거래는 이제 흙당근페이로 해보세요.<br>
                                       </p>
                                       <br>
                                       <p class="mb-0"><div style="font-weight:900;">채팅방에서 바로 송금</div>
                                        <br>채팅창 상단 송금하기 버튼을 눌러 중고거래중인 이웃에게 바로 송금해요.<br>
                                       </p>
                                       <br>
                                    	<p class="mb-0"><div style="font-weight:900;">이웃송금</div>
                                        <br>이제는 현금 챙길 필요가 없어요.<br>
                                        <br>중고래중인 이웃과 간편하고 빠르게 송금해요.<br>
                                       </p>
                                   
                                   
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="bigshopWithIconAccordian2">
                                    <button class="btn collapsed" type="button" data-toggle="collapse" data-target="#bswicollapseTwo" aria-expanded="false" aria-controls="bswicollapseTwo">
                                        <i class="icofont-rounded-up"></i><i class="icofont-rounded-down"></i> 송금 수수료는 얼마인가요?
                                    </button>
                                </div>
                                <div id="bswicollapseTwo" class="collapse" aria-labelledby="bigshopWithIconAccordian2" data-parent="#bigshopAccordianIcon">
                                    <div class="card-body">
                                    
                                    <p class="mb-0"> 중고거래 송금 시 별도 수수료는 발생하지 않아요.
                                        				<br><br>
                                        				당근페이에 있는 잔액을 내 계좌로 보낼 때도 별도 수수료는 발생하지 않아요. (당근페이에 연결되어 있는 본인명의 은행 계좌로만 출금할 수 있어요.)<br>
                                        				<br>• 헌혈증 주실 분 구해요<br>
                                        				<br>• 이웃송금: 무료<br>
                                        				<br>• 당근페이에 출금이체 동의된 내 계좌로 송금: 무료<br>
                                       					<br>• 계좌송금: 월 5회 무료, 이후 건당 500원 (정책 적용일 : 22.09.08)<br><br>
                                       					
                                       					만일 물품 거래가 필요한 상황이라면, 중고거래 게시판을 이용해보시면 어떨까요?<br>
														거래할 수 있도록 흙당근마켓은 중고거래 게시판 서비스를 제공하고 있어요.
</p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- +++++++++++++++++++++++
                    Bigshop Accordian With Icon
                    +++++++++++++++++++++++ -->

                </div>
            </div>
        </div>
    </div>
    <div class="shortcodes_area section_padding_100">
        <div class="container">
            <!-- Shortcodes Content -->
            <div class="row">
                <div class="col-12">
                    <!-- Shortcodes Title -->
                    <div class="shortcodes_title mb-30">
                        <h5>거래 품목</h5>
                    </div>

                    <!-- +++++++++++++++++++++++
                    Bigshop Accordian With Icon
                    +++++++++++++++++++++++ -->
                    <div class="shortcodes_content mb-100">
                        <div class="accordion bigshop-accordian-with-icon" id="bigshopAccordianIcon">
                            <div class="card">
                                <div class="card-header" id="bigshopWithIconAccordian1">
                                    <button class="btn" type="button" data-toggle="collapse" data-target="#bswicollapseOne" aria-expanded="true" aria-controls="bswicollapseOne">
                                        <i class="icofont-rounded-up"></i><i class="icofont-rounded-down"></i>판매 금지 물품
                                    </button>
                                </div>

                                <div id="bswicollapseOne" class="collapse show" aria-labelledby="bigshopWithIconAccordian1" data-parent="#bigshopAccordianIcon">
                                    <div class="card-body">
										<p class="mb-0"><div style="font-weight:900;">흙당근마켓 판매 금지 물품</div>
                                       	<br>• 가품∙이미테이션 (상표권, 저작권 침해 물품, 특정 브랜드의 스타일을 모방한 물품)<br>
                                       	<br>• 주류(무알콜 주류 포함), 담배, 전자담배, 모의총포 및 그 부속품 일체 (ex. 라이터, 비비탄 총알 등 청소년 유해물건)<br>
                                       	<br>• 경유, LPG, 휘발유 등의 유류 거래<br>
                                       	<br>• 반려동물, 생명이 있는 동물·곤충 (무료분양, 열대어 포함)<br>
                                       	<br>• 한약∙의약품 ∙ 의료기기∙마약류 (청소년 유해약물∙유해화학물질)<br>
                                       	<br>• 반영구 화장 등 면허나 자격 없는 자의 불법 유사 의료 행위 홍보/모집글<br>
                                       	<br>• 수제 음식물∙건강기능식품 : 직접 만들거나 가공한 음식, 건강기능식품(지자체 및 영업 신고를 한 사람만 판매할 수 있음) <br>
                                       	<br>• 유통기한이 지난 제품, 포장이 훼손되거나 개봉된 식품<br>
                                       	<br>• 도수 있는 안경∙선글라스 (온라인 판매 불법)<br>
                                       	<br>• 콘택트 렌즈, 써클 렌즈 (온라인 판매 불법)<br>
                                       	<br>• 반복/다량 판매하는 핸드메이드 제품<br>
                                       	<br>• 화장품 샘플 (온라인 판매 불법)<br>
                                       	<br>• 화장품제조업 및 화장품책임판매업의 등록 없이 직접 제조한 화장품<br>
                                       	<br>• 완제품이 아닌 직접 소분한 화장품<br>
                                       	<br>• 화장품법에 따른 라벨 및 기재사항이 없는 화장품<br>
                                       	<br>• 음란물 (청소년 유해 매체물)<br>
                                       	<br>• 촬영 여부를 상대방이 알기 어려운 카메라 혹은 그밖에 유사한 기능을 갖춘 기계장치(불법 카메라 등)<br>
                                       	<br>• 성생활용품<br>
                                       	<br>• 개인정보 (게임 계정, 추천인 계정 포함)<br>
                                       	<br>• 조건부 무료나눔<br>
                                       	<br>• 렌탈 제품<br>
                                       	<br>• 헌혈증 (무료나눔만 가능)<br>
                                       	<br>• 초대권 (무료로 받은 초대권을 유료로 판매하는 경우 / 무료나눔만 가능)<br>
                                       	<br>• 군용품∙군마트용품∙경찰용품∙도검∙화약류∙분사기∙전자충격기∙석궁∙활 (안전확인∙안전인증표시 없는 전기용품 및 단전지 또는 공산품)<br>
                                       	<br>• USD 1000달러 이상의 외환 거래나 매매차익을 목적으로 하는 반복적인 외환 거래 (매매차익을 목적으로 하지 않는 1000달러 미만의 외환 거래는 허용) <br>
                                       	<br>• 나라미, 정부 지원 생필품, 지역상품권, 문화누리카드 등 법률에 의해 재판매 할 수 없는 물품<br>
                                       	<br>• 종량제봉투<br>
                                       	<br>• 통신사 데이터, 인터넷 상품<br>
                                       	<br>• 반입한 날로부터 1년 이상 경과하지 않은 전파인증이 면제된 해외직구 전자제품을 판매하는 행위<br>
                                       	<br>• 스스로 사용할 목적으로 세금을 면제받은 해외직구 물품을 국내에서 재판매 하는 행위<br>
                                       	<br>• 낚시로 포획한 수산물 거래 행위<br>
                                       	<br>• 암표매매 행위<br>
                                       	<br>• 종자 (삽수,어린묘목 등)<br>
                                       	<br>• 국가기관 인증을 받지 않고 친환경, 무농약, 유기농, 오가닉, 무공해 라는 표현을 사용하여 판매하는 행위<br>
                                       	<br>• 100만 원 이상 금 제품 (골드바, 금괴, 금으로 제작된 목걸이, 팔찌, 귀걸이 등)<br>
                                       	<br>• 리콜로 인한 회수/폐기 물품<br>
                                       	<br>• 이외 법률을 위반하는 모든 물품<br>
                                       	<br>• 당근마켓 광고주센터에 등록되지 않은 모든 홍보/광고<br>
                                       	<br><br>
                                       	당근마켓은 현행법령상 판매가 허용되지 않는 불법상품 및 유해 상품을 판매하는 것은 제한하고 있어요.<br> 
                                       	판매 자격을 갖췄더라도 개인 간 거래를 지향하는 당근마켓에서는 해당 물품을 판매할 수 없어요.<br>
                                       	현행법을 위반할 경우 처벌 받을 수 있습니다. 이 점 유의해주시길 바랍니다.
                                     </p>
                                       
                                   
                                   
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="bigshopWithIconAccordian2">
                                    <button class="btn collapsed" type="button" data-toggle="collapse" data-target="#bswicollapseTwo" aria-expanded="false" aria-controls="bswicollapseTwo">
                                        <i class="icofont-rounded-up"></i><i class="icofont-rounded-down"></i> 코로나19 자가진단 키트는 판매할 수 없어요
                                    </button>
                                </div>
                                <div id="bswicollapseTwo" class="collapse" aria-labelledby="bigshopWithIconAccordian2" data-parent="#bigshopAccordianIcon">
                                    <div class="card-body">
                                        <p class="mb-0">코로나19 자가진단 키트는 의료제품, 의료기기로 <b>흙당근마켓에서 판매 및 무료나눔 할 수 없어요.</b><br>
                                      					  (사용 후 양성,음성 결과가 나온 자가검사키트, 신속 항원검사 키트 포함)<br><br>
                                      					  또한, 식품의약품안전처의 공중보건 위기대응 의료제품 온라인 유통개선조치 시행됨에 따라,<br>
                                      					  온라인에서 해당 제품을 판매할 경우, "공중보건 위기대응 의료제품의 개발 촉진 및 긴급 공급을 위한 특별법" 
                                      					  제33조 제1항 제2호에 따라 2년 이하 징역 또는 5천만원 이하의 벌금 등 불이익이 있을 수 있어요.<br><br>
                                      					  *<b>의약품, 의료기기는 판매 금지 품목</b>으로 당근마켓에서 판매할 수 없으며, 나눔, 교환, 삽니다 게시글 또한 허용되지 않습니다.
                                        
                                        
                                        
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="bigshopWithIconAccordian3">
                                    <button class="btn collapsed" type="button" data-toggle="collapse" data-target="#bswicollapseThree" aria-expanded="false" aria-controls="bswicollapseThree">
                                        <i class="icofont-rounded-up"></i><i class="icofont-rounded-down"></i> 형편없는 물건을 판매해요 
                                    </button>
                                </div>
                                <div id="bswicollapseThree" class="collapse" aria-labelledby="bigshopWithIconAccordian3" data-parent="#bigshopAccordianIcon">
                                    <div class="card-body">
                                        <p class="mb-0">흙당근마켓은 <b>판매 금지 물품</b> 이외의 물건에 대해서는 직접적으로 제재하지 않아요.<br><br>
                                        				하지만 사용할 수 없을 정도의 물건은 판매하지 않는 것이 좋아요. <br>
                                        				물건의 상태가 좋지 않다면 구매자로부터 환불 요구를 받을 가능성도 커져요.<br>
                                        				
                                        
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- +++++++++++++++++++++++
                    Bigshop Accordian With Icon
                    +++++++++++++++++++++++ -->

                </div>
            </div>
        </div>
    </div>
    <!-- Shortcodes Area End -->

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
    
      <!-- javaScript -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="js/user/UserHtmlContents.js"></script>
	<script type="text/javascript" src="js/common/CommonHtmlContents.js"></script>
	<script type="text/javascript" src="js/common/user_session_check.js"></script>
	
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>  
    
    <style type="text/css">
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