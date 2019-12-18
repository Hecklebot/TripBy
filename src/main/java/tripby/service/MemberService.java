package tripby.service;

import java.util.List;
import tripby.domain.Member;

public interface MemberService {
  public void insert(Member member);
  public int checkEmail(Member member);
  public List<Member> list();
}
