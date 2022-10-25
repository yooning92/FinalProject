package com.itwill.brown_carrot_market.dto;

public class TownWishList {
	/*
T_WL_NO	NUMBER(10,0)
USER_ID	VARCHAR2(10 BYTE)
T_NO	NUMBER(10,0)
	 */
	private int t_wl_no;
	private UserInfo userInfo;
	private TownBoard townBoard;
	
	public TownWishList() {
		// TODO Auto-generated constructor stub
	}

	public TownWishList(int t_wl_no, UserInfo userInfo, TownBoard townBoard) {
		super();
		this.t_wl_no = t_wl_no;
		this.userInfo = userInfo;
		this.townBoard = townBoard;
	}

	public int getT_wl_no() {
		return t_wl_no;
	}

	public void setT_wl_no(int t_wl_no) {
		this.t_wl_no = t_wl_no;
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
		return "TownWishList [t_wl_no=" + t_wl_no + ", userInfo=" + userInfo + ", townBoard=" + townBoard + "]";
	}
	
	
	
}
