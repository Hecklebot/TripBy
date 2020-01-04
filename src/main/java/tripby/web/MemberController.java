package tripby.web;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import tripby.domain.Member;
import tripby.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
  
  @Resource
  private MemberService memberService;
  
  @GetMapping("form")
  public void form() {
  }
  
  @PostMapping("add")
  public String add(Member member) {
    System.out.println(member);
    memberService.insert(member);
    return "redirect:../member/form";
  }
  
  @PostMapping("checkEmail")
  @ResponseBody
  public Map<String, Integer> checkEmail(@RequestBody Member member) {
    Map<String, Integer> checkMap = new HashMap<>();
    checkMap.put("checked", memberService.checkEmail(member));
    return checkMap;
  }

  @PostMapping("findEmail")
  @ResponseBody
  public Map<String, String> findEmail(@RequestBody Member member) {
    System.out.println(new Gson().toJson(memberService.findEmail(member)));
    Map<String, String> findMap = new HashMap<>();
    findMap.put("findValue", memberService.findEmail(member).getEmail());
    return findMap;
  }
  
  @GetMapping("loginForm")
  public void loginForm() {
  }
  
  @PostMapping("login")
  @ResponseBody
  public String login(@RequestBody Member member, HttpSession session) {
    Member loginUser = memberService.login(member);
    System.out.println("loginUser: " + new Gson().toJson(loginUser));
    session.setAttribute("loginUser", loginUser);
    return new Gson().toJson(loginUser);
  }
}
