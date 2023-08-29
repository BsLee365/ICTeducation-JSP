<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp는 너무 복잡해</title>
</head>
<body>
<form>
	<table border=1>
		<tr>
			<td align=center>아이디
			<td><input type=text name="id" style="width:100px"> 
		</tr>
		<tr>
			<td align=center>이름
			<td><input type=text>
		</tr>
		<tr>
			<td align=center>비밀 번호
			<td><input name="pw" type=password>
		</tr>
		<tr>
			<td>성별
			<td><input type=radio name="성별" value="남자">남자<input type=radio name="성별" value="여자">여자
		</tr>
		<tr>
			<td>생일
			<td><input type="date">
		</tr>
		<tr>
			<td>결혼 여부
			<td><input type=radio name="결혼여부" value="결혼">결혼<input type=radio name="결혼여부" value="미혼">미혼<input type=radio name="결혼여부" value="이혼">이혼
		</tr>
		<tr>
			<td>급여
			<td><input type="text">
		</tr>
		<tr>
			<td>주소
			<td><input type="text">
		</tr>
		<tr>
			<td>매니저
			<td><input type="text">
		</tr>
		<tr>
			<td>이미지
			<td><input type="file">
		</tr>
		<tr>
			<td>취미
			<td><input type="checkbox" value="탁구">탁구<input type="checkbox" value="야구">야구<input type="checkbox" value="축구">축구
		</tr>
		<tr>
			<td>가고 싶은 국가
			<td><label>
					<select>
						<option value="usa">미국</option>
	    				<option value="canada">캐나다</option>
	    				<option value="uk">영국</option>
	    				<option value="japan">일본</option>
	    				<option value="koera">한국</option>
	    			</select>
	    		</label>
	    	</td>
		</tr>
		<tr>
			<td>코멘트
			<td><textarea></textarea>
		</tr>
		<tr>
			<td align=center colspan=2><input type=reset value=초기화>&nbsp;&nbsp;<input type=submit value=가입하기>
		</tr>
	</table>
</form>
</body>
</html>