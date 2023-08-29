<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file='./../common/bootstrap5.jsp' %>
<%@include file='./../common/common.jsp' %>
<%@page import="com.shopping.model.dao.BoardDao" %>
<%@page import="com.shopping.model.bean.Board" %>
<%@page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	BoardDao dao = new BoardDao();
	List<Board> lists = dao.getboards();
	request.setAttribute("datalist", lists);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>
<body>
	<div class="container">
	<h1>게시글 목록</h1>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>비밀번호</th>
					<th>글제목</th>
					<th>글 내용</th>
					<th>조회수</th>
					<th>작성일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${requestScope.datalist}">
				<tr>
					<td>${bean.no}</td>
					<td>${bean.id}</td>
					<td>${bean.password}</td>
					
					<td><c:forEach var="i" begin="1" end="${bean.depth}" step="1">
						<span class="badge rounded-pill bg-secondary">${bean.depth}</span>
					</c:forEach>${bean.subject}</td>
					
					<td>${bean.content}</td>
					
					<c:if test="${bean.readhit > 10}">
						<td><span class="badge rounded-pill bg-danger">${bean.readhit}</span></td>
					</c:if>
					<c:if test="${bean.readhit <= 10}">
						<td><span class="badge rounded-pill bg-primary">${bean.readhit}</span></td>
					</c:if>
					
					<td>${bean.regdate}</td>
				</tr>
				</c:forEach>
				<!-- 조회수 10넘으면 badge다르게 -->
				
			</tbody>
		</table>
		
		<ul class="pagination">
				<li class="page-item">
					<a class="page-link" href="#">1</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">2</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">3</a>
				</li>
				<li class="page-item">
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