package com.itwill.brown_carrot_market.dto;

public class TownReaction {
	/*
T_REAC_NO	NUMBER(10,0)
T_REAC_TYPE	NUMBER(10,0)
T_NO	NUMBER(10,0)
USER_ID	VARCHAR2(30 BYTE) 
	 */
	private int t_reac_no;
	private int t_reac_type;
	private TownBoard townBoard;
	private UserInfo userInfo;
	
	public TownReaction() {
		// TODO Auto-generated constructor stub
	}

	public TownReaction(int t_reac_no, int t_reac_type, TownBoard townBoard, UserInfo userInfo) {
		super();
		this.t_reac_no = t_reac_no;
		this.t_reac_type = t_reac_type;
		this.townBoard = townBoard;
		this.userInfo = userInfo;
	}

	public int getT_reac_no() {
		return t_reac_no;
	}

	public void setT_reac_no(int t_reac_no) {
		this.t_reac_no = t_reac_no;
	}

	public int getT_reac_type() {
		return t_reac_type;
	}

	public void setT_reac_type(int t_reac_type) {
		this.t_reac_type = t_reac_type;
	}

	public TownBoard getTownBoard() {
		return townBoard;
	}

	public void setTownBoard(TownBoard townBoard) {
		this.townBoard = townBoard;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	@Override
	public String toString() {
		return "TownReaction [t_reac_no=" + t_reac_no + ", t_reac_type=" + t_reac_type + ", townBoard=" + townBoard
				+ ", userInfo=" + userInfo + "]";
	}
	
	
	
	
	
}
