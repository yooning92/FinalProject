package com.itwill.brown_carrot_market.dto;

public class ChatContents {
	private Integer c_content_no;
	private String c_content;
	private String send_time;
	private Integer c_read;
	private String user_id;
	private Integer c_room_no;
	
	public ChatContents() {
		super();
	}

	public ChatContents(Integer c_content_no, String c_content, String send_time, Integer c_read, String user_id,
			Integer c_room_no) {
		super();
		this.c_content_no = c_content_no;
		this.c_content = c_content;
		this.send_time = send_time;
		this.c_read = c_read;
		this.user_id = user_id;
		this.c_room_no = c_room_no;
	}
	
	

	public Integer getC_content_no() {
		return c_content_no;
	}

	public void setC_content_no(Integer c_content_no) {
		this.c_content_no = c_content_no;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public String getSend_time() {
		return send_time;
	}

	public void setSend_time(String send_time) {
		this.send_time = send_time;
	}

	public Integer getC_read() {
		return c_read;
	}

	public void setC_read(Integer c_read) {
		this.c_read = c_read;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Integer getC_room_no() {
		return c_room_no;
	}

	public void setC_room_no(Integer c_room_no) {
		this.c_room_no = c_room_no;
	}

	@Override
	public String toString() {
		return "Chat_contents [c_content_no=" + c_content_no + ", c_content=" + c_content + ", send_time=" + send_time
				+ ", c_read=" + c_read + ", user_id=" + user_id + ", c_room_no=" + c_room_no + "]";
	}
	
	

}