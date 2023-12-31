package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.shopping.model.bean.Member;
import com.shopping.model.bean.Order;
import com.shopping.model.bean.WishList;
import com.shopping.model.mall.CartItem;

public class MallDao extends SuperDao{

	public void Calculate(Member payer, Map<Integer, Integer> cartList) throws Exception{
		//payer: 계산을 하는 사람(포인트 적립 대상자)
		//cartList : 카트에 담겨 있는 상품 번호와 구매 수량
		
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		int cnt = -1;
		
		String sql = "";
		
		conn = super.getConnection();
		conn.setAutoCommit(false);
		
		//step01 : 주문 테이블에 매출 1건 입력
		sql = " insert into orders(oid, id, orderdate) values (seqoid.nextval, ?, sysdate)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, payer.getId());
		cnt = pstmt.executeUpdate();
		pstmt = null;
		//step02 : step01에서 방금 들어간 송장 주문 번호 읽기
		sql = " select max(oid) as invoice from orders";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int invoice = 0;	
		if(rs.next()) {
			invoice = rs.getInt("invoice");
		}
		
		int totalPoint = 0; //총 적립 포인트
		for(Integer pnum : cartList.keySet()) {
			
			//step03 : 반복문을 사용하여 주문 상세 테이블에 각 데이터 추가
			sql =" insert into orderdetails(odid, oid, pnum, qty) values (seqodid.nextval, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, invoice);
			pstmt.setInt(2, pnum);
			pstmt.setInt(3, cartList.get(pnum));
			cnt = pstmt.executeUpdate();
			pstmt = null;
			//step04 : 각 상품들의 재고 수량 뺄셈하기
			sql =" update products set stock = stock-? where pnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cartList.get(pnum)); //구매수량
			pstmt.setInt(2, pnum); //상품 번호
			cnt = pstmt.executeUpdate();
			pstmt = null;
			
			//각 상품들의 적립 포인트를 구해줌
			int point = cartList.get(pnum)* new ProductDao().GetMileagePoint(pnum);
			totalPoint += point;
			
			//step05 : 해당 회원의 적립 포인트 변경하기
			sql =" update members set mpoint = mpoint+? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, totalPoint); //적립할 포인트
			pstmt.setString(2, payer.getId()); //회원 아이디
			cnt = pstmt.executeUpdate();
			pstmt = null;
		
		}
		conn.commit();
		
		if(rs != null) {
			rs.close();
		}
		if(pstmt != null) {
			pstmt.close();
		}
		if(conn != null) {
			conn.close();
		}
		
	}

	public List<Order> GetHistory(String id) throws Exception{
		String sql=" select * from orders where id=? order by orderdate desc";
		
		List<Order> orderList = new ArrayList<Order>();
		
		PreparedStatement pstmt = null;
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		
		while(rs.next()) {
			orderList.add(makeOrderBean(rs));
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
		
		return orderList;
	}
	
	public Order makeOrderBean(ResultSet rs) throws SQLException {
		Order bean = new Order();
		
		bean.setId(rs.getString("id"));
		bean.setOid(rs.getInt("oid"));
		bean.setOrderdate(String.valueOf(rs.getDate("orderdate")));
		bean.setRemark(rs.getString("remark"));
		
		return bean;
	}

	public Order getDetailHistory(int oid) throws SQLException {
		//해당 송장 번호에 대한 주문 정보를 반환해 줍니다.
		String sql = "select * from orders where oid=? ";
		
		Order bean = new Order();
		
		conn = super.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, oid);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			bean.setId(rs.getString("oid"));
			bean.setId(sql);
			bean.setOrderdate(sql);
			bean.setRemark(sql);
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

		return bean;
	}

	public List<CartItem> showDetail(int oid) throws SQLException {
		// 송장 번호에 대한 상세 내역을 컬렉션형태로 반환합니다.
		String sql = " select p.pnum, p.name pname, od.qty, p.price, p.point, p.image01 " ;
		sql += " from (orders o inner join orderdetails od " ;
		sql += " on o.oid = od.oid) inner join products p  " ;
		sql += " on od.pnum = p.pnum and o.oid = ?  " ;
		sql += " order by od.odid desc " ;
		
		
		List<CartItem> lists = new ArrayList<CartItem>();
		
		conn = super.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, oid);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			lists.add(this.makeCartItemBean(rs));
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

	private CartItem makeCartItemBean(ResultSet rs) throws SQLException {
		CartItem item = new CartItem();
		
		//item.setId(rs.getString(""));
		item.setImage01(rs.getString("image01"));
		item.setPname(rs.getString("pname"));
		item.setPnum(rs.getInt("pnum"));
		item.setPoint(rs.getInt("point"));
		item.setPrice(rs.getInt("price"));
		item.setQty(rs.getInt("qty"));

		return item;
	}

	public void insertWishList(String id, Map<Integer, Integer> wishList) throws SQLException {
		//로그인 한 사람의 찜 목록(wishList)을 데이터 베이스에 추가합니다.
		String sql = "";
		int cnt = -1;
		PreparedStatement pstmt = null;
		conn = super.getConnection();
		conn.setAutoCommit(false);
		
		// step 01: 과거 나의 찜 정보가 있으면 일단 삭제합니다.
		sql = "delete from wishlist where id = ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		cnt = pstmt.executeUpdate();
		
		if(pstmt != null) {
			pstmt.close();
		}
		
		// step 02: 현재 세션 정보를 반복하여 테이블에 삽입합니다.
		sql = "insert into wishlist(id, pnum, qty) values (?,?,?) ";
		
		pstmt = conn.prepareStatement(sql);
		for(Integer pnum: wishList.keySet()) {
			pstmt.setString(1, id);
			pstmt.setInt(2, pnum);
			pstmt.setInt(3, wishList.get(pnum));
			cnt = pstmt.executeUpdate();
		}
		conn.commit();
		
		if(pstmt != null) {
			pstmt.close();
		}
		if(conn != null) {
			conn.close();
		}
	}

	public List<WishList> getWishList(String id) throws SQLException {
		//나의 WishList 항목을 컬렉션으로 반환합니다.
		String sql = "select * from wishlist where id = ? ";
		
		conn = super.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		List<WishList> lists = new ArrayList<WishList>();
		
		while(rs.next()) {
			lists.add(this.makeWishListBean(rs));
		}
		
		if(pstmt != null) {
			pstmt.close();
		}
		if(pstmt != null) {
			pstmt.close();
		}
		if(conn != null) {
			conn.close();
		}
		
		return lists;
	}

	private WishList makeWishListBean(ResultSet rs) throws SQLException {
		WishList bean = new WishList();
		
		bean.setId(rs.getString("id"));
		bean.setPnum(rs.getInt("pnum"));
		bean.setQty(rs.getInt("qty"));
		
		
		return bean;
	}
	
}
