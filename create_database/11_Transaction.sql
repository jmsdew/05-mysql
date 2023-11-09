/* Transaction */

/*commit
 * 트랜잭션 처리에 사용되는 sql 명령문 중 하나로
 * 트랜잭션은 데이터베이스 작업의 논리적인 단위를 나타내며
 * 여러 sql 문을 하나의 트랜잭션으로 그룹화 할 수 있으며, 데이터베이스의 일관성을 유지하고
 * 데이터 무결성을 보장하기 위해서 중요한 내용이다.
 * 
 * 
 * RollBack 이란
 * mysql 에서 트랜잭션 처리에 사용되는 sql 명령문 중 하나로 트랜잭션은
 * 데이터베이스의 작업의 논리적인 단위를 나타내며, 여러 sql 문을 하나의 트랜잭션으로
 * 그룹화 할 수 있다. RollBack을 사용하면 트랜잭션 내에서 수행한 변경 사항을 취소하고
 * 이전 상태로 되돌릴 수 있다.
 * 
 * */


-- autocommit을 활성화 시킴
SET autocommit = 1;

-- autocommit 활성화시킴 위랑 같음
SET autocommit = ON;

-- autocommit 비활성화시킴
SET autocommit = off;

-- @Transaction;
-- 데이터베이스의 상태를 변화 시킬수 있는 일련의 행위의 묶음
START TRANSACTION; -- 작업을 하나의 단위로 묶는다. rollback이나 COMMIT을 만나면 끝
SELECT * FROM tbl_menu;
INSERT INTO tbl_menu  VALUES (NULL, '바나나해장국', 8500, 4, 'Y');
UPDATE tbl_menu SET menu_name = "수정된 메뉴" WHERE menu_code = 5;
DELETE FROM tbl_menu WHERE menu_code = 7;

SELECT * FROM tbl_menu;

ROLLBACK;

SELECT * FROM tbl_menu ;



