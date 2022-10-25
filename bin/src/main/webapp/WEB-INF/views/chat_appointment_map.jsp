<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약속 장소 지도로 보기</title>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>

<!-- 지도scipt -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7c7231db91ae56cfc5e3c6ea06f73c6&libraries=services,clusterer,drawing"></script>

<!-- 내 js -->
<script src="js/chat/chat_map.js"></script>

</head>
<body>
<input type="hidden" id="caMap_lat" value=${param.c_app_lat}>
<input type="hidden" id="caMap_lng" value=${param.c_app_lng}>
<div id="map" style="width:500px;height:500px;"></div>
</body>
</html>