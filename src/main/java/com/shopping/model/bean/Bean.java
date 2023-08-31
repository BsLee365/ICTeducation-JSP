package com.shopping.model.bean;

public class Bean {
	private Integer pnum;
	private String name;
	private String company;
	private Integer price;
	
	public Bean(){
		
	}
	public Integer getPnum() {
		return pnum;
	}
	public void setPnum(Integer pnum) {
		this.pnum = pnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Bean [pnum=" + pnum + ", name=" + name + ", company=" + company + ", price=" + price + "]";
	}
}
