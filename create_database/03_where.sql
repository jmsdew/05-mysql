/* where */

-- 값이 같은 걸 조회
SELECT
	menu_code ,
	menu_name ,
	menu_price ,
	orderable_status
  FROM tbl_menu
 WHERE orderable_status = 'y';  
 
 SELECT 
 	menu_name ,
 	menu_price ,
 	orderable_status
   FROM tbl_menu
 WHERE menu_price >= 13000;  

-- 같지 않은 상태를 조회하는 방법
 SELECT 
 	menu_name ,
 	menu_price ,
 	orderable_status
   FROM tbl_menu
 WHERE orderable_status != 'y';  -- orderable_status <> 'y'; 도 같은 부정의 의미   
 		
 
 -- 가격이 20000원 이상인 메뉴를 조회
 -- 코드, 이름, 가격을 보여주고 코드를 기준으로 내림차순
  
 
 SELECT 
 	menu_code ,
 	menu_name ,
 	menu_price                 -- 3
  FROM tbl_menu                -- 동작흐름 1
  WHERE menu_price >= 20000    -- 2 
  ORDER BY menu_code DESC;     -- 4      -- ORDER BY 가 제일 나중에 실행 where보다 위에 오면 에러
  
  
-- 가격이 5천원 이상이면서 판매중인 제품을 조회   where 이 여러개면 and
  
 SELECT 
 	menu_code ,
 	menu_name ,
 	menu_price ,
 	orderable_status
   FROM tbl_menu
  WHERE menu_price >= 5000 
 	AND orderable_status = 'y';
  
 -- 제품이 판매 중이거나 또는 category_code가 10인 목록 조회
 -- 코드, 이름, 가격, 카테고리 코드, 상태
 
 SELECT 
 	menu_code ,
 	menu_name ,
 	menu_price ,
 	category_code ,
 	orderable_status
  FROM tbl_menu
 WHERE orderable_status = 'y' 
    OR category_code = 10;
 
 
 SELECT 
 	menu_code ,
 	menu_name ,
 	menu_price,
 	category_code ,
 	orderable_status
  FROM tbl_menu
 WHERE category_code = 4 
 	OR menu_price = 9000
   AND menu_code > 10;
  
  -- 범위를 조회하는 경우
  
 SELECT 
 	menu_code ,
 	menu_name ,
 	menu_price ,
 	category_code ,
 	orderable_status
  FROM tbl_menu
 WHERE menu_price >= 10000
   AND menu_price <= 25000
 ORDER BY menu_price;
 

SELECT 
	menu_name ,
	menu_price ,
	category_code
  FROM tbl_menu
 WHERE menu_price BETWEEN  10000 and 25000;       -- BETWEEN 범위 연산자 10000~25000 사이

 -- 범위에 해당하지 않는 목록 조회
 SELECT 
 	menu_name ,
 	menu_price ,
 	category_code
   FROM tbl_menu
  WHERE menu_price NOT BETWEEN 10000 AND 25000
  ORDER BY menu_price DESC;
 
 
 -- 검색어가 ( 값이 ) 포함되어 있는지 확인하는 방법
 SELECT 
 	menu_name ,
 	menu_price ,
 	category_code
  FROM tbl_menu
 WHERE menu_name LIKE '%마늘%'        --  %로 구분함
 ORDER BY menu_name;
 
-- 가격이 5000원 이상이고 카테고리 코드가 10번 인 녀석 중 갈치라는 이름이 포함된 메뉴를 조회해주세요
-- 코드 , 네임, 카테고리, 가격
SELECT 
	menu_code ,
	menu_name ,
	category_code ,
	menu_price
  FROM tbl_menu
 WHERE menu_price >= 5000 
   AND category_code = 10 
   AND menu_name LIKE '%갈치%';
 
  
  -- like의 부정문을 알아본다.

 SELECT 
	menu_code ,
	menu_name ,
	category_code ,
	menu_price
  FROM tbl_menu
 WHERE menu_price >= 5000 
   AND category_code = 10 
   AND menu_name NOT LIKE '%갈치%';
 
  SELECT * FROM tbl_category;
  
 -- 카테고리 코드 한식(4) 중식(5) 일식(6) 메뉴 조회
 
 SELECT 
 	menu_name ,
 	category_code
  FROM tbl_menu 
 WHERE category_code = 5
 	OR category_code = 6
 	OR category_code = 4;
 
 -- in() 
  
 SELECT 
 	menu_name ,
 	category_code
  FROM tbl_menu 
 WHERE category_code IN (4,5,6);

-- 포함되지 않은 값을 조회
  SELECT 
 	menu_name ,
 	category_code
  FROM tbl_menu 
 WHERE category_code NOT IN (4,5,6);


-- null 을 조회
SELECT 
	category_code ,
	category_name ,
	ref_category_code
  FROM tbl_category 
 WHERE ref_category_code IS NULL;  -- 값이 비어있는 것 출력 null을 값으로 치지 않음

 -- null이 아닌 목록 조회
SELECT 
	category_code ,
	category_name ,
	ref_category_code
  FROM tbl_category
 WHERE ref_category_code IS NOT NULL; 
  