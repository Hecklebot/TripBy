package tripby.dao;

import java.util.List;
import tripby.domain.Member;

public interface MemberDao {
  public void insert(Member member);
  public Member checkEmail(Member member);
  public void update(int no);
  public void delete(int no);
  public List<Member> findAll();
  public Member findBy(int no);
  public Member findEmail(Member member);
  public Member login(Member member);
}
