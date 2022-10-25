package com.itwill.brown_carrot_market.dto;

import java.sql.Date;

/*
이름        널?       유형           
--------- -------- ------------ 
ORDERS_NO NOT NULL NUMBER(10)   
P_NO               NUMBER(20)   
USER_ID            VARCHAR2(10) 
 */
public class Orders {
	private int orders_no;
	private Product product;
	private UserInfo userinfo;
	private Transfer transfer;
	private String orders_date;
	private ProductImage productImage;
	
	public Orders() {

	}

	public Orders(int orders_no, Product product, UserInfo userinfo, Transfer transfer, String orders_date,
			ProductImage productImage) {
		super();
		this.orders_no = orders_no;
		this.product = product;
		this.userinfo = userinfo;
		this.transfer = transfer;
		this.orders_date = orders_date;
		this.productImage = productImage;
	}

	public int getOrders_no() {
		return orders_no;
	}

	public void setOrders_no(int orders_no) {
		this.orders_no = orders_no;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public UserInfo getUserinfo() {
		return userinfo;
	}

	public void setUserinfo(UserInfo userinfo) {
		this.userinfo = userinfo;
	}

	public Transfer getTransfer() {
		return transfer;
	}

	public void setTransfer(Transfer transfer) {
		this.transfer = transfer;
	}

	public String getOrders_date() {
		return orders_date;
	}

	public void setOrders_date(String orders_date) {
		this.orders_date = orders_date;
	}

	public ProductImage getProductImage() {
		return productImage;
	}

	public void setProductImage(ProductImage productImage) {
		this.productImage = productImage;
	}

	@Override
	public String toString() {
		return "Orders [orders_no=" + orders_no + ", product=" + product + ", userinfo=" + userinfo + ", transfer="
				+ transfer + ", orders_date=" + orders_date + ", productImage=" + productImage + "]";
	}

	
}
