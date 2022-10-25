var num = null;
var loginName=null;
var loginId=getLoginId();
var yourId=null;
var mImage=null;
var socket=null;

var checkSeller=null;
var	yourImg = null;
var	yourFreshness = null;
var	product = null;
var	p_img = null;

var c_room_no=null;


var last_seen_time=null;

var c_app_lat=null;
var c_app_lng=null;

var promiseData=null;

var jsonData={
	code:null,
	url:null,
	msg:null,
	your_id:null, // 상대 아이디 
	data:null //chat_contents 
	
};



function getLoginId(){
		$.ajax({
		url:"get_id",
		method:"POST",
		
		dataType:'JSON',
		success:function(jsonResult){
			loginId=jsonResult.mId
			mImage=jsonResult.userImg;
			console.log("로그인 아이디 얻기:"+loginId);
			console.log("프로필 이미지 얻기:"+mImage);
		},
		error:function(xhr){
			console.log("error");
		}
		
	});
	return loginId;
}

//안읽은 채팅 수 가져오기 

function getChatNum(userId){
		
		$.ajax({
					url:'readChat_num',
					method:"POST",
					data:'user_id='+userId,
					dataType:'json',
					success:function(jsonResult){
						console.log("안읽은채팅:"+jsonResult.data);
						if(jsonResult.data=='0'){
							$(".cart_quantity").hide();
						}else{
							$(".cart_quantity").show();
				       $(".cart_quantity").text(jsonResult.data);
						}
					}
				})
}

// 상단 세션 체크 
function session_check(){
	/* login_check ***********************/
	$.ajax({
		url:'user_session_check_json',
		method:'POST',
		dataType:'json',
		success:function(jsonResult){
		    if(jsonResult.code==1){ //세션에 로그인 유저 존재XX
		    	$("#account-area").html(CommonHtmlContents.user_thumbnail());
		    	$("#chat-area a").attr("href", "user_login");
		    	$(".cart_quantity").remove();
		    	$("#brown_carrot_pay a").attr("href", "user_login");
		    	$("#transaction-dropdown a").attr("href", "user_login");
		    	
		    }else if (jsonResult.code==2) {//세션에 로그인 유저 존재
		    	$("#account-area").html(CommonHtmlContents.user_thumbnail_login(jsonResult.data[0]));
		    	connectServer(jsonResult.data[0].user_id);
		    	getChatNum(jsonResult.data[0].user_id);
			}
			}
			});
}
//채팅 페이지 열릴 때 


function connectServer(loginId){
	console.log("connectWS 실행 : "+loginId)
	var url="ws://119.207.178.242:80/brown_carrot_market/replyEcho?"+loginId;
	var ws=new WebSocket(url);
	socket=ws;
	
	ws.onopen = function() {
			console.log(loginId+'채팅대기창 서버 연결 성공');
		
	    };
	    
		ws.onmessage=function(result){

		
		var msg=JSON.parse(result.data);
		console.log(msg);
		var id=msg.toastId;
		var message=msg.c_content;
		
		if(message.startsWith("@@image!#")){
			message="사진 전송";
		}
		
		if(id==loginId){
			
		 reloadChatList();
	      
	      /******************채팅수증가******* */
	     getChatNum(loginId);
	
		
		}
		
		
		
	}    
	    }
	    
	    
	    
	    
	    

$(document).ready(function(){
		
	session_check();
	
	
		// 채팅방 접근 방식 확인
	 var  path=document.getElementById("path").value;
	 var newChatRoomNo=document.getElementById("newChatRoomNo").value;
	 var myId=document.getElementById("loginId").value;
	 console.log(newChatRoomNo)
	 console.log(path);
	 console.log(myId);
	

	
	
	message_send_function();
	
	
	 // 채팅방 접근 방식 확인 -- 너무 야매....
	 var  path=document.getElementById("path").value;
	 var newChatRoomNo=document.getElementById("newChatRoomNo").value;
	 var myId=document.getElementById("loginId").value;
	 console.log(newChatRoomNo)
	 console.log(path);
	 console.log(myId);
	 if(path==2){
			
			$('#chatHead').hide();
			$('#plist').hide();
			$('#chat_history').hide();			
	 if(socket!=null){
	socket.close();
	}

	

		

		
		var chat_detail={
			"c_room_no":newChatRoomNo,
			"loginId":myId
		}
		
$.ajax({
		
		
		url:"chat_detail_rest",
		method:"POST",
		//data:{"c_room_no":num},
		data: JSON.stringify(chat_detail),
		async: true,
        contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
        dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)    			
    			    			
	
		
		success:function(jsonResult){
			connectWS();
			
			var chatContentArray=jsonResult.data;
			yourId=jsonResult.yourId;
			yourImg = jsonResult.yourImg;
			yourFreshness = jsonResult.yourFreshness;
			product = jsonResult.product;
			p_img = jsonResult.p_img;
			console.log(product.p_sell);
			c_room_no=jsonResult.c_room_no;
			console.log("채팅방의 상대방 ID:"+yourId);
			console.log(chatContentArray);
			
			$('#chat_history').html("");
			$('#chatHead').html("");
			/***********숨기기**********/
			console.log("숨기기");

			console.log(loginId);

			$('#chatHead').append(chat_head(yourId,yourImg,c_room_no,yourFreshness,product,p_img));
			
			
			
			
			for(const item of chatContentArray){
		
				

				if(item.user_id!=loginId){
					if(item.user_id=="admin"){
						
					$('#chat_history').append(message_admin(item));
				}
					else if(item.user_id=="adminP"&&c_app_lat!=null){
						$('#chat_history').append( `<li class="clearfix">

                           <div class="message admin-message" margin:auto>${item.c_content}
                           <br>약속 장소 : <a href="javascript:void(popupMap(${promiseData.c_app_lat},${promiseData.c_app_lng}))" style="font-size:6px;",id="chat_spot_map">${promiseData.c_app_spot}</a></div>
                        </li>`);
						
					}else if(item.user_id=="adminP"){
						$('#chat_history').append( `<li class="clearfix">

                           <div class="message admin-message" margin:auto>${item.c_content}
                           <br>약속 장소 : <a style="font-size:6px;",id="chat_spot_map">약속이 취소되었습니다.</a></div>
                        </li>`);
					}
					
					else{
					console.log("상대가 보낸 메세지");
			$('#chat_history').append(message_other(item));
			}
				}else if(item.user_id==loginId){
					console.log("내가 보낸 메세지");
			$('#chat_history').append(message_you(item));
				}
			};

			$(function(){
				$("#chat").css({
				"margin-left": "0px",
 			   	"border-left": "none"
					
					
				});
				
			});
			$('#chatHead').show();
			$('#chat_history').show();
			
		}
	});
	
	}
	
//-------------------------------------------------------------------------------------------------------------------------------------------------	
	
	
    
	});
	
	

	


	
	
		
//채팅방 내용 불러오기		
$(document).on('click','[id^=btnCall]',function(e){
	
	if(socket!=null){
	socket.close();
	}

	num = this.id.substr(7);
		c_room_no=num;
	
			$.ajax({
		url:'promise_check',
		method:"POST",
		data:'c_room_no='+c_room_no,
		dataType:'JSON',
		success:function(jsonResult){
			//console.log("약속장소:"+spot)
			
			if(jsonResult.code=="1"){
			promiseData= jsonResult.data;
			c_app_lat=promiseData.c_app_lat;
			c_app_lng=promiseData.c_app_lng;
			}
			
			
			
			
		}
	});
	
		
	e.stopPropagation();
	e.preventDefault();
		
		var chat_detail={
			"c_room_no":num,
			"loginId":loginId
		}
$.ajax({
		
		
		url:"chat_detail_rest",
		method:"POST",
		//data:{"c_room_no":num},
		data: JSON.stringify(chat_detail),
		async: true,
        contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
        dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)    			
    			    			
	
		
		success:function(jsonResult){
			connectWS();
			var chatContentArray=jsonResult.data;
			yourId=jsonResult.yourId;
			yourImg = jsonResult.yourImg;
			yourFreshness = jsonResult.yourFreshness;
			product = jsonResult.product;
			p_img = jsonResult.p_img;
			/***************판매자************/
			checkSeller = jsonResult.checkSeller;
			console.log(product.p_sell);
			c_room_no=jsonResult.c_room_no;
			console.log("채팅방의 상대방 ID:"+yourId);
			console.log(chatContentArray);
			//$('#content').html('채팅 불러오기 성공');
			/***********숨기기**********/
			console.log("숨기기");
			$('#plist').hide();
			// 채팅방 확장 
			$(function(){
				$("#chat").css({
				"margin-left": "0px",
 			   	"border-left": "none"
					
					
				});
				
			});
			
			$('#chat_history').html("");
			$('#chatHead').html("");
			//loginId=$('#loginId').val();
			console.log(loginId);
			/*
			for(const item of chatContentArray){
				
				if(item.user_id!=loginId){
					var youId = item.user_id;
					break;
			
				}else{
				
					var youId = "error";
			
				}
			};*/
			$('#chatHead').append(chat_head(yourId,yourImg,c_room_no,yourFreshness,product,p_img,checkSeller));
			
			
			
			
			for(const item of chatContentArray){
		
				
			/*if(item.user_id=="admin"){
					$('#chat_history').append(message_admin(item));
				}
				*/
				if(item.user_id!=loginId){
					if(item.user_id=="admin"){
					$('#chat_history').append(message_admin(item));
				}
					else if(item.user_id=="adminP"&&c_app_lat!=null){
						$('#chat_history').append( `<li class="clearfix">

                           <div class="message admin-message" margin:auto>${item.c_content}
                           <br>약속 장소 : <a href="javascript:void(popupMap(${promiseData.c_app_lat},${promiseData.c_app_lng}))" style="font-size:6px;",id="chat_spot_map">${promiseData.c_app_spot}</a></div>
                        </li>`);
						
					}else if(item.user_id=="adminP"){
						$('#chat_history').append( `<li class="clearfix">

                           <div class="message admin-message" margin:auto>${item.c_content}
                           <br>약속 장소 : <a style="font-size:6px;",id="chat_spot_map">약속이 취소되었습니다.</a></div>
                        </li>`);
					}else{
					console.log("상대가 보낸 메세지");
			$('#chat_history').append(message_other(item));
			}
				}else if(item.user_id==loginId){
					console.log("내가 보낸 메세지");
			$('#chat_history').append(message_you(item));
				}
			};
			
			//$('.chat-history').scrollTop($('.chat-history').prop('scrollHeight'));
	
			//$('#chat-history').scrollTop($('#chat-history')[0].scrollHeight);
			console.log($('#chat-history').get(0).scrollHeight);
			console.log($('#chat-history').height());
			if($('#chat-history').get(0).scrollHeight>698){
    			// 세로 스크롤바가 있을 경우 처리
			$('#chat-history').css("display","flex");
			console.log("스크롤바 있음");
}else{
			$('#chat-history').css("display","block");
			console.log("스크롤바 없음");
	
}
			
			
			
			
			
		}
	});
	
	
	});
	



//스크롤
function scrollbarVisible(element) {
  return element.scrollHeight > element.clientHeight;
}




	//날짜 변환 
	function date_string(dateString){
		var dateConv = Date.parse(dateString);
	 var date = dayjs(Number(dateConv));
	  var nowDate1 = date.format("YYYY-MM-DD HH:mm:ss");
	  const nowDate=new Date(nowDate1);
	  
	  var year=nowDate.getFullYear();
	  var month=nowDate.getMonth();
	  var day=nowDate.getDate();
	  var hour=nowDate.getHours();
	  
	  var ampm="AM";
	  
	  if(hour>12){
		hour-=12;
		ampm="PM";
	}
	  var mm=nowDate.getMinutes();
	  var dayformat = "";
	  var dayString="";
	var today=new Date();
	
	if(year==today.getFullYear() && month==today.getMonth() && day==today.getDate()){
		dayString="오늘";
	}else if(year==today.getFullYear()){
		dayString=month+"월"+day+"일";
		
	}else{
		dayString=year+"년"+month+"월"+day+"일";
	}
	
	//$('#chat_history').append(`<h3>${dayString}</h3><br>`);
	
dayformat=hour+":"+mm+" "+ampm+","+" "+dayString;
	
	return dayformat;
		
	}







function message_other(chat_content){
	var chat_read="";
	if(chat_content.c_read==0){
		chat_read="";
	}else if(chat_content.c_read==1){
		chat_read=`<i class="fa fa-check"></i>`;
	}
	
	var chat_c=chat_content.c_content;
	if(chat_c.startsWith("@@image!#")){
		chat_img=chat_c.substr(9);
		chat_c=`<div><img src='img/chat_data/${chat_img}'
											alt="" style="width:300px; height:200px;" id="chat_img_sizeUp"+${chat_img} imgSrc='img/chat_data/${chat_img}' ><input type="hidden" value=${chat_img}></div>` ;
	}
	

	return `<li class="clearfix" >
									<div class="message-data">
										<span class="message-data-time">${date_string(chat_content.send_time)}</span>
									</div>
									<div class="message my-message">${chat_c}</div>
									<div class="chat_read_check" id=${chat_content.c_content_no}>${chat_read}</div>
								</li>`
}



function message_you(chat_content){
	var chat_read="";
	if(chat_content.c_read==0){
		chat_read="";
	}else if(chat_content.c_read==1){
		chat_read=`<i class="fa fa-check"></i>`;
	}
	
	var chat_c=chat_content.c_content;
	if(chat_c.startsWith("@@image!#")){
		chat_img=chat_c.substr(9);
		chat_c=`<div><img src='img/chat_data/${chat_img}'
											alt="" style="width:300px; height:200px;" id="chat_img_sizeUp"+${chat_img} imgSrc='img/chat_data/${chat_img}' ><input type="hidden" value=${chat_img}></div>` ;
	}
	return `<li class="clearfix" >
									<div class="message-data text-right">
										<span class="message-data-time">${date_string(chat_content.send_time)}</span>  <img src='img/user_profile/${mImage}'
											alt="">
									</div>
									<div class="message other-message float-right">${chat_c}</div>
									<div class="chat_read_check_right" id=${chat_content.c_content_no}>${chat_read}</div>
								</li>`
}
/***************** 공지 *************** */
function message_admin(chat_content){
	return `<li class="clearfix">

									<div class="message admin-message" margin:auto>${chat_content.c_content}</div>
								</li>`
}


//약속 잡기 html

function message_admin_promise_history(chat_content){
	$.ajax({
		url:'promise_check',
		method:"POST",
		data:'c_room_no='+c_room_no,
		dataType:'JSON',
		success:function(jsonResult){
			$('#chat_history').append( `<li class="clearfix">

									<div class="message admin-message" margin:auto>${chat_content.c_content}
									<br>현재 약속 장소 : <a href="javascript:void(popupMap(${jsonResult.data.c_app_lat},${jsonResult.data.c_app_lng}))" style="font-size:6px;",id="chat_spot_map",c_app_lat="${jsonResult.data.c_app_lat}",c_app_lng="${jsonResult.data.c_app_lng}">${jsonResult.data.c_app_spot}</a></div>
								</li>`);
			
			
		}
	});
	
}

function message_admin_promise(chat_content){
	
	return `<li class="clearfix">

									<div class="message admin-message" margin:auto>${chat_content.c_content}<br>현재 약속 장소 :
									<a href="javascript:void(popupMap(${chat_content.c_app_lat},${chat_content.c_app_lng}))" style="font-size:6px;" class="chat_spot_map" >${chat_content.c_appspot}</a></div>
								</li>`
}
//상단헤드
function chat_head(id,img,room_no,fresh,product,p_img,check){
	var a ="";
	var b ="";
var c ="";
	if(product.p_sell==1){
		p_sell="판매중";
			console.log('1.판매자id:'+product.userInfo.user_id);
			console.log('1.로그인id:'+loginId);
		if(check==1){
			console.log('세션 = 판매자 : '+loginId);
			a='<button class="dropdown-item" type="button" id="reserveBtn"><b>예약중으로 변경</b></button>';
			b='<button class="dropdown-item" type="button" id="soldOutBtn"><b>판매완료로 변경</b></button>';
			c=`<a href="#" class="btn btn-outline-info" style="display:none"><i class="fa fa-won" id="btnCarrot_Pay" p_no=${product.p_no} style="color:green"></i></a>`;
		}
	}else if(product.p_sell==2){
		p_sell="예약중";
		if(check==0){
			console.log('2.세션 = 구매자 : '+loginId);
			
			c=`<a href="#" class="btn btn-outline-info" style="border-color:green"><i class="fa fa-won" id="btnCarrot_Pay" p_no=${product.p_no} style="color:green"></i></a>`;
		}else if(check==1){	
			console.log('2.세션 = 판매자 : '+loginId);
			a='<button class="dropdown-item" type="button" id="sellBtn"><b>판매중으로 변경</b></button>';
			b='<button class="dropdown-item" type="button" id="soldOutBtn"><b>판매완료로 변경</b></button>';
			c=`<a href="#" class="btn btn-outline-info" style="display:none"><i class="fa fa-won" id="btnCarrot_Pay" p_no=${product.p_no} style="color:green"></i></a>`;
		}
		}else if(product.p_sell==3){
		p_sell="판매완료";
			console.log('3.판매자id:'+product.userInfo.user_id);
			console.log('3.로그인id:'+loginId);
			if(check==1){
				console.log('세션 = 판매자 : '+loginId);
				
				c=`<a href="#" class="btn btn-outline-info" style="border-color:green"><i class="fa fa-won" id="btnCarrot_Pay_Cancel" p_no=${product.p_no} style="color:green;"></i></a>`;
			}
		}
		if(p_img.startsWith('http')){
			p_img= p_img;
		}else{
			p_img= 'img/product_img/'+p_img;
		}
	
	return 	`<div class="row">
								<div class="col-lg-4">
									<a href="javascript:void(0);" data-toggle="modal"
										data-target="#view_info"> <img
										src="img/user_profile/${img}"
										alt="avatar" style="float:left;">
									</a>
									<div class="chat-about">
										<h6 class="m-b-0" style="margin-bottom:1px;font-weight: 700;">${id}</h6>
										<i class="fa fa-thermometer" style="
    														color: orange;
    															width: 15px;
																			"></i>
										<small>${fresh}</small>
									</div>
								</div>
								
								
							<div class="col-lg-4">
						 
    							<div style="text-align:center;">
    							<a href="product_detail?p_no=${product.p_no}";>
								<img src="${p_img}" style="border-radius: 5px; width:70px; "></a>
								<h6 class="m-b-0" style="margin-top:10px; margin-bottom:2px; font-size: 13px;"><b>${product.p_title}</b> <b><${p_sell}></b></h6>
								<small>${product.p_price}원</small> 
								<div>
								<small style="font-size: 70%; color: gray;"><i class="fa fa-location-arrow"></i> ${product.p_address_name}</small></div>
								 </div>	
								 </div>
								
								<div class="col-lg-4 hidden-sm text-right">
									
									${c} 
									
									<a  href="javascript:void(0);" class="btn btn-outline-info" id="btnChatAppointment"><i
										class="fa fa-handshake-o" ></i></a> 
											
									<a href="javascript:void(0);" class="btn btn-outline-primary" id="btnChatImage">
									<i class="fa fa-image"></i></a>
							<!-- 삭제 , 나가기 		
									<a href="javascript:void(0);" class="btn btn-outline-dark"
									id="deleteRoom">
									<i class="fa fa-sign-out"></i></a> 
								
									<a href="javascript:void(0);" class="btn btn-outline-danger"
									id="outRoom">
									<i class="fa fa-close" ></i></a>
							-->		
									<div class="btn-group">
  									<button type="button" class="btn" style="border-color:orange"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   									 <i class="fa fa-align-justify" style="color:orange"></i>
  									</button>
 									<div class="dropdown-menu dropdown-menu-right" style="width:100px;">
  									<button class="dropdown-item" type="button" id="outRoom"><b>채팅방 닫기</b></button>
  									<button class="dropdown-item" type="button" id="deleteRoom"><b>채팅방 나가기</b></button>
  									<div class="dropdown-divider"></div>
   									<button class="dropdown-item" type="button" id="btnChatAppointment"><b>약속잡기</b></button>
   									<button class="dropdown-item" type="button" id="btnChatImage"><b>사진보내기</b></button>
   									<div class="dropdown-divider"></div>
   									${a}
   									${b}
  </div>
</div>
									
								</div>
							</div>`
	
	
}
//판매중으로 변경 클릭
 $(document).on('click','#sellBtn',function(e){
	
	var result = confirm("상품을 판매중으로 변경하시겠습니까?");
	if(result){
		var reserve={
		"product":product
	}
$.ajax({
		
		
		url:"chat_sell_rest",
		method:"POST",
		data: JSON.stringify(reserve),
		async: true,
        contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
        dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)  
				
    			    			
	
		
		success:function(jsonResult){
		product=jsonResult.product;
		$('#chatHead').html("");
		$('#chatHead').append(chat_head(yourId,yourImg,c_room_no,yourFreshness,product,p_img,checkSeller));
		}
		
		
		})
		
		
		
		
		
		
	}else{}

})
//예약 클릭
 $(document).on('click','#reserveBtn',function(e){
	
	var result = confirm("상품을 예약중으로 변경하시겠습니까?");
	if(result){
		var reserve={
		"p_no":product.p_no,
		"yourId":yourId
	}
	$.ajax({
		url:"chat_reserve_rest",
		method:"POST",
		data: JSON.stringify(reserve),
		async: true,
        contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
        dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)  
		success:function(jsonResult){
		product=jsonResult.product;
		
		console.log(product);
		$('#chatHead').html("");
		$('#chatHead').append(chat_head(yourId,yourImg,c_room_no,yourFreshness,product,p_img,checkSeller));
		/*********송금버튼 누를 시 오더번호 생성********
			$.ajax({
				url:"orders_insert_json",
				method:"POST",
				data:{ 
					"p_no" : product.p_no,
					"user_id" : product.userInfo.user_id,
					"yourId" : yourId
				},
				success:function(jsonResult){
					console.log(jsonResult.msg+jsonResult.msg2);
					alert('예약이 완료되었습니다.');
				},error:function(jsonResult){
					console.log(jsonResult.msg+jsonResult.msg2);
					alert('예약이 실패하였습니다.');
				}
				
				
			});		
		*********************/
		}
		
		
		})
		
		
		
		
		
		
	}else{}

})
//판매완료 클릭
 $(document).on('click','#soldOutBtn',function(e){
	
	var result = confirm("상품을 판매완료로 변경하시겠습니까?");
	if(result){
		var reserve={
		"p_no":product.p_no,
		"yourId":yourId
	}
$.ajax({
		
		
		url:"chat_soldout_rest",
		method:"POST",
		data: JSON.stringify(reserve),
		async: true,
        contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
        dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)  
				
    			    			
	
		
		success:function(jsonResult){
		product=jsonResult.product;
		$('#chatHead').html("");
		$('#chatHead').append(chat_head(yourId,yourImg,c_room_no,yourFreshness,product,p_img,checkSeller));
		}
		
		
		})
		
		
		
		
		
		
	}else{}

})


//메세지 전송 

function message_send_function(){
		$('#chat_content_msg').focus();
		
	$("#chat_content_msg").keydown(function(e) {
		if( e.keyCode == 13 ){
			console.log('Enter');
		e.preventDefault();
		e.stopPropagation();
		if($('#chat_content_msg').val()==""){
			alert('내용을 입력하세요');
			$('#chat_content_msg').focus();
			return false;
		}
		console.log("send 버튼 클릭");
		timestamp = new Date().getTime();
		
	
		
		//제이슨데이터 만들기 
		// 임시 데이터 test
		
		jsonData.mId=loginId;
		
		
		/*****상대방 아이디 / 채팅방 데이터 받아와야 함  */
		jsonData.your_id=yourId;
		jsonData.msg="메세지 전송(socket.send)";
		jsonData.code="1";
		jsonData.data=[{
			c_content_no:"",
			c_content:$('#chat_content_msg').val(),
			send_time:"",
			c_read:"0",
			user_id:loginId,
			c_room_no:c_room_no
		}]
		
		

			
		
		console.log("json데이터만들기 끝")
		
		
		
		
		
			
		message_sendDB(jsonData);
		console.log("DB 전송")		
		return false;
			
		}
	});	
		
	$('#btnChatSend').click(function(e){
		e.preventDefault();
		e.stopPropagation();
		if($('#chat_content_msg').val()==""){
			alert('내용을 입력하세요');
			$('#chat_content_msg').focus();
			return false;
		}
		console.log("send 버튼 클릭");
		timestamp = new Date().getTime();
		
	
		
		//제이슨데이터 만들기 
		// 임시 데이터 test
		
		jsonData.mId=loginId;
		
		
		/*****상대방 아이디 / 채팅방 데이터 받아와야 함  */
		jsonData.your_id=yourId;
		jsonData.msg="메세지 전송(socket.send)";
		jsonData.code="1";
		jsonData.data=[{
			c_content_no:"",
			c_content:$('#chat_content_msg').val(),
			send_time:"",
			c_read:"0",
			user_id:loginId,
			c_room_no:c_room_no
		}]
		
		

			
		
		console.log("json데이터만들기 끝")
		
		
		
		
		
			
		message_sendDB(jsonData);
		console.log("DB 전송")		
		return false;
	
	
	});
	return false;
}

function message_sendDB(jsonData){
				$.ajax({
				url:'chat_message_rest',
    			data: JSON.stringify(jsonData.data[0]), //전송 데이터
    			
    			type: "POST", //전송 타입
    			async: true, //비동기 여부
    			//timeout: 5000, //타임 아웃 설정
    				
    			contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
    			dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)    			
    			    			
    			// [응답 확인 부분 - json 데이터를 받습니다] -보낸 클라이언트가 자기한테 받는 거 (?)
    			success: function(response) {
    				console.log("성공");
    				console.log(" 내가 보낸 것 [requestPostBodyJson] : [response] : " + JSON.stringify(response));    				
    				console.log("");
    				jsonData.data[0].send_time=response.send_time;
    				jsonData.data[0].c_content_no=response.c_content_no
    				console.log(JSON.stringify(jsonData));    	
    				
    				socket.send(JSON.stringify(jsonData));		
    					console.log("socket 전송")	;	
    					//console.log("성공적인 socket 전송 여부: "+sendResult);
    			$('#chat_content_msg').val("");
    			},
    			error:function(xhr){
						console.log("error");
				}
    			
    			});
    			
			}





function connectWS(){
	console.log("connectWS 실행 : "+loginId)
	var url="ws://119.207.178.242:80/brown_carrot_market/replyEcho?"+loginId+"&"+c_room_no;
	var ws=new WebSocket(url);
	socket=ws;
	
	ws.onopen = function() {
			console.log(loginId+'서버 연결 성공');
			jsonData.mId=loginId;
		
		
		/*****상대방 아이디 / 채팅방 데이터 받아와야 함  */
		jsonData.your_id=yourId;
		jsonData.msg="채팅방 입장(socket.send)";
		jsonData.code="2";
		jsonData.data=[{
			c_content_no:"",
			c_content:"",
			send_time:"",
			c_read:"0",
			user_id:loginId,
			c_room_no:c_room_no
		}]
			socket.send(JSON.stringify(jsonData));
			console.log()
		getChatNum(loginId);
		
	    };
	    
	ws.onerror=function(evt){
		console.log('에러');
	}
	
	ws.onmessage=function(result){
		result.stopPropagation();
		//console.log(result.data);
		//var onMsg=JSON.parse(result.data);
		console.log('메세지 얻기');
		//console.log(onMsg.data[0]);
		var onmsg=JSON.parse(result.data);
		console.log(onmsg.code);
		
	
		//메세지 전송한 경우
		if(onmsg.code=="1"){
		if(onmsg.user_id!=loginId&&onmsg.toastId=="youExist"){
			//상대가 메세지 보낸 경우
			console.log("상대가 보낸 경우"+onmsg.user_id)
            $('#chat_history').append(message_other(onmsg));
		}else if(onmsg.user_id!=loginId){
			 toastr.options.positionClass = "toast-top-right";
	      toastr['warning'](onmsg.user_id+" : "+onmsg.c_content);
	      
	      /******************채팅수증가******* */
	     getChatNum(loginId);
		}else if(onmsg.user_id==loginId){
			console.log("내가 보낸 경우"+onmsg.user_id)
			//내가 보낸 경우
			$('#chat_history').append(message_you(onmsg));
		}
		/*****************메시지 보내는 순간 리스트 새로고침***********************/
			
			 reloadChatList();
	/****************************************************************************/
		
	/*************메시지 보내는 순간 메시지 포커스************/	
		if($('#chat-history').get(0).scrollHeight>698){
    			// 세로 스크롤바가 있을 경우 처리
			$('#chat-history').css("display","flex");
			console.log("스크롤바 있음");
		}else{
			$('#chat-history').css("display","block");
			console.log("스크롤바 없음");
	
		}
		
		
		
		
		
		
		
		} //입장한 경우
		else if(onmsg.code=="2"){
			console.log(">>>>>>>>입장한 경우");
			var chat_detail={
			"c_room_no":c_room_no,
			"loginId":loginId
		}
		
			$.ajax({
		
		
		url:"chat_detail_rest",
		method:"POST",
		data: JSON.stringify(chat_detail),
		async: true,
        contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
        dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)    			
    			    			
	
		
		success:function(jsonResult){
			var chatContentArray=jsonResult.data;
			yourId=jsonResult.yourId;
			yourImg = jsonResult.yourImg;
			console.log("채팅방의 상대방 ID:"+yourId);
			//$('#chat_history').html("");
			//$('#chatHead').html("");
			//$('#chatHead').append(chat_head(yourId,yourImg));
			
			
			
			for(const item of chatContentArray){
				var chat_read="";
				if(item.c_read==0){
		         chat_read="";
	            }else if(item.c_read==1){
		         chat_read=`<i class="fa fa-check"></i>`;
	            }
	            console.log(item.c_content_no);
				$(`#${item.c_content_no}`).html(chat_read);
				
		
			};
		}
		});
		return false;
		
		
	}else if(onmsg.code=="3"){
		console.log("약속 잡기");
		if(onmsg.user_id=='admin'){
			$('#chat_history').append(message_admin(onmsg));
		}else{			
		$('#chat_history').append(message_admin_promise(onmsg));
		}
			/*****************메시지 보내는 순간 리스트 새로고침***********************/
			
       reloadChatList();
	/****************************************************************************/
	
	
	}
	}
	
	
	
	ws.onclose=function(evt){
		console.log('소켓 닫기');
		
	}
}



/*****************삭제....*************** */

$(document).on('click','#deleteRoom',function(e){
	console.log(c_room_no);

	var chat_room={
		"c_room_no":c_room_no,
		"loginId":loginId
	}
$.ajax({
		
		
		url:"chat_delete_rest",
		method:"POST",
		data: JSON.stringify(chat_room),
		async: true,
        contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
        dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)  
				
    			    			
	
		
		success:function(jsonResult){
			var chatList=jsonResult.data;
		//	var chatContentArray=jsonResult.data;
		//	yourId=jsonResult.yourId;
		//	yourImg = jsonResult.yourImg;
		//	c_room_no=jsonResult.c_room_no;
		//	console.log("채팅방의 상대방 ID:"+yourId);
		//	console.log(chatContentArray[0]);
		//	//$('#content').html('채팅 불러오기 성공');
		//	$('#chat_history').html("");
		//	$('#chatHead').html("");
			//loginId=$('#loginId').val();
			console.log("불러오기");
			console.log(chatList);
			$('#chatRoomList').html("");
			$('#chat_history').html("");
			$('#chatHead').html("");
								// 채팅방 확장 
			$(function(){
				$("#chat").css({
				"margin-left": "280px",
 			   	"border-left": "1px solid #eaeaea"
					
					
				});
				
			});
			$('#chatHead').append(chatRoomHeadGongji());
			$('#chat_history').append(chatRoomGongji());
			
			for(const item of chatList){
				
			$('#chatRoomList').append(chatRoomListNew(item));
			$('#plist').show();	
				
			}

		}
		
	});
	
	});
	/************************************ 채팅방 닫기 ******************************/
$(document).on('click','#outRoom',function(e){
			socket.close();
			$('#chat_history').html("");
			$('#chatHead').html("");
							// 채팅방 확장 
			$(function(){
				$("#chat").css({
				"margin-left": "280px",
 			   	"border-left": "1px solid #eaeaea"
					
					
				});
				
			});
			$('#chatHead').append(chatRoomHeadGongji());
			$('#chat_history').append(chatRoomGongji());
			$('#plist').show();
			
			connectServer(loginId);

	
	});
	/********************************************************************** */
function chatRoomHeadGongji(){
	return `					<div class="row">
								<div class="col-lg-12">
									<a href="javascript:void(0);" data-toggle="modal"
										data-target="#view_info"> <img
										src="img/user_profile/carrot3.png"
										alt="avatar" style="float:left;">
									</a>
									<div class="chat-about">
	
										<h6 class="m-b-0"><b>대장 토끼</b></h6>
										
										<small>자주 묻는 질문</small>
									</div>
								</div>

							</div>`
}
function chatRoomGongji(){
	return `<li class="clearfix">
									<div class="message-data"><img
											src="img/chat-img/logo_carrot.png"
											alt>
										<span class="message-data-adminGongji">흙토끼</span>
									</div>
									<div class="message my-message">
									<h6><b>기본매너</b></h6>
									<p>기본적으로 지켜야하는 매너에는 무엇이 있을까요?</p>
									<p>· 서로 존중해요. 우리 존댓말로 대화해요.<br>
									   · 모두의 시간은 소중합니다. 시간 약속을 꼭 지켜주세요.<br>
									   · 절대로 중간에 연락 끊기는 일이 없도록 해요.<br>
									   · 따듯한 감사 인사로 마무리를 지어요.<br>
									   · 늦은 시간 채팅은 부담스러울 수 있어요.<br>
									</p>
</div>
								</li>
								
								<li class="clearfix">
									<div class="message-data text-right"><img
											src="img/chat-img/logo_carrot.png"
											alt>
										<span class="message-data-adminGongji">금토끼</span>
									</div>
									<div class="message other-message float-right">
									<h6><b>이런 행동은 할 수 없어요.</b></h6>
									<p><br>
									   · 판매 금지 물품 거래.<br>
									   · 중고거래 사기 등 이웃에게 손해를 입히는 행위.<br>
									   · 허위 정보게시 등 이웃을 속이거나 기만하는 행위.<br>
									   · 불쾌감, 성적 수치심 등을 주는 행위.<br>
									   · 이웃을 배제하거나 소외시키는 행위.<br>

									</p>
</div>
								</li>`
}
function chatRoomListNew(list){
	var list_content=list.c_content;
	if(list.c_content.startsWith("@@image!#")){
		list_content="사진 전송";
	}
	
		if(list.p_img.startsWith('http')){
			list.p_img= list.p_img;
		}else{
			list.p_img= 'img/product_img/'+list.p_img;
		}
	
	
	return `        <li class="clearfix">
                        <img src='img/user_profile/${list.you_image}' alt="avatar"><img src="${list.p_img}" style="float:right; width:45px; height:45px; border-radius: 0%">
                       
                        <div class="about">
							<input name="chatRoomNo" type="hidden" value=${list.c_room_no}/>
					<!--	<button type="button" class="btn btn-default" id="btnCall${list.c_room_no}" value=${list.c_room_no}>${list.c_room_no}</button>-->
                            <div class="name" id="btnCall${list.c_room_no}" value=${list.c_room_no}>${list.you_id}</div> 
                            <div class="content"> <i class="fa fa-circle offline"></i>${list_content}</div>                                            
                        </div>
                 </li>`
}




/****************약속 잡기************************/

 $(document).on('click','#btnChatAppointment',function(e){
	$.ajax({
		url:'promise_check',
		method:"POST",
		data:'c_room_no='+c_room_no,
		dataType:'json',
		success:function(jsonResult){
			if(jsonResult.code=="2"){
				alert("약속을 잡으시겠습니까?");
				popupNew();
				
			}else if(jsonResult.code=="1"){
				alert("기존 약속이 있습니다. 수정하시겠습니까?");
				popupChange();
			}
			
		}
	})
	
	
	
}) //약속잡기 버튼 클릭 

$(document).on('click','#btnChatImage',function(e){
	popupImage();
})

$(document).on('click',"img[id^='chat_img_sizeUp']",function(e){
	var src=$(e.target).attr('imgSrc');
	console.log("이미지소스:"+src);
	popupImageSizeUp(src);
})

$(document).on('click','#btnCarrot_Pay',function(e){
	console.log($(e.target).attr("p_no"));
	popupCarrotPay($(e.target).attr("p_no"));
	e.preventDefault;
})

$(document).on('click','#btnCarrot_Pay_Cancel',function(e){
	console.log($(e.target).attr("p_no"));
	popupCarrotPay_Cancel($(e.target).attr("p_no"));
	e.preventDefault;
})

  function popupCarrotPay(p_no){
	 var url = "transfer_page?p_no="+p_no;
            var name = "당근 페이";
            var option = "width = 470, height = 650, top = 100, left = 200, location = no,  resizable=no";
            window.open(url, name, option);
}

  function popupCarrotPay_Cancel(p_no){
	 var url = "transfer_cancel_page?p_no="+p_no;
            var name = "당근 페이";
            var option = "width = 470, height = 650, top = 100, left = 200, location = no,  resizable=no";
            window.open(url, name, option);
}

  function popupImageSizeUp(src){
	var url = "chat_image_sizeUp?src="+src;
            var name = "이미지 확대";
            var option = "width = 600, height = 600, top = 100, left = 200, location = no,  resizable=yes"
            window.open(url, name, option);
}

  function popupImage(){
	 var url = "chat_photo";
            var name = "이미지 전송";
            var option = "width = 400, height = 250, top = 100, left = 200, location = no,  resizable=no"
            window.open(url, name, option);
}
  
  function popupNew(){
            var url = "chat_appointment";
            var name = "약속 잡기";
            var option = "width = 470, height = 790, top = 100, left = 200, location = no,  resizable=no"
            window.open(url, name, option);
        }
        
  function popupChange(){
            var url = "chat_appointment_change";
            var name = "약속 수정";
            var option = "width = 470, height = 790, top = 100, left = 200, location = no,  resizable=no"
            window.open(url, name, option);
        }
        
   function popupMap(c_app_lat,c_app_lng){
            var url = "chat_appointment_map?c_app_lat="+c_app_lat+"&c_app_lng="+c_app_lng;
            var name = "약속 장소 지도로 보기";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no,  resizable=no"
            window.open(url, name, option);
        }
       
/***********팝업창 */		
		
		/*****************채팅목록 다시 부르기 */
		
		function reloadChatList(){
					console.log("채팅방 새로고침");
			$('#chatRoomList').html("");
			var reload_id={
		
		"loginId":loginId
	}
			$.ajax({
		
		
		url:"chat_room_reload_rest",
		method:"POST",
		data: JSON.stringify(reload_id),
		async: true,
        contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
        dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)  
				
    			    			
	
		
		success:function(jsonResult){
			var chatList=jsonResult.data;
		
			console.log("불러오기");
			console.log(chatList);
			$('#chatRoomList').html("");
			for(const item of chatList){
				
			$('#chatRoomList').append(chatRoomListNew(item));
				
				
			}

		}
		
	});
		}
		
		$(function() {
function Toast(type, css, msg) {
        this.type = type;
        this.css = css;
        this.msg = msg;
    }
    
     toastr.options.extendedTimeOut = 0; //1000;
    toastr.options.timeOut = 10000;
    toastr.options.fadeOut = 250;
    toastr.options.fadeIn = 250;
    toastr.options.preventDuplicates = false;
    toastr.options.closeButton = true;
    toastr.options.positionClass = "toast-top-right";
    toastr.options.onclick = function() { 
	console.log("click");
	location.href="chat_room";
	
	 }

})

