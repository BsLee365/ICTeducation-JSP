<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file='./../common/bootstrap5.jsp'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">쇼핑몰</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
					
					<!-- 회원 목록 -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">회원</a>
						<ul class="dropdown-menu">
							
							<c:if test="${whologin eq 0}"> 
								<li><a class="dropdown-item" href="#">회원가입</a></li>
								<li><a class="dropdown-item" href="#">로그인</a></li>
							</c:if>
							<c:if test="${whologin not eq 0}">
								<li><a class="dropdown-item" href="#">정보 수정</a></li>
								<li><a class="dropdown-item" href="#">로그아웃</a></li>
								<li><a class="dropdown-item" href="#">상세보기</a></li>
								<li><a class="dropdown-item" href="#">탈퇴하기</a></li>
								<li><a class="dropdown-item" href="#">목록보기</a></li>
							</c:if>
						</ul>
					</li>
					<!-- 게시글 보기 -->
					<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown">게시물</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">게시물 등록</a></li>
								<li><a class="dropdown-item" href="#">목록 보기</a></li>
							</ul>
						</li>
					<!-- 상품 보기 -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">상품</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">상품 등록</a></li>
							<li><a class="dropdown-item" href="#">상품 목록</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>