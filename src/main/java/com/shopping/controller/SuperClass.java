package com.shopping.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// 하위 컨트롤러들이 공통적으로 사용하는 기능들을 여기에 명시합니다.
public class SuperClass implements SuperController {
	private HttpServletRequest request;
	private HttpServletResponse response;
	protected HttpSession session; //session영역 변수, session사용시 doGet, doPost는 자동 실행
	
	public void setAlertMessage(String message) {
		//session영역에서 "alertMessage"라는 이름으로 사용자에게 주의/오류/경고 문구 등을 띄워 줍니다.
		//common.jsp 파일에 하단 참조
		session.setAttribute("alertMessage", message);
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		this.request = request;
		this.response = response;
		this.session = request.getSession();//그래서 doGet메서드에 적어줌.
		
	}
		 
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		this.request = request;
		this.response = response;
		this.session = request.getSession();
	}

	public void gotoPage(String gotoPage) {//homecontroller.java에서 호출함.
		
		if(this.request == null) {
			System.out.println("doGet/doPost 메소드 호출 누락");
			return ;
		}
		
		//요청한 페이지로 포워딩 합니다.
		RequestDispatcher dispatcher = null;
		try {
			dispatcher = request.getRequestDispatcher(gotoPage);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public Integer getNumberData(String parameter) {
		//숫자형 파라미터에 대한 처리를 메소드
		// 잘못된 숫자형식이면 0을 반환해 줍니다.
		boolean flag = false;
		
		flag = parameter == null;
		
		flag = parameter == null || parameter.equals("") || parameter.equals("null");
		
		return flag ? 0 : Integer.parseInt(parameter);
	}
	
}
