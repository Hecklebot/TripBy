package tripby.web;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
}
