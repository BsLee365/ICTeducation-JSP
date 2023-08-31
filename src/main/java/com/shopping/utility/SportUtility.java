package com.shopping.utility;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.*;

import com.shopping.sports.SportController;

public class SportUtility {
	
	
	public static Map<String, SportController> getSportMap(String pathName) {
		//경로를 받아서 map으로 변환해서 리턴해주는 메서드..
		Map<String, SportController> map = new HashMap<String, SportController>();
		
		Properties prop = getPropertiesData(pathName);
		
		Enumeration<Object> keys = prop.keys();
		
		while (keys.hasMoreElements()) {
			String command = keys.nextElement().toString();
			String className = prop.getProperty(command);
			
			try {
				Class<?> handleClass = Class.forName(className);
				SportController instance = (SportController)handleClass.newInstance();
				map.put(command, instance);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return map;
	}
	
	private static Properties getPropertiesData(String pathName) {
		FileInputStream fis = null;
		Properties prop = null;
		
		try {
			fis = new FileInputStream(pathName);
			prop = new Properties();
			//load를 하면 Porperties로 바꿔줌.
			prop.load(fis);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				fis.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("prop.toString() : " + prop.toString());
		
		return prop;
	}

	public static Map<String, String> getSettingMap(String webSettingName) {
		
		return null;
	}
}
