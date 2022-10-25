$(document).ready(function(){
	
	
	$(window).on("load",function(){
		$("#address_name").on("click", function(e) {
					console.log('click!! - #address_name');
					
					$("#address_name").val('서울시 서초구 역삼동');
					$("#address_lat").val(37.50082663);
					$("#address_lng").val(127.0366527);
					
			});
			
			
			// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();

					// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
					if (navigator.geolocation) {

						// ***GeoLocation을 이용해서 접속 위치를 얻어옵니다
						navigator.geolocation
								.getCurrentPosition(function(position) {

									var lat = position.coords.latitude, // 위도
									lon = position.coords.longitude; // 경도

									var locPosition = new kakao.maps.LatLng(
											lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
									message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

									console.log("locPosition: "+ locPosition.getLat(), locPosition.getLng());
									console.log(message);
									$("#address_lat").val(lat);
									$("#address_lng").val(lon);

									//좌표->주소 변환
									searchDetailAddrFromCoords(
											locPosition,
											function(result, status) {
												if (status === kakao.maps.services.Status.OK) {
													//console.log('도로명주소 : ' + result[0].road_address.address_name);
													//console.log('지번 주소 : ' + result[0].address.address_name);
													//var detailAddr = !!result[0].road_address ? result[0].road_address.address_name  : '';
													var detailAddr = result[0].address.address_name;

													//주소를 동까지만 자릅니다.
													subStr = detailAddr
															.lastIndexOf(" ");
													detailAddr = detailAddr
															.substring(
																	0,
																	subStr);
													//$("#address_name").val(detailAddr);
												}
											});
								});
					} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
						var locPosition = new kakao.maps.LatLng( 33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'
						$("#address_name").val(message);
					}
					// 좌표->주소 변환
					function searchAddrFromCoords(coords, callback) {
						// 좌표로 행정동 주소 정보를 요청합니다
						geocoder.coord2RegionCode(coords.getLng(),
								coords.getLat(), callback);
					}
					function searchDetailAddrFromCoords(coords,
							callback) {
						// 좌표로 법정동 상세 주소 정보를 요청합니다
						geocoder.coord2Address(coords.getLng(), coords
								.getLat(), callback);
					}

				});
			
	});
