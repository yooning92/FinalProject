package com.itwill.brown_carrot_market.dto;

import java.sql.Date;
import java.util.List;
/*
이름                널?       유형           
----------------- -------- ------------ 
TRANSFER_NO       NOT NULL NUMBER(10)   
TRANSFER_DEPOSIT           NUMBER(10)   
TRANSFER_WITHDRAW          NUMBER(10)   
TRANSFER_DATE              DATE         
USER_ID                    VARCHAR2(30) 
ORDERS_NO                  NUMBER(10)   
 */
public class Transfer {
	private int transfer_no;
	private int transfer_deposit;
	private int transfer_withdraw;
	private String transfer_date;
	private String user_id;
	private Orders orders;
	private Product product;
	private UserInfo userInfo;
	private int t_balance;
	
	public Transfer() {
	
	}

	public Transfer(int transfer_no, int transfer_deposit, int transfer_withdraw, String transfer_date, String user_id,
			Orders orders, Product product, UserInfo userInfo, int t_balance) {
		super();
		this.transfer_no = transfer_no;
		this.transfer_deposit = transfer_deposit;
		this.transfer_withdraw = transfer_withdraw;
		this.transfer_date = transfer_date;
		this.user_id = user_id;
		this.orders = orders;
		this.product = product;
		this.userInfo = userInfo;
		this.t_balance = t_balance;
	}

	public int getTransfer_no() {
		return transfer_no;
	}

	public void setTransfer_no(int transfer_no) {
		this.transfer_no = transfer_no;
	}

	public int getTransfer_deposit() {
		return transfer_deposit;
	}

	public void setTransfer_deposit(int transfer_deposit) {
		this.transfer_deposit = transfer_deposit;
	}

	public int getTransfer_withdraw() {
		return transfer_withdraw;
	}

	public void setTransfer_withdraw(int transfer_withdraw) {
		this.transfer_withdraw = transfer_withdraw;
	}

	public String getTransfer_date() {
		return transfer_date;
	}

	public void setTransfer_date(String transfer_date) {
		this.transfer_date = transfer_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public int getT_balance() {
		return t_balance;
	}

	public void setT_balance(int t_balance) {
		this.t_balance = t_balance;
	}

	@Override
	public String toString() {
		return "Transfer [transfer_no=" + transfer_no + ", transfer_deposit=" + transfer_deposit
				+ ", transfer_withdraw=" + transfer_withdraw + ", transfer_date=" + transfer_date + ", user_id="
				+ user_id + ", orders=" + orders + ", product=" + product + ", userInfo=" + userInfo + ", t_balance="
				+ t_balance + "]";
	}

}