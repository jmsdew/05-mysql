-- 조건에 부합하는 중고거래 댓글 조회하기
SELECT 
   ub.TITLE,
   ub.BOARD_ID,
   ur.REPLY_ID,
   ur.WRITER_ID,
   ur.CONTENTS,
   DATE_FORMAT(ur.CREATED_DATE, '%Y-%m-%d')
FROM used_goods_board ub JOIN used_goods_reply ur 
ON ub.BOARD_ID = ur.BOARD_ID
WHERE ub.CREATED_DATE BETWEEN '2022-10-01' AND '2022-10-31'
ORDER BY ur.CREATED_DATE ASC, ub.TITLE ASC;

-- 조건에 부합하는 중고거래 상태 조회하기
SELECT
    BOARD_ID ,
    WRITER_ID ,
    TITLE ,
    PRICE ,
    VIEWS
 FROM USED_GOODS_BOARD UB
 WHERE UB.CREATED-DATE LIKE '2022-10-05'
 ORDER BY BOARD_ID DESC;
 

-- 자동차 종류 별 특정 옵션이 포함된 자동차 수 구하기
SELECT
    CAR_TYPE,
    COUNT(*) AS CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS LIKE '%시트%'
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE;

-- 조건에 맞는 도서와 저자 리스트 출력하기
SELECT
    b.BOOK_ID ,
    a.AUTHOR_NAME ,
     DATE_FORMAT(b.PUBLISHED_DATE, '%Y-%m-%d') PUBLISHED_DATE
 from BOOK b
 join AUTHOR a on (b.AUTHOR_ID = a.AUTHOR_ID)
 where category like '경제'
 order by PUBLISHED_DATE;


-- 성분으로 구분한 아이스크림 총 주문량
SELECT
    b.INGREDIENT_TYPE ,
    sum(a.TOTAL_ORDER)
    
    
 from FIRST_HALF a
 join ICECREAM_INFO b on (a.flavor = b.flavor)
 group by INGREDIENT_TYPE;
 
-- 조건에 부합하는 중고거래 상태 조회하기

SELECT
    BOARD_ID ,
    WRITER_ID ,
    TITLE ,
    PRICE ,
    CASE
        WHEN (status like 'RESERVED') then '예약중'
        WHEN (status like 'SALE') then '판매중'
        else '거래완료'
    end as STATUS

 FROM USED_GOODS_BOARD 
 
 WHERE CREATED_DATE LIKE '2022-10-05'
 ORDER BY BOARD_ID DESC;


-- 진료과별 총 예약 횟수 출력하기
SELECT
    MCDP_CD as `진료과코드`,
    count(*) as 5월예약건수

  from APPOINTMENT 
  where APNT_YMD like '2022-05%'
 -- and APNT_CNCL_YN = 'n'
  group by MCDP_CD
  ORDER BY  5월예약건수 asc , MCDP_CD;
 
 -- 상품 별 오프라인 매출 구하기
 SELECT
    a.PRODUCT_CODE ,
    sum(a.PRICE*b.SALES_AMOUNT) as SALES ,
 from PRODUCT a
 join OFFLINE_SALE b on (a.PRODUCT_ID = b.PRODUCT_ID)
 group by a.PRODUCT_CODE
 order by SALES desc, a.PRODUCT_CODE ;


-- DATETIME에서 DATE로 형 변환
SELECT
    ANIMAL_ID ,
    NAME ,
     DATE_FORMAT(DATETIME, '%Y-%m-%d') as '날짜'
 from ANIMAL_INS ;


 -- 동물 수 구하기
SELECT
    count(*) as 'count'
  from ANIMAL_INS ;
 
 -- 총합을 구하려면 그룹없이 count를 써주면 됨




