package com.itwill.brown_carrot_market.dto;

import java.util.List;

/*
 이름          널?       유형           
----------- -------- ------------ 
WISHLIST_NO NOT NULL NUMBER(10)   
P_NO                 NUMBER(20)   
USER_ID              VARCHAR2(30) 
 */
public class WishList {
	public int wishlist_no;
	public Product product;
	public UserInfo userInfo;
	
	
	
	public WishList() {
	}



	public WishList(int wishlist_no, Product product, UserInfo userInfo) {
		super();
		this.wishlist_no = wishlist_no;
		this.product = product;
		this.userInfo = userInfo;
	}



	public int getWishlist_no() {
		return wishlist_no;
	}



	public void setWishlist_no(int wishlist_no) {
		this.wishlist_no = wishlist_no;
	}



	public Product getProduct() {
		return product;
	}



	public void setProduct(Product product) {
		this.product = product;
	}



	public UserInfo getUserInfo() {
		return userInfo;
	}



	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}



	@Override
	public String toString() {
		return "WishList [wishlist_no=" + wishlist_no + ", product=" + product + ", userInfo=" + userInfo + "]";
	}

	
	
	
	
}