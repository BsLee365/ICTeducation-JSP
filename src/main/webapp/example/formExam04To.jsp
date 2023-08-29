<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름 : ${param.name}<br>
	나이 : ${param.age}<br>
	이미지 : ${param.image}<br>
	숨김 파라미터 : ${param.money}<br>
	성별 : ${param.gender}<br>
	
	취미 : 
	<%
		String[] hobbies = request.getParameterValues("hobby");
		if(hobbies != null){
		for(String hobby:hobbies){
			out.print(hobby + ", ");
		}}
	%><br>
	
	직업 : ${param.job}<br>
	코멘트 : ${param.comment} <br>
</body>
</html>