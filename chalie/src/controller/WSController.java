package controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

@Controller
@RequestMapping("/WebSocket")
public class WSController extends TextWebSocketHandler{

	Set<WebSocketSession> wsSessions;
	Map<WebSocketSession, String> wsSessionMap;
	
	@PostConstruct
	public void init() {
		wsSessions=new LinkedHashSet<>();
		wsSessionMap=new LinkedHashMap<>();
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession wsSession) throws Exception {
		String ip=wsSession.getRemoteAddress().getAddress().getHostAddress().toString();
		wsSessions.add(wsSession);
		wsSessionMap.put(wsSession, "name");
		Map map=new HashMap();
		map.put("cnt", wsSessions.size());
		map.put("info", ip+" �뿉�꽌 �젒�냽�븯�뀲�뒿�땲�떎.");
		wsSession.sendMessage(new TextMessage(new Gson().toJson(map)));
		for(WebSocketSession ws : wsSessions) {
			ws.sendMessage(new TextMessage("HELLO"));
		}
		System.out.println("current size : "+wsSessions.size());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession wsSession, TextMessage message) throws Exception {
		for(WebSocketSession ws : wsSessions) {
			wsSession.sendMessage(new TextMessage(new Gson().toJson(message)));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession wsSession, CloseStatus status) throws Exception {
		wsSessions.remove(wsSession);
		wsSessionMap.remove("");
		for(WebSocketSession ws : wsSessions) {
			wsSession.sendMessage(new TextMessage(new Gson().toJson(message)));
		}
		
	}
}
