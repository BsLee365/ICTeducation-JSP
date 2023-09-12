package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import com.shopping.model.bean.Comment;

public class CommentDao extends SuperDao{

	public List<Comment> GetDataByPk(int no) throws Exception{
		
		//해당 게시물 번호에 달려있는 댓글 목록을 정렬시켜 반환해 줍니다.
		String sql = "";
		sql += "select * from comments ";
		sql += "where no=? order by cnum ";
		
		conn = super.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, no);
		rs = pstmt.executeQuery();
		
		List<Comment> lists = new ArrayList<Comment>();
		
		while(rs.next()) {
			lists.add(GetBeanData(rs));
		}

		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return lists;
	}

	private Comment GetBeanData(ResultSet rs) throws SQLException {
		Comment bean = new Comment();
		
		bean.setCnum(rs.getInt("cnum"));
		bean.setNo(rs.getInt("no"));
		bean.setId(rs.getString("id"));
		bean.setContent(rs.getString("content"));
		bean.setRegdate(rs.getString("regdate"));
		/* bean.setRegdate(String.valueOf(rs.getDate("regdate"))); */
		
		return bean;
	}

	public int InsertData(Comment bean) throws SQLException {
		//넘겨진 댓글 정보를 데이터 베이스에 추가합니다.
		System.out.println(bean);
		//Bean 객체 정보를 이용하여 데이터 베이스에 추가합니다.
		int cnt = -1;
		
		String sql = "insert into comments(cnum, no, id, content, regdate) values";
		sql += "(seqcomm.nextval,?,?,?, sysdate)";
		
		
		PreparedStatement pstmt = null;
		conn = super.getConnection();
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql);
		
		//데이터 삽입.
		pstmt.setInt(1, bean.getNo());
		pstmt.setString(2, bean.getId());
		pstmt.setString(3, bean.getContent());
		
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

	public int DeleteData(int cnum) throws SQLException {
		int cnt = -1;
		//댓글번호 cnum을 삭제합니다.
		String sql = "";
		sql += "delete from comments where cnum=?";
		
		PreparedStatement pstmt = null;
		conn = super.getConnection();
		conn.setAutoCommit(false);
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, cnum);
		
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
