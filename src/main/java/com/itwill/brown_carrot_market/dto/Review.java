package com.itwill.brown_carrot_market.dto;

import java.util.List;

public class Review {

	/*
	 이름           널?       유형            
	------------ -------- ------------- 
	review_no    NOT NULL NUMBER(10)    
	review_desc           VARCHAR2(100) 
	review_image          VARCHAR2(100) 
	review_point          NUMBER(10,1)  
	orders_no             NUMBER(10)    
	user_id               VARCHAR2(30)  
	 */
	
	private int review_no;
	private String review_desc;
	private String your_id;
	private double review_point;
	private Orders orders;
	private UserInfo userInfo;
	
	private List<ReviewImage> reviewImageList;
	
	public Review() {
	}

	public Review(int review_no, String review_desc, String your_id, double review_point, Orders orders,
			UserInfo userInfo, List<ReviewImage> reviewImageList) {
		super();
		this.review_no = review_no;
		this.review_desc = review_desc;
		this.your_id = your_id;
		this.review_point = review_point;
		this.orders = orders;
		this.userInfo = userInfo;
		this.reviewImageList = reviewImageList;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getReview_desc() {
		return review_desc;
	}

	public void setReview_desc(String review_desc) {
		this.review_desc = review_desc;
	}

	public String getYour_id() {
		return your_id;
	}

	public void setYour_id(String your_id) {
		this.your_id = your_id;
	}

	public double getReview_point() {
		return review_point;
	}

	public void setReview_point(double review_point) {
		this.review_point = review_point;
	}

	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public List<ReviewImage> getReviewImageList() {
		return reviewImageList;
	}

	public void setReviewImageList(List<ReviewImage> reviewImageList) {
		this.reviewImageList = reviewImageList;
	}

	@Override
	public String toString() {
		return "Review [review_no=" + review_no + ", review_desc=" + review_desc + ", your_id=" + your_id
				+ ", review_point=" + review_point + ", orders=" + orders + ", userInfo=" + userInfo
				+ ", reviewImageList=" + reviewImageList + "]";
	}

	
}
