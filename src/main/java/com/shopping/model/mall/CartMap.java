package com.shopping.model.mall;

import java.util.*;

//이 클래스는 테스트용으로 CartItem 목록을 저장하고 있는 한시적 클래스.
//차후 데이터 베이스를 사용하여 처리할 예정.
public class CartMap {
	private Map<Integer, CartItem> itemList = null;
	
	public CartMap(){
		this.itemList = new HashMap<Integer, CartItem>();
		
		//목록 채워넣기
		itemList.put(1, new CartItem(1, "우유", 10, 1000, "aaa.png", 4));
		itemList.put(2, new CartItem(2, "고기", 20, 2000, "bbb.png", 4));
		itemList.put(3, new CartItem(3, "채소", 30, 3000, "ccc.png", 7));
		itemList.put(4, new CartItem(4, "라면", 40, 4000, "ddd.png", 23));
		itemList.put(5, new CartItem(5, "계란", 50, 5000, "eee.png", 8));
	}
	
	public Map<Integer, CartItem> GetItemList() {
		
		return this.itemList;
	}
	
	
}
