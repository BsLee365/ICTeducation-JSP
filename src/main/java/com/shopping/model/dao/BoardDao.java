package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Board;
import com.shopping.utility.Paging;

public class BoardDao extends SuperDao{
	public Board getDatabyPK(int no) {
		Board bean = new Board(no, "hong", "1234", "수학", "수학의 정석은 재밌다.", 12, "23/08/23", 0);
		return bean;
	}
	
	public List<Board> getboards() {
		List<Board> boards = new ArrayList<Board>();
		
		boards.add(new Board(1, "hong", "1234", "수학", "수학의 정석은 재밌다.", 12, "23/08/23", 0));
		boards.add(new Board(2, "hong", "1234", "과학", "과학 공부 중입니다.", 8, "23/08/23", 0));
        boards.add(new Board(3, "kim", "5678", "영어", "English is fun!", 20, "23/08/23", 1));
        boards.add(new Board(4, "lee", "abcd", "역사", "역사 수업을 정리하고 있어요.", 15, "23/08/23", 2));
        boards.add(new Board(5, "park", "qwerty", "미술", "오늘은 그림 그리기 좋은 날씨!", 10, "23/08/23", 2));
        
		return boards;
	}
	
	public int GetTotalRecordCount() throws SQLException {
		//테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from boards " ;
	
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
	
	public int InsertData(Board bean) throws SQLException {
		//게시물 Bean 데이터를 이용하여 등록합니다.
		System.out.println(bean);
		//Bean 객체 정보를 이용하여 데이터 베이스에 추가합니다.
		int cnt = -1;
		
		String sql = " insert into boards(no, id, password, subject, content, regdate)";
		sql += " values(seqboard.nextval,?,?,?,?,?)";
		
		
		PreparedStatement pstmt = null;
		conn = super.getConnection();
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql);
		
		//데이터 삽입.
		pstmt.setString(1, bean.getId());
		pstmt.setString(2, bean.getPassword());
		pstmt.setString(3, bean.getSubject());
		pstmt.setString(4, bean.getContent());
		pstmt.setString(5, bean.getRegdate());
		
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

	public List<Board> selectAll() throws SQLException {
		// 게시물 목록을 게시물 글번호 역순 정렬하여 반환합니다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from boards order by no desc";
		
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		List<Board> lists = new ArrayList<Board>();
		
		while(rs.next()) {
			lists.add(getBeanData(rs));
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
	
	public List<Board> selectAll(Paging pageInfo) throws SQLException {
		// TopN구문을 사용하여 페이징 처리된 게시물 목록을 반환합니다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select no, id, password, subject, content, readhit, regdate, remark, depth " ;
		sql += " from (select no, id, password, subject, content, readhit, regdate, remark, depth, rank() over(order by no desc) as ranking " ;
		sql += " from boards) " ;
		sql += " where ranking between ? and ? " ;
		
		conn = super.getConnection();
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());
		
		rs = pstmt.executeQuery();
		
		List<Board> lists = new ArrayList<Board>();
		
		while(rs.next()) {
			lists.add(getBeanData(rs));
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
	

	private Board getBeanData(ResultSet rs) throws SQLException {
		// ResultSet 정보를 bean으로 만들어서 반환해준다ㅏ.
		Board bean = new Board();
		
		bean.setSubject(rs.getString("subject"));
		bean.setContent(rs.getString("content"));

		bean.setPassword(rs.getString("password"));
		bean.setReadhit(rs.getInt("readhit"));
		bean.setRegdate(String.valueOf(rs.getDate("regdate")));
		
		bean.setNo(rs.getInt("no"));
		bean.setId(rs.getString("id"));
		bean.setDepth(rs.getInt("depth"));
		return bean;
	}

	public Board getDataByPrimaryKey(String no) throws SQLException {
		String sql = "select * from boards where no=?";
		Board bean = new Board();
		
		conn = super.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, no);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			bean = getBeanData(rs);
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
		
		return bean;
	}
}
