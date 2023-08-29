<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%@ include file="./../common/bootstrap5.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="total" value="0"></c:set>
	<c:forEach var="i" begin="1" end="100" step="1">
		<c:if test="${i mod 3 == 0}">
			<c:set var="total" value="${total+i}"></c:set>
		</c:if>
	</c:forEach>
	<c:out value="${total}"></c:out><br>
	
	<c:set var="jumsu" value="82"></c:set>
	<c:choose>
		<c:when test="${jumsu > 90}">A</c:when>
		<c:when test="${jumsu > 80}">B</c:when>
		<c:when test="${jumsu > 70}">C</c:when>
		<c:otherwise>D</c:otherwise>
	</c:choose>
	
	<c:if test="${100 > jumsu and jumsu > 90}">A</c:if>
	<c:if test="${90 > jumsu and jumsu > 80} ">B</c:if>
	<c:if test="${80 > jumsu and jumsu > 70}">C</c:if>
	
	
</body>
</html>