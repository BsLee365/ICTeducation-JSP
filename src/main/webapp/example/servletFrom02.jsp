<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=appName%>/world" method=post>
		순서 : <input type="number" name="pnum"> <br>
		이름 : <input type="text" name="name"> <br>
		회사 : <input type="text" name="company"> <br>
		가격 : <input type="number" name="price"> <br>

		<input type="submit" value="전송">
		
		<!-- url pattern(서블릿 맵핑)
		보안상의 문제를 위하여 간접적으로 주소를 지정 방식을 사용하는 기법
		요청 커맨드 : hello
		실제 담당자 : com.shopping.myservlet.HelloServlet.java
		파라미터 : id, name, age, hobby
		메소드 : post 방식
		도착지 : servletTo01.jsp
		Bean 클래스 : Hello
		초기화 파라미터 : company, address
		Bean 클래스 : Hello(company,address 변수들 포함)
		-->
	</form>
</body>
</html>