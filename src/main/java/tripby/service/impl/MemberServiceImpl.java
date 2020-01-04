package tripby.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import tripby.dao.MemberDao;
import tripby.domain.Member;
import tripby.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
  
  @Resource
  MemberDao memberDao;
  
  @Override
  public void insert(Member member) {
    memberDao.insert(member);
  }
  
  @Override
  public List<Member> list() {
    return memberDao.findAll();
  }
  
  @Override
  public int checkEmail(Member member) {
    if(memberDao.checkEmail(member) == null) {
      return 0;
    } else {
      return 1;
    }
  }

  @Override
  public Member findEmail(Member member) {
    if(memberDao.findEmail(member) == null) {
      return null;
    }
    return memberDao.findEmail(member);
  }
  
  @Override
  public Member login(Member member) {
    if(memberDao.login(member) == null) {
      return null;
    }
    return memberDao.login(member);
  }
}
