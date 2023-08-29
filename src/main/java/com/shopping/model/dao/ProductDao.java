package com.shopping.model.dao;

import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Product;

public class ProductDao {
	public Product findDataFK(int num) {
		Product bean = new Product(num, "우유", "남양", "남양우유.jpg", 12, 3500, "유제품", "이것은 남양주에서 생산된 우유 입니다.", 100, "23/08/23");
		
		return bean;
	}
	public List<Product> getDataList(){
		List<Product> lists = new ArrayList<Product>();
		
		lists.add(new Product(1, "사이다", "남양", "cappuccino02.png", 12, 3500, "유제품", "이것은 남양주에서 생산된 사이다 입니다.", 100, "23/08/23"));
		lists.add(new Product(2, "환타", "남양", "cappuccino02.png", 12, 3500, "유제품", "이것은 남양주에서 생산된 환타 입니다.", 100, "23/08/23"));
		lists.add(new Product(3, "콜라", "남양", "cappuccino02.png", 12, 3500, "유제품", "이것은 남양주에서 생산된 콜라 입니다.", 100, "23/08/23"));
		lists.add(new Product(4, "우유", "남양", "cappuccino02.png", 12, 3500, "유제품", "이것은 남양주에서 생산된 우유 입니다.", 100, "23/08/23"));
		lists.add(new Product(5, "이프로", "남양", "cappuccino02.png", 12, 3500, "유제품", "이것은 남양주에서 생산된 이프로 입니다.", 100, "23/08/23"));
		lists.add(new Product(6, "초코에몽", "남양", "cappuccino02.png", 12, 3500, "유제품", "이것은 남양주에서 생산된 초코에몽 입니다.", 100, "23/08/23"));
		lists.add(new Product(7, "딸기에몽", "남양", "cappuccino02.png", 12, 3500, "유제품", "이것은 남양주에서 생산된 딸기에몽 입니다.", 100, "23/08/23"));
		
		return lists;
	}
}
