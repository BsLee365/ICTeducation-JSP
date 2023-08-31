<!-- 로그인 절차 jsp 파일 -->
<%@page import="com.shopping.model.bean.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file='./../common/bootstrap5.jsp'%>
<%@include file='./../common/common.jsp'%>
<%
	Map<String, String> memberList = new HashMap<String, String>();
	memberList.put("admin", "1234");
	memberList.put("hong", "1234");

%>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	boolean isLogin = false; //false이면 로그인 실패(기본 값)
	
	boolean isIDExist = memberList.containsKey(id); //id 존재 여부
	
	if(isIDExist){ //아이디가 존재하는 경우
		String dbpassword = memberList.get(id);
		if(password.equals(dbpassword)){
			isLogin = true; //로그인 성공
			
		}
	}else{ //존재하지 않는 경우
		
	}
	
	String message = "";
	if(isLogin){
		//로그인 성공시
		Member member = new Member();
		mem.setId(id);
		mem.setPassword(password);
		
		//세션에 저장할 나의 로그인 정보 이름은 loginfo 라고 하겠습니다.
		session.setAttribute("loginfo", member); //나의 로그인 정보 저장.
		
		//sendRedirect : 리다이렉션 방식으로 페이지 전환
		response.sendRedirect("./../product/prList02.jsp");
		
	} 
	else{
		session.setAttribute("alertMessage", "아이디/비밀번호를 잘못 입력하셨습니다.");
		response.sendRedirect("./meLoginForm02.jsp");
	}
	out.print(message + id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	로그인 처리 페이지
</body>
</html>