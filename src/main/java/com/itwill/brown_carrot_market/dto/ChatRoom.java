package com.itwill.brown_carrot_market.dto;

public class ChatRoom {
	private Integer c_room_no;
	private String from_id;
	private String to_id;
	private Integer p_no;
	/*****************************/
	private Integer not_read;
	private String send_time;
	private String c_content;
	
	public ChatRoom() {
		super();
	}

	public ChatRoom(Integer c_room_no, String from_id, String to_id, Integer p_no, Integer not_read, String send_time,
			String c_content) {
		super();
		this.c_room_no = c_room_no;
		this.from_id = from_id;
		this.to_id = to_id;
		this.p_no = p_no;
		this.not_read = not_read;
		this.send_time = send_time;
		this.c_content = c_content;
	}

	public Integer getC_room_no() {
		return c_room_no;
	}

	public void setC_room_no(Integer c_room_no) {
		this.c_room_no = c_room_no;
	}

	public String getFrom_id() {
		return from_id;
	}

	public void setFrom_id(String from_id) {
		this.from_id = from_id;
	}

	public String getTo_id() {
		return to_id;
	}

	public void setTo_id(String to_id) {
		this.to_id = to_id;
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

	@Override
	public String toString() {
		return "ChatRoom [c_room_no=" + c_room_no + ", from_id=" + from_id + ", to_id=" + to_id + ", p_no=" + p_no
				+ ", not_read=" + not_read + ", send_time=" + send_time + ", c_content=" + c_content + "]";
	}

	
	
	
	
	
	
	
}