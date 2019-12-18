package tripby.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.WebSocketSession;

@Controller
@RequestMapping
public class ChatController {
  
  @Autowired
  List<WebSocketSession> sessionList;
  
  @GetMapping("chat")
  public void chat() {
    for (WebSocketSession session : sessionList)
      System.out.println(session.getId());
  }
  
}
