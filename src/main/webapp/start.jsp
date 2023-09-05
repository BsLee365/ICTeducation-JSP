<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		/* common.jsp에 위치한 appName은 request.getContextPath(); */
		String gotopage = notWithFormTag + "home"; //Student/Shopping?command=home
		/* out.print(gotopage); */
		response.sendRedirect(gotopage);
	%>
</body>
</html>