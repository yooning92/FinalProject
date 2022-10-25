package com.itwill.brown_carrot_market.controller;

import java.util.ArrayList;

import javax.websocket.Session;

import org.springframework.stereotype.Component;

@Component
//@ServerEndpoint("/websocket")
public class WebSocket {
	 private static ArrayList<Session> sessionList = new ArrayList<Session>();
	 
	// @OnOpen
	 public void handleOpen(Session session) {
		System.out.println("session 연결!:"+session);
	 }
	 
	// @OnMessage
	 public void handleMessage(String message,Session session) {
			System.out.println("메세지 전송:"+session);

	 }
	 
	// @OnClose
	 public void handleClose(Session session) {
			System.out.println("session 끊기:"+session);

	 }

}
