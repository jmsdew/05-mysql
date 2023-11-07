-- 정렬 기능 알아보기
-- ORDER BY

SELECT 
	*
  FROM TBL_MENU
  ORDER BY MENU_CODE /*정렬 기준*/ DESC /* desc 역순 afc 오름차순(기본값 생략 가능) */;
 
 SELECT 
 	*
  FROM TBL_MENU
  ORDER BY menu_code ASC; /*기본값. 오름차순*/
  
  -- ORDER BY 절을 사용하여 결과 집합을 여러 열로 정리
  
 SELECT 
 	MENU_CODE ,
 	MENU_NAME ,
 	MENU_PRICE 
  FROM TBL_MENU
 ORDER BY
 	MENU_PRICE DESC , -- 가격을 내림차순으로 정리 하는데
 	MENU_CODE ASC;    -- 가격이 같을 시 코드 오름차순으로 정렬 하겠다.
 	
 	
-- 연산 결과로 결과 집합 정렬

 	-- 아래의 결과는 두 번 연산이 진행되는 것으로 판단됨
 	-- 데이터의 값이 증가할 수록 성능이 저하된다.
 SELECT 
	menu_code  ,
	menu_price ,
	menu_code  * menu_price 
  FROM tbl_menu
 ORDER BY
 	menu_price * menu_code;
 
 -- 이렇게 사용하는 것이 좋다.
SELECT 
	menu_code  ,
	menu_price ,
	(menu_code  * menu_price) AS '데이터와 가격을 곱함' -- 여기서 연산된 기준이 정렬됨
  FROM tbl_menu
 ORDER BY
 	'데이터와 가격을 곱함'; -- menu_code * menu_price;  -- 정렬 기준을 지정해 준게 아니라 COLUMN을 그냥 선택한 것
 
 	
SELECT FIELD('A','A','B','C');
SELECT FIELD('B','A','B','C');


SELECT 
	menu_code ,
	menu_name ,
	orderable_status ,
	FIELD(orderable_status, 'N','Y')  -- n는 1 y는 2로 반환
  FROM tbl_menu;
 
 
SELECT
	menu_name ,
	orderable_status
  FROM tbl_menu
 ORDER BY field(orderable_status, 'N','Y') DESC;

-- NULL 정렬
-- 오름차순 시 NULL 처음으로(default)

SELECT 
	category_code ,
	category_name ,
	ref_category_code
  FROM tbl_category
 ORDER BY
 	ref_category_code;

-- 역순으로 정렬 시
-- desc
 SELECT 
	category_code ,
	category_name ,
	ref_category_code
  FROM tbl_category
 ORDER BY
 	ref_category_code DESC;
 
 -- 오름 차순시 마지막으로 정렬
 
  SELECT 
	category_code ,
	category_name ,
	ref_category_code
  FROM tbl_category
 ORDER BY
 	ref_category_code IS null;	
 
  -- 내림 차순시 처음으로 정렬
 
  SELECT 
	category_code ,
	category_name ,
	ref_category_code
  FROM tbl_category
 ORDER BY
 	ref_category_code IS NULL DESC;	
 	
 
 
 