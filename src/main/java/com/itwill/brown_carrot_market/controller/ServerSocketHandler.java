package com.itwill.brown_carrot_market.controller;

import java.util.HashMap;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.itwill.brown_carrot_market.service.ChatService;

@Controller
@ServerEndpoint(value = "/serverSocket")
public class ServerSocketHandler {
	@Autowired
	private ChatService chatService;
	
	private String id=null;
	
	private static Map<String,Session> serverClientSession=new HashMap<String,Session>();
	
	
	@OnOpen
	public void serverSocketOpen(Session session) {
		String mId = (String)session.getQueryString();
		this.id=mId;
		serverClientSession.put(mId, session);
		System.out.println(mId+"의 server_client socket 생성:"+session);
	}
	
	@OnMessage
	public void serverSocketMessage(String message,Session session) {
		
	}
	
	@OnClose
	public void serverSocketClose(Session session) {
		System.out.println("server_client socket 닫기");
		serverClientSession.remove(id);

	}
	
	

}
