package com.shopping.controller.comment;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Comment;
import com.shopping.model.dao.CommentDao;

//해당 게시물에 대한 댓글을 보여주는 컨트롤러
public class CommentListController extends SuperClass{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		CommentDao dao = new CommentDao();
		List<Comment> comments = null;
		
		try {
			comments = dao.GetDataByPk(no);
			System.out.println(no + "글에 대한 댓글 갯수 : " + comments.size());
			
			JSONArray jsArr = new JSONArray();
			for(Comment comm: comments) {
				JSONObject obj = new JSONObject();
				obj.put("cnum", comm.getCnum());
				obj.put("id", comm.getId());
				obj.put("content", comm.getContent());
				obj.put("regdate", comm.getRegdate());
				
				jsArr.add(obj);
			}
			System.out.println("jsArr.toString() 결과 보기 : " + jsArr.toString());
			
			request.setAttribute("jsArr", jsArr);
			super.gotoPage("comment/cmList.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
