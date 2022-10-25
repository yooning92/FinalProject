package com.itwill.brown_carrot_market.dao;

import java.util.List;

import com.itwill.brown_carrot_market.dto.ChatContents;


public interface ChatContentsDao {
public List<ChatContents> chatSellectByRoom(int c_room_no);
	
	public ChatContents chatSellectOne(int c_content_no);
	
	public int chatReadUpdate(int c_room_no,String user_id);
	
	public int chatDelete(int c_content_no);
	
	public int deleteChatUpdate(int c_content_no);
	
	public int insertChat(ChatContents chat_contents);
	
	public int selectReadChatCount(String user_id);

}
