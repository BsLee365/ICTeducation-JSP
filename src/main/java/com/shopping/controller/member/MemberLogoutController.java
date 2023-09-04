package com.shopping.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;

public class MemberLogoutController extends SuperClass{
	@Override //회원이 로그 아웃을 시도합니다.
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
		super.session.invalidate(); //정보를 지움. 로그아웃 같은 기능.
		
		super.gotoPage("member/meLoginForm.jsp");
	}

}