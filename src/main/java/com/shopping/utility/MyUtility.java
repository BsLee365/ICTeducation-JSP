package com.shopping.utility;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.*;

import com.shopping.transport.VehicleController;

public class MyUtility {
	
	public static Map<String, VehicleController> getTransportationMap(String webFullPathName){
	//운송 수단 텍스트 파일을 이용하여 각각 동적으로 객체를 생성
	//이 항목들을 Map구조에 담아서 반환 합니다	
	Map<String, VehicleController> map = new HashMap<String, VehicleController>();
	
		Properties prop = getPropertiesData(webFullPathName);
		
		Enumeration<Object> keys = prop.keys();
		
		while(keys.hasMoreElements()) {
			String command = keys.nextElement().toString();
			String className = prop.getProperty(command);
			System.out.println(command + "/" + className);
			
			try {
				Class<?> handleClass = Class.forName(className);
				VehicleController instance = (VehicleController)handleClass.newInstance();
				map.put(command, instance);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return map;
	}

	private static Properties getPropertiesData(String webFullPathName) {
		//스트링을 이용하여 프로퍼티 목록을 반환해줍니다.
		FileInputStream fis = null;
		Properties prop = null;
		
		try {
			fis = new FileInputStream(webFullPathName);
			prop = new Properties();
			prop.load(fis);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			
			try {
				if(fis != null) {
					fis.close();
				}

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("prop.toString()");
		System.out.println(prop.toString());
		return prop;
	}
	
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
