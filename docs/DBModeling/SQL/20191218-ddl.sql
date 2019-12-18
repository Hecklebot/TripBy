-- 회원
DROP TABLE IF EXISTS members RESTRICT;

-- 여행계획
DROP TABLE IF EXISTS trip_plans RESTRICT;

-- 여행세부계획
DROP TABLE IF EXISTS trip_detail_plans RESTRICT;

-- 동행
DROP TABLE IF EXISTS comp RESTRICT;

-- 동행회원
DROP TABLE IF EXISTS comp_members RESTRICT;

-- 동행평가
DROP TABLE IF EXISTS comp_eval RESTRICT;

-- 채팅
DROP TABLE IF EXISTS chats RESTRICT;

-- 여행기
DROP TABLE IF EXISTS trip_notes RESTRICT;

-- 여행일지
DROP TABLE IF EXISTS trip_diaries RESTRICT;

-- 여행지평가
DROP TABLE IF EXISTS trip_eval RESTRICT;

-- 동행여행기
DROP TABLE IF EXISTS comp_trip_notes RESTRICT;

-- 여행지정보
DROP TABLE IF EXISTS trip_info RESTRICT;

-- 여행지음식
DROP TABLE IF EXISTS trip_restaurant RESTRICT;

-- 여행지숙박
DROP TABLE IF EXISTS trip_accom RESTRICT;

-- 여행지즐길거리
DROP TABLE IF EXISTS trip_enter RESTRICT;

-- 음식메뉴
DROP TABLE IF EXISTS restaurant_info RESTRICT;

-- 여행지정보사진
DROP TABLE IF EXISTS trip_info_pic RESTRICT;

-- 숙박정보
DROP TABLE IF EXISTS accom_info RESTRICT;

-- 여행일지사진
DROP TABLE IF EXISTS trip_diary_pic RESTRICT;

-- 여행기사진
DROP TABLE IF EXISTS trip_notes_pic RESTRICT;

-- 여행기좋아요
DROP TABLE IF EXISTS trip_notes_like RESTRICT;

-- 여행일지좋아요
DROP TABLE IF EXISTS trip_diary_like RESTRICT;

-- 여행계획좋아요
DROP TABLE IF EXISTS trip_plan_like RESTRICT;

-- 회원신고
DROP TABLE IF EXISTS member_reports RESTRICT;

-- 여행계획댓글
DROP TABLE IF EXISTS trip_plan_comments RESTRICT;

-- 회원
CREATE TABLE members (
  mem_id        INTEGER      NOT NULL, -- 회원번호
  email         VARCHAR(40)  NOT NULL, -- 이메일
  name          VARCHAR(12)  NOT NULL, -- 닉네임
  pwd           VARCHAR(50)  NOT NULL, -- 비밀번호
  tel           VARCHAR(30)  NOT NULL, -- 연락처
  email_key     VARCHAR(255) NULL,     -- 이메일 인증키
  profile_photo VARCHAR(50)  NULL,     -- 사진
  state         INT          NOT NULL DEFAULT 0, -- 상태
  grade         INT          NOT NULL, -- 등급
  restriction   INTEGER      NULL      -- 제재기간
);

-- 회원
ALTER TABLE members
  ADD CONSTRAINT PK_members -- 회원 기본키
    PRIMARY KEY (
      mem_id -- 회원번호
    );

ALTER TABLE members
  MODIFY COLUMN mem_id INTEGER NOT NULL AUTO_INCREMENT;

-- 여행계획
CREATE TABLE trip_plans (
  trip_plan_id INTEGER      NOT NULL, -- 여행계획번호
  mem_id       INTEGER      NOT NULL, -- 회원번호
  sdt          DATE         NULL,     -- 시작일
  edt          DATE         NULL,     -- 종료일
  loca         VARCHAR(255) NULL,     -- 지역
  cdt          DATE         NULL,     -- 작성일
  vcnt         INTEGER      NULL,     -- 조회수
  pub_chk      TINYINT(1)   NULL,     -- 공개여부
  comp_chk     TINYINT(1)   NULL,     -- 동행여부
  purpoose     TEXT         NULL,     -- 목적
  temp_chk     TINYINT(1)   NOT NULL  -- 상태
);

-- 여행계획
ALTER TABLE trip_plans
  ADD CONSTRAINT PK_trip_plans -- 여행계획 기본키
    PRIMARY KEY (
      trip_plan_id -- 여행계획번호
    );

ALTER TABLE trip_plans
  MODIFY COLUMN trip_plan_id INTEGER NOT NULL AUTO_INCREMENT;

-- 여행세부계획
CREATE TABLE trip_detail_plans (
  trip_detail_plan_id INTEGER      NOT NULL, -- 여행세부계획번호
  trip_plan_id        INTEGER      NOT NULL, -- 여행계획번호
  dat                 DATE         NOT NULL, -- 날짜
  time                TIME         NOT NULL, -- 시간
  detail_loca         VARCHAR(255) NOT NULL, -- 세부장소
  detail_plan         TEXT         NOT NULL  -- 세부계획
);

-- 여행세부계획
ALTER TABLE trip_detail_plans
  ADD CONSTRAINT PK_trip_detail_plans -- 여행세부계획 기본키
    PRIMARY KEY (
      trip_detail_plan_id -- 여행세부계획번호
    );

ALTER TABLE trip_detail_plans
  MODIFY COLUMN trip_detail_plan_id INTEGER NOT NULL AUTO_INCREMENT;

-- 동행
CREATE TABLE comp (
  comp_id             INTEGER     NOT NULL, -- 동행번호
  trip_detail_plan_id INTEGER     NOT NULL, -- 여행세부계획번호
  trip_info_id        INTEGER     NOT NULL, -- 여행지정보번호
  loca                VARCHAR(50) NOT NULL, -- 장소
  max_mem             INTEGER     NOT NULL, -- 총인원
  current_mem         INTEGER     NOT NULL, -- 참여인원
  purpose             TEXT        NOT NULL, -- 목적
  gender_chk          TINYINT(1)  NOT NULL  -- 이성여부
);

-- 동행
ALTER TABLE comp
  ADD CONSTRAINT PK_comp -- 동행 기본키
    PRIMARY KEY (
      comp_id -- 동행번호
    );

ALTER TABLE comp
  MODIFY COLUMN comp_id INTEGER NOT NULL AUTO_INCREMENT;

-- 동행회원
CREATE TABLE comp_members (
  comp_mem_id INTEGER NOT NULL, -- 동행회원번호
  comp_id     INTEGER NOT NULL, -- 동행번호
  mem_id      INTEGER NOT NULL, -- 회원번호
  chat_id     INTEGER NOT NULL  -- 채팅번호
);

-- 동행회원
ALTER TABLE comp_members
  ADD CONSTRAINT PK_comp_members -- 동행회원 기본키
    PRIMARY KEY (
      comp_mem_id -- 동행회원번호
    );

ALTER TABLE comp_members
  MODIFY COLUMN comp_mem_id INTEGER NOT NULL AUTO_INCREMENT;

-- 동행평가
CREATE TABLE comp_eval (
  comp_mem_no INTEGER NOT NULL DEFAULT 0, -- 동행회원번호
  rate        DOUBLE  NOT NULL  -- 평점
);

-- 동행평가
ALTER TABLE comp_eval
  ADD CONSTRAINT PK_comp_eval -- 동행평가 기본키
    PRIMARY KEY (
      comp_mem_no -- 동행회원번호
    );

ALTER TABLE comp_eval
  MODIFY COLUMN comp_mem_no INTEGER NOT NULL AUTO_INCREMENT DEFAULT 0;

-- 채팅
CREATE TABLE chats (
  chat_id INTEGER    NOT NULL, -- 채팅번호
  dat     DATETIME   NOT NULL, -- 날짜
  conts   TEXT       NOT NULL, -- 내용
  is_read TINYINT(1) NOT NULL DEFAULT false -- 읽음
);

-- 채팅
ALTER TABLE chats
  ADD CONSTRAINT PK_chats -- 채팅 기본키
    PRIMARY KEY (
      chat_id -- 채팅번호
    );

ALTER TABLE chats
  MODIFY COLUMN chat_id INTEGER NOT NULL AUTO_INCREMENT;

-- 여행기
CREATE TABLE trip_notes (
  note_id      INTEGER     NOT NULL, -- 여행기번호
  trip_plan_id INTEGER     NOT NULL, -- 여행계획번호
  titl         VARCHAR(50) NOT NULL, -- 제목
  conts        TEXT        NOT NULL, -- 내용
  cdt          DATE        NOT NULL, -- 작성일
  vcnt         INTEGER     NOT NULL, -- 조회수
  pub_state    TINYINT(1)  NOT NULL  -- 공개여부
);

-- 여행기
ALTER TABLE trip_notes
  ADD CONSTRAINT PK_trip_notes -- 여행기 기본키
    PRIMARY KEY (
      note_id -- 여행기번호
    );

ALTER TABLE trip_notes
  MODIFY COLUMN note_id INTEGER NOT NULL AUTO_INCREMENT;

-- 여행일지
CREATE TABLE trip_diaries (
  trip_diary_id       INTEGER     NOT NULL, -- 여행일지번호
  trip_detail_plan_id INTEGER     NULL,     -- 여행세부계획번호
  titl                VARCHAR(50) NOT NULL, -- 제목
  conts               TEXT        NOT NULL, -- 내용
  cdt                 DATE        NOT NULL, -- 작성일
  vcnt                INTEGER     NOT NULL DEFAULT 0, -- 조회수
  pub_chk             TINYINT(1)  NOT NULL  -- 공개여부
);

-- 여행일지
ALTER TABLE trip_diaries
  ADD CONSTRAINT PK_trip_diaries -- 여행일지 기본키
    PRIMARY KEY (
      trip_diary_id -- 여행일지번호
    );

ALTER TABLE trip_diaries
  MODIFY COLUMN trip_diary_id INTEGER NOT NULL AUTO_INCREMENT;

-- 여행지평가
CREATE TABLE trip_eval (
  trip_eval_id  INTEGER NOT NULL, -- 여행지평가번호
  trip_diary_id INTEGER NOT NULL, -- 여행일지번호
  access        INT     NOT NULL, -- 접근성
  hyg           INT     NOT NULL, -- 위생
  kindness      INT     NOT NULL, -- 친절
  food          INT     NULL,     -- 음식
  scenery       INT     NULL      -- 경치
);

-- 여행지평가
ALTER TABLE trip_eval
  ADD CONSTRAINT PK_trip_eval -- 여행지평가 기본키
    PRIMARY KEY (
      trip_eval_id -- 여행지평가번호
    );

ALTER TABLE trip_eval
  MODIFY COLUMN trip_eval_id INTEGER NOT NULL AUTO_INCREMENT;

-- 동행여행기
CREATE TABLE comp_trip_notes (
  note_id INTEGER NOT NULL, -- 여행기번호
  comp_id INTEGER NOT NULL  -- 동행번호
);

-- 동행여행기
ALTER TABLE comp_trip_notes
  ADD CONSTRAINT PK_comp_trip_notes -- 동행여행기 기본키
    PRIMARY KEY (
      note_id, -- 여행기번호
      comp_id  -- 동행번호
    );

-- 여행지정보
CREATE TABLE trip_info (
  trip_info_id INTEGER      NOT NULL, -- 여행지정보번호
  trip_eval_id INTEGER      NOT NULL, -- 여행지평가번호
  name         VARCHAR(50)  NOT NULL, -- 이름
  loca         VARCHAR(255) NOT NULL  -- 위치
);

-- 여행지정보
ALTER TABLE trip_info
  ADD CONSTRAINT PK_trip_info -- 여행지정보 기본키
    PRIMARY KEY (
      trip_info_id -- 여행지정보번호
    );

ALTER TABLE trip_info
  MODIFY COLUMN trip_info_id INTEGER NOT NULL AUTO_INCREMENT;

-- 여행지음식
CREATE TABLE trip_restaurant (
  trip_restaurant_id INTEGER      NOT NULL, -- 여행지음식번호
  trip_info_id       INTEGER      NOT NULL, -- 여행지정보번호
  name               VARCHAR(50)  NOT NULL, -- 식당이름
  loca               VARCHAR(255) NOT NULL, -- 위치
  category           VARCHAR(20)  NOT NULL, -- 카테고리
  open_time          TIME         NOT NULL, -- 영업시작시간
  close_time         TIME         NOT NULL  -- 영업종료시간
);

-- 여행지음식
ALTER TABLE trip_restaurant
  ADD CONSTRAINT PK_trip_restaurant -- 여행지음식 기본키
    PRIMARY KEY (
      trip_restaurant_id -- 여행지음식번호
    );

ALTER TABLE trip_restaurant
  MODIFY COLUMN trip_restaurant_id INTEGER NOT NULL AUTO_INCREMENT;

-- 여행지숙박
CREATE TABLE trip_accom (
  trip_accom_id INTEGER      NOT NULL, -- 여행지숙박번호
  trip_info_id  INTEGER      NOT NULL, -- 여행지정보번호
  category      VARCHAR(20)  NOT NULL, -- 종류
  name          VARCHAR(50)  NOT NULL, -- 이름
  loca          VARCHAR(255) NOT NULL, -- 위치
  chkin_time    TIME         NOT NULL, -- 체크인시간
  chkout_time   TIME         NOT NULL, -- 체크아웃시간
  storage_chk   TINYINT(1)   NOT NULL, -- 짐 보관여부
  pickup_chk    TINYINT(1)   NOT NULL  -- 픽업여부
);

-- 여행지숙박
ALTER TABLE trip_accom
  ADD CONSTRAINT PK_trip_accom -- 여행지숙박 기본키
    PRIMARY KEY (
      trip_accom_id -- 여행지숙박번호
    );

ALTER TABLE trip_accom
  MODIFY COLUMN trip_accom_id INTEGER NOT NULL AUTO_INCREMENT;

-- 여행지즐길거리
CREATE TABLE trip_enter (
  trip_enter_id INTEGER      NOT NULL, -- 여행즐길거리번호
  trip_info_id  INTEGER      NOT NULL, -- 여행지정보번호
  category      VARCHAR(20)  NOT NULL, -- 종류
  name          VARCHAR(50)  NOT NULL, -- 이름
  price         INTEGER      NULL     DEFAULT 0, -- 가격
  loca          VARCHAR(255) NOT NULL, -- 위치
  open_time     TIME         NULL,     -- 영업시작시간
  close_time    TIME         NULL      -- 영업종료시간
);

-- 여행지즐길거리
ALTER TABLE trip_enter
  ADD CONSTRAINT PK_trip_enter -- 여행지즐길거리 기본키
    PRIMARY KEY (
      trip_enter_id -- 여행즐길거리번호
    );

ALTER TABLE trip_enter
  MODIFY COLUMN trip_enter_id INTEGER NOT NULL AUTO_INCREMENT;

-- 음식메뉴
CREATE TABLE restaurant_info (
  trip_restaurant_id INTEGER     NOT NULL, -- 여행지음식번호
  name               VARCHAR(50) NOT NULL, -- 이름
  price              INTEGER     NOT NULL DEFAULT 0 -- 가격
);

-- 음식메뉴
ALTER TABLE restaurant_info
  ADD CONSTRAINT PK_restaurant_info -- 음식메뉴 기본키
    PRIMARY KEY (
      trip_restaurant_id -- 여행지음식번호
    );

-- 여행지정보사진
CREATE TABLE trip_info_pic (
  trip_info_pic_id   INTEGER     NOT NULL, -- 여행지정보사진번호
  trip_accom_id      INTEGER     NOT NULL, -- 여행지숙박번호
  trip_restaurant_id INTEGER     NOT NULL, -- 여행지음식번호
  trip_enter_id      INTEGER     NOT NULL, -- 여행즐길거리번호
  file_name          VARCHAR(50) NOT NULL  -- 파일이름
);

-- 여행지정보사진
ALTER TABLE trip_info_pic
  ADD CONSTRAINT PK_trip_info_pic -- 여행지정보사진 기본키
    PRIMARY KEY (
      trip_info_pic_id -- 여행지정보사진번호
    );

ALTER TABLE trip_info_pic
  MODIFY COLUMN trip_info_pic_id INTEGER NOT NULL AUTO_INCREMENT;

-- 숙박정보
CREATE TABLE accom_info (
  accom_info_id INTEGER     NOT NULL, -- 여행지숙박번호
  category      VARCHAR(20) NOT NULL, -- 숙박구분
  price         INTEGER     NOT NULL DEFAULT 0 -- 가격
);

-- 숙박정보
ALTER TABLE accom_info
  ADD CONSTRAINT PK_accom_info -- 숙박정보 기본키
    PRIMARY KEY (
      accom_info_id -- 여행지숙박번호
    );

-- 여행일지사진
CREATE TABLE trip_diary_pic (
  trip_diary_pic_id INTEGER     NOT NULL, -- 여행일지사진번호
  trip_diary_id     INTEGER     NOT NULL, -- 여행일지번호
  file_name         VARCHAR(50) NOT NULL  -- 파일이름
);

-- 여행일지사진
ALTER TABLE trip_diary_pic
  ADD CONSTRAINT PK_trip_diary_pic -- 여행일지사진 기본키
    PRIMARY KEY (
      trip_diary_pic_id -- 여행일지사진번호
    );

ALTER TABLE trip_diary_pic
  MODIFY COLUMN trip_diary_pic_id INTEGER NOT NULL AUTO_INCREMENT;

-- 여행기사진
CREATE TABLE trip_notes_pic (
  photo_id  INTEGER     NOT NULL, -- 여행기사진번호
  note_id   INTEGER     NOT NULL, -- 여행기번호
  file_name VARCHAR(50) NOT NULL  -- 파일이름
);

-- 여행기사진
ALTER TABLE trip_notes_pic
  ADD CONSTRAINT PK_trip_notes_pic -- 여행기사진 기본키
    PRIMARY KEY (
      photo_id -- 여행기사진번호
    );

ALTER TABLE trip_notes_pic
  MODIFY COLUMN photo_id INTEGER NOT NULL AUTO_INCREMENT;

-- 여행기좋아요
CREATE TABLE trip_notes_like (
  mem_id  INTEGER NOT NULL, -- 회원번호
  note_id INTEGER NOT NULL  -- 여행기번호
);

-- 여행기좋아요
ALTER TABLE trip_notes_like
  ADD CONSTRAINT PK_trip_notes_like -- 여행기좋아요 기본키
    PRIMARY KEY (
      mem_id,  -- 회원번호
      note_id  -- 여행기번호
    );

-- 여행일지좋아요
CREATE TABLE trip_diary_like (
  mem_id        INTEGER NOT NULL, -- 회원번호
  trip_diary_id INTEGER NOT NULL  -- 여행일지번호
);

-- 여행일지좋아요
ALTER TABLE trip_diary_like
  ADD CONSTRAINT PK_trip_diary_like -- 여행일지좋아요 기본키
    PRIMARY KEY (
      mem_id,        -- 회원번호
      trip_diary_id  -- 여행일지번호
    );

-- 여행계획좋아요
CREATE TABLE trip_plan_like (
  mem_id       INTEGER NOT NULL, -- 회원번호
  trip_plan_id INTEGER NOT NULL  -- 여행계획번호
);

-- 여행계획좋아요
ALTER TABLE trip_plan_like
  ADD CONSTRAINT PK_trip_plan_like -- 여행계획좋아요 기본키
    PRIMARY KEY (
      mem_id,       -- 회원번호
      trip_plan_id  -- 여행계획번호
    );

-- 회원신고
CREATE TABLE member_reports (
  mem_id2 INTEGER NOT NULL, -- 신고자번호
  mem_id  INTEGER NOT NULL, -- 피신고자번호
  reason  TEXT    NOT NULL  -- 신고사유
);

-- 회원신고
ALTER TABLE member_reports
  ADD CONSTRAINT PK_member_reports -- 회원신고 기본키
    PRIMARY KEY (
      mem_id2, -- 신고자번호
      mem_id   -- 피신고자번호
    );

-- 여행계획댓글
CREATE TABLE trip_plan_comments (
  trip_plan_comment_id INTEGER  NOT NULL, -- 여행계획댓글
  trip_plan_id         INTEGER  NOT NULL, -- 여행계획번호
  mem_id               INTEGER  NOT NULL, -- 회원번호
  conts                TEXT     NOT NULL, -- 내용
  cdt                  DATETIME NOT NULL  -- 작성일
);

-- 여행계획댓글
ALTER TABLE trip_plan_comments
  ADD CONSTRAINT PK_trip_plan_comments -- 여행계획댓글 기본키
    PRIMARY KEY (
      trip_plan_comment_id -- 여행계획댓글
    );

ALTER TABLE trip_plan_comments
  MODIFY COLUMN trip_plan_comment_id INTEGER NOT NULL AUTO_INCREMENT;

-- 여행계획
ALTER TABLE trip_plans
  ADD CONSTRAINT FK_members_TO_trip_plans -- 회원 -> 여행계획
    FOREIGN KEY (
      mem_id -- 회원번호
    )
    REFERENCES members ( -- 회원
      mem_id -- 회원번호
    );

-- 여행세부계획
ALTER TABLE trip_detail_plans
  ADD CONSTRAINT FK_trip_plans_TO_trip_detail_plans -- 여행계획 -> 여행세부계획
    FOREIGN KEY (
      trip_plan_id -- 여행계획번호
    )
    REFERENCES trip_plans ( -- 여행계획
      trip_plan_id -- 여행계획번호
    );

-- 동행
ALTER TABLE comp
  ADD CONSTRAINT FK_trip_detail_plans_TO_comp -- 여행세부계획 -> 동행
    FOREIGN KEY (
      trip_detail_plan_id -- 여행세부계획번호
    )
    REFERENCES trip_detail_plans ( -- 여행세부계획
      trip_detail_plan_id -- 여행세부계획번호
    );

-- 동행
ALTER TABLE comp
  ADD CONSTRAINT FK_trip_info_TO_comp -- 여행지정보 -> 동행
    FOREIGN KEY (
      trip_info_id -- 여행지정보번호
    )
    REFERENCES trip_info ( -- 여행지정보
      trip_info_id -- 여행지정보번호
    );

-- 동행회원
ALTER TABLE comp_members
  ADD CONSTRAINT FK_comp_TO_comp_members -- 동행 -> 동행회원
    FOREIGN KEY (
      comp_id -- 동행번호
    )
    REFERENCES comp ( -- 동행
      comp_id -- 동행번호
    );

-- 동행회원
ALTER TABLE comp_members
  ADD CONSTRAINT FK_members_TO_comp_members -- 회원 -> 동행회원
    FOREIGN KEY (
      mem_id -- 회원번호
    )
    REFERENCES members ( -- 회원
      mem_id -- 회원번호
    );

-- 동행회원
ALTER TABLE comp_members
  ADD CONSTRAINT FK_chats_TO_comp_members -- 채팅 -> 동행회원
    FOREIGN KEY (
      chat_id -- 채팅번호
    )
    REFERENCES chats ( -- 채팅
      chat_id -- 채팅번호
    );

-- 동행평가
ALTER TABLE comp_eval
  ADD CONSTRAINT FK_comp_members_TO_comp_eval -- 동행회원 -> 동행평가
    FOREIGN KEY (
      comp_mem_no -- 동행회원번호
    )
    REFERENCES comp_members ( -- 동행회원
      comp_mem_id -- 동행회원번호
    );

-- 여행기
ALTER TABLE trip_notes
  ADD CONSTRAINT FK_trip_plans_TO_trip_notes -- 여행계획 -> 여행기
    FOREIGN KEY (
      trip_plan_id -- 여행계획번호
    )
    REFERENCES trip_plans ( -- 여행계획
      trip_plan_id -- 여행계획번호
    );

-- 여행일지
ALTER TABLE trip_diaries
  ADD CONSTRAINT FK_trip_detail_plans_TO_trip_diaries -- 여행세부계획 -> 여행일지
    FOREIGN KEY (
      trip_detail_plan_id -- 여행세부계획번호
    )
    REFERENCES trip_detail_plans ( -- 여행세부계획
      trip_detail_plan_id -- 여행세부계획번호
    );

-- 여행지평가
ALTER TABLE trip_eval
  ADD CONSTRAINT FK_trip_diaries_TO_trip_eval -- 여행일지 -> 여행지평가
    FOREIGN KEY (
      trip_diary_id -- 여행일지번호
    )
    REFERENCES trip_diaries ( -- 여행일지
      trip_diary_id -- 여행일지번호
    );

-- 동행여행기
ALTER TABLE comp_trip_notes
  ADD CONSTRAINT FK_trip_notes_TO_comp_trip_notes -- 여행기 -> 동행여행기
    FOREIGN KEY (
      note_id -- 여행기번호
    )
    REFERENCES trip_notes ( -- 여행기
      note_id -- 여행기번호
    );

-- 동행여행기
ALTER TABLE comp_trip_notes
  ADD CONSTRAINT FK_comp_TO_comp_trip_notes -- 동행 -> 동행여행기
    FOREIGN KEY (
      comp_id -- 동행번호
    )
    REFERENCES comp ( -- 동행
      comp_id -- 동행번호
    );

-- 여행지정보
ALTER TABLE trip_info
  ADD CONSTRAINT FK_trip_eval_TO_trip_info -- 여행지평가 -> 여행지정보
    FOREIGN KEY (
      trip_eval_id -- 여행지평가번호
    )
    REFERENCES trip_eval ( -- 여행지평가
      trip_eval_id -- 여행지평가번호
    );

-- 여행지음식
ALTER TABLE trip_restaurant
  ADD CONSTRAINT FK_trip_info_TO_trip_restaurant -- 여행지정보 -> 여행지음식
    FOREIGN KEY (
      trip_info_id -- 여행지정보번호
    )
    REFERENCES trip_info ( -- 여행지정보
      trip_info_id -- 여행지정보번호
    );

-- 여행지숙박
ALTER TABLE trip_accom
  ADD CONSTRAINT FK_trip_info_TO_trip_accom -- 여행지정보 -> 여행지숙박
    FOREIGN KEY (
      trip_info_id -- 여행지정보번호
    )
    REFERENCES trip_info ( -- 여행지정보
      trip_info_id -- 여행지정보번호
    );

-- 여행지즐길거리
ALTER TABLE trip_enter
  ADD CONSTRAINT FK_trip_info_TO_trip_enter -- 여행지정보 -> 여행지즐길거리
    FOREIGN KEY (
      trip_info_id -- 여행지정보번호
    )
    REFERENCES trip_info ( -- 여행지정보
      trip_info_id -- 여행지정보번호
    );

-- 음식메뉴
ALTER TABLE restaurant_info
  ADD CONSTRAINT FK_trip_restaurant_TO_restaurant_info -- 여행지음식 -> 음식메뉴
    FOREIGN KEY (
      trip_restaurant_id -- 여행지음식번호
    )
    REFERENCES trip_restaurant ( -- 여행지음식
      trip_restaurant_id -- 여행지음식번호
    );

-- 여행지정보사진
ALTER TABLE trip_info_pic
  ADD CONSTRAINT FK_trip_accom_TO_trip_info_pic -- 여행지숙박 -> 여행지정보사진
    FOREIGN KEY (
      trip_accom_id -- 여행지숙박번호
    )
    REFERENCES trip_accom ( -- 여행지숙박
      trip_accom_id -- 여행지숙박번호
    );

-- 여행지정보사진
ALTER TABLE trip_info_pic
  ADD CONSTRAINT FK_trip_restaurant_TO_trip_info_pic -- 여행지음식 -> 여행지정보사진
    FOREIGN KEY (
      trip_restaurant_id -- 여행지음식번호
    )
    REFERENCES trip_restaurant ( -- 여행지음식
      trip_restaurant_id -- 여행지음식번호
    );

-- 여행지정보사진
ALTER TABLE trip_info_pic
  ADD CONSTRAINT FK_trip_enter_TO_trip_info_pic -- 여행지즐길거리 -> 여행지정보사진
    FOREIGN KEY (
      trip_enter_id -- 여행즐길거리번호
    )
    REFERENCES trip_enter ( -- 여행지즐길거리
      trip_enter_id -- 여행즐길거리번호
    );

-- 숙박정보
ALTER TABLE accom_info
  ADD CONSTRAINT FK_trip_accom_TO_accom_info -- 여행지숙박 -> 숙박정보
    FOREIGN KEY (
      accom_info_id -- 여행지숙박번호
    )
    REFERENCES trip_accom ( -- 여행지숙박
      trip_accom_id -- 여행지숙박번호
    );

-- 여행일지사진
ALTER TABLE trip_diary_pic
  ADD CONSTRAINT FK_trip_diaries_TO_trip_diary_pic -- 여행일지 -> 여행일지사진
    FOREIGN KEY (
      trip_diary_id -- 여행일지번호
    )
    REFERENCES trip_diaries ( -- 여행일지
      trip_diary_id -- 여행일지번호
    );

-- 여행기사진
ALTER TABLE trip_notes_pic
  ADD CONSTRAINT FK_trip_notes_TO_trip_notes_pic -- 여행기 -> 여행기사진
    FOREIGN KEY (
      note_id -- 여행기번호
    )
    REFERENCES trip_notes ( -- 여행기
      note_id -- 여행기번호
    );

-- 여행기좋아요
ALTER TABLE trip_notes_like
  ADD CONSTRAINT FK_members_TO_trip_notes_like -- 회원 -> 여행기좋아요
    FOREIGN KEY (
      mem_id -- 회원번호
    )
    REFERENCES members ( -- 회원
      mem_id -- 회원번호
    );

-- 여행기좋아요
ALTER TABLE trip_notes_like
  ADD CONSTRAINT FK_trip_notes_TO_trip_notes_like -- 여행기 -> 여행기좋아요
    FOREIGN KEY (
      note_id -- 여행기번호
    )
    REFERENCES trip_notes ( -- 여행기
      note_id -- 여행기번호
    );

-- 여행일지좋아요
ALTER TABLE trip_diary_like
  ADD CONSTRAINT FK_trip_diaries_TO_trip_diary_like -- 여행일지 -> 여행일지좋아요
    FOREIGN KEY (
      trip_diary_id -- 여행일지번호
    )
    REFERENCES trip_diaries ( -- 여행일지
      trip_diary_id -- 여행일지번호
    );

-- 여행일지좋아요
ALTER TABLE trip_diary_like
  ADD CONSTRAINT FK_members_TO_trip_diary_like -- 회원 -> 여행일지좋아요
    FOREIGN KEY (
      mem_id -- 회원번호
    )
    REFERENCES members ( -- 회원
      mem_id -- 회원번호
    );

-- 여행계획좋아요
ALTER TABLE trip_plan_like
  ADD CONSTRAINT FK_members_TO_trip_plan_like -- 회원 -> 여행계획좋아요
    FOREIGN KEY (
      mem_id -- 회원번호
    )
    REFERENCES members ( -- 회원
      mem_id -- 회원번호
    );

-- 여행계획좋아요
ALTER TABLE trip_plan_like
  ADD CONSTRAINT FK_trip_plans_TO_trip_plan_like -- 여행계획 -> 여행계획좋아요
    FOREIGN KEY (
      trip_plan_id -- 여행계획번호
    )
    REFERENCES trip_plans ( -- 여행계획
      trip_plan_id -- 여행계획번호
    );

-- 회원신고
ALTER TABLE member_reports
  ADD CONSTRAINT FK_members_TO_member_reports -- 회원 -> 회원신고
    FOREIGN KEY (
      mem_id2 -- 신고자번호
    )
    REFERENCES members ( -- 회원
      mem_id -- 회원번호
    );

-- 회원신고
ALTER TABLE member_reports
  ADD CONSTRAINT FK_members_TO_member_reports2 -- 회원 -> 회원신고2
    FOREIGN KEY (
      mem_id -- 피신고자번호
    )
    REFERENCES members ( -- 회원
      mem_id -- 회원번호
    );

-- 여행계획댓글
ALTER TABLE trip_plan_comments
  ADD CONSTRAINT FK_trip_plans_TO_trip_plan_comments -- 여행계획 -> 여행계획댓글
    FOREIGN KEY (
      trip_plan_id -- 여행계획번호
    )
    REFERENCES trip_plans ( -- 여행계획
      trip_plan_id -- 여행계획번호
    );

-- 여행계획댓글
ALTER TABLE trip_plan_comments
  ADD CONSTRAINT FK_members_TO_trip_plan_comments -- 회원 -> 여행계획댓글
    FOREIGN KEY (
      mem_id -- 회원번호
    )
    REFERENCES members ( -- 회원
      mem_id -- 회원번호
    );