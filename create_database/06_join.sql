/* join */


-- inner join
-- on은 테이블간의 연결할 조건을 의미한다.
-- where은 조회된 결과에서 필터링할 조건이다.
SELECT 
	a.menu_name,
	b.category_name
  FROM tbl_menu a
  JOIN tbl_category b ON (a.category_code = b.category_code);
  -- join 에는 테이블의 이름을 지정 해야함
 
 -- right join
 
 SELECT 
 	a.menu_name ,
 	b.category_name
  FROM tbl_menu a
  RIGHT JOIN tbl_category b ON (a.category_code = b.category_code);  -- 오른쪽 category_code 다 불러냄
  
 
 -- cross join
 SELECT
 	a.menu_name ,
 	b.category_name
  FROM tbl_menu a
  CROSS JOIN tbl_category b;
  
 
SELECT 
	a.menu_name ,
	b.category_name
  FROM tbl_menu a
  RIGHT JOIN tbl_category b ON (a.category_code = b.category_code)
 
 