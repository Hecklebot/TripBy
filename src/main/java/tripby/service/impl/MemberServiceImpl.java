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
}
