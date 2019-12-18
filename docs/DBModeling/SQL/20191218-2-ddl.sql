-- ȸ��
CREATE TABLE `MY_SCHEMA`.`members` (
	`mem_id`        INTEGER      NOT NULL COMMENT 'ȸ����ȣ', -- ȸ����ȣ
	`email`         VARCHAR(40)  NOT NULL COMMENT '�̸���', -- �̸���
	`name`          VARCHAR(12)  NOT NULL COMMENT '�г���', -- �г���
	`pwd`           VARCHAR(50)  NOT NULL COMMENT '��й�ȣ', -- ��й�ȣ
	`tel`           VARCHAR(30)  NOT NULL COMMENT '����ó', -- ����ó
	`email_key`     VARCHAR(255) NULL     COMMENT '�̸��� ����Ű', -- �̸��� ����Ű
	`profile_photo` VARCHAR(50)  NULL     COMMENT '����', -- ����
	`state`         INT          NOT NULL DEFAULT 0 COMMENT '����', -- ����
	`grade`         INT          NOT NULL COMMENT '���', -- ���
	`restriction`   INTEGER      NULL     COMMENT '����Ⱓ' -- ����Ⱓ
)
COMMENT 'ȸ��';

-- ȸ��
ALTER TABLE `MY_SCHEMA`.`members`
	ADD CONSTRAINT `PK_members` -- ȸ�� �⺻Ű
		PRIMARY KEY (
			`mem_id` -- ȸ����ȣ
		);

ALTER TABLE `MY_SCHEMA`.`members`
	MODIFY COLUMN `mem_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT 'ȸ����ȣ';

-- �����ȹ
CREATE TABLE `MY_SCHEMA`.`trip_plans` (
	`trip_plan_id` INTEGER      NOT NULL COMMENT '�����ȹ��ȣ', -- �����ȹ��ȣ
	`mem_id`       INTEGER      NOT NULL COMMENT 'ȸ����ȣ', -- ȸ����ȣ
	`sdt`          DATE         NULL     COMMENT '������', -- ������
	`edt`          DATE         NULL     COMMENT '������', -- ������
	`loca`         VARCHAR(255) NULL     COMMENT '����', -- ����
	`cdt`          DATE         NULL     COMMENT '�ۼ���', -- �ۼ���
	`vcnt`         INTEGER      NULL     COMMENT '��ȸ��', -- ��ȸ��
	`pub_chk`      TINYINT(1)   NULL     COMMENT '��������', -- ��������
	`comp_chk`     TINYINT(1)   NULL     COMMENT '���࿩��', -- ���࿩��
	`purpoose`     TEXT         NULL     COMMENT '����', -- ����
	`temp_chk`     TINYINT(1)   NOT NULL COMMENT '����' -- ����
)
COMMENT '�����ȹ';

-- �����ȹ
ALTER TABLE `MY_SCHEMA`.`trip_plans`
	ADD CONSTRAINT `PK_trip_plans` -- �����ȹ �⺻Ű
		PRIMARY KEY (
			`trip_plan_id` -- �����ȹ��ȣ
		);

ALTER TABLE `MY_SCHEMA`.`trip_plans`
	MODIFY COLUMN `trip_plan_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '�����ȹ��ȣ';

-- ���༼�ΰ�ȹ
CREATE TABLE `MY_SCHEMA`.`trip_detail_plans` (
	`trip_detail_plan_id` INTEGER      NOT NULL COMMENT '���༼�ΰ�ȹ��ȣ', -- ���༼�ΰ�ȹ��ȣ
	`trip_plan_id`        INTEGER      NOT NULL COMMENT '�����ȹ��ȣ', -- �����ȹ��ȣ
	`dat`                 DATE         NOT NULL COMMENT '��¥', -- ��¥
	`time`                TIME         NOT NULL COMMENT '�ð�', -- �ð�
	`detail_loca`         VARCHAR(255) NOT NULL COMMENT '�������', -- �������
	`detail_plan`         TEXT         NOT NULL COMMENT '���ΰ�ȹ' -- ���ΰ�ȹ
)
COMMENT '���༼�ΰ�ȹ';

-- ���༼�ΰ�ȹ
ALTER TABLE `MY_SCHEMA`.`trip_detail_plans`
	ADD CONSTRAINT `PK_trip_detail_plans` -- ���༼�ΰ�ȹ �⺻Ű
		PRIMARY KEY (
			`trip_detail_plan_id` -- ���༼�ΰ�ȹ��ȣ
		);

ALTER TABLE `MY_SCHEMA`.`trip_detail_plans`
	MODIFY COLUMN `trip_detail_plan_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '���༼�ΰ�ȹ��ȣ';

-- ����
CREATE TABLE `MY_SCHEMA`.`comp` (
	`comp_id`             INTEGER     NOT NULL COMMENT '�����ȣ', -- �����ȣ
	`trip_detail_plan_id` INTEGER     NOT NULL COMMENT '���༼�ΰ�ȹ��ȣ', -- ���༼�ΰ�ȹ��ȣ
	`trip_info_id`        INTEGER     NOT NULL COMMENT '������������ȣ', -- ������������ȣ
	`loca`                VARCHAR(50) NOT NULL COMMENT '���', -- ���
	`max_mem`             INTEGER     NOT NULL COMMENT '���ο�', -- ���ο�
	`current_mem`         INTEGER     NOT NULL COMMENT '�����ο�', -- �����ο�
	`purpose`             TEXT        NOT NULL COMMENT '����', -- ����
	`gender_chk`          TINYINT(1)  NOT NULL COMMENT '�̼�����' -- �̼�����
)
COMMENT '����';

-- ����
ALTER TABLE `MY_SCHEMA`.`comp`
	ADD CONSTRAINT `PK_comp` -- ���� �⺻Ű
		PRIMARY KEY (
			`comp_id` -- �����ȣ
		);

ALTER TABLE `MY_SCHEMA`.`comp`
	MODIFY COLUMN `comp_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '�����ȣ';

-- ����ȸ��
CREATE TABLE `MY_SCHEMA`.`comp_members` (
	`comp_mem_id` INTEGER NOT NULL COMMENT '����ȸ����ȣ', -- ����ȸ����ȣ
	`comp_id`     INTEGER NOT NULL COMMENT '�����ȣ', -- �����ȣ
	`mem_id`      INTEGER NOT NULL COMMENT 'ȸ����ȣ', -- ȸ����ȣ
	`chat_id`     INTEGER NOT NULL COMMENT 'ä�ù�ȣ' -- ä�ù�ȣ
)
COMMENT '����ȸ��';

-- ����ȸ��
ALTER TABLE `MY_SCHEMA`.`comp_members`
	ADD CONSTRAINT `PK_comp_members` -- ����ȸ�� �⺻Ű
		PRIMARY KEY (
			`comp_mem_id` -- ����ȸ����ȣ
		);

ALTER TABLE `MY_SCHEMA`.`comp_members`
	MODIFY COLUMN `comp_mem_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '����ȸ����ȣ';

-- ������
CREATE TABLE `MY_SCHEMA`.`comp_eval` (
	`comp_mem_no` INTEGER NOT NULL DEFAULT 0 COMMENT '����ȸ����ȣ', -- ����ȸ����ȣ
	`rate`        DOUBLE  NOT NULL COMMENT '����' -- ����
)
COMMENT '������';

-- ������
ALTER TABLE `MY_SCHEMA`.`comp_eval`
	ADD CONSTRAINT `PK_comp_eval` -- ������ �⺻Ű
		PRIMARY KEY (
			`comp_mem_no` -- ����ȸ����ȣ
		);

ALTER TABLE `MY_SCHEMA`.`comp_eval`
	MODIFY COLUMN `comp_mem_no` INTEGER NOT NULL AUTO_INCREMENT DEFAULT 0 COMMENT '����ȸ����ȣ';

-- ä��
CREATE TABLE `MY_SCHEMA`.`chats` (
	`chat_id` INTEGER    NOT NULL COMMENT 'ä�ù�ȣ', -- ä�ù�ȣ
	`dat`     DATETIME   NOT NULL COMMENT '��¥', -- ��¥
	`conts`   TEXT       NOT NULL COMMENT '����', -- ����
	`is_read` TINYINT(1) NOT NULL DEFAULT false COMMENT '����' -- ����
)
COMMENT 'ä��';

-- ä��
ALTER TABLE `MY_SCHEMA`.`chats`
	ADD CONSTRAINT `PK_chats` -- ä�� �⺻Ű
		PRIMARY KEY (
			`chat_id` -- ä�ù�ȣ
		);

ALTER TABLE `MY_SCHEMA`.`chats`
	MODIFY COLUMN `chat_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT 'ä�ù�ȣ';

-- �����
CREATE TABLE `MY_SCHEMA`.`trip_notes` (
	`note_id`      INTEGER     NOT NULL COMMENT '������ȣ', -- ������ȣ
	`trip_plan_id` INTEGER     NOT NULL COMMENT '�����ȹ��ȣ', -- �����ȹ��ȣ
	`titl`         VARCHAR(50) NOT NULL COMMENT '����', -- ����
	`conts`        TEXT        NOT NULL COMMENT '����', -- ����
	`cdt`          DATE        NOT NULL COMMENT '�ۼ���', -- �ۼ���
	`vcnt`         INTEGER     NOT NULL COMMENT '��ȸ��', -- ��ȸ��
	`pub_state`    TINYINT(1)  NOT NULL COMMENT '��������', -- ��������
	`trip_day`     DATE        NULL     COMMENT '��������' -- ��������
)
COMMENT '�����';

-- �����
ALTER TABLE `MY_SCHEMA`.`trip_notes`
	ADD CONSTRAINT `PK_trip_notes` -- ����� �⺻Ű
		PRIMARY KEY (
			`note_id` -- ������ȣ
		);

ALTER TABLE `MY_SCHEMA`.`trip_notes`
	MODIFY COLUMN `note_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '������ȣ';

-- ��������
CREATE TABLE `MY_SCHEMA`.`trip_diaries` (
	`trip_diary_id`       INTEGER     NOT NULL COMMENT '����������ȣ', -- ����������ȣ
	`trip_detail_plan_id` INTEGER     NULL     COMMENT '���༼�ΰ�ȹ��ȣ', -- ���༼�ΰ�ȹ��ȣ
	`titl`                VARCHAR(50) NOT NULL COMMENT '����', -- ����
	`conts`               TEXT        NOT NULL COMMENT '����', -- ����
	`cdt`                 DATE        NOT NULL COMMENT '�ۼ���', -- �ۼ���
	`vcnt`                INTEGER     NOT NULL DEFAULT 0 COMMENT '��ȸ��', -- ��ȸ��
	`pub_chk`             TINYINT(1)  NOT NULL COMMENT '��������' -- ��������
)
COMMENT '��������';

-- ��������
ALTER TABLE `MY_SCHEMA`.`trip_diaries`
	ADD CONSTRAINT `PK_trip_diaries` -- �������� �⺻Ű
		PRIMARY KEY (
			`trip_diary_id` -- ����������ȣ
		);

ALTER TABLE `MY_SCHEMA`.`trip_diaries`
	MODIFY COLUMN `trip_diary_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '����������ȣ';

-- ��������
CREATE TABLE `MY_SCHEMA`.`trip_eval` (
	`trip_eval_id`  INTEGER NOT NULL COMMENT '�������򰡹�ȣ', -- �������򰡹�ȣ
	`trip_diary_id` INTEGER NOT NULL COMMENT '����������ȣ', -- ����������ȣ
	`access`        INT     NOT NULL COMMENT '���ټ�', -- ���ټ�
	`hyg`           INT     NOT NULL COMMENT '����', -- ����
	`kindness`      INT     NOT NULL COMMENT 'ģ��', -- ģ��
	`food`          INT     NULL     COMMENT '����', -- ����
	`view`          INT     NULL     COMMENT '��ġ' -- ��ġ
)
COMMENT '��������';

-- ��������
ALTER TABLE `MY_SCHEMA`.`trip_eval`
	ADD CONSTRAINT `PK_trip_eval` -- �������� �⺻Ű
		PRIMARY KEY (
			`trip_eval_id` -- �������򰡹�ȣ
		);

ALTER TABLE `MY_SCHEMA`.`trip_eval`
	MODIFY COLUMN `trip_eval_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '�������򰡹�ȣ';

-- ���࿩���
CREATE TABLE `MY_SCHEMA`.`comp_trip_notes` (
	`note_id` INTEGER NOT NULL COMMENT '������ȣ', -- ������ȣ
	`comp_id` INTEGER NOT NULL COMMENT '�����ȣ' -- �����ȣ
)
COMMENT '���࿩���';

-- ���࿩���
ALTER TABLE `MY_SCHEMA`.`comp_trip_notes`
	ADD CONSTRAINT `PK_comp_trip_notes` -- ���࿩��� �⺻Ű
		PRIMARY KEY (
			`note_id`, -- ������ȣ
			`comp_id`  -- �����ȣ
		);

-- ����������
CREATE TABLE `MY_SCHEMA`.`trip_info` (
	`trip_info_id` INTEGER      NOT NULL COMMENT '������������ȣ', -- ������������ȣ
	`trip_eval_id` INTEGER      NOT NULL COMMENT '�������򰡹�ȣ', -- �������򰡹�ȣ
	`name`         VARCHAR(50)  NOT NULL COMMENT '�̸�', -- �̸�
	`loca`         VARCHAR(255) NOT NULL COMMENT '��ġ' -- ��ġ
)
COMMENT '����������';

-- ����������
ALTER TABLE `MY_SCHEMA`.`trip_info`
	ADD CONSTRAINT `PK_trip_info` -- ���������� �⺻Ű
		PRIMARY KEY (
			`trip_info_id` -- ������������ȣ
		);

ALTER TABLE `MY_SCHEMA`.`trip_info`
	MODIFY COLUMN `trip_info_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '������������ȣ';

-- ����������
CREATE TABLE `MY_SCHEMA`.`trip_restaurant` (
	`trip_restaurant_id` INTEGER      NOT NULL COMMENT '���������Ĺ�ȣ', -- ���������Ĺ�ȣ
	`trip_info_id`       INTEGER      NOT NULL COMMENT '������������ȣ', -- ������������ȣ
	`name`               VARCHAR(50)  NOT NULL COMMENT '�Ĵ��̸�', -- �Ĵ��̸�
	`loca`               VARCHAR(255) NOT NULL COMMENT '��ġ', -- ��ġ
	`category`           VARCHAR(20)  NOT NULL COMMENT 'ī�װ�', -- ī�װ�
	`open_time`          TIME         NOT NULL COMMENT '�������۽ð�', -- �������۽ð�
	`close_time`         TIME         NOT NULL COMMENT '��������ð�' -- ��������ð�
)
COMMENT '����������';

-- ����������
ALTER TABLE `MY_SCHEMA`.`trip_restaurant`
	ADD CONSTRAINT `PK_trip_restaurant` -- ���������� �⺻Ű
		PRIMARY KEY (
			`trip_restaurant_id` -- ���������Ĺ�ȣ
		);

ALTER TABLE `MY_SCHEMA`.`trip_restaurant`
	MODIFY COLUMN `trip_restaurant_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '���������Ĺ�ȣ';

-- ����������
CREATE TABLE `MY_SCHEMA`.`trip_accom` (
	`trip_accom_id` INTEGER      NOT NULL COMMENT '���������ڹ�ȣ', -- ���������ڹ�ȣ
	`trip_info_id`  INTEGER      NOT NULL COMMENT '������������ȣ', -- ������������ȣ
	`category`      VARCHAR(20)  NOT NULL COMMENT '����', -- ����
	`name`          VARCHAR(50)  NOT NULL COMMENT '�̸�', -- �̸�
	`loca`          VARCHAR(255) NOT NULL COMMENT '��ġ', -- ��ġ
	`chkin_time`    TIME         NOT NULL COMMENT 'üũ�νð�', -- üũ�νð�
	`chkout_time`   TIME         NOT NULL COMMENT 'üũ�ƿ��ð�', -- üũ�ƿ��ð�
	`storage_chk`   TINYINT(1)   NOT NULL COMMENT '�� ��������', -- �� ��������
	`pickup_chk`    TINYINT(1)   NOT NULL COMMENT '�Ⱦ�����' -- �Ⱦ�����
)
COMMENT '����������';

-- ����������
ALTER TABLE `MY_SCHEMA`.`trip_accom`
	ADD CONSTRAINT `PK_trip_accom` -- ���������� �⺻Ű
		PRIMARY KEY (
			`trip_accom_id` -- ���������ڹ�ȣ
		);

ALTER TABLE `MY_SCHEMA`.`trip_accom`
	MODIFY COLUMN `trip_accom_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '���������ڹ�ȣ';

-- ���������Ÿ�
CREATE TABLE `MY_SCHEMA`.`trip_enter` (
	`trip_enter_id` INTEGER      NOT NULL COMMENT '�������Ÿ���ȣ', -- �������Ÿ���ȣ
	`trip_info_id`  INTEGER      NOT NULL COMMENT '������������ȣ', -- ������������ȣ
	`category`      VARCHAR(20)  NOT NULL COMMENT '����', -- ����
	`name`          VARCHAR(50)  NOT NULL COMMENT '�̸�', -- �̸�
	`price`         INTEGER      NULL     DEFAULT 0 COMMENT '����', -- ����
	`loca`          VARCHAR(255) NOT NULL COMMENT '��ġ', -- ��ġ
	`open_time`     TIME         NULL     COMMENT '�������۽ð�', -- �������۽ð�
	`close_time`    TIME         NULL     COMMENT '��������ð�' -- ��������ð�
)
COMMENT '���������Ÿ�';

-- ���������Ÿ�
ALTER TABLE `MY_SCHEMA`.`trip_enter`
	ADD CONSTRAINT `PK_trip_enter` -- ���������Ÿ� �⺻Ű
		PRIMARY KEY (
			`trip_enter_id` -- �������Ÿ���ȣ
		);

ALTER TABLE `MY_SCHEMA`.`trip_enter`
	MODIFY COLUMN `trip_enter_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '�������Ÿ���ȣ';

-- ���ĸ޴�
CREATE TABLE `MY_SCHEMA`.`restaurant_info` (
	`trip_restaurant_id` INTEGER     NOT NULL COMMENT '���������Ĺ�ȣ', -- ���������Ĺ�ȣ
	`name`               VARCHAR(50) NOT NULL COMMENT '�̸�', -- �̸�
	`price`              INTEGER     NOT NULL DEFAULT 0 COMMENT '����' -- ����
)
COMMENT '���ĸ޴�';

-- ���ĸ޴�
ALTER TABLE `MY_SCHEMA`.`restaurant_info`
	ADD CONSTRAINT `PK_restaurant_info` -- ���ĸ޴� �⺻Ű
		PRIMARY KEY (
			`trip_restaurant_id` -- ���������Ĺ�ȣ
		);

-- ��������������
CREATE TABLE `MY_SCHEMA`.`trip_info_pic` (
	`trip_info_pic_id`   INTEGER     NOT NULL COMMENT '����������������ȣ', -- ����������������ȣ
	`trip_accom_id`      INTEGER     NOT NULL COMMENT '���������ڹ�ȣ', -- ���������ڹ�ȣ
	`trip_restaurant_id` INTEGER     NOT NULL COMMENT '���������Ĺ�ȣ', -- ���������Ĺ�ȣ
	`trip_enter_id`      INTEGER     NOT NULL COMMENT '�������Ÿ���ȣ', -- �������Ÿ���ȣ
	`file_name`          VARCHAR(50) NOT NULL COMMENT '�����̸�' -- �����̸�
)
COMMENT '��������������';

-- ��������������
ALTER TABLE `MY_SCHEMA`.`trip_info_pic`
	ADD CONSTRAINT `PK_trip_info_pic` -- �������������� �⺻Ű
		PRIMARY KEY (
			`trip_info_pic_id` -- ����������������ȣ
		);

ALTER TABLE `MY_SCHEMA`.`trip_info_pic`
	MODIFY COLUMN `trip_info_pic_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '����������������ȣ';

-- ��������
CREATE TABLE `MY_SCHEMA`.`accom_info` (
	`accom_info_id` INTEGER     NOT NULL COMMENT '���������ڹ�ȣ', -- ���������ڹ�ȣ
	`category`      VARCHAR(20) NOT NULL COMMENT '���ڱ���', -- ���ڱ���
	`price`         INTEGER     NOT NULL DEFAULT 0 COMMENT '����' -- ����
)
COMMENT '��������';

-- ��������
ALTER TABLE `MY_SCHEMA`.`accom_info`
	ADD CONSTRAINT `PK_accom_info` -- �������� �⺻Ű
		PRIMARY KEY (
			`accom_info_id` -- ���������ڹ�ȣ
		);

-- ������������
CREATE TABLE `MY_SCHEMA`.`trip_diary_pic` (
	`trip_diary_pic_id` INTEGER     NOT NULL COMMENT '��������������ȣ', -- ��������������ȣ
	`trip_diary_id`     INTEGER     NOT NULL COMMENT '����������ȣ', -- ����������ȣ
	`file_name`         VARCHAR(50) NOT NULL COMMENT '�����̸�' -- �����̸�
)
COMMENT '������������';

-- ������������
ALTER TABLE `MY_SCHEMA`.`trip_diary_pic`
	ADD CONSTRAINT `PK_trip_diary_pic` -- ������������ �⺻Ű
		PRIMARY KEY (
			`trip_diary_pic_id` -- ��������������ȣ
		);

ALTER TABLE `MY_SCHEMA`.`trip_diary_pic`
	MODIFY COLUMN `trip_diary_pic_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '��������������ȣ';

-- ��������
CREATE TABLE `MY_SCHEMA`.`trip_notes_pic` (
	`photo_id`  INTEGER     NOT NULL COMMENT '����������ȣ', -- ����������ȣ
	`note_id`   INTEGER     NOT NULL COMMENT '������ȣ', -- ������ȣ
	`file_name` VARCHAR(50) NOT NULL COMMENT '�����̸�' -- �����̸�
)
COMMENT '��������';

-- ��������
ALTER TABLE `MY_SCHEMA`.`trip_notes_pic`
	ADD CONSTRAINT `PK_trip_notes_pic` -- �������� �⺻Ű
		PRIMARY KEY (
			`photo_id` -- ����������ȣ
		);

ALTER TABLE `MY_SCHEMA`.`trip_notes_pic`
	MODIFY COLUMN `photo_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '����������ȣ';

-- ��������ƿ�
CREATE TABLE `MY_SCHEMA`.`trip_notes_like` (
	`mem_id`  INTEGER NOT NULL COMMENT 'ȸ����ȣ', -- ȸ����ȣ
	`note_id` INTEGER NOT NULL COMMENT '������ȣ' -- ������ȣ
)
COMMENT '��������ƿ�';

-- ��������ƿ�
ALTER TABLE `MY_SCHEMA`.`trip_notes_like`
	ADD CONSTRAINT `PK_trip_notes_like` -- ��������ƿ� �⺻Ű
		PRIMARY KEY (
			`mem_id`,  -- ȸ����ȣ
			`note_id`  -- ������ȣ
		);

-- �����������ƿ�
CREATE TABLE `MY_SCHEMA`.`trip_diary_like` (
	`mem_id`        INTEGER NOT NULL COMMENT 'ȸ����ȣ', -- ȸ����ȣ
	`trip_diary_id` INTEGER NOT NULL COMMENT '����������ȣ' -- ����������ȣ
)
COMMENT '�����������ƿ�';

-- �����������ƿ�
ALTER TABLE `MY_SCHEMA`.`trip_diary_like`
	ADD CONSTRAINT `PK_trip_diary_like` -- �����������ƿ� �⺻Ű
		PRIMARY KEY (
			`mem_id`,        -- ȸ����ȣ
			`trip_diary_id`  -- ����������ȣ
		);

-- �����ȹ���ƿ�
CREATE TABLE `MY_SCHEMA`.`trip_plan_like` (
	`mem_id`       INTEGER NOT NULL COMMENT 'ȸ����ȣ', -- ȸ����ȣ
	`trip_plan_id` INTEGER NOT NULL COMMENT '�����ȹ��ȣ' -- �����ȹ��ȣ
)
COMMENT '�����ȹ���ƿ�';

-- �����ȹ���ƿ�
ALTER TABLE `MY_SCHEMA`.`trip_plan_like`
	ADD CONSTRAINT `PK_trip_plan_like` -- �����ȹ���ƿ� �⺻Ű
		PRIMARY KEY (
			`mem_id`,       -- ȸ����ȣ
			`trip_plan_id`  -- �����ȹ��ȣ
		);

-- ȸ���Ű�
CREATE TABLE `MY_SCHEMA`.`member_reports` (
	`mem_id2` INTEGER NOT NULL COMMENT '�Ű��ڹ�ȣ', -- �Ű��ڹ�ȣ
	`mem_id`  INTEGER NOT NULL COMMENT '�ǽŰ��ڹ�ȣ', -- �ǽŰ��ڹ�ȣ
	`reason`  TEXT    NOT NULL COMMENT '�Ű����' -- �Ű����
)
COMMENT 'ȸ���Ű�';

-- ȸ���Ű�
ALTER TABLE `MY_SCHEMA`.`member_reports`
	ADD CONSTRAINT `PK_member_reports` -- ȸ���Ű� �⺻Ű
		PRIMARY KEY (
			`mem_id2`, -- �Ű��ڹ�ȣ
			`mem_id`   -- �ǽŰ��ڹ�ȣ
		);

-- �����ȹ���
CREATE TABLE `MY_SCHEMA`.`trip_plan_comments` (
	`trip_plan_comment_id` INTEGER  NOT NULL COMMENT '�����ȹ���', -- �����ȹ���
	`trip_plan_id`         INTEGER  NOT NULL COMMENT '�����ȹ��ȣ', -- �����ȹ��ȣ
	`mem_id`               INTEGER  NOT NULL COMMENT 'ȸ����ȣ', -- ȸ����ȣ
	`conts`                TEXT     NOT NULL COMMENT '����', -- ����
	`cdt`                  DATETIME NOT NULL COMMENT '�ۼ���' -- �ۼ���
)
COMMENT '�����ȹ���';

-- �����ȹ���
ALTER TABLE `MY_SCHEMA`.`trip_plan_comments`
	ADD CONSTRAINT `PK_trip_plan_comments` -- �����ȹ��� �⺻Ű
		PRIMARY KEY (
			`trip_plan_comment_id` -- �����ȹ���
		);

ALTER TABLE `MY_SCHEMA`.`trip_plan_comments`
	MODIFY COLUMN `trip_plan_comment_id` INTEGER NOT NULL AUTO_INCREMENT COMMENT '�����ȹ���';

-- �����ȹ
ALTER TABLE `MY_SCHEMA`.`trip_plans`
	ADD CONSTRAINT `FK_members_TO_trip_plans` -- ȸ�� -> �����ȹ
		FOREIGN KEY (
			`mem_id` -- ȸ����ȣ
		)
		REFERENCES `MY_SCHEMA`.`members` ( -- ȸ��
			`mem_id` -- ȸ����ȣ
		);

-- ���༼�ΰ�ȹ
ALTER TABLE `MY_SCHEMA`.`trip_detail_plans`
	ADD CONSTRAINT `FK_trip_plans_TO_trip_detail_plans` -- �����ȹ -> ���༼�ΰ�ȹ
		FOREIGN KEY (
			`trip_plan_id` -- �����ȹ��ȣ
		)
		REFERENCES `MY_SCHEMA`.`trip_plans` ( -- �����ȹ
			`trip_plan_id` -- �����ȹ��ȣ
		);

-- ����
ALTER TABLE `MY_SCHEMA`.`comp`
	ADD CONSTRAINT `FK_trip_detail_plans_TO_comp` -- ���༼�ΰ�ȹ -> ����
		FOREIGN KEY (
			`trip_detail_plan_id` -- ���༼�ΰ�ȹ��ȣ
		)
		REFERENCES `MY_SCHEMA`.`trip_detail_plans` ( -- ���༼�ΰ�ȹ
			`trip_detail_plan_id` -- ���༼�ΰ�ȹ��ȣ
		);

-- ����
ALTER TABLE `MY_SCHEMA`.`comp`
	ADD CONSTRAINT `FK_trip_info_TO_comp` -- ���������� -> ����
		FOREIGN KEY (
			`trip_info_id` -- ������������ȣ
		)
		REFERENCES `MY_SCHEMA`.`trip_info` ( -- ����������
			`trip_info_id` -- ������������ȣ
		);

-- ����ȸ��
ALTER TABLE `MY_SCHEMA`.`comp_members`
	ADD CONSTRAINT `FK_comp_TO_comp_members` -- ���� -> ����ȸ��
		FOREIGN KEY (
			`comp_id` -- �����ȣ
		)
		REFERENCES `MY_SCHEMA`.`comp` ( -- ����
			`comp_id` -- �����ȣ
		);

-- ����ȸ��
ALTER TABLE `MY_SCHEMA`.`comp_members`
	ADD CONSTRAINT `FK_members_TO_comp_members` -- ȸ�� -> ����ȸ��
		FOREIGN KEY (
			`mem_id` -- ȸ����ȣ
		)
		REFERENCES `MY_SCHEMA`.`members` ( -- ȸ��
			`mem_id` -- ȸ����ȣ
		);

-- ����ȸ��
ALTER TABLE `MY_SCHEMA`.`comp_members`
	ADD CONSTRAINT `FK_chats_TO_comp_members` -- ä�� -> ����ȸ��
		FOREIGN KEY (
			`chat_id` -- ä�ù�ȣ
		)
		REFERENCES `MY_SCHEMA`.`chats` ( -- ä��
			`chat_id` -- ä�ù�ȣ
		);

-- ������
ALTER TABLE `MY_SCHEMA`.`comp_eval`
	ADD CONSTRAINT `FK_comp_members_TO_comp_eval` -- ����ȸ�� -> ������
		FOREIGN KEY (
			`comp_mem_no` -- ����ȸ����ȣ
		)
		REFERENCES `MY_SCHEMA`.`comp_members` ( -- ����ȸ��
			`comp_mem_id` -- ����ȸ����ȣ
		);

-- �����
ALTER TABLE `MY_SCHEMA`.`trip_notes`
	ADD CONSTRAINT `FK_trip_plans_TO_trip_notes` -- �����ȹ -> �����
		FOREIGN KEY (
			`trip_plan_id` -- �����ȹ��ȣ
		)
		REFERENCES `MY_SCHEMA`.`trip_plans` ( -- �����ȹ
			`trip_plan_id` -- �����ȹ��ȣ
		);

-- ��������
ALTER TABLE `MY_SCHEMA`.`trip_diaries`
	ADD CONSTRAINT `FK_trip_detail_plans_TO_trip_diaries` -- ���༼�ΰ�ȹ -> ��������
		FOREIGN KEY (
			`trip_detail_plan_id` -- ���༼�ΰ�ȹ��ȣ
		)
		REFERENCES `MY_SCHEMA`.`trip_detail_plans` ( -- ���༼�ΰ�ȹ
			`trip_detail_plan_id` -- ���༼�ΰ�ȹ��ȣ
		);

-- ��������
ALTER TABLE `MY_SCHEMA`.`trip_eval`
	ADD CONSTRAINT `FK_trip_diaries_TO_trip_eval` -- �������� -> ��������
		FOREIGN KEY (
			`trip_diary_id` -- ����������ȣ
		)
		REFERENCES `MY_SCHEMA`.`trip_diaries` ( -- ��������
			`trip_diary_id` -- ����������ȣ
		);

-- ���࿩���
ALTER TABLE `MY_SCHEMA`.`comp_trip_notes`
	ADD CONSTRAINT `FK_trip_notes_TO_comp_trip_notes` -- ����� -> ���࿩���
		FOREIGN KEY (
			`note_id` -- ������ȣ
		)
		REFERENCES `MY_SCHEMA`.`trip_notes` ( -- �����
			`note_id` -- ������ȣ
		);

-- ���࿩���
ALTER TABLE `MY_SCHEMA`.`comp_trip_notes`
	ADD CONSTRAINT `FK_comp_TO_comp_trip_notes` -- ���� -> ���࿩���
		FOREIGN KEY (
			`comp_id` -- �����ȣ
		)
		REFERENCES `MY_SCHEMA`.`comp` ( -- ����
			`comp_id` -- �����ȣ
		);

-- ����������
ALTER TABLE `MY_SCHEMA`.`trip_info`
	ADD CONSTRAINT `FK_trip_eval_TO_trip_info` -- �������� -> ����������
		FOREIGN KEY (
			`trip_eval_id` -- �������򰡹�ȣ
		)
		REFERENCES `MY_SCHEMA`.`trip_eval` ( -- ��������
			`trip_eval_id` -- �������򰡹�ȣ
		);

-- ����������
ALTER TABLE `MY_SCHEMA`.`trip_restaurant`
	ADD CONSTRAINT `FK_trip_info_TO_trip_restaurant` -- ���������� -> ����������
		FOREIGN KEY (
			`trip_info_id` -- ������������ȣ
		)
		REFERENCES `MY_SCHEMA`.`trip_info` ( -- ����������
			`trip_info_id` -- ������������ȣ
		);

-- ����������
ALTER TABLE `MY_SCHEMA`.`trip_accom`
	ADD CONSTRAINT `FK_trip_info_TO_trip_accom` -- ���������� -> ����������
		FOREIGN KEY (
			`trip_info_id` -- ������������ȣ
		)
		REFERENCES `MY_SCHEMA`.`trip_info` ( -- ����������
			`trip_info_id` -- ������������ȣ
		);

-- ���������Ÿ�
ALTER TABLE `MY_SCHEMA`.`trip_enter`
	ADD CONSTRAINT `FK_trip_info_TO_trip_enter` -- ���������� -> ���������Ÿ�
		FOREIGN KEY (
			`trip_info_id` -- ������������ȣ
		)
		REFERENCES `MY_SCHEMA`.`trip_info` ( -- ����������
			`trip_info_id` -- ������������ȣ
		);

-- ���ĸ޴�
ALTER TABLE `MY_SCHEMA`.`restaurant_info`
	ADD CONSTRAINT `FK_trip_restaurant_TO_restaurant_info` -- ���������� -> ���ĸ޴�
		FOREIGN KEY (
			`trip_restaurant_id` -- ���������Ĺ�ȣ
		)
		REFERENCES `MY_SCHEMA`.`trip_restaurant` ( -- ����������
			`trip_restaurant_id` -- ���������Ĺ�ȣ
		);

-- ��������������
ALTER TABLE `MY_SCHEMA`.`trip_info_pic`
	ADD CONSTRAINT `FK_trip_accom_TO_trip_info_pic` -- ���������� -> ��������������
		FOREIGN KEY (
			`trip_accom_id` -- ���������ڹ�ȣ
		)
		REFERENCES `MY_SCHEMA`.`trip_accom` ( -- ����������
			`trip_accom_id` -- ���������ڹ�ȣ
		);

-- ��������������
ALTER TABLE `MY_SCHEMA`.`trip_info_pic`
	ADD CONSTRAINT `FK_trip_restaurant_TO_trip_info_pic` -- ���������� -> ��������������
		FOREIGN KEY (
			`trip_restaurant_id` -- ���������Ĺ�ȣ
		)
		REFERENCES `MY_SCHEMA`.`trip_restaurant` ( -- ����������
			`trip_restaurant_id` -- ���������Ĺ�ȣ
		);

-- ��������������
ALTER TABLE `MY_SCHEMA`.`trip_info_pic`
	ADD CONSTRAINT `FK_trip_enter_TO_trip_info_pic` -- ���������Ÿ� -> ��������������
		FOREIGN KEY (
			`trip_enter_id` -- �������Ÿ���ȣ
		)
		REFERENCES `MY_SCHEMA`.`trip_enter` ( -- ���������Ÿ�
			`trip_enter_id` -- �������Ÿ���ȣ
		);

-- ��������
ALTER TABLE `MY_SCHEMA`.`accom_info`
	ADD CONSTRAINT `FK_trip_accom_TO_accom_info` -- ���������� -> ��������
		FOREIGN KEY (
			`accom_info_id` -- ���������ڹ�ȣ
		)
		REFERENCES `MY_SCHEMA`.`trip_accom` ( -- ����������
			`trip_accom_id` -- ���������ڹ�ȣ
		);

-- ������������
ALTER TABLE `MY_SCHEMA`.`trip_diary_pic`
	ADD CONSTRAINT `FK_trip_diaries_TO_trip_diary_pic` -- �������� -> ������������
		FOREIGN KEY (
			`trip_diary_id` -- ����������ȣ
		)
		REFERENCES `MY_SCHEMA`.`trip_diaries` ( -- ��������
			`trip_diary_id` -- ����������ȣ
		);

-- ��������
ALTER TABLE `MY_SCHEMA`.`trip_notes_pic`
	ADD CONSTRAINT `FK_trip_notes_TO_trip_notes_pic` -- ����� -> ��������
		FOREIGN KEY (
			`note_id` -- ������ȣ
		)
		REFERENCES `MY_SCHEMA`.`trip_notes` ( -- �����
			`note_id` -- ������ȣ
		);

-- ��������ƿ�
ALTER TABLE `MY_SCHEMA`.`trip_notes_like`
	ADD CONSTRAINT `FK_members_TO_trip_notes_like` -- ȸ�� -> ��������ƿ�
		FOREIGN KEY (
			`mem_id` -- ȸ����ȣ
		)
		REFERENCES `MY_SCHEMA`.`members` ( -- ȸ��
			`mem_id` -- ȸ����ȣ
		);

-- ��������ƿ�
ALTER TABLE `MY_SCHEMA`.`trip_notes_like`
	ADD CONSTRAINT `FK_trip_notes_TO_trip_notes_like` -- ����� -> ��������ƿ�
		FOREIGN KEY (
			`note_id` -- ������ȣ
		)
		REFERENCES `MY_SCHEMA`.`trip_notes` ( -- �����
			`note_id` -- ������ȣ
		);

-- �����������ƿ�
ALTER TABLE `MY_SCHEMA`.`trip_diary_like`
	ADD CONSTRAINT `FK_trip_diaries_TO_trip_diary_like` -- �������� -> �����������ƿ�
		FOREIGN KEY (
			`trip_diary_id` -- ����������ȣ
		)
		REFERENCES `MY_SCHEMA`.`trip_diaries` ( -- ��������
			`trip_diary_id` -- ����������ȣ
		);

-- �����������ƿ�
ALTER TABLE `MY_SCHEMA`.`trip_diary_like`
	ADD CONSTRAINT `FK_members_TO_trip_diary_like` -- ȸ�� -> �����������ƿ�
		FOREIGN KEY (
			`mem_id` -- ȸ����ȣ
		)
		REFERENCES `MY_SCHEMA`.`members` ( -- ȸ��
			`mem_id` -- ȸ����ȣ
		);

-- �����ȹ���ƿ�
ALTER TABLE `MY_SCHEMA`.`trip_plan_like`
	ADD CONSTRAINT `FK_members_TO_trip_plan_like` -- ȸ�� -> �����ȹ���ƿ�
		FOREIGN KEY (
			`mem_id` -- ȸ����ȣ
		)
		REFERENCES `MY_SCHEMA`.`members` ( -- ȸ��
			`mem_id` -- ȸ����ȣ
		);

-- �����ȹ���ƿ�
ALTER TABLE `MY_SCHEMA`.`trip_plan_like`
	ADD CONSTRAINT `FK_trip_plans_TO_trip_plan_like` -- �����ȹ -> �����ȹ���ƿ�
		FOREIGN KEY (
			`trip_plan_id` -- �����ȹ��ȣ
		)
		REFERENCES `MY_SCHEMA`.`trip_plans` ( -- �����ȹ
			`trip_plan_id` -- �����ȹ��ȣ
		);

-- ȸ���Ű�
ALTER TABLE `MY_SCHEMA`.`member_reports`
	ADD CONSTRAINT `FK_members_TO_member_reports` -- ȸ�� -> ȸ���Ű�
		FOREIGN KEY (
			`mem_id2` -- �Ű��ڹ�ȣ
		)
		REFERENCES `MY_SCHEMA`.`members` ( -- ȸ��
			`mem_id` -- ȸ����ȣ
		);

-- ȸ���Ű�
ALTER TABLE `MY_SCHEMA`.`member_reports`
	ADD CONSTRAINT `FK_members_TO_member_reports2` -- ȸ�� -> ȸ���Ű�2
		FOREIGN KEY (
			`mem_id` -- �ǽŰ��ڹ�ȣ
		)
		REFERENCES `MY_SCHEMA`.`members` ( -- ȸ��
			`mem_id` -- ȸ����ȣ
		);

-- �����ȹ���
ALTER TABLE `MY_SCHEMA`.`trip_plan_comments`
	ADD CONSTRAINT `FK_trip_plans_TO_trip_plan_comments` -- �����ȹ -> �����ȹ���
		FOREIGN KEY (
			`trip_plan_id` -- �����ȹ��ȣ
		)
		REFERENCES `MY_SCHEMA`.`trip_plans` ( -- �����ȹ
			`trip_plan_id` -- �����ȹ��ȣ
		);

-- �����ȹ���
ALTER TABLE `MY_SCHEMA`.`trip_plan_comments`
	ADD CONSTRAINT `FK_members_TO_trip_plan_comments` -- ȸ�� -> �����ȹ���
		FOREIGN KEY (
			`mem_id` -- ȸ����ȣ
		)
		REFERENCES `MY_SCHEMA`.`members` ( -- ȸ��
			`mem_id` -- ȸ����ȣ
		);