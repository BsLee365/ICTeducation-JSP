package com.shopping.utility;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
	//파일을 Properties클래스를 이용하여 분리
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
	
	//setting2.txt를 맵으로 변환하기 위한 함수
	public static Map<String, String> getSettingMap(String webSettingName) {
		Map<String, String> map = new HashMap<String, String>();
		Properties prop = null;
		prop = getPropertiesData(webSettingName);
		
		Enumeration<Object> keys = prop.keys();
		
		while (keys.hasMoreElements()) {
			String key = keys.nextElement().toString();
			String value = prop.getProperty(key);
			
			try {
				map.put(key, new String(value.getBytes("ISO-8859-1"), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return map;
	}
}
