package com.shopping.myservlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.sports.SportController;
import com.shopping.utility.MyUtility;
import com.shopping.utility.SportUtility;

/**
 * Servlet implementation class SportServlet
 */
@WebServlet(urlPatterns = {"/Sport"}, initParams = {
		@WebInitParam(name="txtSetting2", value="/WEB-INF/setting2.txt"),
		@WebInitParam(name="txtSport", value="/WEB-INF/sport.txt")
})
public class SportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	//sport.txt와 setting2.txt파일을 저장하기 위한 Map 생성
	private Map<String, SportController> sportMap = null;
	private Map<String, String> setting2Map = null;
	
	//sport.txt경로를 담을 변수
	private String txtSport = null;
	
	//setting2.txt를 담을 변수
	private String txtSetting2 = null;
	
	//정보를 담을 변수
	private ServletContext application = null;
	
    public SportServlet() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		
		//sport.txt파일을 가져옴.
		this.txtSport = config.getInitParameter("txtSport");
		System.out.println("txtSport : " + txtSport);
		
		//객체의 실제 경로
		this.application = config.getServletContext();
		String pathName = application.getRealPath(this.txtSport);
		System.out.println("pathName : " + pathName);
		
		//SportUtility에서 txtSport를 map으로 바꿔줌.
		sportMap = SportUtility.getSportMap(pathName);
		System.out.println("맵 사이즈 : " + sportMap.size());
		
		//setting2.txt의 경로를 가져옴.
		this.txtSetting2 = config.getInitParameter("txtSetting2");
		System.out.println("txtSetting2 : " + this.txtSetting2);
		
		//setting2.txt의 실제 경로를 가져옴.
		String webSetting2Name = application.getRealPath(this.txtSetting2);
		System.out.println("webSettingName : " + webSetting2Name);
		
		//setting2.txt를 map으로 바꿔줌
		setting2Map = SportUtility.getSettingMap(webSetting2Name);
		
		//application에 map변수에 넣어줌. 이때, setting2Map은 map으로 되어있음.
		application.setAttribute("map", setting2Map);
	}
	
	//service 부재시 doProcess가 대신해서 역할을 함.
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String command = request.getParameter("command");
		System.out.println("command : " + command);
		
		SportController controller = sportMap.get(command); 
		if(controller != null) {
			controller.play(); }
		else { 
			System.out.println("not found"); 
		}
		
		String gotoPage = "example/sportTo.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(gotoPage);
		dispatcher.forward(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doProcess(request, response);
	}

}
