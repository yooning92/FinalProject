<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- <c:redirect url="main"/> --%>
<!-- 위의 코드는 url에 jsessionid가 붙을수밖에 없어서 아래코드로 변경 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<a href='main' id='index'></a>
<script type="text/javascript">
	document.getElementById('index').click();
</script>
</body>
</html>
