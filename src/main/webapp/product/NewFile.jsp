<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file='./../common/bootstrap5.jsp'%>
<%@include file='./../common/common.jsp'%>
<!DOCTYPE html>
<html>
	<head>
	<link rel="stylesheet" href="css/jquery-picZoomer.css">
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="src/jquery.picZoomer.js"></script>
	
		<meta charset="UTF-8">
		<title>상품 등록</title>
	</head>
	<body>
		<div class="container">
			<h1>상품 등록</h1>
			<p>회원 가입하는 페이지 입니다.</p>
			
			<form action="">
				<div class="input-group">
					<span class="input-group-text">상품번호</span>
					<input class="form-control" type="text" id="pnum" name="pnum">
				</div>
				
				<div class="input-group">
					<span class="input-group-text">상품이름</span>
					<input class="form-control" type="text" id="pname" name="pname">
				</div>
				
				<div class="input-group">
					<span class="input-group-text">제조회사</span>
					<input class="form-control" type="text" id="company" name="company">
				</div>
				
				<div class="input-group">
					<span class="input-group-text">상품 이미지</span>
					<input class="form-control" type="file" id="image01" name="image01">
				</div>
				
				<div class="input-group">
					<span class="input-group-text">재고 수량</span>
					<input class="form-control" type="number" id="stock" name="stock">
				</div>
				
				<div class="input-group">
					<span class="input-group-text">단가</span>
					<input class="form-control" type="number" id="price" name="price">
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
					<textarea class="form-control"></textarea>
				</div>
				
				<div class="input-group">
					<span class="input-group-text">적립 포인트</span>
					<input class="form-control" type="number" id="point" name="point">
				</div>
				
				<div class="input-group">
					<span class="input-group-text">입고일자</span>
					<input class="form-control" type="date" id="inputdate" name="inputdate">
				</div>
				<div id="button-set">
					<a type="button" class="btn btn-primary">등록</a>
					<a type="button" class="btn btn-danger" href="./../product/prList01.jsp">취소</a>
					<button type="button" class="btn-warning">초기화</button>
				</div>
			</form>
		</div>
	</body>
</html>