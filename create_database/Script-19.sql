DROP TABLE IF EXISTS admin;

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
        SELECT
        schedule_title,
        schedule_date,
        last_date
        FROM schedule
        where user_code = 1
         AND schedule_date = current_date();
        
        INSERT INTO RECOMMEND
        VALUES (
            NULL,
            10,
            '실패를 두려워하지 않고 도전하는 모습을 보이며, 끈기와 인내력을 발휘하여 목표 달성을 위해 노력하는 모습을 보임
',
            'Y',
            NOW(),
            NULL,
            NULL
        )
        
SELECT 
	schedule_title,
	schedule_date,
	last_date
  FROM schedule; 
 DELETE FROM user_info WHERE user_code =1;

DELETE FROM student WHERE student_code =98;

SELECT
	a.student_name,
	sum(b.score) AS score
  FROM student a
  JOIN praise b ON (a.student_code = b.student_code)
  JOIN praise_category C ON (B.CATEGORY_CODE = C.CATEGORY_CODE)
 WHERE C.category_name = "배려"
 GROUP BY a.student_name
 ORDER BY score DESC
 LIMIT 10;

SELECT
	B.student_name ,
	A.score ,
	A.praise_context ,
	A.praise_date 
  FROM praise A
  JOIN student B ON (A.student_code = B.student_code)
  JOIN praise_category C ON (A.category_code = C.category_code)
  WHERE B.student_name = "정민식"
  AND C.category_name = "배려";

CREATE TABLE IF NOT EXISTS admin
(
    admin_code    INT AUTO_INCREMENT COMMENT '관리자코드',
    admin_id    VARCHAR(255) NOT NULL COMMENT '관리자아이디',
    admin_pwd    VARCHAR(255) NOT NULL COMMENT '관리자비밀번호',
    PRIMARY KEY (admin_code)
) ENGINE=INNODB COMMENT '관리자';

DROP TABLE IF EXISTS user;

CREATE TABLE IF NOT EXISTS user
(
    user_code    INT AUTO_INCREMENT COMMENT '회원코드',
    email    VARCHAR(255) NOT NULL COMMENT '이메일',
    PRIMARY KEY (user_code)
) ENGINE=INNODB COMMENT = '회원';

DROP TABLE IF EXISTS student;

CREATE TABLE IF NOT EXISTS student
(
    student_code    INT AUTO_INCREMENT COMMENT '학생코드',
    student_name    VARCHAR(255) NOT NULL COMMENT '학생이름',
    user_code    INT NOT NULL COMMENT '회원코드',
    student_status    VARCHAR(1) NOT NULL COMMENT '등록상태',
    regist_date    DATE NOT NULL COMMENT '등록일',
    modify_date    DATE COMMENT '수정일',
    delete_date    DATE COMMENT '삭제일',
    PRIMARY KEY (student_code),
    FOREIGN KEY (user_code) REFERENCES user (user_code)
) ENGINE=INNODB COMMENT = '학생';

DROP TABLE IF EXISTS attend;

CREATE TABLE IF NOT EXISTS attend
(
   attend_code    INT AUTO_INCREMENT COMMENT '출결관리코드',
    student_code    INT NOT NULL COMMENT '학생코드',
    attend_kind    VARCHAR(255) NOT NULL COMMENT '출결종류',
    regist_date    DATE NOT NULL COMMENT '등록일',
    reason    VARCHAR(255) NOT NULL COMMENT '사유',
    attend_status    VARCHAR(1) NOT NULL COMMENT '출결상태',
    leave_time    DATETIME COMMENT '조퇴시간',
    modify_date    DATE COMMENT '수정일',
    delete_date    DATE COMMENT '삭제일',
    PRIMARY KEY (attend_code),
    FOREIGN KEY (student_code) REFERENCES student (student_code)
) ENGINE=INNODB COMMENT = '출결관리';

DROP TABLE IF EXISTS attend_change;

CREATE TABLE IF NOT EXISTS attend_change
(
   attend_code    INT NOT NULL COMMENT '출결관리코드',
    modify_date    DATE NOT NULL COMMENT '수정일',
    reason    VARCHAR(255) NOT NULL COMMENT '사유',
    FOREIGN KEY (attend_code) REFERENCES attend (attend_code)
) ENGINE=INNODB COMMENT = '출결수정';

DROP TABLE IF EXISTS bell;

CREATE TABLE IF NOT EXISTS bell
(
    bell_code    INT AUTO_INCREMENT COMMENT '종소리코드',
    bell_file    VARCHAR(255) NOT NULL COMMENT '종소리파일',
    PRIMARY KEY ( bell_code )
) ENGINE=INNODB COMMENT = '종소리';

DROP TABLE IF EXISTS `character`;

CREATE TABLE IF NOT EXISTS `character`
(
    character_code    INT AUTO_INCREMENT COMMENT '캐릭터코드',
    character_file    VARCHAR(255) NOT NULL COMMENT '캐릭터파일',
    PRIMARY KEY (character_code)
) ENGINE=INNODB COMMENT = '캐릭터';

DROP TABLE IF EXISTS propose;

CREATE TABLE IF NOT EXISTS propose
(
    propose_code    INT AUTO_INCREMENT COMMENT '건의사항코드',
    propose_name    VARCHAR(255) NOT NULL COMMENT '건의사항제목',
    propose_content    VARCHAR(255) NOT NULL COMMENT '건의사항내용',
    user_code    INT NOT NULL COMMENT '회원코드',
    regist_date    DATE NOT NULL COMMENT '등록일',
    modify_date    DATE COMMENT '수정일',
    delete_date    DATE COMMENT '삭제일',
    propose_status    VARCHAR(1) NOT NULL COMMENT '건의사항상태',
    PRIMARY KEY (propose_code),
    FOREIGN KEY (user_code) REFERENCES user (user_code)
) ENGINE=INNODB COMMENT = '건의사항';

DROP TABLE IF EXISTS comment;

CREATE TABLE IF NOT EXISTS comment
(
    comment_code    INT AUTO_INCREMENT COMMENT '댓글코드',
    comment_auth    VARCHAR(255) NOT NULL COMMENT '댓글내용',
    admin_code    INT NOT NULL COMMENT '관리자코드',
    propose_code    INT NOT NULL COMMENT '건의사항코드',
    PRIMARY KEY (comment_code),
    FOREIGN KEY (admin_code) REFERENCES admin (admin_code),
    FOREIGN KEY (propose_code) REFERENCES propose (propose_code)
) ENGINE=INNODB COMMENT = '댓글';

DROP TABLE IF EXISTS notice;

CREATE TABLE IF NOT EXISTS notice
(
    notice_code    INT AUTO_INCREMENT COMMENT '공지사항코드',
    notice_name    VARCHAR(255) NOT NULL COMMENT '공지사항이름',
    notice_content    VARCHAR(255) NOT NULL COMMENT '공지사항내용',
    admin_code    INT NOT NULL COMMENT '관리자코드',
    regist_date    DATE NOT NULL COMMENT '등록일',
    modify_date    DATE COMMENT '수정일',
    delete_date    DATE COMMENT '삭제일',
    notice_status    VARCHAR(1) NOT NULL COMMENT '공지사항상태',
    PRIMARY KEY (notice_code),
    FOREIGN KEY (admin_code) REFERENCES admin (admin_code)
) ENGINE=INNODB COMMENT = '공지사항';

DROP TABLE IF EXISTS praise_category;

CREATE TABLE IF NOT EXISTS praise_category
(
    category_code    INT AUTO_INCREMENT COMMENT '카테고리코드',
    category_name    VARCHAR(255) NOT NULL COMMENT '카테고리이름',
    PRIMARY KEY (category_code)
) ENGINE=INNODB COMMENT = '칭찬카테고리';

DROP TABLE IF EXISTS praise;

CREATE TABLE IF NOT EXISTS praise
(
    praise_code    INT AUTO_INCREMENT COMMENT '칭찬코드',
    category_code    INT NOT NULL COMMENT '카테고리코드',
    praise_context    VARCHAR(255) NOT NULL COMMENT '칭찬내용',
    score    INT NOT NULL COMMENT '점수',
    student_code    INT NOT NULL COMMENT '학생코드',
    praise_date    DATE NOT NULL COMMENT '날짜',
    praise_status    VARCHAR(1) NOT NULL COMMENT '칭찬상태',
    regist_date    DATE NOT NULL COMMENT '등록일',
    modify_date    DATE COMMENT '수정일',
    delete_date    DATE COMMENT '삭제일',
    PRIMARY KEY (praise_code),
    FOREIGN KEY (category_code) REFERENCES praise_category (category_code),
    FOREIGN KEY (student_code) REFERENCES student (student_code)
) ENGINE=INNODB COMMENT = '칭찬';

DROP TABLE IF EXISTS recommend;

CREATE TABLE IF NOT EXISTS recommend
(
    recommend_code    INT AUTO_INCREMENT COMMENT '추천코드',
    category_code    INT NOT NULL COMMENT '카테고리코드',
    rec_content    VARCHAR(255) NOT NULL COMMENT '내용',
    `recommend_status` VARCHAR(1) NOT NULL COMMENT '추천코드상태',
    regist_date    DATE NOT NULL COMMENT '등록일',
    modify_date    DATE COMMENT '수정일',
    delete_date    DATE COMMENT '삭제일',
    PRIMARY KEY (recommend_code),
    FOREIGN KEY (category_code) REFERENCES praise_category (category_code)
) ENGINE=INNODB COMMENT = '추천문구';

DROP TABLE IF EXISTS schedule;

CREATE TABLE IF NOT EXISTS schedule
(
    schedule_code    INT AUTO_INCREMENT COMMENT '일정코드',
    schedule_title    VARCHAR(255) NOT NULL COMMENT '제목',
    schedule_date    DATE NOT NULL COMMENT '날짜',
    last_date date comment '끝나는날짜',
    user_code    INT NOT NULL COMMENT '회원코드',
    schedule_status    VARCHAR(1) NOT NULL COMMENT '일정상태',
    schedule_color varchar(255) comment '색깔',
    regist_date    DATE NOT NULL COMMENT '등록일',
    modify_date    DATE COMMENT '수정일',
    delete_date    DATE COMMENT '삭제일',
    PRIMARY KEY (schedule_code),
    FOREIGN KEY (user_code) REFERENCES user (user_code)
) ENGINE=INNODB COMMENT = '일정';

DROP TABLE IF EXISTS seat;

CREATE TABLE IF NOT EXISTS seat
(
    seat_code    INT AUTO_INCREMENT COMMENT '좌석코드',
    student_code    INT NOT NULL COMMENT '학생코드',
    seat_num    INTEGER COMMENT '좌석번호',
    active_status    VARCHAR(1) NOT NULL COMMENT '활성화상태',
    regist_date    DATE NOT NULL COMMENT '등록일',
    modify_date    DATE COMMENT '수정일',
    delete_date    DATE COMMENT '삭제일',
    PRIMARY KEY (seat_code),
    FOREIGN KEY (student_code) REFERENCES student (student_code)
) ENGINE=INNODB COMMENT = '좌석';

DROP TABLE IF EXISTS user_bell;

CREATE TABLE IF NOT EXISTS user_bell
(
    user_code    INT NOT NULL COMMENT '회원코드',
    bell_code    INT NOT NULL COMMENT '종소리코드',
    FOREIGN KEY (user_code) REFERENCES user (user_code),
    FOREIGN KEY (bell_code) REFERENCES bell (bell_code)
) ENGINE=INNODB COMMENT = '회원별종소리';

DROP TABLE IF EXISTS user_char;

CREATE TABLE IF NOT EXISTS user_char
(
    user_code    INTEGER NOT NULL COMMENT '회원코드',
    character_code    INTEGER NOT NULL COMMENT '캐릭터코드',
    FOREIGN KEY (user_code) REFERENCES user (user_code),
    FOREIGN KEY (character_code) REFERENCES `character` (character_code)
) ENGINE=INNODB COMMENT = '회원별캐릭터';

DROP TABLE IF EXISTS user_info;

CREATE TABLE IF NOT EXISTS user_info
(
    user_code    INT NOT NULL COMMENT '회원코드',
    school    VARCHAR(255) NOT NULL COMMENT '학교',
    grade    INT NOT NULL COMMENT '학년',
    class    INT NOT NULL COMMENT '반',
    user_status    VARCHAR(1) NOT NULL COMMENT '회원상태',
    regist_date    DATE NOT NULL COMMENT '등록일',
    modify_date    DATE COMMENT '수정일',
    delete_date    DATE COMMENT '삭제일',
    FOREIGN KEY (user_code) REFERENCES user (user_code)
) ENGINE=INNODB COMMENT = '회원정보';