<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery = javascript + css + etc 등들을 집대성해놓은 라이브러리 -->
<!-- jQuery.js 파일 내에 여러가지 함수 등을 정의해 두었습니다. -->
<script type="text/javascript" src="./../js/jquery.js" ></script>
<script type="text/javascript">
	/*문서가 완전 로딩 되었을 때 document ready 구문이 실행*/
	$(document).ready(function(){
		/* alert("안녕하세요"); */
		/* console.log('호호호'); */
	
		var a = 10;
		var b = 5;
		var c = a + b;
		var result =  a + " + " + b + " + " + c;
		console.log(result)
		
		var label_count=$('label').length;
		console.log("라벨의 갯수 : " + label_count);
		
		$('#label_count').html('<b>'+ label_count + '</b>');
		/* alert($('#label_count').html()); */
		
		/*addClass(calssName) : class="className"이라는 속성을 추가합니다.*/
		$('label').addClass('label_style');
		/*클래스 속성을 제거할 수 도 있음.*/
		$('#age').removeClass('label_style');
		
		/* 속성을 직접 추가 가능 */
		$('#age').attr('style', 'font-size: 35px;')
		
		/* 태그로 css입힐 수 있음 */
		$('#hobby').css('color', 'blue').css('background-color', 'red');
		/* $('#hobby').css('color', ''); */
		
		/* 반복문 */
		var label_string = '';
		$('label').each(function(){
			label_string += $(this).text() + '<br>';
		});
		$('#label_text').html(label_string);
		
		/* 버튼 클릭하여 화면에 노출 */
		$('#check01').click(function(){
			/* console.log("1번 버튼 클릭됨"); */
			var checklist = $(':checkbox');
			/* console.log('type="checkbox"인 항목 개수' + checklist.length); */
			
			var result = "";
			for(var i = 0; i < checklist.length; i++){
				if(checklist[i].checked){
					result += checklist[i].value + ' ';
				}
			}
			$("#check_result_01").html(result);
		});
		/* 라디오 버튼 항목 출력 */
		$('#radio01').click(function(){
			console.log('라디오 버튼 클릭 됨');
			
			var checklist = $(':radio');
			
			var result = "";
			for (var i = 0; i < checklist.length; i++) {
				if(checklist[i].checked){
					result += checklist[i].value + " ";
				}
			}
			$('#check_radio_01').html(result);
		});
		
		
		/* 모두 체크 만들어보기 */
		$('#check02').click(function(){
			var checklist = $('input[name=hobby]:checkbox');
			checklist.prop('checked', true);
			
		});
		
		/* name이 password인것 찾아서 바꿈 */
		$('input[name=password]').css('color', 'red');
		
		/* 수많은 라벨 중 비밀번호 라벨 가져오기 */
		var labellist = $('label')
			var passlabel = labellist.each(function(){
				if($(this).text() == "비밀번호"){
					$(this).css("color", 'red').css('font-size', '30px');
				}
			});
		
		/* 속성으로 지정해보기 */
		$(':disabled').attr('placeholder', "사용 불가합니다.");
		
		/* 선택된 항목 가져오기 */
		/* var text = $('option[selected="selected"]').value();
		console.log(text); */
		
	});
	
</script>
<style>
	.label_style {
		background-color: yellow;
	}
</style>
</head>
<body>
	<h1>폼양식</h1>
	<form action="jqueryTest01.jsp">
		<label>아이디</label>
		<input name="id" disabled="disabled"><br>
		
		<label>비밀번호</label>
		<input name="password" type="password"><br>
	
		<label>이름</label>
		<input name="name" disabled="disabled"><br>
		
		<label id="age">나이</label>
		<input name="age"><br>
		
		<label>생일</label>
		<input name="birthday" type="date"><br>
		
		<label>이미지</label>
		<input name="age" type="image"><br>
		
		<label>숨김 파라미터 :</label>
		<input type="hidden" name="money" value=12000><br>
		
		<label>성별 :</label>
		<input type="radio" name="gender" value="남자" checked="checked">남자
		<input type="radio" name="gender" value="여자">여자<br>
		
		<label id="hobby">취미 :</label>
		<input type="checkbox" name="hobby" value="당구">당구
		<input type="checkbox" name="hobby" value="축구">축구
		<input type="checkbox" name="hobby" value="야구">야구
		<input type="checkbox" name="hobby" value="농구">농구
		<input type="checkbox" name="hobby" value="배구">배구
		<br>
		
		<label>직업 :</label>
		<select name="job">
			<option value="의사">의사
			<option value="판사">판사
			<option value="검사">검사
			<option value="형사">형사
			<option value="장의사">장의사
		</select>
		<br>
		
		<label>코멘트 :</label>
		<textarea name="comments" rows="2" cols="10"></textarea>
		<br>
		
		<input type="submit" value="전송">
		&nbsp;
		<input type="reset" value="초기화">
	</form>
	<hr>
	라벨 개수 : <span id="label_count"></span><br>
	라벨 문구 : <span id ="label_text"></span><br>
	
	<button id="check01">체크 요소 확인 01</button><br>
	<button id="check02">체크 요소 확인 02 (모두 체크)</button><br>
	<button id="radio01">라디오 요소 확인 01</button><br>
	
	<button onclick="changeText()">글자를 바꿔보자</button>
	체크 결과 01: <span id="check_result_01"></span><br>
	라디오 체크 결과: <span id="check_radio_01"></span>
	
	
</body>
</html>