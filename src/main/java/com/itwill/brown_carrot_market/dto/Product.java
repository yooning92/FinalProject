package com.itwill.brown_carrot_market.dto;

import java.util.List;

/*
 이름             널?       유형            
-------------- -------- ------------- 
P_NO           NOT NULL NUMBER(20)    
P_TITLE                 VARCHAR2(500) 
P_DESC                  VARCHAR2(500) 
P_PRICE                 NUMBER(20)    
P_DATE                  DATE          
P_SELL                  NUMBER(10)    
P_COUNT                 NUMBER(10)    
P_WISH                  NUMBER(10)    
P_ADDRESS_NAME          VARCHAR2(100) 
P_ADDRESS_LAT           NUMBER(20,10) 
P_ADDRESS_LNG           NUMBER(20,10) 
P_CTGR_NO               NUMBER(10)    
USER_ID                 VARCHAR2(30)  
 */

public class Product {
	public int p_no;
	public String p_title;
	public String p_desc;
	public int p_price;
	public String p_date;
	public int p_sell;
	public int p_count;
	public int p_wish;
	public String p_address_name;
	public double p_address_lat;
	public double p_address_lng;
	public ProductCategory productCategory;
	public UserInfo userInfo;
	
	public List<ProductImage> productImagesList;
	public List<Address> addressList;
	
	public Product() {
	}

	


	public Product(int p_no, String p_title, String p_desc, int p_price, String p_date, int p_sell, int p_count,
			int p_wish, String p_address_name, double p_address_lat, double p_address_lng, ProductCategory productCategory,
			UserInfo userInfo, List<ProductImage> productImagesList, List<Address> addressList) {
		super();
		this.p_no = p_no;
		this.p_title = p_title;
		this.p_desc = p_desc;
		this.p_price = p_price;
		this.p_date = p_date;
		this.p_sell = p_sell;
		this.p_count = p_count;
		this.p_wish = p_wish;
		this.p_address_name = p_address_name;
		this.p_address_lat = p_address_lat;
		this.p_address_lng = p_address_lng;
		this.productCategory = productCategory;
		this.userInfo = userInfo;
		this.productImagesList = productImagesList;
		this.addressList = addressList;
	}




	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_title() {
		return p_title;
	}

	public void setP_title(String p_title) {
		this.p_title = p_title;
	}

	public String getP_desc() {
		return p_desc;
	}

	public void setP_desc(String p_desc) {
		this.p_desc = p_desc;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_date() {
		return p_date;
	}

	public void setP_date(String p_date) {
		this.p_date = p_date;
	}

	public int getP_sell() {
		return p_sell;
	}

	public void setP_sell(int p_sell) {
		this.p_sell = p_sell;
	}

	public int getP_count() {
		return p_count;
	}

	public void setP_count(int p_count) {
		this.p_count = p_count;
	}

	public int getP_wish() {
		return p_wish;
	}

	public void setP_wish(int p_wish) {
		this.p_wish = p_wish;
	}

	public String getP_address_name() {
		return p_address_name;
	}

	public void setP_address_name(String p_address_name) {
		this.p_address_name = p_address_name;
	}

	public double getP_address_lat() {
		return p_address_lat;
	}

	public void setP_address_lat(double p_address_lat) {
		this.p_address_lat = p_address_lat;
	}

	public double getP_address_lng() {
		return p_address_lng;
	}

	public void setP_address_lng(double p_address_lng) {
		this.p_address_lng = p_address_lng;
	}

	public ProductCategory getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(ProductCategory productCategory) {
		this.productCategory = productCategory;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public List<ProductImage> getProductImagesList() {
		return productImagesList;
	}

	public void setProductImagesList(List<ProductImage> productImagesList) {
		this.productImagesList = productImagesList;
	}
	
	

	public List<Address> getAddressList() {
		return addressList;
	}




	public void setAddressList(List<Address> addressList) {
		this.addressList = addressList;
	}




	@Override
	public String toString() {
		return "Product [p_no=" + p_no + ", p_title=" + p_title + ", p_desc=" + p_desc + ", p_price=" + p_price
				+ ", p_date=" + p_date + ", p_sell=" + p_sell + ", p_count=" + p_count + ", p_wish=" + p_wish
				+ ", p_address_name=" + p_address_name + ", p_address_lat=" + p_address_lat 
				+ ", p_address_lng="+ p_address_lng + ", productCategory=" + productCategory + ", userInfo=" + userInfo
				+ ", productImagesList=" + productImagesList + ", addressList=" + addressList + "]";
	}




	
	
	
}
