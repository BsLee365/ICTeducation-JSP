<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 가입 양식</h1>
	<form action="#">
		아이디 : <input type=text placeholder="아이디"><br>
		이름 : <input type=text placeholder="이름"><br>
		비밀번호 : <input type=password placeholder="비밀번호"><br>
		성별 : <input type=radio name="성별" value="남자">남자 <input type=radio name="성별" value="여자">여자 <br>
		생일 : <input type=date value="생일"><br>
		결혼 여부 : <input type=radio name=결혼여부 value="결혼">결혼 <input type=radio name=결혼여부 value="미혼">미혼 <input type=radio name=결혼여부 value="이혼">이혼 <br> 
		급여 : <input type=text name=salary><br>
		주소 : <input type=text name=address><br>
		매니저: <input type=text name=manager><br>
		이미지 : <input type=file><br>
		취미 : <label for=pingpong><input type=checkbox name=hobby value=탁구 id=pingpong>탁구</label>
			  <label for=baseball><input type=checkbox name=hobby value=야구 id=baseball>야구</label>
			  <label for=football><input type=checkbox name=hobby value=축구 id=football>축구<br></label>
		가고싶은 국가 :
			<select id=contry name=contry>
			<option value="usa">미국</option>
	    	<option value="canada">캐나다</option>
	    	<option value="uk">영국</option>
	    	<option value="japan">일본</option>
			</select> <br>
		코멘트 : <input type=text name=manager><br><br>
		<input type=submit value="제에에에에출"></input> 
	</form>
	
</body>
</html>