package com.itwill.brown_carrot_market.dto;

public class Invitation {
/*
	 이름         널?       유형            
	---------- -------- ------------- 
	INVI_NO    NOT NULL NUMBER(10)    
	INVI_EMAIL          VARCHAR2(100) 
	USER_ID             VARCHAR2(30) 
 */
	
	private int invi_no;
	private String invi_email;
	private String user_id;
	
	public Invitation() {
		// TODO Auto-generated constructor stub
	}

	public Invitation(int invi_no, String invi_email, String user_id) {
		super();
		this.invi_no = invi_no;
		this.invi_email = invi_email;
		this.user_id = user_id;
	}

	public int getInvi_no() {
		return invi_no;
	}

	public void setInvi_no(int invi_no) {
		this.invi_no = invi_no;
	}

	public String getInvi_email() {
		return invi_email;
	}

	public void setInvi_email(String invi_email) {
		this.invi_email = invi_email;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "Invitation [invi_no=" + invi_no + ", invi_email=" + invi_email + ", user_id=" + user_id + "]";
	}
	
	
}
