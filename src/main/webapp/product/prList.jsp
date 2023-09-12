<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file='./../common/common.jsp'%>
    <%@page import="com.shopping.model.dao.ProductDao" %>
    <%@page import="com.shopping.model.bean.Product" %>
    <%@page import="java.util.List" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
	<link rel="stylesheet" href="css/jquery-picZoomer.css">
	<script src="src/jquery.picZoomer.js"></script>
	   <script type="text/javascript">
      $(document).ready(function(){
         // Initialize popoveer
         var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
         var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
              return new bootstrap.Popover(popoverTriggerEl);
         });
         $('#keyword').val('${requestScope.pageInfo.keyword}');
     	 $('#mode').val('${requestScope.pageInfo.mode}');

      });
      function searchAll(){
     	 location.href = '<%=notWithFormTag%>prList';
      }
      
      function writeForm(){
     	if(${whologin} == 0){
			alert('회원 정보가 없습니다.');
			location.href = '<%=notWithFormTag%>prList';
		}else{
			location.href = '<%=notWithFormTag%>prInsert';
		}
      }
   </script>
	<style type="text/css">
	.container{margin-top : 10px;}
	/* table 셀의 수평 가운데 정렬 */
	.card {
		margin-left: auto;
		margin-right: auto;
	}
	
	.card-img-top {
		width: 300px;
		height: 300px;
	}
	
	.removeUnderLine {
		text-decoration-line: none;
	}
	.po{
		/* flex: 0 0 0%; */
	}
	</style>
<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<div class="container">
			<h2><a style="text-decoration: none; color: black;" href="./prList02.jsp">상품 목록</a></h2>
			<p>고객들이 구매하고자하는 상품들의 목록을 보여주는 페이지 입니다.</p>
			
			<!-- 검색기능 -->
			<hr>
						<div class="row">
							<div class="col-sm-1"></div>
							<div class="col-sm-10">
								<form name="myform" action="<%=withFormTag%>" method="get">
									<input type="hidden" name="command" value="prList">
									<div class="row">
										<div class="col-sm-3 mode">
											<select class="form-control form-control-sm" id="mode"
												name="mode">
												<option value="all" selected="selected">--- 선택해 주세요 ---
												<option value="name">제품명
												<option value="category">카테고리
												<option value="contents">글내용
												<option value="company">제조회사
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
						<hr>
						<!-- 검색기능 끝 -->
						

			<table class="table table-borderless">
			<!-- table-hover table-striped table-condensed-->
				<thead>
					
				</thead>
				<tbody>
					<c:set var="colsu" value="3"></c:set>
					<!-- bean은 Product의 객체 -->
					<c:forEach var="bean" items="${requestScope.datalist}" varStatus="status">
					<c:if test="${status.index mod colsu == 0}">
							<tr>
						</c:if>
						<td>
							<div class="card" style="width: 19rem;">
								<a class="removeUnderLine" href="<%=notWithFormTag%>prDetail&pnum=${bean.num}&${requestScope.pageInfo.flowParameter}">
									<img alt="${bean.name}" src="${pageContext.request.contextPath}/upload/${bean.image01}" style="width: 100%;">
										<div class="card-body">
											<h5 class="card-title">${bean.name}</h5>
								</a> 			
											<span data-bs-toggle="popover"
											title="${bean.name}"
											data-bs-trigger="hover"
											data-bs-content="${bean.contents}">		
											<c:if test="${fn:length(bean.contents) >= 10}">
												${fn:substring(bean.contents, 0, 10)}...
											</c:if>
											</span>
										</div>	
								</a>
								<!-- 상품 수정 삭제 -->
								
								<c:if test="${whologin eq 2}">
									<div>
										<a id="updateAnchor" class="btn btn-info" href="<%=notWithFormTag%>prUpdate&pnum=${bean.num}&${requestScope.pageInfo.flowParameter}">수정</a>
										<a id="deleteAnchor" class="btn btn-danger" href="#">삭제</a>
									</div>
								</c:if>
								<!-- 상품 수정 삭제 끝-->

							</div>
						</td>
						<c:if test="${status.index mod colsu == (colsu-1)}">
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			${requestScope.pageInfo.pagingHtml}
		</div>
	</body>
</html>