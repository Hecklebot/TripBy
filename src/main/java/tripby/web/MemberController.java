package tripby.web;

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
    return "redirect:../member/loginForm";
  }
  
  @PostMapping("checkEmail")
  @ResponseBody
  public String checkEmail(@RequestBody Member member) {
    return new Gson().toJson(memberService.checkEmail(member));
  }

  @PostMapping("findEmail")
  @ResponseBody
  public String findEmail(@RequestBody Member member) {
    return new Gson().toJson(memberService.findEmail(member));
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
