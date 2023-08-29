<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%request.setCharacterEncoding("utf-8");%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	아이디 : ${param.id}<br>
	이름 : ${param.name}<br>
	나이 : ${param.age}<br>
	취미 : 
	${paramValues.hobby[0]} 
	${paramValues.hobby[1]} 
	${paramValues.hobby[0]} 
</body>
</html>