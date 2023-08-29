<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테이블을 만들어보자</title>
</head>
<body>
	<h1>표 만들기</h1>
	<table border=1>
		<tr>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
		</tr>
		<tr>
			<td>김유신</td>
			<td>40</td>
			<td>50</td>
			<td>60</td>
		</tr>
		<tr>
			<td>유관순</td>
			<td>45</td>
			<td>55</td>
			<td>65</td>
		</tr>
	</table>
	<h1>표 만들기</h1>
	<table border=1>
		<tr>
		<th>이름</th>
		<th>국어</th>
		<th>영어</th>
		<th>수학</th>
		</tr>
		<tr>
			<td rowspan=3>김유신</td>
			<td>40
			<td>50
			<td>60
		</tr>
		<tr><td colspan=3 align=center>150</td></tr>
		
	</table>
</body>
</html>