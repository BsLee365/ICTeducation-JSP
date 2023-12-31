package com.shopping.myservlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.model.bean.Bean;

/**
 * Servlet implementation class WorldServlet
 */
@WebServlet(
		urlPatterns = { "/world" }, 
		initParams = { 
				@WebInitParam(name = "tel", value = "0212345678"), 
				@WebInitParam(name = "fax", value = "0211112222")
		})
public class WorldServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String tel;
	private String fax;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WorldServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		
		this.tel = config.getInitParameter("tel");
		this.fax = config.getInitParameter("fax");
		
		System.out.println("tex" + this.tel);
		System.out.println("fax" + this.fax);
		// TODO Auto-generated method stub
		
		ServletContext application = config.getServletContext();
		String hello = "안녕하세요";
		application.setAttribute("hello", hello);
		
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String method = request.getMethod();
		if(method.equalsIgnoreCase("POST")) {
			this.doPost(request, response);
		}else {
			this.doGet(request, response);
		}
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(this.getClass() + " doGet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(this.getClass() + " doPost");
		Integer pnum = Integer.parseInt(request.getParameter("pnum"));
		String name = request.getParameter("name");
		String company = request.getParameter("company");
		Integer price = Integer.parseInt(request.getParameter("price"));
		
		System.out.println(pnum);
		System.out.println(name);
		System.out.println(company);
		System.out.println(price);
		
		/*개별 변수를 바인딩*/
		request.setAttribute("pnum", pnum);
		request.setAttribute("name", name);
		request.setAttribute("company", company);
		request.setAttribute("price", price);
		
		/*객체를 바인딩*/
		Bean bean = new Bean();
		bean.setPnum(123);
		bean.setName(name);
		bean.setCompany(company);
		bean.setPrice(price);
		
		request.setAttribute("bean", bean);
		
		/*세션 영역 바인딩*/
		HttpSession session = request.getSession();
		session.setAttribute("tel", tel);
		session.setAttribute("fax", fax);
		
		
		/*어플리케이션 영역 바인딩은 init에서*/
		
		String gotopage = "example/servletTo02.jsp";
		
		//포워딩 방식
		RequestDispatcher dispatcher = request.getRequestDispatcher(gotopage);
		dispatcher.forward(request, response);
		
		//리다이렉션 방식
		response.sendRedirect(gotopage);
		

	}

}
