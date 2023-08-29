<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file='./../common/bootstrap5.jsp' %>
<%@include file='./../common/common.jsp' %>

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
				<tr>
					<td>1</td>
					<td>윤석열</td>
					<td>1234</td>
					<td>"북한은 별거 없다."</td>
					<td>"여러분 한미일이 합치면 세계정복..."</td>
					<td><span class="badge">22</span></td>
					<td>2023/8/24</td>
				</tr>
				<tr>
					<td>1</td>
					<td>문재인</td>
					<td>1234</td>
					<td>"은퇴하고 나서.."</td>
					<td>"은퇴후 먹는 훠궈는 맛있습니다 훠훠.."</td>
					<td><span class="badge">212</span></td>
					<td>2023/8/23</td>
				</tr>
				<tr>
					<td>1</td>
					<td>이재명</td>
					<td>1234</td>
					<td>"대장동 의혹"</td>
					<td>"망치 나가신다~~"</td>
					<td><span class="badge">222</span></td>
					<td>2023/8/24</td>
				</tr>
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