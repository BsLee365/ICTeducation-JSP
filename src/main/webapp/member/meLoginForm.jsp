<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file='./../common/common.jsp'%>
<html>
	<head>	
	<meta charset="UTF-8">
	<title>로그인</title>
<style>
	#id, #password{
		margin-left: 10px;
		width : 150px;
		
	}
	.loginbutton{
		margin-top: 5px;
		text-align: center;
	}
	</style>
	</head>
<body>
<script>
	$(document).ready(function(){
		var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
		var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
		  return new bootstrap.Tooltip(tooltipTriggerEl)
		});
	})
</script>

	<div class="container">
		<h2>로그인</h2>
		<p>로그인 페이지 입니다.</p>
		<form action="<%=withFormTag%>" method="post"> <!-- /Student/Shopping 경로가 들어옴 -->
			<input type="hidden" name="command" value="meLogin">
			<div>
				<div class="input-group">
					<label class="form-label" for="id">아이디:</label>
					<input type="text" class="form-control" name="id" id="id" data-bs-toggle="tooltip" data-bs-placement="top" title="아이디 입력" placeholder="아이디를 입력하세요">
				</div>
				
				<div class="input-group" style="margin-top: 10px;">
					<label class="form-label" for="password">비밀번호:</label>
					<input type="password" class="form-control" name="password" id="password">
				</div>
				<div class="loginbutton">
					<button type="submit" class="btn btn-primary">로그인</button> <!-- 버튼 종류 많음. -->
					<a type="button" href="<%=notWithFormTag%>meInsert" class="btn btn-primary">회원가입</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>