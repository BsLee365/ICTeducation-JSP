package com.shopping.controller.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Member;
import com.shopping.model.dao.MemberDao;

public class MemberListController extends SuperClass{
	
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		List<Member> lists = new ArrayList<Member>();
		MemberDao dao = new MemberDao();
		lists = dao.selectAll();
		/* System.out.println(lists); */
		
		request.setAttribute("datalist", lists);
		gotoPage("member/meList.jsp");
	}
}
