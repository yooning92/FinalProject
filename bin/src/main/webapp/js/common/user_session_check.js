/*function addJavascript(jsname) {

	var th = document.getElementsByTagName('head')[0];

	var s = document.createElement('script');

	s.setAttribute('type','text/javascript');

	s.setAttribute('src',jsname);

	th.appendChild(s);

}
addJavascript('/js/user/UserHtmlContents.js');
addJavascript('/js/chat/socket.js');*/

var promise_time=[];
var today = new Date();
var number ;




$(document).ready(function(){
	
	session_check(); 
	
	
	
});

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
		    	$("#wishlist-area a").attr("href", "user_login");
		    	//공지사항
		    	$("#notice_btn_container>.update_form").hide();	//수정
		    	$("#notice_btn_container>.delete").hide();	//삭제
		    	$(".notice_list_view>.write_form").hide();	//게시글작성
		    	
		    }else if (jsonResult.code==2) {//세션에 로그인 유저 존재
		    	if(!jsonResult.data[0].user_id.startsWith('admin')){
			    	//공지사항
			    	$("#notice_btn_container>.update_form").hide();	//수정
			    	$("#notice_btn_container>.delete").hide();	//삭제
			    	$(".notice_list_view>.write_form").hide();	//게시글작성
		    	}
		    
		    	$("#account-area").html(CommonHtmlContents.user_thumbnail_login(jsonResult.data[0]));
				connectServer(jsonResult.data[0].user_id);
				sessionStorage.setItem("sUserId",jsonResult.data[0].user_id);
				
			//약속 목록 가져오기	
	        $.ajax({
		      url:'promise_alert',
		      method:"POST",
		      data:'user_id='+jsonResult.data[0].user_id,
		      dataType:'json',
		      success:function(jsonResult){
			
			 
			  for(var promise of jsonResult.data){
				 
				 if(promise.c_app_date.substr(0,10)==getDateFormat(today)){
				
				var id="";
				if(promise.from_id==jsonResult.data[0].user_id){
					id=promise.to_id;
				}else{
					id=promise.from_id;
				}
				
			
				  
				  
                 	//약속 시간 체크
	              timerFunc(promise.c_app_date,id,promise.c_app_spot);//인자로 넘겨주는 dateTime은 'yyyyMMddhhmiss"의 기본형
				
				}
			}
			
			
			
		}
		
		
	         }); // 약속 알림 설정 끝 
	         
	         	
				
				//안읽은채팅 가져오기 
				getChatNum(jsonResult.data[0].user_id);
			}
		}
	}); //ajax 끝
	
}

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


function getDateFormat(date) {
    return date.getFullYear() + "-" + (date.getMonth() + 1).toString().padStart(2, 0) + "-" + date.getDate();
}




function timerFunc(dateTime,id,spot){
	
    var year = Number(dateTime.substring(0,4));
    var month = Number(dateTime.substring(5,7));
    var day = Number(dateTime.substring(8,11));
    
    var time = Number(dateTime.substring(11,13));
    var minute = Number(dateTime.substring(14,16));
    var second = Number(dateTime.substring(17,19));

    var oprDate = new Date(year, month-1, day, time-1, minute, second); //동작을 원하는 시간의 Date 객체를 생성합니다.
    var nowDate = new Date();

    var timer = oprDate.getTime() - nowDate.getTime(); //동작시간의 밀리세컨과 현재시간의 밀리세컨의 차이를 계산합니다.
    console.log("약속 시간:"+time+":"+minute);
   	
   	var msg=`오늘 ${id} 님과 ${time}시 ${minute} 분에 약속이 있어요! <br> 약속 장소 : ${spot}`;
   	
   	
    if(timer < 0){ //타이머가 0보다 작으면 함수를 종료합니다.
       return;
    }else{
       setTimeout(function(){
	toastr.options.positionClass = 'toast-top-full-width' ;
	toastr['success'](msg);
}, timer);
    }
}



function connectServer(loginId){
	console.log("connectWS 실행 : "+loginId)
	var url="ws://119.207.178.242:80/brown_carrot_market/replyEcho?"+loginId;
	var ws=new WebSocket(url);
	socket=ws;
	
	ws.onopen = function() {
			console.log(loginId+'서버 연결 성공');
		
	    };
	    
	ws.onerror=function(evt){
		console.log('에러');
	}
	
	ws.onmessage=function(result){
		console.log('메세지 전송');
		//alert(result.data);
		
		var msg=JSON.parse(result.data);
		console.log(msg);
		var id=msg.toastId;
		var message=msg.c_content;
		
		if(message.startsWith("@@image!#")){
			message="사진 전송";
		}
		
		if(id==loginId){
	    //  new Toast('warning', 'toast-top-right', msg.user_id+":"+message);
	      toastr.options.positionClass = "toast-top-right";
	      toastr['warning'](msg.user_id+" : "+message);
	      
	      /******************채팅수증가******* */
	     getChatNum(loginId);
	
		
		}
		
		
		
	}
	
	
	
	ws.onclose=function(evt){
		console.log('소켓 닫기');
		
	}
}





/*알림창 설정*/
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

$(function(){
	$("#searchKey").keypress(function(e) {
  if (e.keyCode === 13) {
	location.href="search_list?search_keyword="+$("#searchKey").val();
    e.preventDefault();
  
  }
});
	
})



    




