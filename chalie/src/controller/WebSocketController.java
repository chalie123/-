package controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

@Controller("ws")
public class WebSocketController extends TextWebSocketHandler{

	Map<WebSocketSession, String> wsSessions;
	
	@PostConstruct 
	public void init() {
		wsSessions=new HashMap<>();
	} 
	
	public void afterConnectionEstablished(WebSocketSession wsSession) throws Exception {
		for(WebSocketSession ws : wsSessions.keySet()) {
			Map map=new HashMap();
			map.put("name", "name");
			map.put("text", "님이 접속하셨습니다.");
			ws.sendMessage(new TextMessage(new Gson().toJson(map)));
		}
		wsSessions.put(wsSession, "name");
		wsSessions.values();
		Map map=new HashMap();
		map.put("logons", wsSessions.values());
		for(WebSocketSession ws : wsSessions.keySet()) {	
			ws.sendMessage(new TextMessage(new Gson().toJson(map)));
		}
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession wsSession, TextMessage message) throws Exception {
		Map map=new HashMap();
		map.put("name", wsSessions.get(wsSession));
		map.put("text", message.getPayload());
		for(WebSocketSession ws : wsSessions.keySet()) {
			ws.sendMessage(new TextMessage(new Gson().toJson(map)));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession wsSession, CloseStatus status) throws Exception {
		System.out.println("WS disconnected.");
		wsSessions.remove(wsSession);
		for(WebSocketSession ws : wsSessions.keySet()) {
			Map map=new HashMap();
			map.put("name", "name");
			map.put("text", "님이 접속을 해제하셨습니다.");
			ws.sendMessage(new TextMessage(new Gson().toJson(map)));
		}
		
	}
}
