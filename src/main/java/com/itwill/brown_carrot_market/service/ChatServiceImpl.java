package com.itwill.brown_carrot_market.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.brown_carrot_market.dao.ChatContentsDao;
import com.itwill.brown_carrot_market.dao.ChatRoomDao;
import com.itwill.brown_carrot_market.dao.PromiseDao;
import com.itwill.brown_carrot_market.dto.ChatContents;
import com.itwill.brown_carrot_market.dto.ChatRoom;
import com.itwill.brown_carrot_market.dto.ChatRoomListView;
import com.itwill.brown_carrot_market.dto.Promise;



@Service
public class ChatServiceImpl implements ChatService {
	@Autowired 
	ChatContentsDao chat_contentsDao;
	
	@Autowired
	ChatRoomDao chatRoomDao;
	
	@Autowired
	PromiseDao promiseDao;
	
	public ChatServiceImpl() {
		System.out.println(">>>>> 채팅 service 생성");
	}

	@Override
	public List<ChatContents> chatSellectByRoom(int c_room_no) {
		// TODO Auto-generated method stub
		return chat_contentsDao.chatSellectByRoom(c_room_no);
	}

	@Override
	public ChatContents chatSellectOne(int c_content_no) {
		// TODO Auto-generated method stub
		return chat_contentsDao.chatSellectOne(c_content_no);
	}

	@Override
	public int chatReadUpdate(int c_room_no,String user_id) {
		// TODO Auto-generated method stub
		return chat_contentsDao.chatReadUpdate(c_room_no,user_id);
	}

	@Override
	public int chatDelete(int c_content_no) {
		// TODO Auto-generated method stub
		return chat_contentsDao.chatDelete(c_content_no);
	}

	@Override
	public int deleteChatUpdate(int c_content_no) {
		// TODO Auto-generated method stub
		return chat_contentsDao.deleteChatUpdate(c_content_no);
	}

	@Override
	public int insertChat(ChatContents chat_contents) {
		// TODO Auto-generated method stub
		return chat_contentsDao.insertChat(chat_contents);
	}

	@Override
	public String testService() {
		// TODO Auto-generated method stub
		String str= "ChatService 호출 테스트";
		return str;
	}

	// 채팅방 생성
	@Override
	public int chatRoomCreate(String from_id, String to_id, Integer p_no) {
		return chatRoomDao.chatRoomCreate(from_id, to_id, p_no);
	}

	//채팅방 삭제 
		@Override
		public int chatRoomDelete(String user_id,int c_room_no) {
			int result = 0;
			if(chatRoomDao.chatRoomDeleteCheck(c_room_no)==2) {
				ChatRoom chatRoom = chatRoomDao.chatRoomSelect(c_room_no);
				if(chatRoom.getTo_id().equals(user_id)) {
					result = chatRoomDao.chatRoomDelteTo(user_id, c_room_no);
				}else if(chatRoom.getFrom_id().equals(user_id)) {
					result = chatRoomDao.chatRoomDelteFrom(user_id, c_room_no);
				}
			
				
			}
			else if(chatRoomDao.chatRoomDeleteCheck(c_room_no)==1) {
				result = chatRoomDao.chatRoomDelete(c_room_no);
				
			}
			


		
			return result;
		}
	
	// 채팅방 중복 체크 
	@Override
	public boolean duplicateCheck(String from_id, String to_id,Integer p_no) {
		boolean isDuplicated = false;
		List<ChatRoom> ChatRoomList = chatRoomDao.chatRoomCheck(from_id, to_id, p_no);
		for (ChatRoom chat : ChatRoomList) {
			if(chat.getFrom_id().equalsIgnoreCase(from_id) && chat.getP_no()==p_no &&chat.getTo_id().equalsIgnoreCase(to_id)) {
				isDuplicated = true;
			}
		}
		return isDuplicated;
	}
	// 채팅방 목록  from,to,p_no으로 방번호 찾기
	@Override
	public int chatRoomSearch(String from_id, String to_id, Integer p_no) {
		ChatRoom chatRoom = chatRoomDao.chatRoomSelectFTP(from_id, to_id, p_no);
 
		return chatRoom.getC_room_no();
	}

	// 채팅방 전체 조회
	@Override
	public List<ChatRoomListView> chatRoomSelectAll(String user_id) {
		List<ChatRoomListView> chatRoomListView = chatRoomDao.chatRoomSelectAll(user_id);
		/*위에가 문제*/
			System.out.println("service단");


		for (ChatRoomListView a : chatRoomListView) {
			ChatRoom chatRoom = chatRoomDao.chatRoomSelect(a.getC_room_no()); 
			if(chatRoom.getTo_id().equals(user_id)) {
				a.setYou_id(chatRoom.getFrom_id());

			}else if(chatRoom.getFrom_id().equals(user_id)) {
				a.setYou_id(chatRoom.getTo_id());
	
			}
			
		}
	
		return chatRoomListView;
	}

	@Override
	public ChatRoom chatRoomSelect(Integer c_room_no) {
		return chatRoomDao.chatRoomSelect(c_room_no);
	}
	
	@Override
	public int chatNotRead(int c_room_no,String user_id) {
		return chatRoomDao.chatNotRead(c_room_no, user_id);
	}

	@Override
	public Promise promiseSelect(int c_room_no) {
		// TODO Auto-generated method stub
		return promiseDao.promiseSelect(c_room_no);
	}

	@Override
	public int promiseInsert(Promise promise) {
		// TODO Auto-generated method stub
		return promiseDao.promiseInsert(promise);
	}

	@Override
	public int promiseDelete(int c_room_no) {
		// TODO Auto-generated method stub
		return promiseDao.promiseDelete(c_room_no);
	}

	@Override
	public int promiseUpdate(Promise promise) {
		// TODO Auto-generated method stub
		return promiseDao.promiseUpdate(promise);
	}

	@Override
	public int promiseExist(int c_room_no) {
		// TODO Auto-generated method stub
		return promiseDao.promiseExist(c_room_no);
	}

	@Override
	public List<Promise> promiseAlert(String user_id) {
		// TODO Auto-generated method stub
		return promiseDao.promiseAlert(user_id);
	}
	
	//안읽은메세지수

	@Override
	public int selectReadChatCount(String user_id) {
		// TODO Auto-generated method stub
		return chat_contentsDao.selectReadChatCount(user_id);
	}
	
	//채팅방 p_no, to_id로 채팅중인 사람들 
	@Override
	public List<ChatRoomListView> chatListUsers(int p_no,String user_id) {
		// TODO Auto-generated method stub
		return chatRoomDao.chatListUsers(p_no,user_id);
	}

	
	

}