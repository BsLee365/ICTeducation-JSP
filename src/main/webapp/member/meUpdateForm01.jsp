<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file='./../common/bootstrap5.jsp'%>
<%@include file='./../common/common.jsp'%>
<%@page import="com.shopping.model.dao.MemberDao"%>
<%@page import="com.shopping.model.bean.Member"%>

<%
	//스크립트 릿: 자바 코딩하는 곳.
	/* String id = request.getParameter("id");
	out.print("아이디 : " + id); */
	
	String id = "hong";
	MemberDao dao = new MemberDao();
	Member bean = dao.getDataByPk(id);
	
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>회원 정보 수정</title>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var gender = '<%=bean.getGender()%>';
			$('input[value="'+gender+'"]').attr('checked', true);
			
			
			var hobby = '<%=bean.getHobby()%>';
			var myhobby = hobby.split(",");
			
			var selecth = $('input[name=hobby]');
			
			console.log("같지롱");
			for (var i = 0; i < selecth.length; i++) {
				for (var j = 0; j < myhobby.length; j++) {
					if (selecth[i].value == myhobby[j]) {
						$('input[id=' + (j+1) + ']').attr('checked', true);
					}
				}
			}
		});
		
	</script>
	
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
	</head>
<body>
	<%-- <h1><%="아이디 : " + id %></h1> --%>
	<div class="container">
		<h2>회원 정보 수정</h2>
		<p>회원 가입하는 페이지 입니다.</p>
		
		<form action="">
			<div class="input-group">
				<span class="input-group-text">아이디</span>
				<input disabled class="form-control" type="text" id="fake" name="fake" value=<%=bean.getId()%>>
				<input  type="hidden" id="id" name="id" value=<%=bean.getId()%>>
			</div>
			
			<div class="input-group">
				<span class="input-group-text">패스워드</span>
				<input class="form-control" type="password" id="" name="" value=<%=bean.getPassword()%>>
			</div>
			
			<div class="input-group">
				<span class="input-group-text">이름</span>
				<input class="form-control" type="text" id="" name="" value=<%=bean.getName()%>>
			</div>
			
			<div class="input-group">
				<span class="input-group-text">생일</span>
				<input class="form-control" type="datetime" id="" name="" value=<%=bean.getBirth()%>>
			</div>
				
			<div class="input-group">
				<span class="input-group-text">성별</span>
				<div class="form-control">
					<label class="radio-gender">
						<input type="radio"id="1" name="gender" value="male">남자
					</label>
					<label class="radio-gender">
						<input type="radio"id="2" name="gender" value="female">여자
					</label>
				</div>
			</div>
				
			<div class="input-group">
				<span class="input-group-text">취미</span>
				<div class="form-control">
					<label class="radio-inline check-hobby hobby">
						<input type="checkbox" id="1" name="hobby" value="축구">축구
					</label>
					<label class="radio-inline check-hobby hobby">
						<input type="checkbox" id="2" name="hobby" value="야구">야구
					</label>
					<label class="radio-inline check-hobby hobby">
						<input type="checkbox" id="3" name="hobby" value="배구">배구
					</label>
					<label class="radio-inline check-hobby hobby">
						<input type="checkbox" id="4" name="hobby" value="농구">농구
					</label>
					<label class="radio-inline check-hobby hobby">
						<input type="checkbox" id="5" name="hobby" value="탁구">탁구
					</label>
					<label class="radio-inline check-hobby hobby">
						<input type="checkbox" id="6" name="hobby" value="구구">구구
					</label>
				</div>
			</div>
				<div class="input-group">
					<span class="input-group-text">결혼여부</span>
					<div class="form-control">
						 <label class="radio-inline"><input type="radio" id="1" name="marriage"> 미혼</label>
						 <label class="radio-inline"><input type="radio" id="2" name="marriage"> 결혼</label>
						 <label class="radio-inline"><input type="radio" id="3" name="marriage"> 이혼</label>
					</div>
				<div class="input-group">
					<span class="input-group-text">봉급</span>
					<input class="form-control" type="text" id="" name="" value=<%=bean.getSalary()%>>
				</div>
				
				<div class="input-group">
					<span class="input-group-text">주소</span>
					<input class="form-control" type="text" id="" name="" value=<%=bean.getAddress()%>>
				</div>
				
				<div class="input-group">
					<span class="input-group-text">매니저</span>
					<input class="form-control" type="text" id="" name="" value=<%=bean.getManager()%>>
				</div>
			</div>
			<div class="button-set">
				<button type="submit" class="btn btn-primary">등록</button>
				&nbsp;
				<button type="reset" class="btn btn-primary">초기화</button>
				&nbsp;
				<a type="button" href="meLoginForm01.jsp" class="btn btn-primary">취소</a>
			</div>
		</form>
	</div>
</body>
</html>