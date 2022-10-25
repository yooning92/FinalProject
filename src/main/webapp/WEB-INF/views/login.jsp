<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script src="js/chat/login.js"></script>
</head>
<body>
<div class="container">
		<h1 class="page-header">Login</h1>
		<form name="f" method="post">
		<table class="table table-bordered">
			<tr>
				<td><input type="text" name="user" id="user"
					class="form-control" placeholder="id를 입력해주세요"></td>
				<td>
					<button type="button" class="btn btn-default" id="btnlogin">로그인</button>

				</td>
			</tr>

		</table></form>
	</div>
</body>
</html>