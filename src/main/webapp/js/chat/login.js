


//채팅 페이지 열릴 때 

$(document).ready(function(){
	
	//$('#content').html('$(document)ready 성공');
	
	
	console.log('$(document)ready 성공');
	
	//소켓 연결 
	$('#btnlogin').click(function(){
		console.log('로그인 버튼 클릭');
		document.f.action="chat_room";
		document.f.method='POST';
		document.f.submit();
	});
	

});



