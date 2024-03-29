/* comstraints */

/*
 * 제약조건
 * 테이블 작성 시 각 칼럼에 값 기록에 대한 제약조건을 설정할 수 있다.
 * 데이터 무결성 보장을 목적으로 한다.
 * 입력/수정하는 데이터에 문제가 없는지 자동으로 검사해 주게 하기 위한 목적이다.
 * primary key, not null, unique, check, foreign key
 * 
 * */

-- not null
-- null 값을 허용하지 않는다.
DROP TABLE IF EXISTS user_notnull;
CREATE TABLE IF NOT EXISTS user_notnull(
		user_no int NOT NULL,
		user_id varchar(255) NOT NULL,
		user_pwd varchar(255) NOT NULL,
		user_name varchar(255) NOT NULL,
		gender varchar(3),
		phone varchar(255) NOT NULL,
		email varchar(255)
)ENGINE=unnodb;

INSERT INTO user_notnull
	(user_no, user_id, user_pwd, user_name, gender, phone, email)
 VALUES
  (1,'user01', 'pass01', '홍길동', '남', '010-2322-2322', 'hong12@gmail.com'),
  (2,'user02', 'pass02', '김길동', '여', '010-2322-2322', 'kim12@gmail.com'),
  (3,'user03', 'pass03', '고길동', '남', '010-2322-2322', 'ko12@gmail.com');
  
 SELECT * FROM user_notnull;
 
-- not null 제약 조건은 null을 허용하지 않기 때문에 아래의 경우 오류가 발생된다.
-- 값을 넣어주거나 기본 값 설정을 해주어야 한다.
INSERT INTO user_notnull
	(user_no, user_id, user_pwd, user_name, gender, phone)
 VALUES
  (4,'user03', 'pass03', '고길동', '남', '010-2322-2322');

 
 /*유니크 제약조건*/
 -- unique 제약조건은 중복되는 값을 허용하지 않는 제약조건이다.
DROP TABLE IF EXISTS USER_unique;

CREATE TABLE IF not EXISTS user_unique(
		user_no int NOT NULL UNIQUE ,  -- 유일한 값을 가지는 제약조건
		user_id varchar(255) NOT NULL,
		user_pwd varchar(255) NOT NULL,
		user_name varchar(255) NOT NULL,
		gender varchar(3),
		phone varchar(255) NOT NULL,
		email varchar(255),
		unique(phone) -- 유일한 값을 가지는 제약조건
)ENGINE=unnodb;

INSERT INTO user_unique
	(user_no, user_id, user_pwd, user_name, gender, phone, email)
 VALUES
  (1,'user01', 'pass01', '홍길동', '남', '010-2322-2321', 'hong12@gmail.com'),
  (2,'user02', 'pass02', '김길동', '여', '010-2322-2322', 'kim12@gmail.com'),
  (3,'user03', 'pass03', '고길동', '남', '010-2322-2323', 'ko12@gmail.com');
  


 
 SELECT * FROM user_unique;
 

CREATE TABLE IF not EXISTS user_unique_test(
		user_no int NOT NULL UNIQUE ,  
		user_id varchar(255) NOT NULL,
		user_pwd varchar(255) NOT NULL,
		user_name varchar(255) NOT NULL,
		gender varchar(3),
		phone varchar(255),
		email varchar(255),
		unique(phone)
)ENGINE=innodb;

-- 아래의 경우 null을 값으로 인식하지 않기 때문에 unique 제약조건에 위배되지 않는다.
INSERT INTO user_unique_test
	(user_no, user_id, user_pwd, user_name, gender, phone, email)
 VALUES
  (1,'user01', 'pass01', '홍길동', '남', NULL , 'hong12@gmail.com'),
  (2,'user02', 'pass02', '김길동', '여', NULL , 'kim12@gmail.com'),
  (3,'user03', 'pass03', '고길동', '남', NULL , 'ko12@gmail.com');
 -- null은 비어있기에 중복이 아님 
 
 -- 값을 넣어주는 과정에서 중복되는 값을 넣으면 에러가 발생된다.
 UPDATE user_unique_test 
 	SET phone = '123456'
  WHERE user_no in(1,2,3);	
 SELECT * FROM user_unique_test;



/* primary key */
/* 테이블에서 한 행의 정볼르 찾기 위해 사용 할 컬럼을 의미한다.
 * 테이블에 대한 식별자 역할을 한다.(한 행씩 구분하는 역할)
 * not_null + unique 제약조건을 의미
 * 한 테이블 당 한 개만 설정할 수 있다.
 * 컬럼 레벨, 테이블 레벨 둘 다 설정 가능하다.
 * 한 개의 칼럼에 설정할 수 있으며, 여러 개의 컬럼을 묶어서 설정하는 것도 가능하다(복합키)
 * */
DROP TABLE IF EXISTS user_primarykey;

CREATE TABLE IF not EXISTS user_primarykey(
		user_no int ,  
		user_id varchar(255) NOT NULL,
		user_pwd varchar(255) NOT NULL,
		user_name varchar(255) NOT NULL,
		gender varchar(3),
		phone varchar(255),
		email varchar(255),
		PRIMARY key(user_no)
)ENGINE=innodb;

SELECT * FROM user_primarykey;

INSERT INTO user_primarykey
	(user_no, user_id, user_pwd, user_name, gender, phone, email)
 VALUES
  (1,'user01', 'pass01', '홍길동', '남', NULL , 'hong12@gmail.com'),
  (2,'user02', 'pass02', '김길동', '여', NULL , 'kim12@gmail.com'),
  (3,'user03', 'pass03', '고길동', '남', NULL , 'ko12@gmail.com');
 
 -- primary key는 unique 제약조건으로 인해 중복되는 값을 허용하지 않는다.
INSERT INTO user_primarykey
	(user_no, user_id, user_pwd, user_name, gender, phone, email)
 VALUES
  (1,'user01', 'pass01', '홍길동', '남', NULL , 'hong12@gmail.com');

 UPDATE user_primarykey   -- 없는 값은 변경 가능
 	SET user_no = 2
  WHERE user_no = 1;	

  -- not null 제약조건으로 인해 null 값을 허용하지 않는다.
INSERT INTO user_primarykey
	(user_no, user_id, user_pwd, user_name, gender, phone, email)
 VALUES
  (null,'user01', 'pass01', '홍길동', '남', NULL , 'hong12@gmail.com');
 
 
 -- foreign key
 -- 참조 (REFERENCES)된 다른 테이블에서 제공하는 값만 사용할 수 있다.
 -- 참조 무결성을 위배하지 않기 위해서 사용
 -- foreign key 제약조건에 의해서
 -- 테이블 간의 관계(RELAYTIONSHIP)가 형성됨
 -- 제공되는 값 외에는 null을 사용할 수 있음
 
 DROP TABLE IF EXISTS user_grade;

CREATE TABLE IF NOT EXISTS user_grade(
		grade_code int NOT NULL UNIQUE ,
		grade_name varchar(255) NOT NULL
)ENGINE = innodb;

INSERT INTO user_grade
VALUES
(10, '일반회원'),
(20, '우수회원'),
(30, '특별회원');
INSERT INTO user_grade
VALUES
(50, '테스트회원');
 
DROP TABLE IF EXISTS USER_foreignkey1;
CREATE TABLE IF not EXISTS USER_foreignkey1(
		user_no int PRIMARY key,  
		user_id varchar(255) NOT NULL,
		user_pwd varchar(255) NOT NULL,
		user_name varchar(255) NOT NULL,
		gender varchar(3),
		phone varchar(255)NOT NULL ,
		email varchar(255),
		grade_code int ,
		foreign KEY (grade_code) -- 포린키 레퍼런시스 한 묶음 포린키를 걸면 CHECK 제약조건에 걸리는 상태로 만듦. 
			REFERENCES user_grade (grade_code)   --  check(grade_code in 10,20,30)
)ENGINE=innodb; 

INSERT INTO USER_foreignkey1
	(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
	(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 10),
	(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com', 20);
 
SELECT * FROM USER_foreignkey1;

-- 아래의 grade_code 는 user_grade의 grade_code를 참조하고 있는데
-- user_grade의 grade_code를 확인해보면 50의 값이 존재하지 않기 때문에 에러가 발생된다.
-- 에러를 피하기 위해서는 user_grade의 grade_code에 50의 값을 추가 해야한다.
 INSERT INTO USER_foreignkey1
	(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
	(3, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 50);

 
 DROP TABLE IF EXISTS USER_foreignkey2;

CREATE TABLE IF not EXISTS USER_foreignkey2(
		user_no int PRIMARY key,  
		user_id varchar(255) NOT NULL,
		user_pwd varchar(255) NOT NULL,
		user_name varchar(255) NOT NULL,
		gender varchar(3),
		phone varchar(255),
		email varchar(255),
		grade_code int ,
		foreign KEY (grade_code) 
			REFERENCES user_grade (grade_code)  
			ON UPDATE SET NULL -- 참조한 컬럼이 바뀌면 null로
			ON DELETE SET NULL -- 참조한 컬럼이 삭제되면 null로
)ENGINE=innodb;

INSERT INTO USER_foreignkey2
	(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
	(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 10),
	(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com', 20);
 

-- 부모 테이블의 grade_code 수정
DROP TABLE IF EXISTS USER_foreignkey1;

-- on update set null 옵션으로 인해 부모의 값을 수정하면 자식의 값은 null로 바뀐다.
UPDATE user_grade 
   SET grade_code = NULL
 WHERE grade_code = 10;


ALTER TABLE user_grade 
MODIFY grade_code int;

DESCRIBE user_grade;

SELECT * FROM user_grade;

SELECT * FROM user_foreignkey2;

-- on delete set null 옵션으로 인해 부모의 값을 삭제하면 자식의 값은 null로 바뀐다.
DELETE FROM user_grade 
 WHERE grade_code = 20;


-- check 제약 조건 위반시 허용되지 않음
DROP TABLE IF EXISTS user_check;
CREATE TABLE IF NOT EXISTS user_check(
	user_no int AUTO_INCREMENT PRIMARY KEY , 
	user_name varchar(255) NOT NULL ,
	gender varchar(3) check(gender IN ('남', '여')) ,
	age int check(age >=19)
)ENGINE= innodb;

SELECT * FROM user_check;

INSERT INTO user_check
VALUES
	(NULL, '홍길동', '남', 25),
	(NULL, '신사임당', '여', 33);

SELECT * FROM user_check;

INSERT INTO user_check 
VALUES
	(NULL, '안중근','남', 27);
-- age 의 check 제약조건을 확인하면 age>=19 로 설정이 되어 있기 때문에 오류가 발생됨.
INSERT INTO user_check 
VALUES
	(NULL, '유관순','여', 17);


/* DEFAULT */
/* 컬럼에 null 대신 기본 값을 적용
 * 컬럼 타입이 date 일 시 current_date 만 가능
 * 컬럼 타입이 dateTime 일 시 current_time 과 current_timestamp , now() 모두 가능 * */

DROP TABLE IF EXISTS tbl_country;
CREATE TABLE IF NOT EXISTS tbl_country(  
	country_code INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(255) DEFAULT '한국',
    population VARCHAR(255) DEFAULT '0명',
    add_day DATE DEFAULT (current_date),
    add_time DATETIME DEFAULT (current_time)
)ENGINE = innodb;

SELECT * FROM tbl_country;

INSERT INTO tbl_country 
VALUES
	(NULL,DEFAULT,DEFAULT,DEFAULT,DEFAULT);

SELECT *FROM TBL_COUNTRY;

INSERT INTO tbl_country 
	(country_code)   -- DEFAULT 생략 가능
VALUES (NULL);
	


