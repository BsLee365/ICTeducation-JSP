package com.shopping.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Board;
import com.shopping.model.dao.BoardDao;
import com.shopping.utility.Paging;

public class BoardListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
		//페이징 처리를 위한 파라미터들
		String pageNumber = request.getParameter("pageNumber"); //출처?
		String pageSize = request.getParameter("pageSize");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
				
		System.out.println("pageNumber :" + pageNumber);
		BoardDao dao = new BoardDao();
		
		try {
			int totalCount = dao.GetTotalRecordCount(); //수정예정
			String url = super.getUrlInfomation("boList");
			boolean isGrid = false;
			
			Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
			//pageInfo를 메소드에 넣어줘야함.
			List<Board> lists = dao.selectAll(pageInfo);
			
			request.setAttribute("datalist", lists);
			
			//페이징 관련 정보를 바인딩
			request.setAttribute("pageInfo", pageInfo);
			
			super.gotoPage("board/boList.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
