package com.itwill.brown_carrot_market.dto;

public class Notice {
	
	/*
NOTICE_NO	NUMBER(10,0)
NOTICE_TITLE	VARCHAR2(100 BYTE)
NOTICE_CONTENT	VARCHAR2(1000 BYTE)
NOTICE_DATE	DATE
NOTICE_COUNT	NUMBER(10,0)
NOTICE_FIX	NUMBER(10,0)
	 */
	private int notice_no;
	private String notice_title;
	private String notice_content;
	private String notice_date;
	private int notice_count;
	private int notice_fix;
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(int notice_no, String notice_title, String notice_content, String notice_date, int notice_count,
			int notice_fix) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.notice_count = notice_count;
		this.notice_fix = notice_fix;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}

	public int getNotice_count() {
		return notice_count;
	}

	public void setNotice_count(int notice_count) {
		this.notice_count = notice_count;
	}

	public int getNotice_fix() {
		return notice_fix;
	}

	public void setNotice_fix(int notice_fix) {
		this.notice_fix = notice_fix;
	}

	@Override
	public String toString() {
		return "Notice [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_date=" + notice_date + ", notice_count=" + notice_count + ", notice_fix="
				+ notice_fix + "]";
	}
	
	
	
	
	
}
