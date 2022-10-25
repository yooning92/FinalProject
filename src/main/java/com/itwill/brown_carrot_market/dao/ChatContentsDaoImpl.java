package com.itwill.brown_carrot_market.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.brown_carrot_market.dto.ChatContents;
import com.itwill.brown_carrot_market.mapper.ChatContentsMapper;

@Repository
public class ChatContentsDaoImpl implements ChatContentsDao {
	@Autowired
	private ChatContentsMapper chatContentsMapper;
	
	public ChatContentsDaoImpl() {
		System.out.println(">>>>>>>>채팅 mapper:"+chatContentsMapper);
	}
	@Override
	public List<ChatContents> chatSellectByRoom(int c_room_no) {
		// TODO Auto-generated method stub
		return chatContentsMapper.chatSellectByRoom(c_room_no);
	}

	@Override
	public ChatContents chatSellectOne(int c_content_no) {
		// TODO Auto-generated method stub
		return chatContentsMapper.chatSellectOne(c_content_no);
	}

	@Override
	public int chatReadUpdate(int c_room_no,String user_id) {
		// TODO Auto-generated method stub
		return chatContentsMapper.chatReadUpdate(c_room_no,user_id);
	}

	@Override
	public int chatDelete(int c_content_no) {
		// TODO Auto-generated method stub
		return chatContentsMapper.chatDelete(c_content_no);
	}

	@Override
	public int deleteChatUpdate(int c_content_no) {
		// TODO Auto-generated method stub
		return chatContentsMapper.deleteChatUpdate(c_content_no);
	}

	@Override
	public int insertChat(ChatContents chat_contents) {
		// TODO Auto-generated method stub
		return chatContentsMapper.insertChat(chat_contents);
	}
	@Override
	public int selectReadChatCount(String user_id) {
		// TODO Auto-generated method stub
		return chatContentsMapper.selectReadChatCount(user_id);
	}

}