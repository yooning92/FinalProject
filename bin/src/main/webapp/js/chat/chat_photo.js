 var jsonData={
	code:null,
	url:null,
	msg:null,
	your_id:null, // 상대 아이디 
	data:null //chat_contents 
	
};
$(document).ready(function(){
	$('#btnchatImgSubmit').hide();	
})

$(document).on('change','#img_choose',function(e){
	
	$('#btnchatImgSubmit').show();
})


$(document).on('click','#btnchatImgSubmit',function(e){
	
	const formData =new FormData($('#chat_image_form')[0]);
	
	$.ajax({
		url:"chat_upload",
		type:"POST",
		processData:false,	//파일전송시 반드시 false
		contentType:false,
		data:formData,
		success:function(jsonResult){
			console.log("채팅 이미지 업로드 결과:"+jsonResult.message);
			console.log("채팅 이미지 업로드 결과:"+jsonResult.newFileName);
			
			jsonData.mId=window.opener.loginId;
		
		
		/*****상대방 아이디 / 채팅방 데이터 받아와야 함  */
		jsonData.your_id=window.opener.yourId;
		jsonData.msg="이미지 전송(socket.send)";
		jsonData.code="1";
		jsonData.data=[{
			c_content_no:"",
			c_content:"@@image!#"+jsonResult.newFileName,
			send_time:"",
			c_read:"0",
			user_id:window.opener.loginId,
			c_room_no:window.opener.c_room_no
		}]
		
		console.log("DB 저장 이미지 데이터:"+jsonData.data[0].c_content);
		window.opener.message_sendDB(jsonData);
		
		self.close();
		}
	});
	
	//DB 저장 
	//소켓 전송 
	e.preventDefault();
	
})

