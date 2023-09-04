<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file='./../common/bootstrap5.jsp'%>
<%@include file='./../common/common.jsp'%>
<%@page import="com.shopping.model.bean.Product" %>
<%@page import="com.shopping.model.dao.ProductDao" %>

<!DOCTYPE html>
<%
	ProductDao productdao = new ProductDao();
	Product bean = productdao.findDataFK(12);
%>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		/*box model에 대한 공부가 필요합니다.*/
		.input-group{
			margin:7px;
			color: blue;
		}
		.input-group-text{
			display: block;
			margin-left: auto;
			margin-right: auto;
		}
		#button-set{
			margin-top: 15px;
			
		}
		.hobby, .radio-gender{
			margin-right: 10px;
		}
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
				console.log("실행")
				$('option').each(function(){
					if($(this).val() == <%=bean.getCategory()%>){
						$(this).attr('selected', true)
					}
				})
			})
		</script>
	</head>
<body>
	<div class="container">
		<h2>상품 수정</h2>
		<p>상품 수정 페이지 입니다.</p>
		
		<form action="">
				<div class="input-group">
					<span class="input-group-text">상품번호</span>
					<input disabled class="form-control" type="number" id="pnum" name="pnum" value=<%=bean.getNum()%>>
					<input  class="form-control" type="hidden" id="pnum" name="pnum" value=<%=bean.getNum()%>>
				</div>
				
				<div class="input-group">
					<span class="input-group-text">상품이름</span>
					<input class="form-control" type="text" id="pname" name="pname" value="<%=bean.getName()%>">
				</div>
				
				<div class="input-group">
					<span class="input-group-text">제조회사</span>
					<input class="form-control" type="text" id="company" name="company" value="<%=bean.getCompany()%>">
				</div>
				
				<div class="input-group">
					<span class="input-group-text">상품 이미지</span>
					<input class="form-control" type="file" id="image01" name="image01" value="<%=bean.getImage01()%>">
				</div>
				
				<div class="input-group">
					<span class="input-group-text">재고 수량</span>
					<input class="form-control" type="number" id="stock" name="stock" value="<%=bean.getStock()%>">
				</div>
				
				<div class="input-group">
					<span class="input-group-text">단가</span>
					<input class="form-control" type="number" id="price" name="price" value="<%=bean.getPrice()%>">
				</div>
				
				<div class="input-group">
					<span class="input-group-text">카테고리</span>
					<select class="form-select" id="category" aria-label="Default select example">
						<option value="-">--항목선택--</option>
						<option value="생필품">생필품</option>
						<option value="냉동식품">냉동식품</option>
						<option value="유제품">유제품</option>
						<option value="유아용품">유아용품</option>
					</select>
				</div>
				
				<div class="input-group">
					<span class="input-group-text">상품 상세 설명</span>
					<textarea class="form-control"><%=bean.getContents()%></textarea>
				</div>
				
				<div class="input-group">
					<span class="input-group-text">적립 포인트</span>
					<input class="form-control" type="number" id="point" name="point" value="<%=bean.getPoints()%>">
				</div>
				
				<div class="input-group">
					<span class="input-group-text">입고일자</span>
					<input class="form-control" type="datetime" id="inputdate" name="inputdate" value="<%=bean.getInputdate()%>">
				</div>
				<div id="button-set">
					<a type="button" class="btn btn-primary">등록</a>
					<a type="button" class="btn btn-danger" href="./../product/prList01.jsp">취소</a>
					<button type="button" class="btn btn-warning">초기화</button>
				</div>
			</form>
	</div>
</body>
</html>