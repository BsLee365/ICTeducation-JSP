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
	<form action="<%=appName%>/hello" method=post>
		아이디 : <input type="text" name="id" value="park"> <br>
		이름 : <input type="text" name="name" value="박영희"> <br>
		나이 : <input type="text" name="age" value="30"> <br>
		취미 : 
		탁구<input type="checkbox" name="hobby" value="탁구"> 
		축구<input type="checkbox" name="hobby" value="축구">
		농구<input type="checkbox" name="hobby" value="농구"> 
		야구<input type="checkbox" name="hobby" value="야구"> <br>
		
		<input type="submit" value="전송">
		
		<!-- url pattern(서블릿 맵핑)
		보안상의 문제를 위하여 간접적으로 주소를 지정 방식을 사용하는 기법
		요청 커맨드 : hello
		실제 담당자 : com.shopping.myservlet.HelloServlet.java
		파라미터 : id, name, age, hobby(requst 영역에 바인딩)
		메소드 : post 방식
		초기화 파라미터 : company, address(session 영역에 바인딩)
		hello: 여러분 안녕하세요.(application 영역에 바인딩)
		Bean 클래스 : Hello(company,address 변수들 포함)
		도착지 : servletTo01.jsp
		Bean 클래스 : Hello(파라미터들)
		-->
	</form>
</body>
</html>