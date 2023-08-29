<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="2">
		<tr>
			<th>이름</th>
			<th>그림</th>
			<th>주소</th>
		</tr>
		<tr>
			<td>이름</td>
			<td><img  alt="항목" src="https://www.navercorp.com/img/ko/og/logo.png" style="width: 230px; height: 130px;"></td>
			<td><a href="#" onclick="plus()">3 더하기 5</a></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><img alt="항목" src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Daum_communication_logo.svg/1200px-Daum_communication_logo.svg.png" style="width: 230px; height: 130px;"></td>
			<td><a href="#" onclick="multi()">3 곱하기 5</a></td>
		</tr>
	</table>
</body>
<script>
	function plus(){
		alert("3 더하기 5는 " + (3 + 5) + "입니다.");
	}
	function multi(){
		alert("3 곱하기 5는 " + (3*5) + "입니다");
	}
</script>
</html>
