package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.connector.Response;

import com.shopping.model.bean.Member;

public class MemberDao extends SuperDao{
	
	public Member getDataByPk(String id) {//하드코딩된 데이터
		Member bean = new Member(id, "홍길동", "1234","male","23/08/20","미혼",100,"역삼","hong", "탁구,축구");
		return bean;
	}
	public List<Member> getmember(){
		List<Member> lists = new ArrayList<Member>();
		
		lists.add(new Member("id1", "홍길동", "1234", "male", "23/08/20", "이혼", 100, "역삼", "hong", "탁구,축구"));
		lists.add(new Member("id2", "김철수", "5678", "male", "12/05/19", "미혼", 150, "강남", "kim", "야구,농구"));
		lists.add(new Member("id3", "이영희", "9012", "female", "05/03/22", "기혼", 200, "서초", "lee", "테니스,골프"));
		lists.add(new Member("id4", "박민준", "3456", "male", "15/11/18", "미혼", 120, "신림", "park", "축구"));
		lists.add(new Member("id5", "최지우", "7890", "female", "08/09/21", "미혼", 180, "홍대", "choi", "배드민턴,요가"));
		lists.add(new Member("id6", "정성호", "2345", "male", "10/07/23", "이혼", 90, "건대", "jung", "탁구,테니스"));
		
		return lists;
	}
	public Member getDataByPk(String id, String password) throws Exception{ //DB에서 데이터 가져오기
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		/* ?를 placeholder라고 합니다. 치환되어야 할 영역. */
		
		String sql = "select * from members";
		sql += " where id = ? and password = ?";
		
		conn = super.getConnection();//단계 2번, 데이터 베이스 연결.
		pstmt = conn.prepareStatement(sql); //단계 3번, 쿼리문 삽입.
		
		pstmt.setString(1, id); //1번째로 시작
		pstmt.setString(2, password);//반드시 excute위에서 치환시켜줘야 함.
		
		rs = pstmt.executeQuery();//단계 4-1번, 쿼리 실행
		
		Member bean = null;
		if(rs.next()) { //1건 이상이 조회됨.
			bean = getBeanData(rs);
		}
		
		if(rs != null) { //반드시 lifo순서대로 close
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
	private Member getBeanData(ResultSet rs) throws Exception{
		//ResultSet의 데이터를 이용하여 Bean에 기록한 다음, 반환
		Member bean = new Member();
		
		bean.setId(rs.getString("id"));
		bean.setName(rs.getString("name"));
		bean.setPassword(rs.getString("password"));
		bean.setGender(rs.getString("gender"));
		bean.setBirth(String.valueOf(rs.getDate("birth")));
		bean.setMarriage(rs.getString("marriage"));
		bean.setSalary(rs.getInt("salary"));
		bean.setAddress(rs.getString("address"));
		bean.setManager(rs.getString("manager"));
		
		return bean;
	}
}
