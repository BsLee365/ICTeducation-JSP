package com.shopping.controller.product;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Product;
import com.shopping.model.dao.ProductDao;

public class ProductListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		List<Product> lists = new ArrayList<Product>();
		ProductDao dao = new ProductDao();
		lists = dao.selectAll();
		
		System.out.println(lists);
		request.setAttribute("datalist", lists);

		super.gotoPage("/product/prList.jsp");
	}
}
