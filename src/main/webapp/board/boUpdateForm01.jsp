<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file='./../common/bootstrap5.jsp'%>
<%@include file='./../common/common.jsp'%>

<%@page import="com.shopping.model.bean.Board" %>
<%@page import="com.shopping.model.dao.BoardDao" %>
<!DOCTYPE html>
<%
	int id = 1;
	BoardDao dao = new BoardDao();
	Board bean = dao.getDatabyPK(id);
%>
<html>
	<head>
	<meta charset="UTF-8">
	
	<style type="text/css">
  		/* box model에 대한 공부가 필요합니다. */
  		.container{margin-top: 10px;}
  		.input-group{margin: 7px;}
  		.input-group-text{
  			display: block;
  			margin-left: auto;
  			margin-right: auto;
  		}
  		#buttonset{margin-top: 15px;}
  	</style>

	<title>Insert title here</title>
	</head>
<body>
	<div class="container">
		<h2>게시물 수정</h2>
		<p>사용자들이 게시물을 수정하는 페이지입니다.</p>
		
		<form>
			<div class="input-group">
				<span class="input-group-text col-md-2">게시물 번호</span> 
				<input disabled id="no" name="no" type="number" class="form-control" value=<%=bean.getNo()%>>
				<input id="no" name="no" type="hidden" class="form-control" value=<%=bean.getNo()%>>
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">아이디</span> 
				<input id="writer" name="writer" type="text" class="form-control" value=<%=bean.getId()%>>
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">비밀번호</span> 
				<input id="writer" name="writer" type="password" class="form-control" value=<%=bean.getPassword()%>>
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">글제목</span> 
				<input id="writer" name="writer" type="text" class="form-control" value=<%=bean.getSubject()%>>
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">글내용</span> 
				<textarea id="content" name="content" class="form-control"><%=bean.getContent()%></textarea>
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">조회수</span> 
				<input id="content" name="content" type="text" class="form-control" value=<%=bean.getReadhit()%>>
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">등록 일자</span> 
				<input id="regdate" name="regdate" type="datetime" class="form-control" value=<%=bean.getRegdate()%>>
			</div>
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary btn-lg">등록</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-secondary btn-lg">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>