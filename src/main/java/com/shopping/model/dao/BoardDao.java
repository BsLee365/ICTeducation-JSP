package com.shopping.model.dao;

import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Board;

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
}
