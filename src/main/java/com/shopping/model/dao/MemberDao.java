package com.shopping.model.dao;

import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Member;

public class MemberDao extends SuperDao{
	
	public Member getDataByPk(String id) {
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
}
