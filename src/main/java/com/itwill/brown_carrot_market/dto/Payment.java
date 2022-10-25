package com.itwill.brown_carrot_market.dto;

/* 이름                 널?       유형           
------------------ -------- ------------ 
MERCHANT_UID       NOT NULL VARCHAR2(30) 
PAYMENT_METHOD              VARCHAR2(30) 
PAYMENT_AMOUNT              NUMBER(10)   
PAYMENT_DATE                VARCHAR2(30)
USER_ID						VARCHAR2(30)        
 */
public class Payment {
	private String merchant_uid;
	private String payment_method;
	private int payment_amount;
	private String payment_date;
	private UserInfo userInfo;
	
	public Payment() {

	}
	
	public Payment(String merchant_uid, String payment_method, int payment_amount, String payment_date,
			UserInfo userInfo) {
		super();
		this.merchant_uid = merchant_uid;
		this.payment_method = payment_method;
		this.payment_amount = payment_amount;
		this.payment_date = payment_date;
		this.userInfo = userInfo;
	}
	
	public String getMerchant_uid() {
		return merchant_uid;
	}
	
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	
	public String getPayment_method() {
		return payment_method;
	}
	
	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}
	
	public int getPayment_amount() {
		return payment_amount;
	}
	
	public void setPayment_amount(int payment_amount) {
		this.payment_amount = payment_amount;
	}
	
	public String getPayment_date() {
		return payment_date;
	}
	
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	
	public UserInfo getUserInfo() {
		return userInfo;
	}
	
	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	@Override
	public String toString() {
		return "Payment [merchant_uid=" + merchant_uid + ", payment_method=" + payment_method + ", payment_amount="
				+ payment_amount + ", payment_date=" + payment_date + ", userInfo=" + userInfo + "]";
	}
	
	
	
}
