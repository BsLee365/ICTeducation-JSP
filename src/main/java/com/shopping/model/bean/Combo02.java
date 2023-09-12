package com.shopping.model.bean;

public class Combo02 {
	private String name;
	private int cnt;
	
	public Combo02(){
		
	}
	
	public int getCnt() {
		return cnt;
	}


	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}


	@Override
	public String toString() {
		return "Combo02 [name=" + name + ", cnt=" + cnt + "]";
	}
	
}
