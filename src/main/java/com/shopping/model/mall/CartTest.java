package com.shopping.model.mall;

import java.util.*;

//CartManager 클래스를 위한 한시적 테스트용 클래스입니다.
public class CartTest {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		
		int pnum = 0, qty = 0;
		CartMap cartMap = new CartMap();
		CartManager manager = new CartManager(); //카트 관리자 객체
		
		System.out.println("상품 품목");
		Map<Integer ,CartItem> itemList = cartMap.GetItemList();
		
		for(Integer key :itemList.keySet()) {
			CartItem item = itemList.get(key);
			System.out.println(item);
		}
		
		
		while(true) {
			System.out.println("\n1.카트 목록보기, 2.추가, 3.삭제, 4.수정, 5.품목 갯수 확인, 6.카트 비우기, 0.종료");
			int menu = scan.nextInt();
			
			switch (menu) {
			case 0: 
				System.out.println("프로그램 종료");
				System.exit(0);//정상 종료 되었음을 운영체제에게 통보하기
				break;
			
			case 1: 
				System.out.println("구매 수량 정보");
				Map <Integer, Integer> cartlists = manager.getAllCartList(); 
				
				System.out.println("카트 : " + cartlists);
				
				
				break;
			
			case 2: 
				System.out.print("추가할 상품 번호 입력 :");
				pnum = scan.nextInt();
				System.out.print("구매 수량 입력 : ");
				qty = scan.nextInt();
							
				manager.AddCart(pnum, qty);
		
				break;
			
			case 3: 
				System.out.println("삭제할 상품 번호 입력");
				pnum = scan.nextInt();
				manager.DeleteCart(pnum);
				break;
			
			case 4: 
				System.out.println("이전 개수에 덮어 씁니다.");
				System.out.print("수정할 상품 번호 입력 : ");
				pnum = scan.nextInt();
				
				System.out.print("구매 수량 입력 : ");
				qty = scan.nextInt();
				
				manager.EditCart(pnum, qty);
				
				break;
			
			case 5: 
				int size = manager.GetCartItemSize();
				System.out.println("구매할 품목 갯수 : " + size);
				
				break;
			case 6: 
				System.out.println("");
				manager.RemoveAllCart();
				
				break;
			
		}
	}
}
	
}
