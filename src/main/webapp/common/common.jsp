<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file='./../common/bootstrap5.jsp'%>
<%@include file='./../common/navFile.jsp'%>
<% 
    //appName = 애플리케이션 이름(프로젝트 이름_Student)
	 String appName = request.getContextPath();
	/* out.print("프로젝트 이름 : " + appName); */

%>
<%-- jstl을 위한 태그 라이브러리 선언 --%>
<!-- prefix alias느낌 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<script type="text/javascript" src="./../js/sweetalert.js">
	</script>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- 공통으로 참조 되는 파일임. -->
</body>
</html>