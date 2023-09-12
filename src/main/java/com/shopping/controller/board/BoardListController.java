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
		String pageNumber = request.getParameter("pageNumber"); //평소에는 null로 값이 들어감.
		String pageSize = request.getParameter("pageSize");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
		String flowParameter = request.getParameter(null);		
		
		
		System.out.println("pageNumber :" + pageNumber);
		BoardDao dao = new BoardDao();
		
		try {
			//int totalCount = dao.GetTotalRecordCount(); //데이터 베이스에서 count(*)로 총 데이터 갯수 가져옴.

			int totalCount = dao.GetTotalRecordCount(mode, keyword); //검색 결과 갯수 가져옴
			String url = super.getUrlInfomation("boList"); //URL경로를 재지정.
			
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
