package com.shopping.controller.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.dao.MallDao;

public class MemberLogoutController extends SuperClass{
	@Override //회원이 로그 아웃을 시도합니다.
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
		MallDao dao = new MallDao();
		Map<Integer, Integer> wishList = super.mycart.getAllCartList();
		try {
			//session 영역에 남겨진 장바구니가 있으면, 임시 테이블 WishList에 추가해 줍니다.
			if(super.loginfo != null) {
				if(wishList.size() > 0) {
					dao.insertWishList(super.loginfo.getId(), wishList);
				}
				else {
					super.youNeededLogin();
					return ;
				}
			}
			
			
			super.session.invalidate(); //정보를 지움. 로그아웃 같은 기능.
			super.gotoPage("member/meLoginForm.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}