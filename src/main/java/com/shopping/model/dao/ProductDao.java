package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Member;
import com.shopping.model.bean.Product;
import com.shopping.utility.Paging;

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
		
		 ProductDao dao = new ProductDao(); List<Product> products = dao.getDataList();
		  
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
	
	public List<Product> selectAll(Paging pageInfo) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Product> lists = new ArrayList<Product>();
		
		String sql = "";
		sql = "select pnum, name, company, image01, image02, image03, stock, price, category, contents, point, inputdate from (select pnum, name, company, image01, image02, image03, stock, price, category, contents, point, inputdate, rank()over(order by pnum desc) as ranking from products ";
				
		
		String mode = pageInfo.getMode();
		String keyword = pageInfo.getKeyword();
		
		if (mode == null || mode.equals("all")) {
			mode = "all";
		}else {
			sql += " where " + mode + " like '%" + keyword + "%'";
		}
		
		sql += " )";
		sql += " where ranking between ? and ?";
		
		conn = super.getConnection();
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());
	
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			lists.add(getDatabean(rs));
		}
		
		if(rs != null) {
			rs.close();
		}
		if(pstmt != null) {
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
		bean.setpoint(rs.getInt("point"));
		bean.setInputdate(rs.getString("inputdate"));
		
		return bean;
	}
	
	public int InsertData(Product bean) throws SQLException {
		//기입한 상품 정보를 이용하여 데이터 베이스에 추가합니다.
		System.out.println("상품 등록 빈 : " + bean);
		
		PreparedStatement pstmt = null;
		String sql = "insert into products(pnum,name,company,image01,image02,image03,stock,price,category,contents,point,inputdate)";
		sql += " values(seqprod.nextval,?,?,?,?,?,?,?,?,?,?,?) ";
		
		int cnt = -1;
		
		conn = super.getConnection();
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bean.getName());
		pstmt.setString(2, bean.getCompany());
		pstmt.setString(3, bean.getImage01());
		pstmt.setString(4, bean.getImage02());
		pstmt.setString(5, bean.getImage03());
		pstmt.setInt(6, bean.getStock());
		pstmt.setInt(7, bean.getPrice());
		pstmt.setString(8, bean.getCategory());
		pstmt.setString(9, bean.getContents());
		pstmt.setInt(10, bean.getpoint());
		pstmt.setString(11, bean.getInputdate());
		cnt = pstmt.executeUpdate();
		
		conn.commit();
		
		if(pstmt != null) {
			pstmt.close();
		}
		if(conn != null) {
			conn.close();
		}
		
		return cnt;
	}
	
	public int GetTotalRecordCount() throws SQLException {
		//테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from products " ;
			
		conn = super.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
				
		int cnt = -1;
		if(rs.next()) {
			cnt = rs.getInt("cnt");
		}
				
		if(rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}
		return cnt;
	}
	public int GetTotalRecordCount(String mode, String keyword) throws SQLException {
		System.out.println("검색할 필드명 : " + mode);
		System.out.println("검색할 키워드 : " + keyword);
		
		String sql = "select count(*) as cnt from products";
		
		if (mode == null || mode.equals("all")) {
			mode = "all";
		}else {
			sql += " where " + mode + " like '%" + keyword + "%'";
		}
		
		conn = super.getConnection();
		PreparedStatement pstmt = null;
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = null;
		//pstmt.setString(1, keyword);
		rs = pstmt.executeQuery();
		
		int cnt = -1;
		while (rs.next()) {
			cnt = rs.getInt("cnt");
		}
		
		if(rs != null) {
			rs.close();
		}if(pstmt != null) {
			pstmt.close();
		}
		if(conn != null) {
			conn.close();
		}
	
		return cnt;
	}
	public Product GetDataByPK(Integer pnum) throws SQLException {
		// 상품 번호를 이용하여 해당 상품에 대한 Bean 객체를 반환
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from products ";
		sql += "where pnum = ?";
		
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pnum);
		rs = pstmt.executeQuery();
		
		Product bean = null;
		
		if (rs.next()) {
			bean = this.getDatabean(rs); //객체가 존재할 때만 생성.
			
		}
		
		if(rs != null) {
			rs.close();
		}if(pstmt != null) {
			pstmt.close();
		}
		if(conn != null) {
			conn.close();
		}
	
		return bean;
	}
	
	public int UpdateData(Product bean) throws SQLException {
		System.out.println("상품 등록 빈 : " + bean);
		
		PreparedStatement pstmt = null;
		String sql = "update products set name=?, company=?, image01=?, image02=?, image03=?, stock=?, price=?, category=?, contents=?, point=?, inputdate=? ";
		sql += "where pnum=?";
		
		int cnt = -1;
		
		conn = super.getConnection();
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bean.getName());
		pstmt.setString(2, bean.getCompany());
		pstmt.setString(3, bean.getImage01());
		pstmt.setString(4, bean.getImage02());
		pstmt.setString(5, bean.getImage03());
		pstmt.setInt(6, bean.getStock());
		pstmt.setInt(7, bean.getPrice());
		pstmt.setString(8, bean.getCategory());
		pstmt.setString(9, bean.getContents());
		pstmt.setInt(10, bean.getpoint());
		pstmt.setString(11, bean.getInputdate());
		pstmt.setInt(12, bean.getNum());
		
		cnt = pstmt.executeUpdate();

		conn.commit();
		
		if(pstmt != null) {
			pstmt.close();
		}
		if(conn != null) {
			conn.close();
		}
		
		return cnt;
	}
}
