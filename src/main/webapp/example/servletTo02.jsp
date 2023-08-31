<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<h3>개별 변수를 바인딩</h3> request
 		${requestScope.pnum}<br>
 		${requestScope.name}<br>
 		${requestScope.company}<br>
 		${requestScope.price}<br>
 	<hr>
 	<h3>bean 객체 바인딩</h3> bean 
 		${requestScope.bean.pnum}<br>
 		${requestScope.bean.name}<br>
 		${requestScope.bean.company}<br>
 		${requestScope.bean.price}<br>
 		
 	<hr>
 	<h3>세션 영역 바인딩</h3> session
 		${sessionScope.tel}<br>
 		${sessionScope.fax}<br>
 	<hr>
 	<h3>어플리케이션 영역 바인딩</h3> application
 		${applicationScope.hello}<br>
 		
 	<hr>
</body>
</html>