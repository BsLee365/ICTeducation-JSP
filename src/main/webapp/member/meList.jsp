<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file='./../common/common.jsp'%>
<%@page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<div class="container">
			<h2>회원 목록</h2>
			<p>회원 목록을 보여주는 페이지 입니다.</p>
			<p style="text-align: right;">${requestScope.pageInfo.pagingStatus}</p>
			<table class="table table-hover">
			<!-- table-hover table-striped table-condensed-->
			<%-- <tr><td colspan="9" align="right">${requestScope.pageInfo.pagingStatus}</td></tr> --%>
				<thead >
					<tr class="table-dark">
						<th><a class="dropdown-item" href="<%=notWithFormTag%>meDetail&id=${bean.id}"></a>아이디</th>
						<th>이름</th>
						<th>비밀 번호</th>
						<th>성별</th>
						<th>생일</th>
						<th>결혼 여부</th>
						<th>급여</th>
						<th>주소</th>
						<th>매니저</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bean" items="${requestScope.datalist}">
					<tr>
						<td><a href="<%=notWithFormTag%>meDetail&id=${bean.id}">${bean.id}</a></td>
						<td>${bean.name}
						<td>${bean.password}
						<td>${bean.gender}
						<td>${bean.birth}
						
						
						<c:if test="${bean.marriage eq '기혼' or bean.marriage eq '결혼'}">
							<td><span class="badge rounded-pill bg-success">${bean.marriage}</span>
						</c:if>
						<c:if test="${bean.marriage eq '미혼' }">
							<td><span class="badge rounded-pill bg-danger">${bean.marriage}</span>
						</c:if>
						<c:if test="${bean.marriage eq '이혼' }">
							<td><span class="badge rounded-pill bg-info">${bean.marriage}</span>
						</c:if>
						
						<td>${bean.salary}
						<td>${bean.address}
						<td>${bean.manager}
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
			${requestScope.pageInfo.pagingHtml}
		</div>
	</body>
</html>