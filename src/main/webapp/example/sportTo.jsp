<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	코치 : ${applicationScope.map['coach']} <br>
	플레이어 : ${applicationScope.map['player']} <br>
	등 번호 : ${applicationScope.map['number']} <br>
	국적 : ${applicationScope.map['nationality']} <br>
	포지션 : ${applicationScope.map['position']} <br>
</body>
</html>