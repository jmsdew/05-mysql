/* group by */

SELECT 
	category_code ,
	count(*)          
  FROM tbl_menu 
 GROUP BY category_code ;  -- 대상 값을 하나로 묶어서 출력 (카운트됨)
 
SELECT 
	menu_code,
	category_code
  FROM tbl_menu;
  
 -- sum()
 
 SELECT 
 	category_code ,
 	menu_price	
   FROM tbl_menu ;
 
 SELECT 
 	category_code ,
 	sum(menu_price)
  FROM tbl_menu 
  GROUP BY category_code ;
  
 -- avg() 함수(평균치)
 SELECT 
	category_code ,
 	avg(menu_price)
  FROM tbl_menu
  GROUP BY category_code;
 
 -- 다중열 묶음
 SELECT 
 	category_code ,
 	menu_price ,
 	count(*) 
  FROM tbl_menu 
 GROUP BY category_code , menu_price ;  -- category code 가 같으면서 menu price 가 같은 것들

SELECT * FROM tbl_menu ;

 -- HAVING 그룹에 조건을 걸 때 사용
SELECT 
	category_code
  FROM tbl_menu 
  -- WHERE menu_name = "과메기커틀릿" -- 이렇게도 가능
  WHERE  menu_name NOT IN ('과메기커틀릿')
  GROUP BY category_code 
  HAVING category_code BETWEEN 5 AND 8;  
 
 -- rollup 묶은 그룹의 합계
 SELECT 
 	category_code ,
 	sum(menu_price)
  FROM tbl_menu 
 GROUP BY category_code 
 WITH ROLLUP;




 
 
 
	
 