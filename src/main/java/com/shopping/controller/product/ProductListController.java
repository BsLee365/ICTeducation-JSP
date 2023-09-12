package com.shopping.controller.product;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Product;
import com.shopping.model.dao.ProductDao;
import com.shopping.utility.Paging;

public class ProductListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		//페이징 처리를 위한 파라미터들
		String pageNumber = request.getParameter("pageNumber"); //Paging.java에서 result변수
		String pageSize = request.getParameter("pageSize");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
		
		System.out.println("pageNumber : " + pageNumber);
		
		ProductDao dao = new ProductDao();
		try {

			//int totalCount = dao.GetTotalRecordCount();//모든 항목을 가져옴.
			
			
			int totalCount = dao.GetTotalRecordCount(mode, keyword);
			String url = super.getUrlInfomation("prList");
			boolean isGrid = true;
			Paging pageInfo = new Paging(pageNumber, pageSize,totalCount,url,  mode, keyword, isGrid);
			
			List<Product> lists = dao.selectAll(pageInfo);
			
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("datalist", lists);
			
			super.gotoPage("product/prList.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
}
