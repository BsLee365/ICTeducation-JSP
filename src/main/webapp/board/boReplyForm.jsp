<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file='./../common/common.jsp'%>

<%@page import="com.shopping.model.bean.Board" %>
<%@page import="com.shopping.model.dao.BoardDao" %>
<!DOCTYPE html>
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
		<h2>게시물 답글</h2>
		<p>특정 게시물에 대한 답글을 작성하는 페이지입니다.</p>
		
		<form action="<%=withFormTag%>" method="post">
		<!-- 업데이트 후 넘어갈 페이지 인자값 -->
		<input type="text" name="pageNumber" value="<%=request.getParameter("pageNumber")%>">
		<input type="text" name="pagesize" value="<%=request.getParameter("pageSize")%>">
		<input type="text" name="mode" value="<%=request.getParameter("mode")%>">
		<input type="text" name="keyword" value="<%=request.getParameter("keyword")%>">
		<input type="text" name="command" value="boReply">
		
		<!-- 답글과 관련된 파라미터 목록 -->
		<input type="text" name="groupno" value="<%=request.getParameter("groupno")%>">
		<input type="text" name="orderno" value="<%=request.getParameter("orderno")%>">
		<input type="text" name="depth" value="<%=request.getParameter("depth")%>">
		
			<div class="input-group">
				<span class="input-group-text col-md-2">게시물 번호</span> 
				<input disabled id="no" name="no" type="number" class="form-control" value='${requestScope.bean.getNo()}'>	
				<input id="no" name="no" type="hidden" class="form-control" value='${requestScope.bean.getNo()}'>
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">아이디</span> 
				<input id="id" name="id" type="text" class="form-control" value='${requestScope.bean.getId()}'>>
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">글제목</span> 
				<input id="subject" name="subject" type="text" class="form-control">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">글내용</span> 
				<input id="content" name="content" class="form-control">
			</div>
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary btn-lg">답글작성</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-secondary btn-lg">초기화</button>
			</div>
		</form>`
	</div>
</body>
</html>