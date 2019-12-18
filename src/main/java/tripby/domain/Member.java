package tripby.domain;

import lombok.Data;

@Data
public class Member {
  private int memberNo;
  private String email;
  private String name;
  private String password;
  private String tel;
  private String emailKey;
  private String profilePhoto;
  private int state;
  private int grade;
  private int restriction;
  
  private String socketId;
}
