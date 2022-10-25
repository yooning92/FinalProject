package com.itwill.brown_carrot_market.dto;

public class TownReply {
	/*
T_REPLY_NO	NUMBER(10,0)
T_REPLY_TITLE	VARCHAR2(300 BYTE)
T_REPLY_CONTENT	VARCHAR2(1000 BYTE)
T_REPLY_DATE	DATE
GROUPNO	NUMBER(10,0)
STEP	NUMBER(10,0)
DEPTH	NUMBER(10,0)
USER_ID	VARCHAR2(30 BYTE)
T_NO	NUMBER(10,0)
	 */
	private int t_reply_no;
	private String t_reply_title;
	private String t_reply_content;
	private String t_reply_date;
	private int groupno;
	private int step;
	private int depth;
	private UserInfo userInfo;
	private TownBoard townBoard;
	
	public TownReply() {
		// TODO Auto-generated constructor stub
	}
	public TownReply(int t_reply_no, String t_reply_title, String t_reply_content, String t_reply_date, int groupno,
			int step, int depth, UserInfo userInfo, TownBoard townBoard) {
		super();
		this.t_reply_no = t_reply_no;
		this.t_reply_title = t_reply_title;
		this.t_reply_content = t_reply_content;
		this.t_reply_date = t_reply_date;
		this.groupno = groupno;
		this.step = step;
		this.depth = depth;
		this.userInfo = userInfo;
		this.townBoard = townBoard;
	}
	public int getT_reply_no() {
		return t_reply_no;
	}
	public void setT_reply_no(int t_reply_no) {
		this.t_reply_no = t_reply_no;
	}
	public String getT_reply_title() {
		return t_reply_title;
	}
	public void setT_reply_title(String t_reply_title) {
		this.t_reply_title = t_reply_title;
	}
	public String getT_reply_content() {
		return t_reply_content;
	}
	public void setT_reply_content(String t_reply_content) {
		this.t_reply_content = t_reply_content;
	}
	public String getT_reply_date() {
		return t_reply_date;
	}
	public void setT_reply_date(String t_reply_date) {
		this.t_reply_date = t_reply_date;
	}
	public int getGroupno() {
		return groupno;
	}
	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public UserInfo getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
	public TownBoard getTownBoard() {
		return townBoard;
	}
	public void setTownBoard(TownBoard townBoard) {
		this.townBoard = townBoard;
	}
	@Override
	public String toString() {
		return "TownReply [t_reply_no=" + t_reply_no + ", t_reply_title=" + t_reply_title + ", t_reply_content="
				+ t_reply_content + ", t_reply_date=" + t_reply_date + ", groupno=" + groupno + ", step=" + step
				+ ", depth=" + depth + ", userInfo=" + userInfo + ", townBoard=" + townBoard + "]";
	}
	
	
	
	
}
