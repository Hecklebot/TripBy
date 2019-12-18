package tripby.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Configuration
public class SocketHandler extends TextWebSocketHandler {
  
  private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
  
  @Bean
  public List<WebSocketSession> sessionList() {
    return sessionList;
  }
  
  // 클라이언트와 연결 이후에 실행되는 메서드
  @Override
  public void afterConnectionEstablished(
      WebSocketSession session) throws Exception {
    
    sessionList.add(session);
    for (WebSocketSession session2 : sessionList) {
      session2.sendMessage(
          new TextMessage(session.getId() + "님이 입장하셨습니다"));
    }
  }
  
  // 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드
  @Override
  public void handleTextMessage(
      WebSocketSession session, TextMessage message) throws Exception {
    
    for (WebSocketSession session2 : sessionList) {
      session2.sendMessage(
          new TextMessage(session.getId() + "님: " + message.getPayload()));
    }
  }
  
  // 클라이언트와 연결을 끊었을 때 실행되는 메소드
  @Override
  public void afterConnectionClosed(
      WebSocketSession session, CloseStatus status) throws Exception {
    
    sessionList.remove(session);
    for (WebSocketSession session2 : sessionList) {
      session2.sendMessage(new TextMessage(session.getId() + "님이 퇴장하셨습니다"));
    }
  }
  
  
  
}
