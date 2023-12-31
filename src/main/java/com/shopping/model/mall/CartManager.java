package com.shopping.model.mall;

import java.util.HashMap;
import java.util.Map;

//매장 내의 카트를 관리하기 위한 유틸리티 클래스 입니다.
public class CartManager {
	//carts : 나의 카트에 담겨져 있는 상품들의 번호와 수량 정보
	//카트의 품목은 <제품번호, 수량> 형식입니다.
	private Map<Integer, Integer> carts = null;
	
	public CartManager() {
		this.carts = new HashMap<Integer, Integer>();
	}

	public int GetCartItemSize() {
		//카트에 담겨져 있는 품목의 갯수를 반환합니다.		
		return this.carts.size();
	}

	public void AddCart(int pnum, int qty) {
		// 카트에 상품 품목을 추가
		if(this.carts.containsKey(pnum)) { //이미 카트에 품목이 있는 경우
			int newQty = this.carts.get(pnum) + 1;
			this.carts.put(pnum, newQty);
		}else {
			if(qty != 0) {
				this.carts.put(pnum, qty);	
			}
		}
	}

	public void EditCart(int pnum, int qty) {
		// 카트 내의 상품 수량을 변경합니다. (overwrite)
		if(this.carts.containsKey(pnum)) {
			this.carts.put(pnum, qty);
		}else {
			System.out.println("수정할 품목이 없습니다.");
		}
		
	}

	public void DeleteCart(int pnum) {
		//해당 상품 목록을 Cart 품목에서 제거합니다.
		this.carts.remove(pnum);
	}

	public void RemoveAllCart() {
		//카트에 들어 있는 모든 품목을 제거합니다. (결제시 사용할 예정)
		this.carts.clear();
	}

	public Map<Integer, Integer> getAllCartList() {
		//카트 내의 모든 품목들을 반환합니다.
		return this.carts;
	}
	
	
}
