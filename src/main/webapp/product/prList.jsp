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

      });
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
	</style>
<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<div class="container">
			<h2><a style="text-decoration: none; color: black;" href="./prList02.jsp">상품 목록</a></h2>
			<p>고객들이 구매하고자하는 상품들의 목록을 보여주는 페이지 입니다.</p>
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
								<a class="removeUnderLine" href="/prDetail02.jsp?num=${bean.num}">
									<img alt="${bean.name}" src="${pageContext.request.contextPath}/upload/${bean.image01}" style="width: 100%;">
										<div class="card-body">
											<h5 class="card-title">${bean.name}</h5>
											
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