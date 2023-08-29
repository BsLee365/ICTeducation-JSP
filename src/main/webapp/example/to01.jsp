<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	Integer age = Integer.parseInt(request.getParameter("age"));
	String[] hobbies = request.getParameterValues("hobby");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	아이디 : <%=id%> <br>
	이름 : <%=name%> <br>
	나이 : <%=age%><br>
	취미 : <%
			if(hobbies != null){
				for(int i= 0; i < hobbies.length; i++){
					out.print(hobbies[i] + ", ");
				}
			}
			%>

</body>
</html>