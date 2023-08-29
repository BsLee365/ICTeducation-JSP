<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!--폰트 가져올 주소-->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/font-applesdgothicneo@1.0/all.min.css">
	
	<style type="text/css">
	/*css 주석 다는 법*/
		body{
			font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
		}
		label{
			font-size: 20px;
		}
		/*id 별로 css*/
		#age{
			color: red;
			font-size: 35px;
			background-color: blue;
		}
		/*클래스 별로*/
		.mytarget{
			color: red;
			font-size: 20px;
		}
		.yourtarget{
			color: red;
			font-size: 40;
		}
		label > input {
			font-size: 300px;
		}
		/*, 기호를 사용하면 2개 이상의 요소에 스타일 지정 가능*/
		.mytarget, .yourtarget{
			background-color: yellow;
		}
		form > #password{ /*하위 속성 지정 가능.*/
			color: orange;
		}
		select > #doctor, #jangdoctor{
			font-size: 35px;
			color: yellow;
			background-color: navy;
		}
	</style>
</head>
<body>
	<h1>폼양식</h1>
	<form action="htmlTest01.jsp">
		<label>아이디</label>
		<input name="id"><br>
		
		<label id="password">비밀번호</label>
		<input name="password" type="password"><br>
	
		<label>이름</label>
		<input name="name"><br>
		
		<label id="age">나이</label>
		<input name="age"><br>
		
		<label class="mytarget">생일</label>
		<input name="birthday" type="date"><br>
		
		<label class="mytarget yourtarget">이미지</label> <!--class를 2개 선언도 가능.-->
		<input name="age" type="image"><br>
		
		<label class="yourtarget">숨김 파라미터 :</label>
		<input type="hidden" name="money" value=12000 ><br>
		
		<label>성별 :</label>
		<input type="radio" name="gender" value="남자" checked="checked">남자
		<input type="radio" name="gender" value="여자">여자<br>
		
		<label>취미 :</label>
		<input type="checkbox" name="hobby" value="당구">당구
		<input type="checkbox" name="hobby" value="축구">축구
		<input type="checkbox" name="hobby" value="야구">야구
		<input type="checkbox" name="hobby" value="농구">농구
		<input type="checkbox" name="hobby" value="배구">배구
		<br>
		
		<label>직업 :</label>
		<select name="job">
			<option value="의사" id="doctor">의사
			<option value="판사">판사
			<option value="검사">검사
			<option value="형사">형사 
			<option value="장의사" id="jangdoctor">장의사
		</select>
		<br>
		
		<label>코멘트 :</label>
		<textarea name="comments" rows="2" cols="10"></textarea>
		<br>
		
		<input type="submit" value="전송">
		&nbsp;
		<input type="reset" value="초기화">
	</form>
	
</body>
</html>