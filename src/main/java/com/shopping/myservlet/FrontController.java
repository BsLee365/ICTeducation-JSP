package com.shopping.myservlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.shopping.controller.SuperController;
import com.shopping.utility.MyUtility;

/**
 * Servlet implementation class FrontController
 */
@WebServlet(
		urlPatterns = { "/Shopping" }, 
		initParams = { 
				@WebInitParam(name = "txtSetting", value = "/WEB-INF/setting.txt"), 
				@WebInitParam(name = "todolist", value = "/WEB-INF/todolist.txt")
		})
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//초기화 파라미터 관련 변수
    private String txtSetting = null;
    private String todolist = null;
    ServletContext application = null;
    
    
    //읽어드린 setting.txt 파일을 map으로 변환하기 위한 변수
    private Map<String, String> settingMap = null;
    
    //읽어드린 todolist.txt 파일을 map으로 변환하기 위한 변수
    private Map<String, SuperController> todolistMap = null;
    
    
    //mageUploadWebPath 변수 : 실제 이미지가 업로드 되는 경로
	private String imageUploadWebPath;
    public FrontController() {
       
    }

	public void init(ServletConfig config) throws ServletException {
		
		//파일 읽어들이기
		this.txtSetting = config.getInitParameter("txtSetting");
		this.todolist = config.getInitParameter("todolist");
		
		System.out.println("this.txtSetting : "+ this.txtSetting);
		System.out.println("this.todolist : "+ this.todolist);
		
		application = config.getServletContext();
		
		//txtSetting.txt와 todolist.txt의 실제 경로 가져오기
		String txtSettingFile = application.getRealPath(txtSetting);
		String todolistFile = application.getRealPath(todolist);
		
		System.out.println("txtSettingFile : " + txtSettingFile);
		System.out.println("todolistFile : " + todolistFile);
		
		//setting.txt를 map으로 바꿔줌.
		this.settingMap = MyUtility.getSettingMap(txtSettingFile);
		System.out.println("setting file element size : " + this.settingMap.size());
		
		application.setAttribute("map", this.settingMap);
		
		//int setting.txt 파일 내의 uploadPath=upload 항목 참조 요망
		//이미지 업로드 경로를 변수에 저장합니다.
		String imsiPath = settingMap.get("uploadPath");
		if(imsiPath==null) {imsiPath ="imgae";}
		//imageUploadWebPath 변수 : 실제 이미지가 업로드 되는 경로
		imageUploadWebPath = application.getRealPath(imsiPath);
		System.out.println("imageUploadWebPath :  " +  imageUploadWebPath);
		
		//todolist.txt를 map으로 바꿔줌.
		this.todolistMap = MyUtility.getTodolistMap(todolistFile);
		System.out.println("this.todolistMap : " + this.todolistMap.size());
		
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		
		//컨트롤러 분기를 위한 핵심 파라미터
		String command = request.getParameter("command"); //jsp파일로 부터 받은 파라미터 값을 저장, home이 대입.
		
		if (command == null) { //파일이 없을 경우 
			System.out.println("file upload event invoked");
			
			MultipartRequest mr = MyUtility.getMultipartRequest(request, imageUploadWebPath);
			
			if(mr != null) {
				command = mr.getParameter("command");
				//MyUtility.deleteOldImageFile(imageUploadWebPath, mr);
				
				//file upload object binding in request scope
				request.setAttribute("mr", mr);
			}else {
				System.out.println("MultipartRequest object is null");
			}
		}

		System.out.println("command : " + command);
		SuperController controller = this.todolistMap.get(command); //command랑 맞는 키 값을 대입, SuperController는 todolist.txt에 있는 key값을 가지고 있는 모든 컨트롤러의 타입을 지정해준다. 
		//SuperController의 업캐스트로 doGet, doPost을 사용.
		if(controller != null) {
			String method = request.getMethod();
			try {
				//request가 어떤 타입으로 왔는지 확인.
				if (method.equalsIgnoreCase("POST")) { //Post타입
					System.out.println(this.getClass() + " : post method called");
					controller.doPost(request, response);
				}else { //Get타입
					System.out.println(this.getClass() + " : get method called");
					controller.doGet(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}else {
			System.out.println("not found command");
		}
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		doProcess(request, response);
	}

}
