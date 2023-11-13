/*Trigger*/

/*
 * 트리거는 사전적 의미로 방아쇠를 당기다라는 뜻을 가지고 있다.
 * mysql 에서 트리거는 테이블에서 어떤 이벤트가 발생했을 때, 실행하고자 하는 
 * 작업들을 자동으로 수행할 수 있도록 미리 설정하는 기능이다.
 * */

-- 트리거와 프로시저를 시작하기전 super 권한을 가진 계정이 필요하다.
-- GRANT super ON *.* TO 'menu'@'%';

-- delimiter
/* 구분자를 정의하는 명령어로 trigger와 proceduer와 같은 것을 정의하게 된다. 
 * 내부에서 프로그램 종료부인 ;를 추가하게 되는데 이 때 정상적으로 동작하지 않는 문제가 발생되어
 * 구분자를 ; 에서 다른 것으로 변경 처리 하고 내부 기능을 정의할 수 있도록 하기 위해서 사용한다.
 * */

/* 행 트리거
 * 테이블 안에 영향을 받는 각각의 행에 대하여 실행된다.
 * old - 변경 전의 데이터로 delete 혹은 update 로 변경되기 전의 데이터를 의미한다.
 * new - 변경 후 데이터로 insert 혹은 update  로 변경된 데이터를 의미한다.
 * 
 * old : insert는 변경 정의 데이터가 아니기 때문에 old를 감지할 수 없다.
 * new : delete 의 경우 변경 후의 값이 존재하기 때문에 new에서 조회할 수 없다.
 * 
 * after : 쿼리 수행 이후
 * before : 쿼리 이벤트 동작 이후
 * 
 * insert : 등록
 * update : 변경
 * delete : 삭제
 * 
 */

delimiter $$
CREATE TRIGGER t_order_menu -- <- 트리거의 이름
AFTER INSERT ON tbl_order -- {after | before, insert | update | delete}  -- 동작 시점
FOR EACH ROW
BEGIN
	INSERT INTO tbl_order_menu (order_code, menu_code, order_amount)
	VALUES (NEW.order_code, 2, 10000);
END; $$
delimiter ;

SHOW TRIGGERS;

-- 테이블에 날짜를 넣기 위해서 변경함
/*
ALTER TABLE tbl_order 
MODIFY COLUMN order_date date;

ALTER TABLE tbl_order 
MODIFY COLUMN order_time datetime;
*/

SELECT * FROM tbl_order ;
INSERT INTO tbl_order
VALUES (NULL, current_date(), current_time(), 10000);

SELECT * FROM tbl_order_menu;

-- 트리거 삭제
DROP TRIGGER IF EXISTS t_order_menu;

 