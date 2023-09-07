package com.shopping.controller.product;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Category;
import com.shopping.model.bean.Product;
import com.shopping.model.dao.CategoryDao;
import com.shopping.model.dao.ProductDao;

public class ProductUpdateController extends SuperClass{
	
	private final String PREFIX = "product/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		//Categories 테이블에서 상품 카테고리 목록을 읽어서 request에 바인딩합니다.
		CategoryDao cdao = new CategoryDao();
		List<Category> lists = null;
		
		//상품 수정시 넘어오는 상품 번호를 우선시 함., prUpdateForm.jsp
		Integer pnum = Integer.parseInt(request.getParameter("pnum"));//prList.jsp에서 받음.
		ProductDao pdao = new ProductDao();
		Product bean = pdao.GetDataByPK(pnum);
		
		try {
			lists = cdao.GetCategoryList("product", "select");
			request.setAttribute("categories" , lists);
			request.setAttribute("bean" , bean); //이전에 넣었던 상품
		} catch (Exception e) {
			e.printStackTrace();
		}

		super.gotoPage(PREFIX + "prUpdateForm.jsp");
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr");
		
		Product bean = new Product();
		//상품 등록과는 다르게 수정은 상품 번호를 반드시 챙겨야 합니다.
		bean.setNum(super.getNumberData(mr.getParameter("pnum"))); //mr로 받은 이유는 파일이 포함되어 있기 때문.
		
		//bean.setNum(null); //시퀀스가 알아서 처리해 줌. 
		bean.setName(mr.getParameter("name"));
		bean.setCompany(mr.getParameter("company"));
		bean.setImage01(mr.getFilesystemName("image01"));
		bean.setImage02(mr.getFilesystemName("image02"));
		bean.setImage03(mr.getFilesystemName("image03"));
		bean.setStock(super.getNumberData(mr.getParameter("stock")));
		bean.setPrice(super.getNumberData(mr.getParameter("price")));
		bean.setCategory(mr.getParameter("category"));
		bean.setContents(mr.getParameter("contents"));
		bean.setpoint(super.getNumberData(mr.getParameter("point")));
		bean.setInputdate(mr.getParameter("inputdate"));

		ProductDao dao = new ProductDao();
		
		int cnt = -1;
		try {
			cnt = dao.UpdateData(bean);
			
			if (cnt == -1) {
				super.gotoPage(PREFIX + "prUpdateForm.jsp");
			}else {
				new ProductListController().doGet(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
