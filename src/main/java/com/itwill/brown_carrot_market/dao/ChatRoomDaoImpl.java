package com.itwill.brown_carrot_market.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.brown_carrot_market.dto.ChatRoom;
import com.itwill.brown_carrot_market.dto.ChatRoomListView;
import com.itwill.brown_carrot_market.mapper.ChatRoomMapper;



@Repository
public class ChatRoomDaoImpl implements ChatRoomDao {
	
	@Autowired
	private ChatRoomMapper chatRoomMapper;
	
	
	public ChatRoomDaoImpl() {
		
	}
	
	// 채팅방 전체 조회
	@Override
	public List<ChatRoomListView> chatRoomSelectAll(String user_id) {
		return chatRoomMapper.chatRoomSelectAll(user_id);
	}
	
	// 채팅방 목록 체크기능
	@Override
	public ChatRoom chatRoomSelect(Integer c_room_no) {
		return chatRoomMapper.chatRoomSelect(c_room_no);
	}
	// 채팅방 목록  from,to,p_no으로 방번호 찾기
	@Override
	public ChatRoom chatRoomSelectFTP(String from_id, String to_id, Integer p_no) {
		return chatRoomMapper.chatRoomSelectFTP(from_id,to_id,p_no);
	}
	
	// 채팅방 생성
	@Override
	public int chatRoomCreate(String from_id, String to_id, Integer p_no) {
		return chatRoomMapper.chatRoomCreate(from_id, to_id, p_no);
	}
	// 채팅방 삭제
	@Override
	public int chatRoomDelete(int c_room_no) {
		return chatRoomMapper.chatRoomDelete(c_room_no);
	}
	// 첫 채팅방 삭제 --> To
		@Override
		public int chatRoomDelteTo(String user_id,int c_room_no) {
			return chatRoomMapper.chatRoomDeleteTo(user_id, c_room_no);
		}
		// 첫 채팅방 삭제 --> From
			@Override
			public int chatRoomDelteFrom(String user_id,int c_room_no) {
				return chatRoomMapper.chatRoomDeleteFrom(user_id, c_room_no);
			}
			
		// 첫채팅방 삭제 체크
			@Override
			public int chatRoomDeleteCheck(int c_room_no) {
				return chatRoomMapper.chatRoomDeleteCheck(c_room_no);
			}
	
	@Override
	public List<ChatRoom> chatRoomCheck(String from_id,String to_id,Integer p_no) {
		return chatRoomMapper.chatRoomCheck(from_id, to_id, p_no);
	}
	
	@Override
	public int chatNotRead(int c_room_no,String user_id) {
		return chatRoomMapper.chatNotRead(c_room_no, user_id);
	}
	
	//채팅방 p_no, to_id로 채팅중인 사람들 
	@Override
	public List<ChatRoomListView> chatListUsers(int p_no,String user_id) {
		return chatRoomMapper.chatListUsers(p_no, user_id);
	}

	
}
