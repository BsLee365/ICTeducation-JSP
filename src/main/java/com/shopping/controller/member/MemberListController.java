package com.shopping.controller.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Board;
import com.shopping.model.bean.Member;
import com.shopping.model.dao.MemberDao;
import com.shopping.utility.Paging;

public class MemberListController extends SuperClass{
	
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		//페이징 처리를 위한 파라미터들
		String pageNumber = request.getParameter("pageNumber"); //Paging.java에서 result변수
		String pageSize = request.getParameter("pageSize");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
		
		System.out.println("pageNumber :" + pageNumber);
		MemberDao dao = new MemberDao();
		try {
			int totalCount = dao.GetTotalRecordCount();
			String url = super.getUrlInfomation("meList");
			boolean isGrid = false;
			
			Paging pageInfo = new Paging(pageNumber, pageSize,totalCount,url,  mode, keyword, isGrid);
			
			List<Member> lists = dao.selectAll(pageInfo);
			
			request.setAttribute("datalist", lists);
			request.setAttribute("pageInfo", pageInfo);
			
			super.gotoPage("member/meList.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();;
		}
		/* lists = dao.selectAll(); */
		/* System.out.println(lists); */

	}
}
