package com.shopping.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Board;
import com.shopping.model.dao.BoardDao;

public class BoardUpdateController extends SuperClass {
	private final String PREFIX = "board/";
	
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		//게시글 번호로 데이터를 받음.
		Integer no = Integer.parseInt(request.getParameter("no"));
		BoardDao dao = new BoardDao();
		Board bean = dao.getNoData(no);//pk로 모든 항목들 가져옴.
		
		try {
			request.setAttribute("bean", bean);
		} catch (Exception e) {
			e.printStackTrace();
		}

		super.gotoPage(PREFIX + "boUpdateForm.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		System.out.println("컨트롤러!");
		Board bean = new Board();
		
		bean.setId(request.getParameter("id"));
		bean.setPassword(request.getParameter("password"));
		bean.setSubject(request.getParameter("subject"));
		bean.setContent(request.getParameter("content"));
		bean.setReadhit(Integer.parseInt(request.getParameter("readhit")));
		bean.setRegdate(request.getParameter("regdate"));
		bean.setNo(Integer.parseInt(request.getParameter("no")));
		
		BoardDao dao = new BoardDao();
		int cnt = -1;
	
		try {
			cnt = dao.UpdateData(bean);
			
			if (cnt == -1) {
				System.out.println("실패!");
				super.gotoPage(PREFIX + "boUpdateForm.jsp");
				
			}else {//성공
				//게시물 목록 보기 페이지로 이동
				new BoardListController().doGet(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			new BoardUpdateController().doGet(request, response);
		}
	
	}
}
