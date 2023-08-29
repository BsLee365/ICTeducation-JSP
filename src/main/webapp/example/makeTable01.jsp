<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>makeTable01.jsp</title>
</head>
<body>
	<h1>표 만들기</h1>
	<table border=1>
		<thead>
			<tr>
				<th>이름</th>
				<th>국어</th>
				<th>영어</th>
				<th>수학</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align="center">김유신</td>
				<td>40</td>
				<td>50</td>
				<td>60</td>
			</tr>
			<tr>
				<td align="center">유관순</td>
				<td>45</td>
				<td>55</td>
				<th>65</th>
			</tr>
		</tbody>
	</table>
	
	<h1>표 만들기</h1>
	<table border=1>
		<thead>
			<tr>
				<th>이름</th>
				<th>국어</th>
				<th>영어</th>
				<th>수학</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align="center" rowspan="2">김유신</td>
				<td>40</td>
				<td>50</td>
				<td>60</td>
			</tr>
			<tr>
				<td>45</td>
				<td>55</td>
				<td>65</td>
			</tr>
		</tbody>
	</table>
</body>
</html>