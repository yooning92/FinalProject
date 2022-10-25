package com.itwill.brown_carrot_market.dto;

public class TownCategory {
	/*
T_CTGR_NO	NUMBER(10,0)
T_CTGR_NAME	VARCHAR2(100 BYTE)
	 */
	private int t_ctgr_no;
	private String t_ctgr_name;
	
	public TownCategory() {
		// TODO Auto-generated constructor stub
	}

	public TownCategory(int t_ctgr_no, String t_ctgr_name) {
		super();
		this.t_ctgr_no = t_ctgr_no;
		this.t_ctgr_name = t_ctgr_name;
	}

	public int getT_ctgr_no() {
		return t_ctgr_no;
	}

	public void setT_ctgr_no(int t_ctgr_no) {
		this.t_ctgr_no = t_ctgr_no;
	}

	public String getT_ctgr_name() {
		return t_ctgr_name;
	}

	public void setT_ctgr_name(String t_ctgr_name) {
		this.t_ctgr_name = t_ctgr_name;
	}

	@Override
	public String toString() {
		return "TownCategory [t_ctgr_no=" + t_ctgr_no + ", t_ctgr_name=" + t_ctgr_name + "]";
	}
	
	
	
	
}
