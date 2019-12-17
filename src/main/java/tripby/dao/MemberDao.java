package tripby.dao;

import java.util.List;
import tripby.domain.Member;

public interface MemberDao {
  public void insert(Member member);
  public void update(int no);
  public void delete(int no);
  public List<Member> findAll();
  public Member findBy(int no);
}
