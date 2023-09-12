<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file='./../common/common.jsp'%>

<!DOCTYPE html>
<html>
	<head>
	<!-- 그림 확대 js css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-picZoomer.css">
	<script src="${pageContext.request.contextPath}/js/jquery.picZoomer.js"></script>
	
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
		const maxPurchaseSize = 5;
		/* const price = 10000; 단가 */
		
		$(document).ready(function(){
			
			var price = ${bean.price}; //단가
			
			// Select all elements with data-toggle="popover" in the document
			$('[data-toggle="popover"]').popover();
		
			// Select a specified element
			$('#myPopover').popover();
			
			$('#qty').innerWidth($('.minus').innerWidth()-3);
			$('#totalprice').text('0');
			
			/* attr() 함수는 속성(attribute)을 읽거나 쓰기 위한 함수 */
			$('.small_image').click(function(){
				$('.active_image').attr('src', $(this).attr('src'));
			});
			
			$('.plus').click(function(){ /* +버튼 */
				var qty = $('#qty').val();
				if (qty == maxPurchaseSize) {
					alert("최대구매 수량은" + maxPurchaseSize +"까지 입니다.");
					return; /* 더이상 진행을 막음. */
				}
				/* Number 객체는 Integer.parseInt()와 동일한 효과 */
				var newQty = Number(qty) + 1;
				if(qty == ''){
					$('#qty').val('1');
				}else{
					$('#qty').val(newQty);
				}
				var amount = newQty*price;
				$('#totalprice').text(amount.toLocaleString());
			})
			
			
			$('.minus').click(function(){ /* -버튼 */
				var qty = $('#qty').val();
				if(qty == '0'){
					alert("더 이상 물건이 없습니다.");
					return;
				}
				var newQty = Number(qty) - 1;
				if(qty == ''){
					$('#qty').val('1');
					$('#totalprice').text('0');
				}else{
					$('#qty').val(newQty);
					var amount = newQty*price;
					$('#totalprice').text(amount.toLocaleString());
				}
			})
			
			$('#qty').blur(function(){ /* 수량 입력란이 포커스를 잃을 때 */ 
				var qty = $('#qty').val();
				if(qty == '' || isNaN(qty) == true){
					alert("" + maxPurchaseSize + '이하의 숫자만 가능합니다.');
					$('#qty').val('0');
					$('#qty').focus();
					return;
				}
				if(isNaN(qty) == false){
					var newQty = Number(qty);
					if(newQty < 0 || newQty >= maxPurchaseSize){
						alert("0이상" + maxPurchaseSize + '이상의 숫자만 가능합니다.');
						$('#qty').val('0');
						$('#qty').focus();
						return;
					}
				}
			})
			
			$('.cart').click(function(){ /* 장바구니 클릭 */
				var qty = $('#qty').val();
				if(qty < 1 || qty > 5){
					alert('최소 1개 이상 카트에 담을 수 있습니다.');
					return;
				}
				
			})
			
			$('.rightnow').click(function(){ /* 즉시 구매 클릭 */
				var qty = $('#qty').val();
				if(qty < 1 || qty > 5){
					alert('즉시 구매는 최소 1개 이상 가능합니다.');
					return;
				}
			})
			$('.picZoomer').picZoomer();
		})
	</script>
	<style>
		.container{
			margin-top: 2px;
		}
		.card {
			margin-top: 6px;
			margin-left: auto;
			margin-right: auto;
		}
		
		.leftside {
			margin-left: 0px;
		}
		
		.card_borderless {
			border: 0px;
		}
		
		.small_image {
			width: 100px;
			height: 100px;
			margin: 2px;
			border-radius: 5px;
		}
		
		#totalprice {
			color: red;
			font-size: 20px;
			font-weight: bolder;
		}
		
		.cart {
			background-color: black;
			border: 1px solid black;
		} /* 속성 표기법 */
		.rightnow {
			background-color: red;
			border: 1px solid red;
		}
		
		#qty {
			margin: -1px;
			border: 0px;
			font-size: 0.7rem;
		}
		
		.plus, .minus {
			font-size: 1.1rem;
		}
</style>
	</head>
	<body>
		<div class="container">
			<h2><a style="text-decoration: none; color: black;" href="./prList02.jsp">상품 목록</a></h2>
			<p>고객들이 구매하고자하는 상품들의 목록을 보여주는 페이지 입니다.</p>
			<table class="table table-borderless">
			<!-- table-hover table-striped table-condensed-->
				<thead>

				</thead>
				<tbody>
					<tr>
						<td class="col-lg-5">
							<div class="card picZoomer">
								<img alt="${bean.name}" src="upload/${bean.image01}" class="card-img-top active_image">
							</div>
					</td>
					
						<td class="col-lg-1">
							<img alt="${bean.name}" src="upload/${bean.image01}" class="card-img-top small_image rounded">
							
							<c:if test="${not empty bean.image02}">
								<img alt="${bean.name}" src="upload/${bean.image02}" class="card-img-top small_image rounded">
							</c:if>
							<img alt="${bean.name}" src="upload/${bean.image03}" class="card-img-top small_image rounded">
						
						</td>
						
						<td class="col-lg-6">
							<div class="card leftside card_borderless" style="width: 18rem;">
								<h5 class ="card-title">${bean.name}</h5>
								<p class="card-text">${bean.contents}</p>
								<p class="card-text">
									합계 : <span id="totalprice">10000</span>원
								</p>
								<ul class="pagination">
								  <li><a href="#" class="page-link minus">-</a></li>
								  <li class="page-item">
								  	<a class="page-link" href="#" style="width: 50px;">
								  		<input type="text" name="qty" id="qty" value="0" class="page-link" data-bs-trigger="hover" data-toggle="popover" title="수량 누적 알림" data-content="기존 카트에 품목이 이미 존재하면 수량을 누적합니다.">
								  	</a>
								  </li>
								  <li><a href="#" class="page-link plus">+</a></li>
								</ul>
								
								<div class="btn-group">
									<button type="button" class="btn btn-primary cart">장바구니</button>
									<button type="button" class="btn btn-primary rightnow">바로구매</button>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			
		</div>
	</body>
</html>