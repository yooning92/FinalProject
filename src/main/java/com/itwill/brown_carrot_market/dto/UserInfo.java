package com.itwill.brown_carrot_market.dto;

import java.util.List;

public class UserInfo {
	/*
	 이름             널?       유형            
	-------------- -------- ------------- 
	USER_ID        NOT NULL VARCHAR2(30)  
	USER_PW                 VARCHAR2(50)  
	USER_NAME               VARCHAR2(50)  
	USER_EMAIL              VARCHAR2(100) 
	USER_PHONE              VARCHAR2(15)  
	USER_FRESHNESS          NUMBER(10,1)  
	USER_POINT              NUMBER(10)    
	USER_PROFILE            VARCHAR2(200) 
	 */
	
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_email;
	private String user_phone;
	private double user_freshness;
	private int user_point; 
	private String user_profile;
	
	private List<Address> addressList;
	
	
	public UserInfo() {
		// TODO Auto-generated constructor stub
	}


	public UserInfo(String user_id, String user_pw, String user_name,
			String user_email, String user_phone, double user_freshness,
			int user_point, String user_profile, List<Address> addressList) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_phone = user_phone;
		this.user_freshness = user_freshness;
		this.user_point = user_point;
		this.user_profile = user_profile;
		this.addressList = addressList;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getUser_pw() {
		return user_pw;
	}


	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public String getUser_email() {
		return user_email;
	}


	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}


	public String getUser_phone() {
		return user_phone;
	}


	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}


	public double getUser_freshness() {
		return user_freshness;
	}


	public void setUser_freshness(double user_freshness) {
		this.user_freshness = user_freshness;
	}


	public int getUser_point() {
		return user_point;
	}


	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}


	public String getUser_profile() {
		return user_profile;
	}


	public void setUser_profile(String user_profile) {
		this.user_profile = user_profile;
	}


	public List<Address> getAddressList() {
		return addressList;
	}


	public void setAddressList(List<Address> addressList) {
		this.addressList = addressList;
	}
	/*
	 *패쓰워드 일치여부 검사 
	 */
	public boolean isMatchPassword(String password){
		boolean isMatch=false;
		if(this.user_pw.equals(password)){
			isMatch=true;
		}
		return isMatch;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_pw=" + user_pw
				+ ", user_name=" + user_name + ", user_email=" + user_email
				+ ", user_phone=" + user_phone + ", user_freshness="
				+ user_freshness + ", user_point=" + user_point
				+ ", user_profile=" + user_profile + ", addressList="
				+ addressList + "]";
	}
	public String toString2() {
		return "user_id=" + user_id + "&user_pw=" + user_pw
				+ "&user_name=" + user_name + "&user_email=" + user_email
				+ "&user_phone=" + user_phone + "&user_freshness="
				+ user_freshness + "&user_point=" + user_point
				+ "&user_profile=" + user_profile + "&addressList="
				+ addressList;
	}

	

}







