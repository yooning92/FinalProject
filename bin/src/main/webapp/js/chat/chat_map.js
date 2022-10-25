
var searchKeyword=null;
var mapContainer=null;
var map=null;
var markerImage=null;
var marker=null;
var c_app_lat=null; 
var c_app_lng=null;


$(document).ready(function(){
	$(window).on("load",function(){
		c_app_lat=$('#caMap_lat').val();
		c_app_lng=$('#caMap_lng').val();
		console.log("위도,경도:"+c_app_lat+c_app_lng);
		 mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(c_app_lat, c_app_lng), // 지도의 중심좌표
		        level: 2, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(c_app_lat, c_app_lng); 

var markerImageUrl = "img/chat-img/logo_carrot.png",
		    markerImageSize = new kakao.maps.Size(50, 52), // 마커 이미지의 크기
		    markerImageOptions = { 
		        offset : new kakao.maps.Point(20, 42)// 마커 좌표에 일치시킬 이미지 안의 좌표
		    };

		// 마커 이미지를 생성한다
		markerImage = new kakao.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition,
    image:markerImage,
    draggable:false,
    clickable:true
  
    
})


// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
	})
	
		
		
		})
	





	
	


