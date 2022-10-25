package com.itwill.brown_carrot_market.dto;

/*
   이름          널?       유형           
----------- -------- ------------ 
P_CTGR_NO   NOT NULL NUMBER(10)   
P_CTGR_NAME          VARCHAR2(50) 
 */
public class ProductCategory {
	public int p_ctgr_no;
	public String p_ctgr_name;
	
	public ProductCategory() {	
	}

	public ProductCategory(int p_ctgr_no, String p_ctgr_name) {
		super();
		this.p_ctgr_no = p_ctgr_no;
		this.p_ctgr_name = p_ctgr_name;
	}

	public int getP_ctgr_no() {
		return p_ctgr_no;
	}

	public void setP_ctgr_no(int p_ctgr_no) {
		this.p_ctgr_no = p_ctgr_no;
	}

	public String getP_ctgr_name() {
		return p_ctgr_name;
	}

	public void setP_ctgr_name(String p_ctgr_name) {
		this.p_ctgr_name = p_ctgr_name;
	}

	@Override
	public String toString() {
		return "ProductCategory [p_ctgr_no=" + p_ctgr_no + ", p_ctgr_name=" + p_ctgr_name + "]";
	}
	
	
}
