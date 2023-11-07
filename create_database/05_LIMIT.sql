/* LIMIT  */

SELECT 
	menu_code ,
	menu_name ,
	menu_price
  FROM tbl_menu 
  ORDER BY menu_price DESC;
  
 SELECT 
 	menu_code ,
 	menu_name ,
 	menu_price
  FROM tbl_menu 
 ORDER BY menu_code  
 LIMIT 0,4;   -- 범위 지정   앞자리 시작 인덱스 , 뒷자리는 출력할 갯수
 
 SELECT 
 	menu_code ,
 	menu_name ,
 	menu_price
  FROM tbl_menu 
 ORDER BY
 menu_price DESC,
 menu_name ASC
  LIMIT 5;
  
 