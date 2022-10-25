package com.itwill.brown_carrot_market.dto;

/*
이름              널?       유형            
--------------- -------- ------------- 
review_img_no   NOT NULL NUMBER(10)    
review_img_name NOT NULL VARCHAR2(200) 
review_no                NUMBER(10)   
*/

public class ReviewImage {
	
	public int review_img_no;
	public String review_img_name;
	public int review_no;
	
	public ReviewImage() {
	}
	
	public ReviewImage(int review_img_no, String review_img_name,
			int review_no) {
		super();
		this.review_img_no = review_img_no;
		this.review_img_name = review_img_name;
		this.review_no = review_no;
	}

	public int getReview_img_no() {
		return review_img_no;
	}

	public void setReview_img_no(int review_img_no) {
		this.review_img_no = review_img_no;
	}

	public String getReview_img_name() {
		return review_img_name;
	}

	public void setReview_img_name(String review_img_name) {
		this.review_img_name = review_img_name;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	@Override
	public String toString() {
		return "ReviewImage [review_img_no=" + review_img_no
				+ ", review_img_name=" + review_img_name + ", review_no="
				+ review_no + "]";
	}
	
}
