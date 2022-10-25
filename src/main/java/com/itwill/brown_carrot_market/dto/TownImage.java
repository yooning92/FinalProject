package com.itwill.brown_carrot_market.dto;

public class TownImage {
	/*
T_IMG_NO	NUMBER(10,0)
T_IMG_NAME	VARCHAR2(100 BYTE)
T_NO	NUMBER(10,0) 
	 */
	private int t_img_no;
	private String t_img_name;
	private int t_no;
	
	
	public TownImage() {
		// TODO Auto-generated constructor stub
	}


	public TownImage(int t_img_no, String t_img_name, int t_no) {
		super();
		this.t_img_no = t_img_no;
		this.t_img_name = t_img_name;
		this.t_no = t_no;
	}


	public int getT_img_no() {
		return t_img_no;
	}


	public void setT_img_no(int t_img_no) {
		this.t_img_no = t_img_no;
	}


	public String getT_img_name() {
		return t_img_name;
	}


	public void setT_img_name(String t_img_name) {
		this.t_img_name = t_img_name;
	}


	public int getT_no() {
		return t_no;
	}


	public void setT_no(int t_no) {
		this.t_no = t_no;
	}


	@Override
	public String toString() {
		return "TownImage [t_img_no=" + t_img_no + ", t_img_name=" + t_img_name + ", t_no=" + t_no + "]";
	}
	
	
}
