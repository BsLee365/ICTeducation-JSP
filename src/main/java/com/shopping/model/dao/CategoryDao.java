package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import com.shopping.model.bean.Category;

public class CategoryDao extends SuperDao{
	// 해당 조건에 충족하는 카테고리 목록들을 반환해줍니다.
	public List<Category> GetCategoryList(String module, String type) throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = super.getConnection();
		
		String sql = "select * from categories where module=? and type=?";
		/*
		 * sql += " where module=? and type=?"; sql += " order by ordering asc ";
		 */
		
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, module);
		pstmt.setString(2, type);
		
		rs = pstmt.executeQuery();

		List<Category> lists = new ArrayList<Category>();
		
		while(rs.next()) {
			lists.add(getBeanData(rs));
		}
				
		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}
		
		return lists;
	}
	
	private Category getBeanData(ResultSet rs) throws SQLException {
		Category bean = new Category();
		
		bean.setModul(rs.getString("module"));
		bean.setType(rs.getString("type"));
		bean.setOrdering(Integer.parseInt(rs.getString("ordering")));
		bean.setEngname(rs.getString("engname"));
		bean.setKorname(rs.getString("korname"));
		
		return bean;
		
	}
}
