<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file='./../common/common.jsp'%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<style type="text/css">
		.input-group{
			margin-top: 10px;
		}
	</style>
	

	<title>Insert title here</title>
	</head>
<body>
	<div class="container">
		<h2>게시글 상세 페이지</h2>
		<p>게시글의 상세 페이지 입니다.</p>
		
		<div class="input-group">
			<span class="input-group-text">게시글 번호</span>
			<input type="text" value="${bean.no}" class="input-group-text" readonly="readonly"/>
		</div>
		<div class="input-group">
			<span class="input-group-text">아이디</span>
			<input type="text" value="${bean.id}" class="input-group-text" readonly="readonly"/>
		</div>
		<div class="input-group">
			<span class="input-group-text">패스워드</span>
			<input type="text" value="${bean.password}" class="input-group-text" readonly="readonly"/>
		</div>
		<div class="input-group">
			<span class="input-group-text">제목</span>
			<input type="text" value="${bean.subject}" class="input-group-text" readonly="readonly"/>
		</div>
		<div class="input-group">
			<span class="input-group-text">내용</span>
			<input type="" value="${bean.content}" class="input-group-text" readonly="readonly"/>
		</div>
		<div class="input-group">
			<span class="input-group-text">조회수</span>
			<input type="text" value="${bean.readhit}" class="input-group-text" readonly="readonly"/>
		</div>
		<div class="input-group">	
			<span class="input-group-text">업로드 일자</span>
			<input type="text" value="${bean.regdate}" class="input-group-text" readonly="readonly"/>
		</div>
		<%-- <div class="input-group">
			<span class="input-group-text">리마크?</span>
			<input type="text" value="${bean.no}" class="input-group-text"/>
		</div> --%>
		<div class="input-group">
			<span class="input-group-text">depth?</span>
			<input type="text" value="${bean.depth}" class="input-group-text" readonly="readonly"/>
		</div>
	</div>
</body>
</html>