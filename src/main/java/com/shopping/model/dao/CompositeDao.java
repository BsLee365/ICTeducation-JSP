package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import com.shopping.model.bean.Combo01;
import com.shopping.model.bean.Combo02;
import com.shopping.model.bean.Combo03;
import com.shopping.model.bean.Combo04;
import com.shopping.model.bean.Combo05;

public class CompositeDao extends SuperDao {

	public List<Combo01> View01() throws SQLException {
		String sql = "select m.name, b.subject, b.content, b.regdate "
				+ "from members m inner join boards b "
				+ "on m.id = b.id "
				+ "order by m.name";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		conn =super.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
			
		List<Combo01> lists = new ArrayList<Combo01>();
			
		while(rs.next()) {
			Combo01 bean = new Combo01();
			bean.setContent(rs.getString("content"));
			bean.setName(rs.getString("name"));
			bean.setSubject(rs.getString("subject"));
			bean.setRegdate(String.valueOf(rs.getString("regdate")));
			
			lists.add(bean);
			
		} 
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return lists;
	}

	public List<Combo02> View02() throws SQLException {
		String sql ="select m.name, count(*) as cnt "
				+ "from members m inner join boards b "
				+ "on m.id = b.id "
				+ "group by m.name "
				+ "order by m.name";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		conn =super.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
			
		List<Combo02> lists = new ArrayList<Combo02>();
			
		while(rs.next()) {
			Combo02 bean = new Combo02();
			bean.setName(rs.getString("name"));
			bean.setCnt(rs.getInt("cnt"));
			
			lists.add(bean);
			
		} 
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return lists;
		
	}

	public List<Combo03> View03() throws SQLException {
		String sql ="select m.name mname, p.name pname, o.orderdate, od.qty, p.price, od.qty * p.price as amount "
				+ "from ((members m inner join orders o "
				+ "on m.id=o.id) inner join orderdetails od "
				+ "on o.oid=od.oid) inner join products p "
				+ "on od.pnum=p.pnum "
				+ "order by p.name desc, m.name asc";
		
		List<Combo03> lists = new ArrayList<Combo03>();
		PreparedStatement pstmt = null;
		
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Combo03 bean = new Combo03();
			
			bean.setMname(rs.getString("mname"));
			bean.setPname(rs.getString("pname"));
			bean.setOrderdate(rs.getString("orderdate"));
			bean.setQty(rs.getInt("qty"));
			bean.setPrice(rs.getInt("price"));
			bean.setAmount(rs.getInt("amount"));
			
			lists.add(bean); //데이터 없음
		}
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return lists;
	}
	
	public List<Combo04> View04() throws SQLException {
		String sql = "select m.id, sum(od.qty * p.price) as sumtotal "
				+ "from ((members m inner join orders o "
				+ "on m.id=o.id) inner join orderdetails od "
				+ "on o.oid=od.oid) inner join products p "
				+ "on od.pnum=p.pnum "
				+ "group by m.id";
		
		
		List<Combo04> lists = new ArrayList<Combo04>();	
		
		conn = super.getConnection();
		PreparedStatement pstmt = null;
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Combo04 bean = new Combo04();
			bean.setId(rs.getString("id"));
			bean.setTotal(rs.getInt("sumtotal"));
			
			lists.add(bean);
			
		}
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		
		return lists;
	}
	
	public List<Combo05> View05() throws SQLException {
		List<Combo05> lists = new ArrayList<Combo05>();	
		
		String sql = "select m.id, count(o.id) as cnt "
				+ "from members m left outer join orders o "
				+ "on m.id=o.id "
				+ "group by m.id "
				+ "order by cnt desc, m.id asc";

		conn = super.getConnection();
		PreparedStatement pstmt = null;
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Combo05 bean = new Combo05();
			bean.setId(rs.getString("id"));
			bean.setCnt(rs.getInt("cnt"));
			
			lists.add(bean);
		}
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return lists;
	}
	
}
