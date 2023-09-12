<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file='./../common/common.jsp'%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<style type="text/css">
		.input-group{
			margin-top: 10px;
			width: 100%;
		}
		#contents {
			width: 50%;
			padding-right: 10%;
		}
		.emoticon{
			text-decoration: none;
		}
	</style>
	<style type="text/css">
      /* 댓글들을 위한 스타일 지정 */
      * {
         padding: 0;
         margin: 0;
         color: #333;
      }
      ul { list-style: none; }
      #container { padding: 30px 20px; }
      #insertComment {
         padding: 20px 15px;
         border-bottom: 1px solid #7BAEB5;
      }

      #insertComment label {
         display: inline-block;
         width: 80px;
         font-size: 14px;
         font-weight: bold;
         margin-bottom: 10px;
      }

      #insertComment input[type='text'], #insertComment textarea {
         border: 1px solid #ccc;
         vertical-align: middle;
         padding: 3px 10px;
         font-size: 12px;
         line-height: 150%;
      }

      #insertComment textarea {
         width: 450px;
         height: 120px ;
      }

      .commentItem {
         font-size: 13px;
         color: #333;
         padding: 15px;
         border-bottom: 1px dotted #ccc;
         line-height: 150%;
      }

      .commentItem .id {
         color: #555;
         line-height: 200%;
      }

      .commentItem .id input {
         vertical-align: middle;
      }

      .commentItem .id .name {
         color: #222;
         font-weight: bold;
         font-size: 14px;
      }
      
      .form-group {
         margin-bottom: 3px;
      }
      
      .form-control {
         height: 25px;
      }
      .btn-primary{opacity: 0.8;}
   </style>
	<script type="text/javascript">
		//삭제버튼 클릭
		//on()메소드는 선택된 요소에 이벤트 핸들러 함수를 연결시켜 주는 기능을 합니다.
		//cnum이라는 속성을 개발자가 지정해 두었습니다.
		$(document).on('click','.delete_btn',function(){
			if(confirm('선택하신 항목을 삭제하시겠습니까?')){
				$.ajax({
					url:'<%=notWithFormTag%>cmDelete', 
					data:'cnum=' + $(this).attr('cnum'),
					type:'GET',
					dataType:'text',
					success: function(result,status){
						console.log(result);
						console.log(status);
						getListComment();
					}
				});
			}
		});

		function getListComment(){
			$('#comment_list').empty();
			/* $.ajax() 함수를 이용하여 데이터 보여주기.*/
			$.ajax({
				url:'<%=notWithFormTag%>cmList', 
				data:'no=' + '${bean.no}',
				type:'GET',
				dataType:'json',
				success: function(result,status){
					/* result는 넘어온 데이터 결과 값 */
					console.log(result);
					$.each(result, function(idx){ /* idx는 색인 번호 */
						var cnum =result[idx].cnum;
						var id =result[idx].id;
						var content =result[idx].content;
						var regdate =result[idx].regdate;
						addNewItem(cnum, id, content, regdate);
					});
				}
			});
		}
		
		function addNewItem(cnum, id, content, regdate){
			/* 댓글 1개를 추가해주는 함수입니다. */
			var litag = $('<li>'); /* 댓글의 외곽 li 태그 */
			litag.addClass('commentItem');
			
			var ptag = $('<p>'); /* 작성자 정보가 들어갈 태그 */
			ptag.addClass('id');
			
			var spantag = $('<span>'); /* 작성자 이름이 들어갈 태그 */
			spantag.addClass('name');
			spantag.html(id+"님");
			
			var spandate = $('<span>'); /* 작성일자가 들어갈 태그 */
			spandate.html("&nbsp;&nbsp;/&nbsp;&nbsp;" + regdate + '&nbsp;');
			
			if(id == '${sessionScope.loginfo.id}'){ //로그인한 사람이 작성한 댓글이면 삭제 가능
				var inputtag = $('<input>'); //삭제 버튼
				var attrlist = {'id':id, 'type':'button', 'value':'삭제', 'class': 'btn btn-outline-primary', 'cnum':cnum};
				inputtag.attr(attrlist);
				inputtag.addClass('delete_btn');
			}else{
				var inputtag = ''
			}
			
			var content_p = $('<p>'); //작성한 댓글 내용
			content_p.html(content);
			
			//조립하기
			ptag.append(spantag).append(spandate).append(inputtag);
			litag.append(ptag).append(content_p);
			
			$('#comment_list').append(litag);
		}
		
		$(document).ready(function(){
			getListComment();
			//like또는 hate 버튼 눌렀을때 갱신
			$('#emoticon').on('click', function{
				location.replace(location.href);
			})
			
			
			
			/* 사용자가 댓글을 입력하고, 전송 버튼을 눌렀습니다. */
			$('#comment_form').submit(function() {
				/* 댓글 입력 없이 전송 버튼을 누른 경우 */
				if(!$('#content').val()){
					alert('댓글을 입력해 주셔야 합니다.');
					$('#content').focus();
					return false;
				}
				//post방식으로 데이터를 전송합니다.
				var URL = '<%=notWithFormTag%>cmInsert';
				var parameters = $('#comment_form').serialize();
				$.post(URL, parameters, function(data){
					$('#content').val('');
					//getListcomment(); //목록 갱신하기
					location.reload();	
					
				}).fail(function(){
					alert('댓글 작성에 실패하였습니다.');
					return false;
				});
				return true;
			});
		});
	</script>
	<title>Insert title here</title>
	</head>
<body>
	<div class="container">
		<h2>게시글 상세 페이지</h2>
		<p>게시글의 상세 페이지 입니다.</p>
		
		<div class="input-group">
			<span class="input-group-text">게시글 번호</span>
			<input type="text" value="${bean.no}" class="input-group-text" id="contents" readonly="readonly"/>
		</div>
		<div class="input-group">
			<span class="input-group-text">아이디</span>
			<input type="text" value="${bean.id}" class="input-group-text" id="contents" readonly="readonly"/>
		</div>
		<div class="input-group">
			<span class="input-group-text">패스워드</span>
			<input type="text" value="${bean.password}" class="input-group-text" id="contents" readonly="readonly"/>
		</div>
		<div class="input-group">
			<span class="input-group-text">제목</span>
			<input type="text" value="${bean.subject}" class="input-group-text" id="contents" readonly="readonly"/>
		</div>
		<div class="input-group">
			<span class="input-group-text">내용</span>
			<input type="text" value="${bean.content}" class="input-group-text" id="contents" readonly="readonly"/>
		</div>
		<div class="input-group">
			<span class="input-group-text">조회수</span>
			<input type="text" value="${bean.readhit}" class="input-group-text" id="contents" readonly="readonly"/>
		</div>
		<div class="input-group">	
			<span class="input-group-text">업로드 일자</span>
			<input type="text" value="${bean.regdate}" class="input-group-text" id="contents" readonly="readonly"/>
		</div>
		<%-- <div class="input-group">
			<span class="input-group-text">리마크?</span>
			<input type="text" value="${bean.no}" class="input-group-text"/>
		</div> --%>
		<div class="input-group">
			<span class="input-group-text">depth?</span>
			<input type="text" value="${bean.depth}" class="input-group-text" readonly="readonly"/>
		</div>
		
		<div>
			<%--댓글 영역--%>
			<ul id="comment_list">
				<%--여기에 동적으로 요소들을 추가합니다.--%>
						
			</ul>
		</div>
		<%--댓글 작성 영역--%>
		<div id="insertComment">
               <form id="comment_form" method="post" role="form" class="form-horizontal" >
                  <table class="table">
                      <thead>
                      </thead>
                      <tbody>
                        <tr>
                          <td>
                             <label for="content" class="col-xs-3 col-lg-3 control-label">작성자</label>              
                          </td>
                          <td>
                           <input type="hidden" name="no" value="${bean.no}" />
                           <input type="text" name="fakeid" id="fakeid" class="form-control" size="10" 
                              disabled="disabled" value="${sessionScope.loginfo.name}(${sessionScope.loginfo.id})님">                           
                           <input type="hidden" name="id" id="id" value="${sessionScope.loginfo.id}">
                          </td>
                        </tr>
                        <tr>
                          <td>
                             <label for="content" class="col-xs-3 col-lg-3 control-label">댓글 내용</label>
                          </td>
                          <td>
                             <textarea name="content" rows="3" cols="50" id="content" ></textarea>
                          </td>
                        </tr>
                        <tr>
                          <td colspan="2">
                             <button type="submit" class="btn btn-info">저장하기</button> 
                        </td>
                        </tr>
                      </tbody>
                  </table>
                  <!-- 좋아요 싫어요 버튼 시작 -->
                 &nbsp;&nbsp;&nbsp;
		         <a class="emoticon" href="<%=notWithFormTag%>boEmoticon&mode=likes&no=${bean.no}">
		            <img src="<%=appName%>/image/likes.png" width="30px" height="30px" alt="">
		            ${bean.likes}
		         </a>
		         &nbsp;&nbsp;
		         <a class="emoticon" href="<%=notWithFormTag%>boEmoticon&mode=hates&no=${bean.no}">
		            <img src="<%=appName%>/image/hates.png" width="30px" height="30px" alt="">
		            ${bean.hates}
		         </a>
		         <!-- 좋아요 싫어요 버튼 끝 --> 
               </form>   
            </div>
	</div>
</body>
</html>