<%@page import="com.shopping.model.bean.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./bootstrap5.jsp" %>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% 
    //appName = 애플리케이션 이름(프로젝트 이름_Student)
	 String appName = request.getContextPath();
	/* out.print("프로젝트 이름 : " + appName); */
	
	//FrontController.java, start.jsp
	String mappingName = "/Shopping";
	//form 태그에서 사용할 변수 
	String withFormTag = appName + mappingName;
	//form 태그가 아닌 영역에서 사용할 변수
	String notWithFormTag = appName + mappingName + "?command=";
	
	/* out.print("withFormTag : " + withFormTag + "<br>");
	out.print("notWithFormTag : " + notWithFormTag + "<br>");
	out.print("mappingName : " + mappingName + "<br>"); */
%>
<%-- jstl을 위한 태그 라이브러리 선언 --%>
<!-- prefix alias느낌 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	Member mem = new Member();
	/* mem.setId("hong");
	mem.setName("홍길동"); */
	//session.setAttribute("loginfo", mem); //로그인시
	//session.setAttribute("loginfo", null); //미로그인시
	
	
	//경고성 alert Box
	/* session.setAttribute("alertMessage", "아이디/비번 정보를 잘못 입력하셨습니다.");  */
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
	<!-- <script type="text/javascript" src="./../js/sweetalert.js"> -->
	</script>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- 공통으로 참조 되는 파일임. -->
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="<%=withFormTag%>?command=home">쇼핑몰</a>
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
								<li><a class="dropdown-item" href="<%=notWithFormTag%>meInsert">회원가입</a></li>
								<li><a class="dropdown-item" href="<%=notWithFormTag%>meLogin">로그인</a></li>
								<!-- notWithFormTag = /Student/Shopping?command=meLogin -->
							</c:if>
							<c:if test="${whologin ne 0}">
								<!-- 로그인 된 사람만 -->
								<li><a class="dropdown-item" href="#">정보 수정</a></li>
								<li><a class="dropdown-item" href="<%=notWithFormTag%>meLogout">로그아웃</a></li>
								<li><a class="dropdown-item" href="<%=notWithFormTag%>meDetail&id=${sessionScope.loginfo.id}">상세보기</a></li>
								<li><a class="dropdown-item" href="<%=notWithFormTag%>meDelete&id=${sessionScope.loginfo.id}">탈퇴하기</a></li>
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
									<li><a class="dropdown-item" href="<%=notWithFormTag%>boInsert">게시물 등록</a></li>
								</c:if>
									<li><a class="dropdown-item" href="<%=notWithFormTag%>boList">목록보기</a></li>
							</ul>
						</li>
						
					<!-- 상품 보기 -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">상품</a>
						<ul class="dropdown-menu">
							<c:if test="${whologin ne 0}">
								<li><a class="dropdown-item" href="<%=notWithFormTag%>prInsert">상품 등록</a></li>
							</c:if>
								<li><a class="dropdown-item" href="<%=notWithFormTag%>prList">상품 목록</a></li>
						</ul>
					</li>
					<c:if test="${whologin eq 2}">
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown">회원</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="<%=notWithFormTag%>meList">목록 보기</a></li>
							</ul>
						</li>
					</c:if>
					<!-- 회원 목록 보기 / 관리자만-->

					<!-- 쇼핑몰 section -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">쇼핑몰</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item"
								href="<%=notWithFormTag%>maList"> 카트 내역 보기 </a></li>
							<li><a class="dropdown-item"
								href="<%=notWithFormTag%>maHistory"> 나의 쇼핑 내역 </a></li>
						</ul></li>
						<!-- 쇼핑몰 section 끝 -->
					<!-- 뷰 섹션 -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">데이터 보기</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="<%=notWithFormTag%>vwList">목록보기</a>
							</li>
						</ul>
					</li>
					<!-- 뷰 섹션 끝-->
				</ul>
			</div>
		</div>
	</nav>
	<c:if test="${not empty sessionScope.alertMessage}">
		<!-- 사용자에게 주의/경고/오류 등을 알려주기 위한 Alert Box -->
		<div class="alert alert-success alert-dismissible" style="margin: 10px 10px 0px 10px;">
	  		<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
	  		<strong>경고 메시지</strong> ${sessionScope.alertMessage}
	  		${sessionScope.loginfo}
		</div>
		
	</c:if>
	<!-- 보여준 alertbox를 제거합니다. -->
	<c:remove var="alertMessage" scope="session"/>
</body>
</html>