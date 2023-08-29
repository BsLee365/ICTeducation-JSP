<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./common.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
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
							<li><a class="dropdown-item" href="#">회원가입</a></li>
							<li><a class="dropdown-item" href="#">정보 수정</a></li>
							<li><a class="dropdown-item" href="#">로그인</a></li>
							<li><a class="dropdown-item" href="#">로그아웃</a></li>
							<li><a class="dropdown-item" href="#">상세보기</a></li>
							<li><a class="dropdown-item" href="#">탈퇴하기</a></li>
							<li><a class="dropdown-item" href="#">목록보기</a></li>
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


	<!-- Carousel -->
	<div id="demo" class="carousel slide" data-bs-ride="carousel">

		<!-- Indicators/dots -->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
				class="active"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
		</div>

		<!-- The slideshow/carousel -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="<%=appName%>/image/la.jpg" alt="Los Angeles"
					class="d-block" style="width: 100%">
				<div class="carousel-caption">
					<h3>Los Angeles</h3>
					<p>We had such a great time in LA!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="<%=appName%>/image/chicago.jpg" alt="Chicago"
					class="d-block" style="width: 100%">
				<div class="carousel-caption">
					<h3>Chicago</h3>
					<p>We had such a great time in LA!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="<%=appName%>/image/newyork.jpg" alt="New York"
					class="d-block" style="width: 100%">
				<div class="carousel-caption">
					<h3>New York</h3>
					<p>We had such a great time in LA!</p>
				</div>
			</div>
		</div>

		<!-- Left and right controls/icons -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#demo" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#demo" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>

	<div class="container-fluid mt-3">
		<h3>Carousel Example</h3>
		<p>The following example shows how to create a basic carousel with
			indicators and controls.</p>
	</div>

</body>
</html>
