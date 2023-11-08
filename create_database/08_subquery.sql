/* 서브쿼리 */

SELECT   -- 메인쿼리
	menu_code ,
	menu_price ,
	menu_name ,
	category_code ,
	orderable_status
  FROM tbl_menu 
  WHERE category_code = (
  	SELECT -- 서브쿼리
 		category_code
 	FROM tbl_menu
 	WHERE menu_name = '민트미역국');
  
 
 -- 가장 많은 메뉴가 포함된 카테고리
 -- 서브쿼리
 SELECT 
 	category_code ,
 	count(*)
 	FROM tbl_menu 
 	GROUP BY category_code ;
 	
 -- 
 SELECT max(menu_price) FROM tbl_menu ;  -- 제일 큰 값 호출
 
 SELECT 
 	max(count)
  FROM (
 	SELECT
 		count(*) AS 'count'   -- 컬럼을 대상으로 쓰려면 별칭 지정을 해야함
 	  FROM tbl_menu  
 	 GROUP BY category_code
 	 ) AS countMenu; -- 가상의 테이블 (뷰) 를 생성하면 별칭을 붙여야 함 from() 안에 생성
  
 -- 카테고리 평균 가격보다 높은 가격의 메뉴 조회
 SELECT	
 	menu_code ,
 	menu_name ,
 	menu_price ,
 	category_code ,
 	orderable_status
  FROM tbl_menu a
 WHERE menu_price > (
 			SELECT 
 				avg(menu_price)
 			  FROM tbl_menu 
 			 );
 	
 	
SELECT 
	category_code
  FROM tbl_category a
 WHERE TRUE;
 	
 	
 	
 	 
 
 