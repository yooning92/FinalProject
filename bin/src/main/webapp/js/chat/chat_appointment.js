 var chatAppdate=null; 
 var chatApptime=null; 
 var chatAppLat=null; 
 var chatAppLng=null; 
  var detailAddr=null;
  var chatAppspot=null;
  var marker_org=null;
  
  var jsonData={
	code:null,
	url:null,
	msg:null,
	your_id:null, // 상대 아이디 
	data:null //chat_contents 
	
};
  
  $(document).ready(function(){
	var lastIndexCount=location.href.lastIndexOf('/');
	var changeUrl=location.href.substr(lastIndexCount+1);
	
	console.log("수정 url:"+changeUrl);
	
	if(changeUrl=="chat_appointment_change"){
	
			$.ajax({
				url:'promise_check',
				method:"POST",
				data:'c_room_no='+window.opener.c_room_no,
				dataType:'JSON',
				success:function(jsonResult){
					var dateidx=jsonResult.data.c_app_date
					console.log("기존 약속 날짜"+dateidx);
					$('#datePicker').val(dateidx.substr(0,10));
					$('#datePicker').trigger('change');
					$('#chatAppTime').val(dateidx.substr(11));
					$('#chatAppTime').trigger('change');
					$('#searchChatAppSpot').val(jsonResult.data.c_app_spot);
					chatAppspot=jsonResult.data.c_app_spot;
					chatAppLat=jsonResult.data.c_app_lat;
					chatAppLng=jsonResult.data.c_app_lng;

					$('#btnChatAppSpot').trigger('click');
				}
			});
		
	}
	
	$('#datePicker').datepicker({
	format:"yyyy-mm-dd",
	language:"kr",
	todayHighlight:true
	
});

$('#datePicker').on('change',function(){
	chatAppdate=$('#datePicker').val();
})



$('#chatAppTime').on('change',function(){
	chatApptime=$('#chatAppTime').val();
})


/***약속 장소 ******/

$('#btnChatAppSpot').click(function(e){
	console.log(">>>>>>>>>장소 찾기 버튼 클릭 ");
	    if($('#searchChatAppSpot').val()==""){
		alert("장소를 입력해주세요");
		return false;
	}
		e.preventDefault();
		e.stopPropagation();
		
		// 장소 검색 객체를 생성합니다
		
		searchKeyword=$('#searchChatAppSpot').val();
		console.log("장소검색>>>"+searchKeyword);
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(window.opener.c_app_lat, window.opener.c_app_lng), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

			// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 
// 키워드로 장소를 검색합니다
ps.keywordSearch(searchKeyword, placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();
        for (var i=0; i<1; i++) {
                        bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
		displayMarker(data[0]);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    	var markerImageUrl = "img/chat-img/logo_carrot.png",
		    markerImageSize = new kakao.maps.Size(40, 42), // 마커 이미지의 크기
		    markerImageOptions = { 
		        offset : new kakao.maps.Point(20, 42)// 마커 좌표에 일치시킬 이미지 안의 좌표
		    };

		// 마커 이미지를 생성한다
		markerImage = new kakao.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);
		
    marker_org = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x),
        image:markerImage
    }),infowindow = new kakao.maps.InfoWindow({zindex:1});
    
    chatAppLng=place.x;
    chatAppLat=place.y;
    
    
     infowindow.setContent('<div style="padding:5px;font-size:6px;color:orange;font-weight:bold;">' + place.place_name + '<br> ('+place.road_address_name+')</div>');
        infowindow.open(map, marker_org);
        
      chatAppspot=place.place_name+"("+place.road_address_name+")";
     
     
    console.log("수정 load 시장소: "+chatAppspot);

   
}


/*************************지도 클릭 이벤트 처리******************************/

var geocoder = new kakao.maps.services.Geocoder();


// 마커 이미지의 주소
		var markerImageUrl = "img/chat-img/logo_carrot.png",
		    markerImageSize = new kakao.maps.Size(40, 42), // 마커 이미지의 크기
		    markerImageOptions = { 
		        offset : new kakao.maps.Point(20, 42)// 마커 좌표에 일치시킬 이미지 안의 좌표
		    };

		// 마커 이미지를 생성한다
		markerImage = new kakao.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);
		marker = new kakao.maps.Marker({
		    position: map.getCenter() , // 마커의 좌표
		    draggable : false, // 마커를 드래그 가능하도록 설정한다
		    image : markerImage, // 마커의 이미지
		    map: map // 마커를 표시할 지도 객체
		}), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:2});

		marker.setMap(map);
		
			// 지도에 클릭 이벤트를 등록합니다
	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	     marker_org.setVisible(false);
	
	    
	     searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
			
			
			if(!!result[0].road_address){
			var buildingName=!!result[0].road_address.building_name?"("+result[0].road_address.building_name+")":"";
			
            detailAddr = !!result[0].road_address ? '<div style="padding:5px;color:orange; font-size:6pt; font-weight:bold;">' + result[0].road_address.address_name+" "+buildingName +'</div>' : '';
           	chatAppspot=result[0].road_address.address_name+" "+buildingName;
            }else{
				detailAddr = '<div style="padding:5px;color:orange; font-size:6pt; font-weight:bold; ">' + result[0].address.address_name + '</div>';
				chatAppspot=result[0].address.address_name;
			}
	
            var content = '<div class="bAddr">' +
                            
                            detailAddr + 
                        '</div>';

            // 마커를 클릭한 위치에 표시합니다 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
            
            
            
            chatAppLat=mouseEvent.latLng.getLat();
            chatAppLng=mouseEvent.latLng.getLng();
            
             var message = '클릭한 위치의 위도는 ' + chatAppLat + ' 이고, ';
	    message += '경도는 ' + chatAppLng + ' 입니다';
	    
	    console.log(message);
        }   
    });
	
	    
	});
	
	function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}
	
});


/*******************약속 DB/socket 전송********************** */
$('#chatAppFinalSubmit').click(function(e){
	e.preventDefault();
	e.stopPropagation();
	


	validate();




jsonData.mId=window.opener.loginId;
jsonData.your_id=window.opener.yourId;
jsonData.msg="약속 전송";
jsonData.code="3";
jsonData.data=[{
			c_content_no:"",
			c_content:`${window.opener.loginId} 님이 ${chatAppdate} ${chatApptime}에 약속을 잡았어요!`,
			c_appdate:chatAppdate,
			c_apptime:chatApptime,
			c_appspot:chatAppspot,
			c_app_lat:chatAppLat,
			c_app_lng:chatAppLng,
			c_app_date:chatAppdate+" "+chatApptime,
			send_time:"",
			c_read:"0",
			user_id:"adminP", //보내는 아이디 admin_promise 변경 
			c_room_no:window.opener.c_room_no
		}]
		console.log(jsonData);
		
		$.ajax({
			url:'promise_insert_rest',
			data:JSON.stringify(jsonData.data[0]),
			type:"POST",
			async:true,
			contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
    		dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)   
    		
    		
    		success:function(result){
				
			console.log("promise insert SUCCESS!")
			window.opener.socket.send(JSON.stringify(jsonData));
  		    self.close();
			},
			
			
			error:function(xhr){
				console.log("promise insert error");
			}
			
		});


  

//  f.submit();

	//디비 전송 - 성공시 함수실행...? 
})

$('#chatAppDeleteSubmit').click(function(e){
	alert("약속 삭제하시겠습니까?")
	
	e.preventDefault();
	e.stopPropagation();
	
	jsonData.mId=window.opener.loginId;
jsonData.your_id=window.opener.yourId;
jsonData.msg="약속 삭제";
jsonData.code="3";
jsonData.data=[{
			c_content_no:"",
			c_content:`${window.opener.loginId} 님이 약속을 취소했습니다!`,
			send_time:"",
			c_read:"0",
			user_id:"admin", //보내는 아이디 admin_promise 변경 
			c_room_no:window.opener.c_room_no
		}]
	
	$.ajax({
		url:"promise_delete",
		data:JSON.stringify(jsonData.data[0]),
			type:"POST",
			async:true,
			contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
    		dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)   
    		
		success:function(result){
			console.log("promsie DELETE success");
			window.opener.socket.send(JSON.stringify(jsonData));
  		    self.close();
		}
		
	})
});

//약속 수정 
$('#chatAppUpdateSubmit').click(function(e){
	//console.log((chatAppdate+" "+chatApptime).substr(0,16));
	e.preventDefault();
	e.stopPropagation();
	validate();
	
	var dateStr=(chatAppdate+" "+chatApptime).substr(0,16);
	
	jsonData.mId=window.opener.loginId;
jsonData.your_id=window.opener.yourId;
jsonData.msg="약속 업데이트";
jsonData.code="3";
jsonData.data=[{
			c_content_no:"",
			c_content:`${window.opener.loginId} 님이 ${dateStr}으로 약속을 변경했어요!`,
			c_appdate:chatAppdate,
			c_apptime:chatApptime,
			c_appspot:chatAppspot,
			c_app_lat:chatAppLat,
			c_app_lng:chatAppLng,
			c_app_date:(chatAppdate+" "+chatApptime).substr(0,16),
			send_time:"",
			c_read:"0",
			user_id:"adminP", //보내는 아이디 admin_promise 변경 
			c_room_no:window.opener.c_room_no
		}]
		console.log(jsonData);
		
		
		$.ajax({
			url:'promise_update',
			data:JSON.stringify(jsonData.data[0]),
			type:"POST",
			async:true,
			contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정
    		dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)   
    		
    		
    		success:function(result){
				
			console.log("promise update SUCCESS!")
			window.opener.socket.send(JSON.stringify(jsonData));
  		    self.close();
			},
			
			
			error:function(xhr){
				console.log("promise update error");
			}
			
		});
})

}) // document.ready 끝 

 
 /**********지도 script**************/
 
 function validate(){
	if($('#datePicker').val()==""){
			alert('날짜를 입력하세요');
			$('#datePicker').focus();
			return false;
		}   
		
if($('#chatAppTime').val()==""){
			alert('시간을 입력하세요');
			$('#chatAppTime').focus();
			return false;
		}   
if(chatAppspot==null){
	alert('약속 장소를 지정하세요');
	$('#searchChatAppSpot').focus();
	return false;
}

}




  