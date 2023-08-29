<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%@ include file="./../common/bootstrap5.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<body>
		<!-- 1부터 10까지의 총합 구하기 -->
		<c:set var="total" value="0"></c:set>
		<c:forEach var="i" begin="1" end="10" step="1">
			<c:set var="total" value="${total+i}"></c:set>
		</c:forEach>
		<c:out value="${total}"></c:out><br>
		<!-- 1부터 10까지의 짝수와 홀수 의 총합 각각 구하기 -->
		<c:set var="odd" value="0"></c:set>
		<c:set var="even" value="0"></c:set>
		
		<c:forEach var="i" begin="1" end="10" step="1">
			<c:if test="${i%2==1}">
				<c:set var="odd" value="${odd+i}"></c:set>
			</c:if>
			<c:if test="${i%2==0}">
				<c:set var="even" value="${even+i}"></c:set>
			</c:if>
		</c:forEach>
		
		홀수 총합 : <c:out value="${odd}"></c:out><br>
		짝수 총합 : <c:out value="${even}"></c:out><br>
		<!-- 1부터 10까지의 3의 배수 총합/4의 배수 총합/ 나머지 총합 구하기 -->
		<c:set var="result01" value="0"></c:set>
		<c:set var="result02" value="0"></c:set>
		<c:set var="result03" value="0"></c:set>
		<!-- 구문 내 주석은 삼가하는게 좋을듯. -->
		<c:forEach var="i" begin="1" end="10" step="1">
			 <c:choose> 
			 	<c:when test="${i mod 3 == 0}"> 
			 		<c:set var="result01" value="${result01+i}"></c:set>
			 	</c:when> <!-- switch -->
			 	<c:when test="${i mod 4 == 0}">
			 		<c:set var="result02" value="${result02+i}"></c:set>
			 	</c:when>	
				<c:otherwise>
					<c:set var="result03" value="${reesult03+i}"></c:set>
				</c:otherwise>
			 </c:choose>
		</c:forEach>
		
		결과 01: <c:out value="${result01}"></c:out><br>
		결과 02: <c:out value="${result02}"></c:out><br>
		결과 03: <c:out value="${result03}"></c:out><br>

		<c:set var="id" value="hong"></c:set>
		
		<c:if test="${empty id}">
			비어있음<br>
		</c:if>
		<c:if test="${not empty id}">
			들어있음 ${id}이 들어있음.<br>
		</c:if>
		
		<c:remove var="id"/>
		<c:if test="${empty id}">
			비어있음<br>
		</c:if>
	</body>
</html>