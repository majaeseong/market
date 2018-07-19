package com.jaeseong.market.util;


import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocketHandler extends TextWebSocketHandler{
	
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionSet.remove(session);
	}

	@Override

	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		sessionSet.add(session);

	}


 @Override

	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

	 for(WebSocketSession se : sessionSet) {
	 		if(se.isOpen()) {
	 			se.sendMessage(message);
	 		}
	 	}
 	}
}
