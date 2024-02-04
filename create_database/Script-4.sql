SHOW tables;

SELECT * FROM admin;
SELECT * FROM attend;
SELECT * FROM attend_change;
SELECT * FROM bell;
SELECT * FROM `character`;
SELECT * FROM comment;
SELECT * FROM notice;
SELECT * FROM praise ;
SELECT * FROM praise_category ;
SELECT * FROM propose ;
SELECT * FROM recommend ;
SELECT * FROM schedule ;
SELECT * FROM seat ;
SELECT * FROM student ;
SELECT * FROM USER;
SELECT * FROM user_bell ;
SELECT * FROM user_char ;
SELECT * FROM user_info;






SET FOREIGN_KEY_CHECKS=1;

select table_name, column_name, constraint_name, referenced_table_name, referenced_column_name 
from information_schema.key_column_usage 
where table_schema = 'kbjdb' and referenced_table_schema is not null;

CONSTRAINT fk_order_menu_menu_code FOREIGN KEY (menu_code) REFERENCES tbl_menu (menu_code)

DROP TABLE `admin`;

CREATE TABLE `admin`
(
    `admin_code`    INTEGER AUTO_INCREMENT NOT NULL COMMENT '관리자코드',
    `admin_pwd`    VARCHAR(255) NOT NULL COMMENT '관리자pwd',
    `admin_id`    VARCHAR(255) NOT NULL COMMENT '관리자id',
 PRIMARY KEY ( `admin_code` )
) COMMENT = '관리자';



DROP TABLE `attend`;

CREATE TABLE `attend`
(
	`attren_code`    INTEGER AUTO_INCREMENT NOT NULL COMMENT '출결관리코드',
    `student_code`    INTEGER NOT NULL COMMENT '학생코드',
    `attend_kind`    VARCHAR(255) NOT NULL COMMENT '출결종류',
    `regist_date`    DATE NOT NULL COMMENT '등록일',
    `reason`    VARCHAR(255) NOT NULL COMMENT '사유',
    `attend_status`    VARCHAR(5) NOT NULL COMMENT '출결상태',
    `leave_time`    DATETIME COMMENT '조퇴시간',
    `modify_date`    DATE COMMENT '수정일',
    `delete_date`    DATE COMMENT '삭제일',
 PRIMARY KEY ( `attren_code` ),
 FOREIGN key(student_code) REFERENCES student(student_code)
) COMMENT = '출결관리';



DROP TABLE `attend_change`;

CREATE TABLE `attend_change`
(
	`attren_code`    INTEGER NOT NULL COMMENT '출결관리코드',
    `modify_date`    DATE NOT NULL COMMENT '수정일',
    `reason`    VARCHAR(255) NOT NULL COMMENT '사유',
     FOREIGN key(attren_code) REFERENCES attend(attren_code)
) COMMENT = '출결수정';



DROP TABLE bell;

CREATE TABLE `bell`
(
    `bell_code`    INTEGER AUTO_INCREMENT NOT NULL COMMENT '종소리코드',
    `bell_file`    VARCHAR(255) NOT NULL COMMENT '종소리파일',
 PRIMARY KEY ( `bell_code` )
) COMMENT = '종소리';


DROP TABLE `character` ;

CREATE TABLE `Character`
(
    `Character_code`    INTEGER AUTO_INCREMENT NOT NULL COMMENT '캐릭터코드',
    `Character_file`    VARCHAR(255) NOT NULL COMMENT '캐릭터파일',
 PRIMARY KEY ( `Character_code` )
) COMMENT = '캐릭터';

DROP TABLE comment ;

CREATE TABLE `comment`
(
    `comment_code`    INTEGER AUTO_INCREMENT NOT NULL COMMENT '댓글코드',
    `comment_auth`    VARCHAR(255) NOT NULL COMMENT '댓글내용',
    `admin_code`    INTEGER NOT NULL COMMENT '관리자코드',
    `propose_code`    INTEGER COMMENT '건의사항코드',
 PRIMARY KEY ( `comment_code` ),
  FOREIGN key(admin_code) REFERENCES admin(admin_code),
  FOREIGN key(propose_code) REFERENCES propose(propose_code)
) COMMENT = '댓글';





DROP TABLE notice ;

CREATE TABLE `Notice`
(
    `Notice_code`    INTEGER AUTO_INCREMENT NOT NULL COMMENT '게시물코드',
    `Notice_name`    VARCHAR(255) NOT NULL COMMENT '게시물이름',
    `Notice_content`    VARCHAR(255) NOT NULL COMMENT '게시물내용',
    `admin_code`    INTEGER NOT NULL COMMENT '관리자코드',
    `regist_date`    DATE NOT NULL COMMENT '등록일',
    `modify_date`    DATE COMMENT '수정일',
    `delete_date`    DATE COMMENT '삭제일',
    `notice_status`    VARCHAR(5) NOT NULL COMMENT '게시글상태',
 PRIMARY KEY ( `Notice_code` ),
 FOREIGN key(admin_code) REFERENCES admin(admin_code)
) COMMENT = '공지사항';




DROP TABLE praise ;

CREATE TABLE `praise`
(
    `praise_code`    INTEGER AUTO_INCREMENT NOT NULL COMMENT '칭찬코드',
    `category_code`    INTEGER NOT NULL COMMENT '카테고리코드',
    `praise_context`    VARCHAR(255) NOT NULL COMMENT '칭찬내용',
    `score`    INTEGER NOT NULL COMMENT '점수',
    `student_code`    INTEGER NOT NULL COMMENT '학생코드',
    `praise_date`    DATE NOT NULL COMMENT '날짜',
    `praise_status`    VARCHAR(5) NOT NULL COMMENT '칭찬상태',
    `regist_date`    DATE NOT NULL COMMENT '등록일',
    `modify_date`    DATE COMMENT '수정일',
    `delete_date`    DATE COMMENT '삭제일',
 PRIMARY KEY ( `praise_code` ),
 FOREIGN key(student_code) REFERENCES student(student_code),
 FOREIGN key(category_code) REFERENCES praise_category(category_code)
) COMMENT = '칭찬';


DROP TABLE praise_category ;

CREATE TABLE `praise_category`
(
    `category_code`    INTEGER AUTO_INCREMENT NOT NULL COMMENT '카테고리코드',
    `category_name`    VARCHAR(255) NOT NULL COMMENT '카테고리이름',
 PRIMARY KEY ( `category_code` )
) COMMENT = '칭찬카테고리';


DROP TABLE propose;

CREATE TABLE `propose`
(
    `propose_code`    INTEGER AUTO_INCREMENT NOT NULL COMMENT '건의사항코드',
    `propose_name`    VARCHAR(255) NOT NULL COMMENT '건의사항제목',
    `propose_content`    VARCHAR(255) NOT NULL COMMENT '건의사항내용',
    `user_code`    INTEGER NOT NULL COMMENT '회원코드',
    `regist_date`    DATE NOT NULL COMMENT '등록일',
    `modify_date`    DATE COMMENT '수정일',
    `delete_date`    DATE COMMENT '삭제일',
    `propose_status`    VARCHAR(5) NOT NULL COMMENT '건의사항상태',
 PRIMARY KEY ( `propose_code` ),
 FOREIGN key(user_code) REFERENCES `user`(user_code)
) COMMENT = '건의사항';



DROP TABLE recommend ;

CREATE TABLE `recommend`
(
    `recommend_code`    INTEGER AUTO_INCREMENT NOT NULL COMMENT '추천코드',
    `category_code`    INTEGER NOT NULL COMMENT '카테고리코드',
    `rec_content`    VARCHAR(255) NOT NULL COMMENT '내용',
    `recommend_status`    VARCHAR(5) NOT NULL COMMENT '추천코드상태',
    `regist_date`    DATE NOT NULL COMMENT '등록일',
    `modify_date`    DATE COMMENT '수정일',
    `delete_date`    DATE COMMENT '삭제일',
 PRIMARY KEY ( `recommend_code` ),
 FOREIGN key(category_code) REFERENCES praise_category(category_code)
) COMMENT = '추천문구';



DROP TABLE schedule ;

CREATE TABLE `Schedule`
(
    `Schedule_code`    INTEGER AUTO_INCREMENT NOT NULL COMMENT '일정코드',
    `Schedule_title`    VARCHAR(255) NOT NULL COMMENT '제목',
    `Schedule_date`    DATE NOT NULL COMMENT '날짜',
    `Schedule_content`    VARCHAR(255) NOT NULL COMMENT '내용',
    `user_code`    INTEGER COMMENT '회원코드',
    `Schedule_status`    VARCHAR(5) NOT NULL COMMENT '일정상태',
    `regist_date`    DATE NOT NULL COMMENT '등록일',
    `modify_date`    DATE COMMENT '수정일',
    `delete_date`    DATE COMMENT '삭제일',
 PRIMARY KEY ( `Schedule_code` ),
 FOREIGN key(user_code) REFERENCES user(user_code)
) COMMENT = '일정';

DROP TABLE seat;

CREATE TABLE `Seat`
(
    `Seat_code`    INTEGER NOT NULL AUTO_INCREMENT COMMENT '좌석코드',
    `student_code`    INTEGER NOT NULL COMMENT '학생코드',
    `seat_num`    INTEGER COMMENT '좌석번호',
    `active_status`    VARCHAR(5) NOT NULL COMMENT '활성화상태',
    `regist_date`    DATE NOT NULL COMMENT '등록일',
    `modify_date`    DATE COMMENT '수정일',
    `delete_date`    DATE COMMENT '삭제일',
 PRIMARY KEY ( `Seat_code` ),
 FOREIGN key(student_code) REFERENCES student(student_code)
) COMMENT = '좌석';



DROP TABLE student ;

CREATE TABLE `student`
(
    `student_code`    INTEGER AUTO_INCREMENT NOT NULL COMMENT '학생코드',
    `student_name`    VARCHAR(255) NOT NULL COMMENT '학생이름',
    `user_code`    INTEGER NOT NULL COMMENT '회원코드',
    `student_status`    VARCHAR(5) NOT null COMMENT '등록상태',
    `regist_date`    DATE NOT NULL COMMENT '등록일',
    `modify_date`    DATE COMMENT '수정일',
    `delete_date`    DATE COMMENT '삭제일',
 PRIMARY KEY ( `student_code` ),
 FOREIGN key(user_code) REFERENCES user(user_code)
) COMMENT = '학생';

DROP TABLE USER;
CREATE TABLE `user`
(
    `user_code`    INTEGER  AUTO_INCREMENT NOT NULL COMMENT '회원코드',
    `email`    VARCHAR(255) NOT NULL COMMENT '이메일',
 PRIMARY KEY ( `user_code` )
) COMMENT = '회원';

DROP TABLE user_bell;

CREATE TABLE `user_bell`
(
    `user_code`    INTEGER NOT NULL COMMENT '회원코드',
    `bell_code`    INTEGER NOT NULL COMMENT '종소리코드',
    FOREIGN key(user_code) REFERENCES user(user_code)
) COMMENT = '회원별종소리';



DROP TABLE user_char ;
CREATE TABLE `user_char`
(
    `user_code`    INTEGER NOT NULL COMMENT '회원코드',
    `Character_code`    INTEGER NOT NULL COMMENT '캐릭터코드',
    FOREIGN key(user_code) REFERENCES user(user_code)
) COMMENT = '회원별캐릭터';



DROP TABLE user_info;
CREATE TABLE `user_info`
(
    `user_code`    INTEGER NOT NULL COMMENT '회원코드',
    `school`    VARCHAR(255) NOT NULL COMMENT '학교',
    `grade`    INTEGER NOT NULL COMMENT '학년',
    `class`    INTEGER NOT NULL COMMENT '반',
    `user_status`    VARCHAR(5) NOT NULL COMMENT '회원상태',
    `regist_date`    DATE NOT NULL COMMENT '등록일',
    `modify_date`    DATE COMMENT '수정일',
    `delete_date`    DATE COMMENT '삭제일',
    FOREIGN key(user_code) REFERENCES user(user_code)
) COMMENT = '회원정보';




