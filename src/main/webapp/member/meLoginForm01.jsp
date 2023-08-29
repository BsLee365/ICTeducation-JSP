<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file='./../common/bootstrap5.jsp'%>
<%@include file='./../common/common.jsp'%>
<html>
	<head>
	<meta charset="UTF-8">
	<title>로그인</title>
		
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
		<form action="">
			<div>
				<div class="input-group">
					<label class="form-label" for="id">아이디: </label>
					<input type="text" class="form-control" name="id" id="id" data-bs-toggle="tooltip" data-bs-placement="left" title="Hooray!" placeholder="아이디를 입력하세요">
				</div>
				
				<div class="input-group">
					<label class="form-label" for="password">비밀번호: </label>
					<input type="password" class="form-control" name="password" id="password">
				</div>
				<button type="submit" class="btn btn-primary">로그인</button> <!-- 버튼 종류 많음. -->
				<a type="button" href="./../member/meInsertForm01.jsp" class="btn btn-primary">회원가입</a>
				
			</div>
		</form>
	</div>
</body>
</html>