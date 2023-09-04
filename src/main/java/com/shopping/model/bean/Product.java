package com.shopping.model.bean;

public class Product {
	
	/* 상품번호 상품이름 거래처이름 이미지 재고수량 단가 카테고리 상세설명 적립금액 입고일자 */
	private Integer num;
	private String name;
	private String company;
	private String image01;
	private String image02;
	private String image03;
	private Integer stock;
	private Integer price;
	private String category;
	private String contents;
	private Integer points;
	private String inputdate;
	
	public Product() {
		
	}
	
	public Product(Integer num, String name, String company, String image01, String image02 , String image03, Integer stock, Integer price,
			String category, String contents, Integer points, String inputdate) {
		super();
		this.num = num;
		this.name = name;
		this.company = company;
		this.image01 = image01;
		this.image02 = image02;
		this.image03 = image03;
		this.stock = stock;
		this.price = price;
		this.category = category;
		this.contents = contents;
		this.points = points;
		this.inputdate = inputdate;
	}
	
	@Override
	public String toString() {
		return "Product [num=" + num + ", name=" + name + ", company=" + company + ", image01=" + image01 + ", image02="
				+ image02 + ", image03=" + image03 + ", stock=" + stock + ", price=" + price + ", category=" + category
				+ ", contents=" + contents + ", points=" + points + ", Inputdate=" + inputdate + "]";
	}
	
	public String getImage01() {
		return image01;
	}

	public void setImage01(String image01) {
		this.image01 = image01;
	}

	public String getImage02() {
		return image02;
	}

	public void setImage02(String image02) {
		this.image02 = image02;
	}

	public String getImage03() {
		return image03;
	}

	public void setImage03(String image03) {
		this.image03 = image03;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
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

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Integer getPoints() {
		return points;
	}

	public void setPoints(Integer points) {
		this.points = points;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}
	
	
}
