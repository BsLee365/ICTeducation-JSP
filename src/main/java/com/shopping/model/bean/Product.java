package com.shopping.model.bean;

public class Product {
	
	/* 상품번호 상품이름 거래처이름 이미지 재고수량 단가 카테고리 상세설명 적립금액 입고일자 */
	private Integer num;
	private String name;
	private String company;
	private String image;
	private Integer stock;
	private Integer price;
	private String category;
	private String contents;
	private Integer points;
	private String imputdate;
	
	public Product(Integer num, String name, String company, String image, Integer stock, Integer price,
			String category, String contents, Integer points, String imputdate) {
		super();
		this.num = num;
		this.name = name;
		this.company = company;
		this.image = image;
		this.stock = stock;
		this.price = price;
		this.category = category;
		this.contents = contents;
		this.points = points;
		this.imputdate = imputdate;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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

	public String getImputdate() {
		return imputdate;
	}

	public void setImputdate(String imputdate) {
		this.imputdate = imputdate;
	}
	
	
}
