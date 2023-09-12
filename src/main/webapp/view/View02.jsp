<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file='./../common/common.jsp'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container mt-3">
		<h2>회원과 게시물</h2>
		<p>회원과 게시물을 조인하여 결과를 출력해 줍니다.</p>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>이름</th>
					<th>게시글 작성수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${requestScope.lists}">
					<tr>
						<td>${bean.name}</td>
						<td>${bean.cnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>