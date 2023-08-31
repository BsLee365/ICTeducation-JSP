<%@page import="com.shopping.model.bean.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file='./../common/bootstrap5.jsp'%>
<%-- <%@include file='./../common/navFile.jsp'%> --%>
<%@ page import="java.util.*"%>
<% 
    //appName = 애플리케이션 이름(프로젝트 이름_Student)
	 String appName = request.getContextPath();
	/* out.print("프로젝트 이름 : " + appName); */

%>
<%-- jstl을 위한 태그 라이브러리 선언 --%>
<!-- prefix alias느낌 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	Member mem = new Member();
	mem.setId("hong");
	mem.setName("홍길동");
	//session.setAttribute("loginfo", mem); //로그인시
	session.setAttribute("loginfo", null); //미로그인시
	
	
	//경고성 alert Box
	session.setAttribute("alertMessage", "아이디/비번 정보를 잘못 입력하셨습니다.");
%>

<!-- whologin변수는 현재 로그인 상태를 알려주는 변수입니다.-->
<!-- 미로그인(0) 일반 사용자(1) 관리자(2)-->
	<c:set var="whologin" value="0"></c:set>
	<c:if test="${not empty sessionScope.loginfo}">
		<c:if test="${sessionScope.loginfo.id == 'admin'}">
			<c:set var="whologin" value="2"></c:set>
		</c:if>
		<c:if test="${sessionScope.loginfo.id != 'admin'}">
			<c:set var="whologin" value="1"></c:set>
		</c:if>
	</c:if>
<!DOCTYPE html>
<html>
	<head>
	<!-- sweetalert 사용하기 위한 js파일 임포트 -->
	<script type="text/javascript" src="./../js/sweetalert.js">
	</script>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- 공통으로 참조 되는 파일임. -->
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">쇼핑몰</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					
					<!-- 로그인시 회원 이름 표시 -->
					<c:if test="${whologin eq 0}">
						<li class="nav-item"><a class="nav-link" href="#">미로그인</a></li>
					</c:if>
					
					<c:if test="${whologin ne 0}">
						<li class="nav-item"><a class="nav-link" href="#">${sessionScope.loginfo.name}님</a></li>
					</c:if>
					
					<!-- 회원 목록 -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">회원</a>
						<ul class="dropdown-menu">
							
							<c:if test="${whologin eq 0}"> 
								<!-- 로그인 안된 사람만 -->
								<li><a class="dropdown-item" href="#">회원가입</a></li>
								<li><a class="dropdown-item" href="#">로그인</a></li>
							</c:if>
							<c:if test="${whologin ne 0}">
								<!-- 로그인 된 사람만 -->
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
								<c:if test="${whologin ne 0}"><!-- 회원만 -->
									<li><a class="dropdown-item" href="#">게시물 등록</a></li>
								</c:if>
									<li><a class="dropdown-item" href="#">목록 보기</a></li>
							</ul>
						</li>
						
					<!-- 상품 보기 -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">상품</a>
						<ul class="dropdown-menu">
							<!-- 관리자만 -->
							<c:if test="${whologin ne 0}">
								<li><a class="dropdown-item" href="#">상품 등록</a></li>
							</c:if>
								<li><a class="dropdown-item" href="#">상품 목록</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<c:if test="${not empty sessionScope.alertMessage}">
		<!-- 사용자에게 주의/경고/오류 등을 알려주기 위한 Alert Box -->
		<div class="alert alert-success alert-dismissible" style="margin: 10px 10px 0px 10px;">
	  		<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
	  		<strong>로그인 실패</strong> ${sessionScope.alertMessage}
		</div>
	</c:if>
	<!-- 보여준 alertbox를 제거합니다. -->
	<c:remove var="alertMessage" scope="session"/>
</body>
</html>