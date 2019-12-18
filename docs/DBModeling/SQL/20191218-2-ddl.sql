-- 회원
CREATE TABLE `MY_SCHEMA`.`members` (
	`mem_id`        INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
	`email`         VARCHAR(40)  NOT NULL COMMENT '이메일', -- 이메일
	`name`          VARCHAR(12)  NOT NULL COMMENT '닉네임', -- 닉네임
	`pwd`           VARCHAR(50)  NOT NULL COMMENT '비밀번호', -- 비밀번호
	`tel`           VARCHAR(30)  NOT NULL COMMENT '연락처', -- 연락처
	`email_key`     VARCHAR(255) NULL     COMMENT '이메일 인증키', -- 이메일 인증키
	`profile_photo` VARCHAR(50)  NULL     COMMENT '사진', -- 사진
	`state`         INT          NOT NULL DEFAULT 0 COMMENT '상태', -- 상태
	`grade`         INT          NOT NULL COMMENT '등급', -- 등급
	`restriction`   INTEGER      NULL     COMMENT '제재기간' -- 제재기간
)
COMMENT '회원';

-- 회원
ALTER TABLE `MY_SCHEMA`.`members`
	ADD CONSTRAINT `PK_members` -- 회원 기본키
		PRIMARY KEY (
			`mem_id` -- 회원번호
		);

ALTER TABLE `MY_SCHEMA`.`members`
	MODIFY COLUMN `mem_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '회원번호';

-- 여행계획
CREATE TABLE `MY_SCHEMA`.`trip_plans` (
	`trip_plan_id` INTEGER      NOT NULL COMMENT '여행계획번호', -- 여행계획번호
	`mem_id`       INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
	`sdt`          DATE         NULL     COMMENT '시작일', -- 시작일
	`edt`          DATE         NULL     COMMENT '종료일', -- 종료일
	`loca`         VARCHAR(255) NULL     COMMENT '지역', -- 지역
	`cdt`          DATE         NULL     COMMENT '작성일', -- 작성일
	`vcnt`         INTEGER      NULL     COMMENT '조회수', -- 조회수
	`pub_chk`      TINYINT(1)   NULL     COMMENT '공개여부', -- 공개여부
	`comp_chk`     TINYINT(1)   NULL     COMMENT '동행여부', -- 동행여부
	`purpoose`     TEXT         NULL     COMMENT '목적', -- 목적
	`temp_chk`     TINYINT(1)   NOT NULL COMMENT '상태' -- 상태
)
COMMENT '여행계획';

-- 여행계획
ALTER TABLE `MY_SCHEMA`.`trip_plans`
	ADD CONSTRAINT `PK_trip_plans` -- 여행계획 기본키
		PRIMARY KEY (
			`trip_plan_id` -- 여행계획번호
		);

ALTER TABLE `MY_SCHEMA`.`trip_plans`
	MODIFY COLUMN `trip_plan_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '여행계획번호';

-- 여행세부계획
CREATE TABLE `MY_SCHEMA`.`trip_detail_plans` (
	`trip_detail_plan_id` INTEGER      NOT NULL COMMENT '여행세부계획번호', -- 여행세부계획번호
	`trip_plan_id`        INTEGER      NOT NULL COMMENT '여행계획번호', -- 여행계획번호
	`dat`                 DATE         NOT NULL COMMENT '날짜', -- 날짜
	`time`                TIME         NOT NULL COMMENT '시간', -- 시간
	`detail_loca`         VARCHAR(255) NOT NULL COMMENT '세부장소', -- 세부장소
	`detail_plan`         TEXT         NOT NULL COMMENT '세부계획' -- 세부계획
)
COMMENT '여행세부계획';

-- 여행세부계획
ALTER TABLE `MY_SCHEMA`.`trip_detail_plans`
	ADD CONSTRAINT `PK_trip_detail_plans` -- 여행세부계획 기본키
		PRIMARY KEY (
			`trip_detail_plan_id` -- 여행세부계획번호
		);

ALTER TABLE `MY_SCHEMA`.`trip_detail_plans`
	MODIFY COLUMN `trip_detail_plan_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '여행세부계획번호';

-- 동행
CREATE TABLE `MY_SCHEMA`.`comp` (
	`comp_id`             INTEGER     NOT NULL COMMENT '동행번호', -- 동행번호
	`trip_detail_plan_id` INTEGER     NOT NULL COMMENT '여행세부계획번호', -- 여행세부계획번호
	`trip_info_id`        INTEGER     NOT NULL COMMENT '여행지정보번호', -- 여행지정보번호
	`loca`                VARCHAR(50) NOT NULL COMMENT '장소', -- 장소
	`max_mem`             INTEGER     NOT NULL COMMENT '총인원', -- 총인원
	`current_mem`         INTEGER     NOT NULL COMMENT '참여인원', -- 참여인원
	`purpose`             TEXT        NOT NULL COMMENT '목적', -- 목적
	`gender_chk`          TINYINT(1)  NOT NULL COMMENT '이성여부' -- 이성여부
)
COMMENT '동행';

-- 동행
ALTER TABLE `MY_SCHEMA`.`comp`
	ADD CONSTRAINT `PK_comp` -- 동행 기본키
		PRIMARY KEY (
			`comp_id` -- 동행번호
		);

ALTER TABLE `MY_SCHEMA`.`comp`
	MODIFY COLUMN `comp_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '동행번호';

-- 동행회원
CREATE TABLE `MY_SCHEMA`.`comp_members` (
	`comp_mem_id` INTEGER NOT NULL COMMENT '동행회원번호', -- 동행회원번호
	`comp_id`     INTEGER NOT NULL COMMENT '동행번호', -- 동행번호
	`mem_id`      INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
	`chat_id`     INTEGER NOT NULL COMMENT '채팅번호' -- 채팅번호
)
COMMENT '동행회원';

-- 동행회원
ALTER TABLE `MY_SCHEMA`.`comp_members`
	ADD CONSTRAINT `PK_comp_members` -- 동행회원 기본키
		PRIMARY KEY (
			`comp_mem_id` -- 동행회원번호
		);

ALTER TABLE `MY_SCHEMA`.`comp_members`
	MODIFY COLUMN `comp_mem_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '동행회원번호';

-- 동행평가
CREATE TABLE `MY_SCHEMA`.`comp_eval` (
	`comp_mem_no` INTEGER NOT NULL DEFAULT 0 COMMENT '동행회원번호', -- 동행회원번호
	`rate`        DOUBLE  NOT NULL COMMENT '평점' -- 평점
)
COMMENT '동행평가';

-- 동행평가
ALTER TABLE `MY_SCHEMA`.`comp_eval`
	ADD CONSTRAINT `PK_comp_eval` -- 동행평가 기본키
		PRIMARY KEY (
			`comp_mem_no` -- 동행회원번호
		);

ALTER TABLE `MY_SCHEMA`.`comp_eval`
	MODIFY COLUMN `comp_mem_no` INTEGER NOT NULL AUTO_INCREMENT DEFAULT 0 COMMENT '동행회원번호';

-- 채팅
CREATE TABLE `MY_SCHEMA`.`chats` (
	`chat_id` INTEGER    NOT NULL COMMENT '채팅번호', -- 채팅번호
	`dat`     DATETIME   NOT NULL COMMENT '날짜', -- 날짜
	`conts`   TEXT       NOT NULL COMMENT '내용', -- 내용
	`is_read` TINYINT(1) NOT NULL DEFAULT false COMMENT '읽음' -- 읽음
)
COMMENT '채팅';

-- 채팅
ALTER TABLE `MY_SCHEMA`.`chats`
	ADD CONSTRAINT `PK_chats` -- 채팅 기본키
		PRIMARY KEY (
			`chat_id` -- 채팅번호
		);

ALTER TABLE `MY_SCHEMA`.`chats`
	MODIFY COLUMN `chat_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '채팅번호';

-- 여행기
CREATE TABLE `MY_SCHEMA`.`trip_notes` (
	`note_id`      INTEGER     NOT NULL COMMENT '여행기번호', -- 여행기번호
	`trip_plan_id` INTEGER     NOT NULL COMMENT '여행계획번호', -- 여행계획번호
	`titl`         VARCHAR(50) NOT NULL COMMENT '제목', -- 제목
	`conts`        TEXT        NOT NULL COMMENT '내용', -- 내용
	`cdt`          DATE        NOT NULL COMMENT '작성일', -- 작성일
	`vcnt`         INTEGER     NOT NULL COMMENT '조회수', -- 조회수
	`pub_state`    TINYINT(1)  NOT NULL COMMENT '공개여부', -- 공개여부
	`trip_day`     DATE        NULL     COMMENT '여행일차' -- 여행일차
)
COMMENT '여행기';

-- 여행기
ALTER TABLE `MY_SCHEMA`.`trip_notes`
	ADD CONSTRAINT `PK_trip_notes` -- 여행기 기본키
		PRIMARY KEY (
			`note_id` -- 여행기번호
		);

ALTER TABLE `MY_SCHEMA`.`trip_notes`
	MODIFY COLUMN `note_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '여행기번호';

-- 여행일지
CREATE TABLE `MY_SCHEMA`.`trip_diaries` (
	`trip_diary_id`       INTEGER     NOT NULL COMMENT '여행일지번호', -- 여행일지번호
	`trip_detail_plan_id` INTEGER     NULL     COMMENT '여행세부계획번호', -- 여행세부계획번호
	`titl`                VARCHAR(50) NOT NULL COMMENT '제목', -- 제목
	`conts`               TEXT        NOT NULL COMMENT '내용', -- 내용
	`cdt`                 DATE        NOT NULL COMMENT '작성일', -- 작성일
	`vcnt`                INTEGER     NOT NULL DEFAULT 0 COMMENT '조회수', -- 조회수
	`pub_chk`             TINYINT(1)  NOT NULL COMMENT '공개여부' -- 공개여부
)
COMMENT '여행일지';

-- 여행일지
ALTER TABLE `MY_SCHEMA`.`trip_diaries`
	ADD CONSTRAINT `PK_trip_diaries` -- 여행일지 기본키
		PRIMARY KEY (
			`trip_diary_id` -- 여행일지번호
		);

ALTER TABLE `MY_SCHEMA`.`trip_diaries`
	MODIFY COLUMN `trip_diary_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '여행일지번호';

-- 여행지평가
CREATE TABLE `MY_SCHEMA`.`trip_eval` (
	`trip_eval_id`  INTEGER NOT NULL COMMENT '여행지평가번호', -- 여행지평가번호
	`trip_diary_id` INTEGER NOT NULL COMMENT '여행일지번호', -- 여행일지번호
	`access`        INT     NOT NULL COMMENT '접근성', -- 접근성
	`hyg`           INT     NOT NULL COMMENT '위생', -- 위생
	`kindness`      INT     NOT NULL COMMENT '친절', -- 친절
	`food`          INT     NULL     COMMENT '음식', -- 음식
	`view`          INT     NULL     COMMENT '경치' -- 경치
)
COMMENT '여행지평가';

-- 여행지평가
ALTER TABLE `MY_SCHEMA`.`trip_eval`
	ADD CONSTRAINT `PK_trip_eval` -- 여행지평가 기본키
		PRIMARY KEY (
			`trip_eval_id` -- 여행지평가번호
		);

ALTER TABLE `MY_SCHEMA`.`trip_eval`
	MODIFY COLUMN `trip_eval_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '여행지평가번호';

-- 동행여행기
CREATE TABLE `MY_SCHEMA`.`comp_trip_notes` (
	`note_id` INTEGER NOT NULL COMMENT '여행기번호', -- 여행기번호
	`comp_id` INTEGER NOT NULL COMMENT '동행번호' -- 동행번호
)
COMMENT '동행여행기';

-- 동행여행기
ALTER TABLE `MY_SCHEMA`.`comp_trip_notes`
	ADD CONSTRAINT `PK_comp_trip_notes` -- 동행여행기 기본키
		PRIMARY KEY (
			`note_id`, -- 여행기번호
			`comp_id`  -- 동행번호
		);

-- 여행지정보
CREATE TABLE `MY_SCHEMA`.`trip_info` (
	`trip_info_id` INTEGER      NOT NULL COMMENT '여행지정보번호', -- 여행지정보번호
	`trip_eval_id` INTEGER      NOT NULL COMMENT '여행지평가번호', -- 여행지평가번호
	`name`         VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
	`loca`         VARCHAR(255) NOT NULL COMMENT '위치' -- 위치
)
COMMENT '여행지정보';

-- 여행지정보
ALTER TABLE `MY_SCHEMA`.`trip_info`
	ADD CONSTRAINT `PK_trip_info` -- 여행지정보 기본키
		PRIMARY KEY (
			`trip_info_id` -- 여행지정보번호
		);

ALTER TABLE `MY_SCHEMA`.`trip_info`
	MODIFY COLUMN `trip_info_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '여행지정보번호';

-- 여행지음식
CREATE TABLE `MY_SCHEMA`.`trip_restaurant` (
	`trip_restaurant_id` INTEGER      NOT NULL COMMENT '여행지음식번호', -- 여행지음식번호
	`trip_info_id`       INTEGER      NOT NULL COMMENT '여행지정보번호', -- 여행지정보번호
	`name`               VARCHAR(50)  NOT NULL COMMENT '식당이름', -- 식당이름
	`loca`               VARCHAR(255) NOT NULL COMMENT '위치', -- 위치
	`category`           VARCHAR(20)  NOT NULL COMMENT '카테고리', -- 카테고리
	`open_time`          TIME         NOT NULL COMMENT '영업시작시간', -- 영업시작시간
	`close_time`         TIME         NOT NULL COMMENT '영업종료시간' -- 영업종료시간
)
COMMENT '여행지음식';

-- 여행지음식
ALTER TABLE `MY_SCHEMA`.`trip_restaurant`
	ADD CONSTRAINT `PK_trip_restaurant` -- 여행지음식 기본키
		PRIMARY KEY (
			`trip_restaurant_id` -- 여행지음식번호
		);

ALTER TABLE `MY_SCHEMA`.`trip_restaurant`
	MODIFY COLUMN `trip_restaurant_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '여행지음식번호';

-- 여행지숙박
CREATE TABLE `MY_SCHEMA`.`trip_accom` (
	`trip_accom_id` INTEGER      NOT NULL COMMENT '여행지숙박번호', -- 여행지숙박번호
	`trip_info_id`  INTEGER      NOT NULL COMMENT '여행지정보번호', -- 여행지정보번호
	`category`      VARCHAR(20)  NOT NULL COMMENT '종류', -- 종류
	`name`          VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
	`loca`          VARCHAR(255) NOT NULL COMMENT '위치', -- 위치
	`chkin_time`    TIME         NOT NULL COMMENT '체크인시간', -- 체크인시간
	`chkout_time`   TIME         NOT NULL COMMENT '체크아웃시간', -- 체크아웃시간
	`storage_chk`   TINYINT(1)   NOT NULL COMMENT '짐 보관여부', -- 짐 보관여부
	`pickup_chk`    TINYINT(1)   NOT NULL COMMENT '픽업여부' -- 픽업여부
)
COMMENT '여행지숙박';

-- 여행지숙박
ALTER TABLE `MY_SCHEMA`.`trip_accom`
	ADD CONSTRAINT `PK_trip_accom` -- 여행지숙박 기본키
		PRIMARY KEY (
			`trip_accom_id` -- 여행지숙박번호
		);

ALTER TABLE `MY_SCHEMA`.`trip_accom`
	MODIFY COLUMN `trip_accom_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '여행지숙박번호';

-- 여행지즐길거리
CREATE TABLE `MY_SCHEMA`.`trip_enter` (
	`trip_enter_id` INTEGER      NOT NULL COMMENT '여행즐길거리번호', -- 여행즐길거리번호
	`trip_info_id`  INTEGER      NOT NULL COMMENT '여행지정보번호', -- 여행지정보번호
	`category`      VARCHAR(20)  NOT NULL COMMENT '종류', -- 종류
	`name`          VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
	`price`         INTEGER      NULL     DEFAULT 0 COMMENT '가격', -- 가격
	`loca`          VARCHAR(255) NOT NULL COMMENT '위치', -- 위치
	`open_time`     TIME         NULL     COMMENT '영업시작시간', -- 영업시작시간
	`close_time`    TIME         NULL     COMMENT '영업종료시간' -- 영업종료시간
)
COMMENT '여행지즐길거리';

-- 여행지즐길거리
ALTER TABLE `MY_SCHEMA`.`trip_enter`
	ADD CONSTRAINT `PK_trip_enter` -- 여행지즐길거리 기본키
		PRIMARY KEY (
			`trip_enter_id` -- 여행즐길거리번호
		);

ALTER TABLE `MY_SCHEMA`.`trip_enter`
	MODIFY COLUMN `trip_enter_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '여행즐길거리번호';

-- 음식메뉴
CREATE TABLE `MY_SCHEMA`.`restaurant_info` (
	`trip_restaurant_id` INTEGER     NOT NULL COMMENT '여행지음식번호', -- 여행지음식번호
	`name`               VARCHAR(50) NOT NULL COMMENT '이름', -- 이름
	`price`              INTEGER     NOT NULL DEFAULT 0 COMMENT '가격' -- 가격
)
COMMENT '음식메뉴';

-- 음식메뉴
ALTER TABLE `MY_SCHEMA`.`restaurant_info`
	ADD CONSTRAINT `PK_restaurant_info` -- 음식메뉴 기본키
		PRIMARY KEY (
			`trip_restaurant_id` -- 여행지음식번호
		);

-- 여행지정보사진
CREATE TABLE `MY_SCHEMA`.`trip_info_pic` (
	`trip_info_pic_id`   INTEGER     NOT NULL COMMENT '여행지정보사진번호', -- 여행지정보사진번호
	`trip_accom_id`      INTEGER     NOT NULL COMMENT '여행지숙박번호', -- 여행지숙박번호
	`trip_restaurant_id` INTEGER     NOT NULL COMMENT '여행지음식번호', -- 여행지음식번호
	`trip_enter_id`      INTEGER     NOT NULL COMMENT '여행즐길거리번호', -- 여행즐길거리번호
	`file_name`          VARCHAR(50) NOT NULL COMMENT '파일이름' -- 파일이름
)
COMMENT '여행지정보사진';

-- 여행지정보사진
ALTER TABLE `MY_SCHEMA`.`trip_info_pic`
	ADD CONSTRAINT `PK_trip_info_pic` -- 여행지정보사진 기본키
		PRIMARY KEY (
			`trip_info_pic_id` -- 여행지정보사진번호
		);

ALTER TABLE `MY_SCHEMA`.`trip_info_pic`
	MODIFY COLUMN `trip_info_pic_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '여행지정보사진번호';

-- 숙박정보
CREATE TABLE `MY_SCHEMA`.`accom_info` (
	`accom_info_id` INTEGER     NOT NULL COMMENT '여행지숙박번호', -- 여행지숙박번호
	`category`      VARCHAR(20) NOT NULL COMMENT '숙박구분', -- 숙박구분
	`price`         INTEGER     NOT NULL DEFAULT 0 COMMENT '가격' -- 가격
)
COMMENT '숙박정보';

-- 숙박정보
ALTER TABLE `MY_SCHEMA`.`accom_info`
	ADD CONSTRAINT `PK_accom_info` -- 숙박정보 기본키
		PRIMARY KEY (
			`accom_info_id` -- 여행지숙박번호
		);

-- 여행일지사진
CREATE TABLE `MY_SCHEMA`.`trip_diary_pic` (
	`trip_diary_pic_id` INTEGER     NOT NULL COMMENT '여행일지사진번호', -- 여행일지사진번호
	`trip_diary_id`     INTEGER     NOT NULL COMMENT '여행일지번호', -- 여행일지번호
	`file_name`         VARCHAR(50) NOT NULL COMMENT '파일이름' -- 파일이름
)
COMMENT '여행일지사진';

-- 여행일지사진
ALTER TABLE `MY_SCHEMA`.`trip_diary_pic`
	ADD CONSTRAINT `PK_trip_diary_pic` -- 여행일지사진 기본키
		PRIMARY KEY (
			`trip_diary_pic_id` -- 여행일지사진번호
		);

ALTER TABLE `MY_SCHEMA`.`trip_diary_pic`
	MODIFY COLUMN `trip_diary_pic_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '여행일지사진번호';

-- 여행기사진
CREATE TABLE `MY_SCHEMA`.`trip_notes_pic` (
	`photo_id`  INTEGER     NOT NULL COMMENT '여행기사진번호', -- 여행기사진번호
	`note_id`   INTEGER     NOT NULL COMMENT '여행기번호', -- 여행기번호
	`file_name` VARCHAR(50) NOT NULL COMMENT '파일이름' -- 파일이름
)
COMMENT '여행기사진';

-- 여행기사진
ALTER TABLE `MY_SCHEMA`.`trip_notes_pic`
	ADD CONSTRAINT `PK_trip_notes_pic` -- 여행기사진 기본키
		PRIMARY KEY (
			`photo_id` -- 여행기사진번호
		);

ALTER TABLE `MY_SCHEMA`.`trip_notes_pic`
	MODIFY COLUMN `photo_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '여행기사진번호';

-- 여행기좋아요
CREATE TABLE `MY_SCHEMA`.`trip_notes_like` (
	`mem_id`  INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
	`note_id` INTEGER NOT NULL COMMENT '여행기번호' -- 여행기번호
)
COMMENT '여행기좋아요';

-- 여행기좋아요
ALTER TABLE `MY_SCHEMA`.`trip_notes_like`
	ADD CONSTRAINT `PK_trip_notes_like` -- 여행기좋아요 기본키
		PRIMARY KEY (
			`mem_id`,  -- 회원번호
			`note_id`  -- 여행기번호
		);

-- 여행일지좋아요
CREATE TABLE `MY_SCHEMA`.`trip_diary_like` (
	`mem_id`        INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
	`trip_diary_id` INTEGER NOT NULL COMMENT '여행일지번호' -- 여행일지번호
)
COMMENT '여행일지좋아요';

-- 여행일지좋아요
ALTER TABLE `MY_SCHEMA`.`trip_diary_like`
	ADD CONSTRAINT `PK_trip_diary_like` -- 여행일지좋아요 기본키
		PRIMARY KEY (
			`mem_id`,        -- 회원번호
			`trip_diary_id`  -- 여행일지번호
		);

-- 여행계획좋아요
CREATE TABLE `MY_SCHEMA`.`trip_plan_like` (
	`mem_id`       INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
	`trip_plan_id` INTEGER NOT NULL COMMENT '여행계획번호' -- 여행계획번호
)
COMMENT '여행계획좋아요';

-- 여행계획좋아요
ALTER TABLE `MY_SCHEMA`.`trip_plan_like`
	ADD CONSTRAINT `PK_trip_plan_like` -- 여행계획좋아요 기본키
		PRIMARY KEY (
			`mem_id`,       -- 회원번호
			`trip_plan_id`  -- 여행계획번호
		);

-- 회원신고
CREATE TABLE `MY_SCHEMA`.`member_reports` (
	`mem_id2` INTEGER NOT NULL COMMENT '신고자번호', -- 신고자번호
	`mem_id`  INTEGER NOT NULL COMMENT '피신고자번호', -- 피신고자번호
	`reason`  TEXT    NOT NULL COMMENT '신고사유' -- 신고사유
)
COMMENT '회원신고';

-- 회원신고
ALTER TABLE `MY_SCHEMA`.`member_reports`
	ADD CONSTRAINT `PK_member_reports` -- 회원신고 기본키
		PRIMARY KEY (
			`mem_id2`, -- 신고자번호
			`mem_id`   -- 피신고자번호
		);

-- 여행계획댓글
CREATE TABLE `MY_SCHEMA`.`trip_plan_comments` (
	`trip_plan_comment_id` INTEGER  NOT NULL COMMENT '여행계획댓글', -- 여행계획댓글
	`trip_plan_id`         INTEGER  NOT NULL COMMENT '여행계획번호', -- 여행계획번호
	`mem_id`               INTEGER  NOT NULL COMMENT '회원번호', -- 회원번호
	`conts`                TEXT     NOT NULL COMMENT '내용', -- 내용
	`cdt`                  DATETIME NOT NULL COMMENT '작성일' -- 작성일
)
COMMENT '여행계획댓글';

-- 여행계획댓글
ALTER TABLE `MY_SCHEMA`.`trip_plan_comments`
	ADD CONSTRAINT `PK_trip_plan_comments` -- 여행계획댓글 기본키
		PRIMARY KEY (
			`trip_plan_comment_id` -- 여행계획댓글
		);

ALTER TABLE `MY_SCHEMA`.`trip_plan_comments`
	MODIFY COLUMN `trip_plan_comment_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '여행계획댓글';

-- 여행계획
ALTER TABLE `MY_SCHEMA`.`trip_plans`
	ADD CONSTRAINT `FK_members_TO_trip_plans` -- 회원 -> 여행계획
		FOREIGN KEY (
			`mem_id` -- 회원번호
		)
		REFERENCES `MY_SCHEMA`.`members` ( -- 회원
			`mem_id` -- 회원번호
		);

-- 여행세부계획
ALTER TABLE `MY_SCHEMA`.`trip_detail_plans`
	ADD CONSTRAINT `FK_trip_plans_TO_trip_detail_plans` -- 여행계획 -> 여행세부계획
		FOREIGN KEY (
			`trip_plan_id` -- 여행계획번호
		)
		REFERENCES `MY_SCHEMA`.`trip_plans` ( -- 여행계획
			`trip_plan_id` -- 여행계획번호
		);

-- 동행
ALTER TABLE `MY_SCHEMA`.`comp`
	ADD CONSTRAINT `FK_trip_detail_plans_TO_comp` -- 여행세부계획 -> 동행
		FOREIGN KEY (
			`trip_detail_plan_id` -- 여행세부계획번호
		)
		REFERENCES `MY_SCHEMA`.`trip_detail_plans` ( -- 여행세부계획
			`trip_detail_plan_id` -- 여행세부계획번호
		);

-- 동행
ALTER TABLE `MY_SCHEMA`.`comp`
	ADD CONSTRAINT `FK_trip_info_TO_comp` -- 여행지정보 -> 동행
		FOREIGN KEY (
			`trip_info_id` -- 여행지정보번호
		)
		REFERENCES `MY_SCHEMA`.`trip_info` ( -- 여행지정보
			`trip_info_id` -- 여행지정보번호
		);

-- 동행회원
ALTER TABLE `MY_SCHEMA`.`comp_members`
	ADD CONSTRAINT `FK_comp_TO_comp_members` -- 동행 -> 동행회원
		FOREIGN KEY (
			`comp_id` -- 동행번호
		)
		REFERENCES `MY_SCHEMA`.`comp` ( -- 동행
			`comp_id` -- 동행번호
		);

-- 동행회원
ALTER TABLE `MY_SCHEMA`.`comp_members`
	ADD CONSTRAINT `FK_members_TO_comp_members` -- 회원 -> 동행회원
		FOREIGN KEY (
			`mem_id` -- 회원번호
		)
		REFERENCES `MY_SCHEMA`.`members` ( -- 회원
			`mem_id` -- 회원번호
		);

-- 동행회원
ALTER TABLE `MY_SCHEMA`.`comp_members`
	ADD CONSTRAINT `FK_chats_TO_comp_members` -- 채팅 -> 동행회원
		FOREIGN KEY (
			`chat_id` -- 채팅번호
		)
		REFERENCES `MY_SCHEMA`.`chats` ( -- 채팅
			`chat_id` -- 채팅번호
		);

-- 동행평가
ALTER TABLE `MY_SCHEMA`.`comp_eval`
	ADD CONSTRAINT `FK_comp_members_TO_comp_eval` -- 동행회원 -> 동행평가
		FOREIGN KEY (
			`comp_mem_no` -- 동행회원번호
		)
		REFERENCES `MY_SCHEMA`.`comp_members` ( -- 동행회원
			`comp_mem_id` -- 동행회원번호
		);

-- 여행기
ALTER TABLE `MY_SCHEMA`.`trip_notes`
	ADD CONSTRAINT `FK_trip_plans_TO_trip_notes` -- 여행계획 -> 여행기
		FOREIGN KEY (
			`trip_plan_id` -- 여행계획번호
		)
		REFERENCES `MY_SCHEMA`.`trip_plans` ( -- 여행계획
			`trip_plan_id` -- 여행계획번호
		);

-- 여행일지
ALTER TABLE `MY_SCHEMA`.`trip_diaries`
	ADD CONSTRAINT `FK_trip_detail_plans_TO_trip_diaries` -- 여행세부계획 -> 여행일지
		FOREIGN KEY (
			`trip_detail_plan_id` -- 여행세부계획번호
		)
		REFERENCES `MY_SCHEMA`.`trip_detail_plans` ( -- 여행세부계획
			`trip_detail_plan_id` -- 여행세부계획번호
		);

-- 여행지평가
ALTER TABLE `MY_SCHEMA`.`trip_eval`
	ADD CONSTRAINT `FK_trip_diaries_TO_trip_eval` -- 여행일지 -> 여행지평가
		FOREIGN KEY (
			`trip_diary_id` -- 여행일지번호
		)
		REFERENCES `MY_SCHEMA`.`trip_diaries` ( -- 여행일지
			`trip_diary_id` -- 여행일지번호
		);

-- 동행여행기
ALTER TABLE `MY_SCHEMA`.`comp_trip_notes`
	ADD CONSTRAINT `FK_trip_notes_TO_comp_trip_notes` -- 여행기 -> 동행여행기
		FOREIGN KEY (
			`note_id` -- 여행기번호
		)
		REFERENCES `MY_SCHEMA`.`trip_notes` ( -- 여행기
			`note_id` -- 여행기번호
		);

-- 동행여행기
ALTER TABLE `MY_SCHEMA`.`comp_trip_notes`
	ADD CONSTRAINT `FK_comp_TO_comp_trip_notes` -- 동행 -> 동행여행기
		FOREIGN KEY (
			`comp_id` -- 동행번호
		)
		REFERENCES `MY_SCHEMA`.`comp` ( -- 동행
			`comp_id` -- 동행번호
		);

-- 여행지정보
ALTER TABLE `MY_SCHEMA`.`trip_info`
	ADD CONSTRAINT `FK_trip_eval_TO_trip_info` -- 여행지평가 -> 여행지정보
		FOREIGN KEY (
			`trip_eval_id` -- 여행지평가번호
		)
		REFERENCES `MY_SCHEMA`.`trip_eval` ( -- 여행지평가
			`trip_eval_id` -- 여행지평가번호
		);

-- 여행지음식
ALTER TABLE `MY_SCHEMA`.`trip_restaurant`
	ADD CONSTRAINT `FK_trip_info_TO_trip_restaurant` -- 여행지정보 -> 여행지음식
		FOREIGN KEY (
			`trip_info_id` -- 여행지정보번호
		)
		REFERENCES `MY_SCHEMA`.`trip_info` ( -- 여행지정보
			`trip_info_id` -- 여행지정보번호
		);

-- 여행지숙박
ALTER TABLE `MY_SCHEMA`.`trip_accom`
	ADD CONSTRAINT `FK_trip_info_TO_trip_accom` -- 여행지정보 -> 여행지숙박
		FOREIGN KEY (
			`trip_info_id` -- 여행지정보번호
		)
		REFERENCES `MY_SCHEMA`.`trip_info` ( -- 여행지정보
			`trip_info_id` -- 여행지정보번호
		);

-- 여행지즐길거리
ALTER TABLE `MY_SCHEMA`.`trip_enter`
	ADD CONSTRAINT `FK_trip_info_TO_trip_enter` -- 여행지정보 -> 여행지즐길거리
		FOREIGN KEY (
			`trip_info_id` -- 여행지정보번호
		)
		REFERENCES `MY_SCHEMA`.`trip_info` ( -- 여행지정보
			`trip_info_id` -- 여행지정보번호
		);

-- 음식메뉴
ALTER TABLE `MY_SCHEMA`.`restaurant_info`
	ADD CONSTRAINT `FK_trip_restaurant_TO_restaurant_info` -- 여행지음식 -> 음식메뉴
		FOREIGN KEY (
			`trip_restaurant_id` -- 여행지음식번호
		)
		REFERENCES `MY_SCHEMA`.`trip_restaurant` ( -- 여행지음식
			`trip_restaurant_id` -- 여행지음식번호
		);

-- 여행지정보사진
ALTER TABLE `MY_SCHEMA`.`trip_info_pic`
	ADD CONSTRAINT `FK_trip_accom_TO_trip_info_pic` -- 여행지숙박 -> 여행지정보사진
		FOREIGN KEY (
			`trip_accom_id` -- 여행지숙박번호
		)
		REFERENCES `MY_SCHEMA`.`trip_accom` ( -- 여행지숙박
			`trip_accom_id` -- 여행지숙박번호
		);

-- 여행지정보사진
ALTER TABLE `MY_SCHEMA`.`trip_info_pic`
	ADD CONSTRAINT `FK_trip_restaurant_TO_trip_info_pic` -- 여행지음식 -> 여행지정보사진
		FOREIGN KEY (
			`trip_restaurant_id` -- 여행지음식번호
		)
		REFERENCES `MY_SCHEMA`.`trip_restaurant` ( -- 여행지음식
			`trip_restaurant_id` -- 여행지음식번호
		);

-- 여행지정보사진
ALTER TABLE `MY_SCHEMA`.`trip_info_pic`
	ADD CONSTRAINT `FK_trip_enter_TO_trip_info_pic` -- 여행지즐길거리 -> 여행지정보사진
		FOREIGN KEY (
			`trip_enter_id` -- 여행즐길거리번호
		)
		REFERENCES `MY_SCHEMA`.`trip_enter` ( -- 여행지즐길거리
			`trip_enter_id` -- 여행즐길거리번호
		);

-- 숙박정보
ALTER TABLE `MY_SCHEMA`.`accom_info`
	ADD CONSTRAINT `FK_trip_accom_TO_accom_info` -- 여행지숙박 -> 숙박정보
		FOREIGN KEY (
			`accom_info_id` -- 여행지숙박번호
		)
		REFERENCES `MY_SCHEMA`.`trip_accom` ( -- 여행지숙박
			`trip_accom_id` -- 여행지숙박번호
		);

-- 여행일지사진
ALTER TABLE `MY_SCHEMA`.`trip_diary_pic`
	ADD CONSTRAINT `FK_trip_diaries_TO_trip_diary_pic` -- 여행일지 -> 여행일지사진
		FOREIGN KEY (
			`trip_diary_id` -- 여행일지번호
		)
		REFERENCES `MY_SCHEMA`.`trip_diaries` ( -- 여행일지
			`trip_diary_id` -- 여행일지번호
		);

-- 여행기사진
ALTER TABLE `MY_SCHEMA`.`trip_notes_pic`
	ADD CONSTRAINT `FK_trip_notes_TO_trip_notes_pic` -- 여행기 -> 여행기사진
		FOREIGN KEY (
			`note_id` -- 여행기번호
		)
		REFERENCES `MY_SCHEMA`.`trip_notes` ( -- 여행기
			`note_id` -- 여행기번호
		);

-- 여행기좋아요
ALTER TABLE `MY_SCHEMA`.`trip_notes_like`
	ADD CONSTRAINT `FK_members_TO_trip_notes_like` -- 회원 -> 여행기좋아요
		FOREIGN KEY (
			`mem_id` -- 회원번호
		)
		REFERENCES `MY_SCHEMA`.`members` ( -- 회원
			`mem_id` -- 회원번호
		);

-- 여행기좋아요
ALTER TABLE `MY_SCHEMA`.`trip_notes_like`
	ADD CONSTRAINT `FK_trip_notes_TO_trip_notes_like` -- 여행기 -> 여행기좋아요
		FOREIGN KEY (
			`note_id` -- 여행기번호
		)
		REFERENCES `MY_SCHEMA`.`trip_notes` ( -- 여행기
			`note_id` -- 여행기번호
		);

-- 여행일지좋아요
ALTER TABLE `MY_SCHEMA`.`trip_diary_like`
	ADD CONSTRAINT `FK_trip_diaries_TO_trip_diary_like` -- 여행일지 -> 여행일지좋아요
		FOREIGN KEY (
			`trip_diary_id` -- 여행일지번호
		)
		REFERENCES `MY_SCHEMA`.`trip_diaries` ( -- 여행일지
			`trip_diary_id` -- 여행일지번호
		);

-- 여행일지좋아요
ALTER TABLE `MY_SCHEMA`.`trip_diary_like`
	ADD CONSTRAINT `FK_members_TO_trip_diary_like` -- 회원 -> 여행일지좋아요
		FOREIGN KEY (
			`mem_id` -- 회원번호
		)
		REFERENCES `MY_SCHEMA`.`members` ( -- 회원
			`mem_id` -- 회원번호
		);

-- 여행계획좋아요
ALTER TABLE `MY_SCHEMA`.`trip_plan_like`
	ADD CONSTRAINT `FK_members_TO_trip_plan_like` -- 회원 -> 여행계획좋아요
		FOREIGN KEY (
			`mem_id` -- 회원번호
		)
		REFERENCES `MY_SCHEMA`.`members` ( -- 회원
			`mem_id` -- 회원번호
		);

-- 여행계획좋아요
ALTER TABLE `MY_SCHEMA`.`trip_plan_like`
	ADD CONSTRAINT `FK_trip_plans_TO_trip_plan_like` -- 여행계획 -> 여행계획좋아요
		FOREIGN KEY (
			`trip_plan_id` -- 여행계획번호
		)
		REFERENCES `MY_SCHEMA`.`trip_plans` ( -- 여행계획
			`trip_plan_id` -- 여행계획번호
		);

-- 회원신고
ALTER TABLE `MY_SCHEMA`.`member_reports`
	ADD CONSTRAINT `FK_members_TO_member_reports` -- 회원 -> 회원신고
		FOREIGN KEY (
			`mem_id2` -- 신고자번호
		)
		REFERENCES `MY_SCHEMA`.`members` ( -- 회원
			`mem_id` -- 회원번호
		);

-- 회원신고
ALTER TABLE `MY_SCHEMA`.`member_reports`
	ADD CONSTRAINT `FK_members_TO_member_reports2` -- 회원 -> 회원신고2
		FOREIGN KEY (
			`mem_id` -- 피신고자번호
		)
		REFERENCES `MY_SCHEMA`.`members` ( -- 회원
			`mem_id` -- 회원번호
		);

-- 여행계획댓글
ALTER TABLE `MY_SCHEMA`.`trip_plan_comments`
	ADD CONSTRAINT `FK_trip_plans_TO_trip_plan_comments` -- 여행계획 -> 여행계획댓글
		FOREIGN KEY (
			`trip_plan_id` -- 여행계획번호
		)
		REFERENCES `MY_SCHEMA`.`trip_plans` ( -- 여행계획
			`trip_plan_id` -- 여행계획번호
		);

-- 여행계획댓글
ALTER TABLE `MY_SCHEMA`.`trip_plan_comments`
	ADD CONSTRAINT `FK_members_TO_trip_plan_comments` -- 회원 -> 여행계획댓글
		FOREIGN KEY (
			`mem_id` -- 회원번호
		)
		REFERENCES `MY_SCHEMA`.`members` ( -- 회원
			`mem_id` -- 회원번호
		);