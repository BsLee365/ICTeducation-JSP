package com.shopping.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Member;
import com.shopping.model.dao.MemberDao;

//회원 가입을 위한 컨트롤러 입니다.
public class MemberInsertController extends SuperClass{
	
	private final String PREFIX = "member/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		super.gotoPage(PREFIX+ "meInsertForm.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		
		Member bean = new Member();
		
		bean.setId(request.getParameter("id"));
		bean.setName(request.getParameter("name"));
		bean.setPassword(request.getParameter("password"));
		bean.setGender(request.getParameter("gender"));
		bean.setBirth(request.getParameter("birth"));
		bean.setMarriage(request.getParameter("marriage"));
		bean.setSalary(Integer.parseInt(request.getParameter("salary")));
		bean.setAddress(request.getParameter("address"));
		bean.setManager(request.getParameter("manager"));
		
		MemberDao dao = new MemberDao();
		int cnt = -1;
		
		try {
			cnt = dao.InsertData(bean);
			
			if (cnt == -1) { //가입 실패
				new MemberInsertController().doGet(request, response);//실패하면 meInsertForm.jsp로 보내버림.
			}else {
				new MemberLoginController().doPost(request, response);//성공하면 로그인 창으로 보내버림.
			}
		} catch (Exception e) {
			e.printStackTrace();
			new MemberLoginController().doPost(request, response);
		}
		
		
	}
}
