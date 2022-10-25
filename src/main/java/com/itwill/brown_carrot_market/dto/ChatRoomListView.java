package com.itwill.brown_carrot_market.dto;

/**
 * @author qkrrj
 *
 */
public class ChatRoomListView {

	private Integer c_room_no;
	private Integer p_no;
	private Integer not_read;
	private String send_time;
	private String c_content;
	private String you_id;
	private String you_image;
	private String p_img;
	private double you_fresh;
	// you_image
	// you_locate
	// 
	
	public ChatRoomListView() {
		super();
	}

	public ChatRoomListView(Integer c_room_no, Integer p_no, Integer not_read, String send_time, String c_content,
			String you_id,String you_image,String p_img,double you_fresh) {
		super();
		this.c_room_no = c_room_no;
		this.p_no = p_no;
		this.not_read = not_read;
		this.send_time = send_time;
		this.c_content = c_content;
		this.you_id = you_id;
		this.you_image = you_image;
		this.p_img=p_img;
		this.you_fresh=you_fresh;
	}

	public Integer getC_room_no() {
		return c_room_no;
	}

	public void setC_room_no(Integer c_room_no) {
		this.c_room_no = c_room_no;
	}

	public Integer getP_no() {
		return p_no;
	}

	public void setP_no(Integer p_no) {
		this.p_no = p_no;
	}

	public Integer getNot_read() {
		return not_read;
	}

	public void setNot_read(Integer not_read) {
		this.not_read = not_read;
	}

	public String getSend_time() {
		return send_time;
	}

	public void setSend_time(String send_time) {
		this.send_time = send_time;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public String getYou_id() {
		return you_id;
	}

	public void setYou_id(String you_id) {
		this.you_id = you_id;
	}

	public String getYou_image() {
		return you_image;
	}

	public void setYou_image(String you_image) {
		this.you_image = you_image;
	}
	

	public String getP_img() {
		return p_img;
	}

	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	

	public double getYou_fresh() {
		return you_fresh;
	}

	public void setYou_fresh(double you_fresh) {
		this.you_fresh = you_fresh;
	}

	@Override
	public String toString() {
		return "ChatRoomListView [c_room_no=" + c_room_no + ", p_no=" + p_no + ", not_read=" + not_read + ", send_time="
				+ send_time + ", c_content=" + c_content + ", you_id=" + you_id + ", you_image=" + you_image
				+ ", p_img=" + p_img + ", you_fresh=" + you_fresh + "]";
	}

	



	
	
	
}
