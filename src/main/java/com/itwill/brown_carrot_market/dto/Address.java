package com.itwill.brown_carrot_market.dto;

public class Address {
	/*
	 이름            널?       유형            
	------------- -------- ------------- 
	ADDRESS_NO    NOT NULL NUMBER(30)    
	ADDRESS_NAME           VARCHAR2(100) 
	ADDRESS_LAT            NUMBER(20,10) 
	ADDRESS_LNG            NUMBER(20,10) 
	ADDRESS_RANGE          NUMBER(20)    
	USER_ID                VARCHAR2(30)   
	 */
	
	private int address_no;
	private String address_name;
	private double address_lat;
	private double address_lng;
	private int address_range;
	
	private String user_id;
	
	public Address() {
		// TODO Auto-generated constructor stub
	}

	public Address(int address_no, String address_name, double address_lat,
			double address_lng, int address_range, String user_id) {
		super();
		this.address_no = address_no;
		this.address_name = address_name;
		this.address_lat = address_lat;
		this.address_lng = address_lng;
		this.address_range = address_range;
		this.user_id = user_id;
	}

	public int getAddress_no() {
		return address_no;
	}

	public void setAddress_no(int address_no) {
		this.address_no = address_no;
	}

	public String getAddress_name() {
		return address_name;
	}

	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}

	public double getAddress_lat() {
		return address_lat;
	}

	public void setAddress_lat(double address_lat) {
		this.address_lat = address_lat;
	}

	public double getAddress_lng() {
		return address_lng;
	}

	public void setAddress_lng(double address_lng) {
		this.address_lng = address_lng;
	}

	public int getAddress_range() {
		return address_range;
	}

	public void setAddress_range(int address_range) {
		this.address_range = address_range;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "Address [address_no=" + address_no + ", address_name="
				+ address_name + ", address_lat=" + address_lat
				+ ", address_lng=" + address_lng + ", address_range="
				+ address_range + ", user_id=" + user_id + "]";
	}
	
}
