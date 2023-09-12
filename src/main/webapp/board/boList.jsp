<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file='./../common/common.jsp' %>
<%@page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<style>
	.container{margin-top: 10px;}
	.rounded-pill{opacity: 0.7;}
	.mode, .keyword, .col{margin: auto;}
</style>
<script type="text/javascript">
	//검색 옵션 유지
	$(document).ready(function() {
		
		$('#keyword').val('${requestScope.pageInfo.keyword}');
		$('#mode').val('${requestScope.pageInfo.mode}');
	});
	
	function searchAll(){ //전체 검색
		location.href = '<%=notWithFormTag%>boList';
	}
	
	function writeForm(){ //글쓰기, 로그인 안했으면 글 못쓰게 막아버리기
		if(${whologin} == 0){
			alert('회원 정보가 없습니다.');
			location.href = '<%=notWithFormTag%>boList';
		}else{
			location.href = '<%=notWithFormTag%>boInsert';
		}
	}
</script>
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
					<th>글제목</th>
					<th>작성자</th>
					<!-- <th>비밀번호</th> -->
					
					<!-- <th>글 내용</th> -->
					<th>조회수</th>
					<th>작성일자</th>
					<th>수정</th>
					<th>답글</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="9" align="right">

						<!-- 검색기능 -->
						<div class="row">
							<div class="col-sm-1"></div>
							<div class="col-sm-10">
								<form name="myform" action="<%=withFormTag%>" method="get">
									<input type="hidden" name="command" value="boList">
									<div class="row">
										<div class="col-sm-3 mode">
											<select class="form-control form-control-sm" id="mode"
												name="mode">
												<option value="all" selected="selected">--- 선택해 주세요 ---
												<option value="id">작성자
												<option value="subject">글제목
												<option value="content">글내용
											</select>
										</div>
										<div class="col-sm-2 keyword">
											<input class="form-control form-control-sm" type="text"
												name="keyword" id="keyword" placeholder="키워드 입력">
										</div>
										<div class="col">
											<button type="submit" class="btn btn-warning form-control-sm"
												onclick="">검색</button>
										</div>
										<div class="col">
											<button type="button" class="btn btn-warning form-control-sm"
												onclick="searchAll();">전체 검색</button>
										</div>
										<div class="col">
											<button type="button" class="btn btn-info form-control-sm"
												onclick="writeForm();">글 쓰기</button>
										</div>
										<div class="col">${requestScope.pageInfo.pagingStatus}</div>
									</div>
								</form>
							</div>
							<div class="col-sm-1"></div>
						</div>
						<!-- 검색기능 끝 -->


					</td>
				</tr>
				<c:forEach var="bean" items="${requestScope.datalist}">
				<tr>
					<td>${bean.no}</td>
					
					<td><c:forEach var="i" begin="1" end="${bean.depth}" step="1">
						<span class="badge rounded-pill bg-secondary">${bean.depth}</span>
					</c:forEach>
					
					<a href="<%=notWithFormTag%>boDetail&no=${bean.no}">${bean.subject}</a></td>
					<td>${bean.id}DB에 null값</td> 
					
					<%-- <td>${bean.password}</td> --%>
					<%-- <td>${bean.content}</td> --%>
					
					<c:if test="${bean.readhit > 10}">
						<td><span class="badge rounded-pill bg-danger">${bean.readhit}</span></td>
					</c:if>
					<c:if test="${bean.readhit <= 10}">
						<td><span class="badge rounded-pill bg-primary">${bean.readhit}</span></td>
					</c:if>
					
					<td>${bean.regdate}</td>
					
				 <%-- <c:if test="${sessionScope.loginfo.id eq bean.no}"> --%>
						<td><a type="button" href="<%=notWithFormTag%>boUpdate&no=${bean.no}&${requestScope.pageInfo.flowParameter}" class="btn btn-info">수정</a></td>
						
				<%-- </c:if> --%>
				<c:set var="replyInfo" value="&groupno=${bean.no}&orderno=${bean.no}&depth=${bean.no}"></c:set>
				<td><a type="button" href="<%=notWithFormTag%>boReply&no=${bean.no}&${requestScope.pageInfo.flowParameter}${replyInfo}" class="btn btn-info">답글</a></td>
				
				</tr>
				</c:forEach>
				<!-- 조회수 10넘으면 badge다르게 -->
				
			</tbody>
		</table>
		
		${requestScope.pageInfo.pagingHtml}
	</div>
</body>
</html>