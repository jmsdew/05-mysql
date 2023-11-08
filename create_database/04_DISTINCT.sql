-- DISTINCT

-- 중복되는 값을 제거한다.
SELECT 
	category_code
  FROM tbl_menu
 ORDER BY category_code;
 
SELECT 
	DISTINCT category_code
  FROM tbl_menu
 ORDER BY category_code;
 

-- NULL값을 포함한 열의 DISTINCT
SELECT 
	ref_category_code
  FROM tbl_category;
  
 SELECT 
	DISTINCT ref_category_code
  FROM tbl_category;
  
 -- 열이 여러개인 값의 중복 제거
 
 SELECT DISTINCT 
 	category_code ,
 	orderable_status 
  FROM tbl_menu
 ORDER BY category_code;
 
-- 성분으로 구분한 아이스크림 총 주문량
 SELECT
 	category_code ,
 	orderable_status 
  FROM tbl_menu
 ORDER BY category_code;
 
-- 진료과별 총 예약 횟수 출력하기
SELECT
    MCDP_CD as `진료과코드`,
    count(*) as 5월예약건수

  from APPOINTMENT 
  where APNT_YMD like '2022-05%'
 -- and APNT_CNCL_YN = 'n'
  group by MCDP_CD
  ORDER BY  5월예약건수 asc , MCDP_CD;