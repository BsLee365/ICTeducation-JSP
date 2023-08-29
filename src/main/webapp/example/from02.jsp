<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="to02.jsp" method="post">
		아이디 : <input type="text" name="id" value="hong"><br>
		이름 : <input type="text" name="name" value="홍길동"><br>
		나이 : <input type="text" name="age" value="20"><br>
		취미 : 
			탁구 <input type="checkbox" name="hobby" value="탁구">
			축구 <input type="checkbox" name="hobby" value="축구" checked>
			농구 <input type="checkbox" name="hobby" value="농구">
			<br>
		<button type="submit">전송</button>
	</form>
	
	앵커 태그
	<a href="./to01.jsp?id=kim&age=50">하드 코딩</a>
	<%
		String id = "park";
		int age = 30;
	%>
	<a href="to01.jsp?id=<%=id%>&age=<%=age%>">변수사용</a>
</body>
</html>