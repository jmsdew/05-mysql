select MENU_NAME from TBL_MENU; 

SELECT -- 선택하다   동작 순서 2
	menu_code ,  
	menu_name , 
	menu_price 
  FROM tbl_menu;      -- 어느곳에서 (테이블) 동작 순서 1
  
-- CODE, 이름, 가격, STATUS(상태) , 카테고리를 조회 해주세요
  
  -- 포매티을 통해 보기 좋은 형태로 출력함
  SELECT 
  	 menu_code ,
  	 menu_name ,
  	 menu_price ,
  	 orderable_status ,
  	 category_code 
  FROM tbl_menu;
  
 SELECT 
 	*  -- 모든 케이스 조회하기. 하지만 쓰지 않는 것이 좋음
  FROM TBL_MENU;
  
 -- 연산을 바로 실행함
 SELECT 6 +3;
 
SELECT 6 *3;

-- 내장 함수를 사용함
SELECT NOW();  -- 현재 날짜 및 시간

SELECT CONCAT('홍',' ','길동'); -- 가상의 테이블에 column을 생성해 명령어를 수행함

SELECT CONCAT('홍',' ','길동') as 'NAME'; -- 별칭을 만들어 줌  ('홍',' ','길동' 이렇게 불러오기 불편하기 때문에 별칭을 만들어서 불러줌)


