/**
* 작업 날짜 : 2015. 11. 20.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.websocket.controller;

import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.easyware.common.security.Member_Vo_Security;

public class Chat_Handler extends TextWebSocketHandler{
	
	private Map<String,WebSocketSession> users = new ConcurrentHashMap<>();
	
	@Override // 세션 연결
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String msg=session.getPrincipal().getName();
		
		
		Map<String, Object> map=session.getAttributes();
		System.out.println(msg);
		users.put(session.getId(), session);
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		String payLoad =(String) message.getPayload();
		
		System.out.println("메시지 "+payLoad);
		for (WebSocketSession s : users.values()) {
			s.sendMessage(message);	
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		String msg=exception.getMessage();
		// System.out.println(":::::::::::::::::::"+msg);
	}
	
	// 연결 종료시 
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		int code=status.getCode();
		// System.out.println("::::::::::::::::::::::: "+code);
		users.remove(session.getId(),session);
		
	}
	
}
