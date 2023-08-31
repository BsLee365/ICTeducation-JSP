package com.shopping.myservlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		String tex = config.getInitParameter("tel");
		String fax = config.getInitParameter("fax");
		
		System.out.println("tex" + tex);
		System.out.println("fax" + fax);
		// TODO Auto-generated method stub
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
		String pnum = request.getParameter("pnum");
		String name = request.getParameter("name");
		String company = request.getParameter("company");
		String price = request.getParameter("price");
		
		System.out.println(pnum );
		System.out.println(name);
		System.out.println(company);
		System.out.println(price);
		
	}

}
