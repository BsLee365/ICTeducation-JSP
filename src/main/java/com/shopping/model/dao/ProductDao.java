package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.shopping.model.bean.Product;

public class ProductDao extends SuperDao{
	public Product findDataFK(int num) {
		Product bean = new Product(num, "우유", "남양", "남양우유.jpg", null, null, 12, 3500, "유제품", "이것은 남양주에서 생산된 우유 입니다.", 100, "23/08/23");
		
		return bean;
	}
	public List<Product> getDataList(){
		List<Product> lists = new ArrayList<Product>();
		
		lists.add(new Product(1, "사이다", "남양", "cappuccino02.png", "man_casual1.jpg", "man_casual2.jpg", 12, 3500, "유제품", "이것은 남양주에서 생산된 사이다 입니다.", 100, "23/08/23"));
		lists.add(new Product(2, "환타", "남양", "redwine01.png", null, null, 12, 3500, "유제품", "이것은 남양주에서 생산된 환타 입니다.", 100, "23/08/23"));
		lists.add(new Product(3, "콜라", "남양", "redwine02.png", null, null, 12, 3500, "유제품", "이것은 남양주에서 생산된 콜라 입니다.", 100, "23/08/23"));
		lists.add(new Product(4, "우유", "남양", "cappuccino02.png", null, null, 12, 5500, "유제품", "이것은 남양주에서 생산된 우유 입니다.", 100, "23/08/23"));
		lists.add(new Product(5, "이프로", "남양", "cappuccino02.png", null, null, 12, 2500, "유제품", "이것은 남양주에서 생산된 이프로 입니다.", 100, "23/08/23"));
		lists.add(new Product(6, "초코에몽", "남양", "cappuccino02.png", null, null, 12, 1200, "유제품", "이것은 남양주에서 생산된 초코에몽 입니다.", 100, "23/08/23"));
		lists.add(new Product(7, "딸기에몽", "남양", "cappuccino02.png", null, null, 12, 1200, "유제품", "이것은 남양주에서 생산된 딸기에몽 입니다.", 100, "23/08/23"));
		
		return lists;
	}
	
	public Product getDataByPK02(int pnum) {
		
		 ProductDao dao = new ProductDao(); List<Product> products =
		 dao.getDataList();
		  
		 for (int i = 1; i < products.size(); i++) {
		  
		 }
		 
		
		//해당 상품 번호에 맞는 상품 Bean을 반환합니다.
		if(pnum == 1) {
			return new Product(1, "사이다", "남양", "cappuccino02.png", "french_baguette_01.png", "french_baguette_0.png", 12, 3500, "유제품", "이것은 남양주에서 생산된 사이다 입니다.", 100, "23/08/23");
		}
		else if(pnum == 2) {
			return new Product(2, "환타", "남양", "redwine01.png", null, null, 12, 2500, "유제품", "이것은 남양주에서 생산된 환타 입니다.", 100, "23/08/23");
		}
		else {
			return new Product(3, "콜라", "남양", "redwine02.png", null, null, 12, 1500, "유제품", "이것은 남양주에서 생산된 콜라 입니다.", 100, "23/08/23");
		}
	}
	
	public List<Product>selectAll() throws SQLException {
		List<Product> lists = new ArrayList<Product>();
		//데이터 베이스 연결
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		conn = super.getConnection();
		
		String sql = "select * from products";
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(sql);
		
		while (rs.next()) {
			lists.add(getDatabean(rs));
		}
		
		if(rs != null) {
			rs.close();
		}if(pstmt != null) {
			pstmt.close();
		}
		if(conn != null) {
			conn.close();
		}
	
		return lists;
	}
	public Product getDatabean(ResultSet rs) throws SQLException {
		Product bean = new Product();
		
		bean.setNum(rs.getInt("pnum"));
		bean.setName(rs.getString("name"));
		bean.setCompany(rs.getString("company"));
		bean.setImage01(rs.getString("image01"));
		bean.setImage02(rs.getString("image02"));
		bean.setImage03(rs.getString("image03"));
		bean.setStock(rs.getInt("stock"));
		bean.setPrice(rs.getInt("price"));
		bean.setCategory(rs.getString("category"));
		bean.setContents(rs.getString("contents"));
		bean.setPoints(rs.getInt("point"));
		bean.setInputdate(rs.getString("inputdate"));
		
		return bean;
	}
	
}
