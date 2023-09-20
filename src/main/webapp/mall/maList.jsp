<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file='./../common/common.jsp'%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	/* 총 금액과 적립 포인트를 위한 스타일 지정 */
	.LargeSpan{
		color: red;
		font-size: 1.2em;
		font-weight: bolder;
	}
	img{
		width:45px;
		height:45px;
	}
	/* 수정 버튼을 위한 스타일 지정 */
	.row{
		margin: auto;
		vertical-align: middle;
	}
	.col{
		margin: -30px;
		vertical-align: middle;
	}
	.form-control-sm{
		width: 80px;
		height: 30px;
		border: 2px solid Gainsboro;
	}
	
</style>

<script type="text/javascript">
	/* 카트 목록에서 특정 상품(변수 : pnum) 개수를 변경해주는 함수 */
	function editQty(pnum){
		
		/* 입력 양식을 'edit_상품번호' 형식으로 만들어 두었습니다. */
		var qty = $('#edit_' + pnum).val();
		
		if(!qty){
			alert('수정할 개수를 입력해 주세요.');
			$('#edit_' + pnum).focus();
			return false;
		}
		/* 수정될 상품의 번호와 수정량을 컨트롤러로 넘깁니다. */
		location.href = '<%=notWithFormTag%>maUpdate&pnum=' + pnum + '&qty=' + qty;
	}



	function checkAll(){
		if($('#checkall').prop('checked')){ /* 전체 선택 on */
			$('input[name=cartCheckBox]').prop('checked', true);
		}else{ /* 전체선택 off */
			$('input[name=cartCheckBox]').prop('checked', false);
		}
		
		
		reCalculateAmount();
	}

	function reCalculateAmount(){
		/* 개별 체크 박스의 상태가 변경되거나, 전체 선택 체크의 상태 변경시 호출됨. */
		var cartTotalPrice = 0;
		var cartTotalPoint = 0;
		
		/* 체크 상태가 on인 항목들을 반복합니다. */
		$('#checkall').prop('checked', true);
		  	$('input[name=cartCheckBox]:checked').each(function(){
		  		var pnum = $(this).val();
		  		var price = $('.price_'+pnum).attr('data');
		  		var point = $('.point_'+pnum).attr('data');
		  		var qty = $('.qty'+pnum).attr('data');
		  		
		  		cartTotalPrice += price * qty;
		  		cartTotalPoint += point * qty;
		  		
		  		console.log(pnum)//값은 들어옴.  
		  	});
		
		 
		$('.cartTotalPrice').html(AddComma(cartTotalPrice));
		$('.cartTotalPoint').html(AddComma(cartTotalPoint));
		
		
	}
	
    function AddComma(num){ /* 3자리마다 콤마 유형 넣기 */
        var regexp = /\B(?=(\d{3})+(?!\d))/g;
        return num.toString().replace(regexp, ',');
    }

	$(document).ready(function(){
		  $('#checkall').prop('checked', true); /* 전체 선택 체크 박스 on */
		  	$('input[name=cartCheckBox]').each(function(){
		  		$(this).prop('checked', true);
		  	});
		  	$('input[name=cartCheckBox]').change(function(){
		  		/* 개별 체크 박스의 상태 변경 */
		  		reCalculateAmount();
		  	});
	});
	
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container mt-3">
		<h2>카트 내역 보기</h2>
		<p>나의 관심/구매 예정인 목록에 대한 정보를 보여줍니다.</p>
		<table class="table table-striped">
			<thead>
				<tr>
				<%--전체선택 버튼 시작--%>
					<th width="9%">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="checkall"
								name="option1" onclick="checkAll();"> <label
								class="form-check-label">전체 선택</label>
						</div>
					</th>
					<%--전체선택 버튼 끝--%>
					<th>상품명</th>
					<th>수량</th>
					<th>단가</th>
					<th>포인트</th>
					<th>금액</th>
					<th>누적포인트</th>
					<th colspan="2">수정/삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="totalAmount" value="0"/>
				<c:set var="totalPoint" value="0"/>
				<c:forEach var="bean" items="${sessionScope.cartWishList}">
					<tr>
						<td align="center" valign="middle">
							<div class="form-check">
								<input type="checkbox" name="cartCheckBox" value="${bean.pnum}">
							</div>
						</td>
						<td align="center" valign="middle">
						<img alt="${bean.pname}" class="rounded" src="upload/${bean.image01}"><br>
						${bean.pname}
						</td>
						
						<td class="qty_${bean.pnum}" data="${bean.qty}" align="center" valign="middle">${bean.qty}개</td>
						<td class="price_${bean.pnum}" data="${bean.price}" align="center" valign="middle"><fmt:formatNumber value="${bean.price}" pattern="###,###"/></td>
						<td class="point_${bean.pnum}" data="${bean.point}" align="center" valign="middle"><fmt:formatNumber value="${bean.point}" pattern="###,###"/></td>
						<td align="center" valign="middle"><fmt:formatNumber value="${bean.qty*bean.price}" pattern="###,###"/>원</td>
						<td align="center" valign="middle"><fmt:formatNumber value="${bean.qty*bean.point}" pattern="###,###"/>원</td>
						
						<td align="center" valign="middle">
							<div class="row">
								<div class="col">
									<input class="form-control-sm" type="text"
										id="edit_${bean.pnum}" name="edit_${bean.pnum}">
									<button class="btn btn-outline-secondary btn-sm"
										onclick="editQty('${bean.pnum}');">수정</button>
								</div>
							</div>
						</td>
						<td align="center" valign="middle"><a
							href="<%=notWithFormTag%>maDelete&pnum=${bean.pnum}"> 삭제 </a></td>
							
					</tr>
					<%-- 총 금액과 총 누적 포인트를 누적합니다.--%>
					<c:set var="totalAmount" value="${totalAmount += bean.price}"/>
					<c:set var="totalPoint" value="${totalPoint += bean.point}"/>
				</c:forEach>
				<%--결제하기 추가 주문 기능, 총 금액, 총 누적 포인트 영역--%>
				<tr>
					<td align="center" colspan="3">
						<a href="<%=notWithFormTag%>maCalculate">결제하기</a>
						&nbsp;&nbsp;&nbsp;
						<a href="<%=notWithFormTag%>prList">추가 주문</a>
					</td>
					<td align="left" colspan="6">
						<span class="LargeSpan">총금액: <span class="cartTotalPrice"></span><fmt:formatNumber value="${totalAmount}" pattern="###,###"/>원</span>
						&nbsp;&nbsp;&nbsp;
						<span class="LargeSpan">총 적립 포인트: <span class="cartTotalPoint"></span><fmt:formatNumber value="${totalPoint}" pattern="###,###"/>원</span>
						
					</td>
				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>