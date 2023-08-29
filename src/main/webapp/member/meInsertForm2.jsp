<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file='./../common/bootstrap5.jsp'%>
<%@include file='./../common/common.jsp'%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		$(document).ready(function(){
			
		})
		
		function validCheck(){
			
			
			
			var id = $('#id').val();
			if(id.length < 4 || id.length > 10){
				swal('아이디는 4자리 이상 10자리 이하입니다.');
				$('#id').focus();
				return false; /*false이면 이벤트 전파 금지  */
			}
			
			var radioList = $('input[type="radio"]:checked');
			if (radioList.length == 0) {
				swal('성별은 반드시 선택이 되어야 합니다.');
				return false;
			}
			
			var checkList = $('input[type="checkbox"]:checked');
			if (checkList.length < 2) {
				swal("취미는 적어도 2개 이상 선택해야됩니다.");
				return false;
			}
			
			var password = $('#password').val();
			var regex = /^[a-z]\S{4,11}$/;
			var result = regex.text(password);
			
			if(result == false){
				swal('비밀 번호의 첫글자는 반드시 소문자이어야 합니다.');
				return false;
			}
			if(password.indexOf('@') <= 0 && password.indexOf('$') <= 0){
				swal("특수 문자 @# 중에 최소 1개가 포함이 되어야 합니다.")
				return false;
			}
			
			/* jqueryUI 플러그인 date picker */
			var birth = $('birth').val();
			var regex = /^\d{4}\/[01]\d{1}\/[0123]\d{1}$/;
			var result = reg.text(birth);
			
			if(result == false){
				swal('생일은 반드시 yyyy/mm/dd/ 형식으로 입력해주세요.')
				return false;
			}
		}

		
		function nameVailCheck(){
			var name = $('#name').val();
			if(name.length < 2){
				$('#name').focus();
				swal("이름 길이가 말도 안되게 짧습니다.");
				return false;
			}
			else if(name.length > 10){
				$('#name').focus();
				swal("이름 길이가 말도 안되게 깁니다.");
				return false;
			}
			
		
		}
	</script>
	<style type="text/css">
		/*box model에 대한 공부가 필요합니다.*/
		.input-group{
			margin:7px;
			color: blue;
		}
		.input-group-text{
			display: block;
			margin-left: auto;
			margin-right: auto;
		}
		#button-set{
			margin-top: 15px;
			
		}
		.hobby, .radio-gender{
			margin-right: 10px;
		}
		</style>
	</head>
<body>
	<div class="container">
		<h2>회원 가입</h2>
		<p>회원 가입하는 페이지 입니다.</p>
		
		<form action="">
			<div class="input-group">
				<span class="input-group-text">아이디</span>
				<input class="form-control" type="text" id="id" name="id">
			</div>
			
			<div class="input-group">
				<span class="input-group-text">패스워드</span>
				<input class="form-control" type="password" id="password" name="password">
			</div>
			
			<div class="input-group">
				<span class="input-group-text">이름</span>
				<input class="form-control" type="text" id="name" name="name">
			</div>
			
			<div class="input-group">
				<span class="input-group-text">생일</span>
				<input class="form-control" type="date" id="birth" name="birth">
			</div>
				
			<div class="input-group">
				<span class="input-group-text">성별</span>
				<div class="form-control">
					<label class="radio-gender">
						<input type="radio"id="1" name="gender" value="male">남자
					</label>
					<label class="radio-gender">
						<input type="radio"id="2" name="gender" value="female">여자
					</label>
				</div>
			</div>
				
			<div class="input-group">
				<span class="input-group-text">취미</span>
				<div class="form-control">
					<label class="radio-inline check-hobby hobby">
						<input type="checkbox" id="1" name="hobby" value="football">축구
					</label>
					<label class="radio-inline check-hobby hobby">
						<input type="checkbox" id="2" name="hobby" value="baseball">야구
					</label>
					<label class="radio-inline check-hobby hobby">
						<input type="checkbox" id="3" name="hobby" value="bea">배구
					</label>
					<label class="radio-inline check-hobby hobby">
						<input type="checkbox" id="4" name="hobby" value="basket">농구
					</label>
					<label class="radio-inline check-hobby hobby">
						<input type="checkbox" id="5" name="hobby" value="pingpong">탁구
					</label>
					<label class="radio-inline check-hobby hobby">
						<input type="checkbox" id="6" name="hobby" value="gugu">구구
					</label>
				</div>
			</div>
				<div class="input-group">
					<span class="input-group-text">결혼여부</span>
					<div class="form-control">
						 <label class="radio-inline"><input type="radio" id="1" name="marriage"> 미혼</label>
						 <label class="radio-inline"><input type="radio" id="2" name="marriage"> 결혼</label>
						 <label class="radio-inline"><input type="radio" id="3" name="marriage"> 이혼</label>
					</div>
				<div class="input-group">
					<span class="input-group-text">봉급</span>
					<input class="form-control" type="text" id="" name="">
				</div>
				
				<div class="input-group">
					<span class="input-group-text">주소</span>
					<input class="form-control" type="text" id="" name="">
				</div> 
				
				<div class="input-group">
					<span class="input-group-text">매니저</span>
					<input class="form-control" type="text" id="" name="">
				</div>
			</div>
			<div class="button-set">
				<button type="submit" class="btn btn-primary" onclick="return validCheck(); return nameVailCheck()">
				등록
				</button>
				&nbsp;
				<button type="reset" class="btn btn-primary">초기화</button>
				&nbsp;
				<a type="button" href="meLoginForm01.jsp" class="btn btn-primary">취소</a>
			</div>
		</form>
	</div>
</body>
</html>