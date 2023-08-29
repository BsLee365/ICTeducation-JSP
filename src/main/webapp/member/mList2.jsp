<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file='./../common/bootstrap5.jsp'%>
<%@include file='./../common/common.jsp'%>
<%@page import="com.shopping.model.dao.MemberDao" %>
<%@page import="com.shopping.model.bean.Member" %>
<%@page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	MemberDao dao = new MemberDao();
	List<Member> lists = dao.getmember();
	
	request.setAttribute("datalist", lists);
%>
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
			
			<table class="table table-hover">
			<!-- table-hover table-striped table-condensed-->
				<thead >
					<tr class="table-dark">
						<th>아이디</th>
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
						<td>${bean.id}
						<td>${bean.name}
						<td>${bean.password}
						<td>${bean.gender}
						<td>${bean.birth}
						
						
						<c:if test="${bean.marriage eq '기혼' }">
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
			
			
			<ul class="pagination">
				<li class="page-item">
					<a class="page-link" href="#">1</a>
				</li>
				<li class="page-item active">
					<a class="page-link" href="#">2</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">3</a>
				</li>
				<li class="page-item disabled">
					<a class="page-link" href="#">4</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">5</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">6</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">7</a>
				</li>
			</ul>
		</div>
	</body>
</html>