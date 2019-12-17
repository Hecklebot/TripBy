package tripby.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import tripby.domain.Member;
import tripby.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
  
  private MemberService memberService;
  
  @GetMapping("form")
  public void form() {
  }
  
  @PostMapping("add")
  public String add(Member member) {
    System.out.println(member);
    memberService.insert(member);
    return "redirect:member/form";
  }
  
  @GetMapping("list")
  public void list() {
  }
  
}
