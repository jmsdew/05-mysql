/* SET OPERATORS */

/*
 * UNION */

SELECT 
	  menu_code 
	, menu_name 
	, menu_price 
	, category_code 
	, orderable_status 
  FROM tbl_menu 
  WHERE category_code =10
  UNION   -- 중복을 제거하고 결과를 합쳐서 보여줌
SELECT
	  menu_code  
	, menu_name 
	, menu_price 
	, category_code 
	, orderable_status 
  FROM tbl_menu 
  WHERE menu_price <9000;
	
-- union all	 
 
 SELECT 
	  menu_code 
	, menu_name 
	, menu_price 
	, category_code 
	, orderable_status 
  FROM tbl_menu 
  WHERE category_code =10
  UNION ALL  -- 중복을 제거하지 않고 결과를 합쳐서 보여줌
SELECT
	  menu_code  
	, menu_name 
	, menu_price 
	, category_code 
	, orderable_status 
  FROM tbl_menu 
  WHERE menu_price <9000;
 
 
 -- INNER JOIN에 sub query 이용하기
 
 
 
 
 
 
	
	 