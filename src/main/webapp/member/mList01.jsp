<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file='./../common/bootstrap5.jsp'%>
    <%@include file='./../common/common.jsp'%>
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
			
			<table class="table table-condensed">
			<!-- table-hover table-striped table-condensed-->
				<thead>
					<tr>
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
					<tr>
						<td>hong</td>
						<td>홍길동</td>
						<td>1234</td>
						<td>남자</td>
						<td>2023/08/24</td>
						<td>미혼</td>
						<td>1000</td>
						<td>마포</td>
						<td>kim9</td>
					</tr>
					<tr>
						<td>yoon</td>
						<td>윤석열</td>
						<td>석열짱123</td>
						<td>남자</td>
						<td>1960/08/24</td>
						<td>미혼</td>
						<td>1000</td>
						<td>용산</td>
						<td>rock10</td>
					</tr>
					<tr>
						<td>moon</td>
						<td>문재인</td>
						<td>훠궈짱1234</td>
						<td>남자</td>
						<td>2023/08/24</td>
						<td>미혼</td>
						<td>1000</td>
						<td>마포</td>
						<td>moonIn</td>
					</tr>
					<tr>
						<td>leeMB</td>
						<td>이명박</td>
						<td>재인짱123</td>
						<td>남자</td>
						<td>1959/08/24</td>
						<td>미혼</td>
						<td>1000</td>
						<td>어딘가</td>
						<td>MBB</td>
					</tr>
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