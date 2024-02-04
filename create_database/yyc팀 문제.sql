SELECT * FROM item;
SELECT * FROM user_id;
SELECT * FROM seller;
SELECT * FROM category;
SELECT * FROM address;
SELECT * FROM detailed_order ;

-- 각 지역별 베스트 셀러의 이름과 총액 출력하시오.
-- (지역 판매자 물건)

CREATE VIEW legion AS
SELECT 
  LEFT(normal_address, 2) AS address_prefix  -- 2글자라는 보장 없음 규칙을 찾아서  split 이용 권장
FROM address;
 
SELECT 
    m.address_prefix,
    m.user_no,
    m.user_name,
    m.total_item_price
FROM maxsell m
JOIN (
    SELECT 
        address_prefix,
        MAX(total_item_price) AS max_total_item_price
    FROM maxsell
    GROUP BY address_prefix
) max_per_region ON m.address_prefix = max_per_region.address_prefix AND m.total_item_price = max_per_region.max_total_item_price;


CREATE VIEW maxsell AS 
    SELECT 
        u.user_no,
        l.address_prefix,
        u.user_name,
        SUM(i.item_price) AS total_item_price
    FROM item i
    JOIN user_id u ON i.user_no = u.user_no 
    JOIN address a ON u.user_no = a.user_no
    JOIN legion l ON LEFT(a.normal_address, 2) = l.address_prefix
    GROUP BY u.user_no, l.address_prefix;

DROP VIEW maxsell;	  
DROP VIEW legion;

SELECT * FROM maxsell ;



-- ------------------------------------------------- 실패

-- 셀러가 판매하는 상품의 가격 조회
SELECT 
	u.user_no ,
	u.user_name ,
	i.item_name ,
	i.item_no ,
	io.option_no ,
	(i.item_price + io.add_cost) AS optionprice 
  FROM user_id u
  JOIN item i ON u.user_no = i.user_no 
  LEFT JOIN item_option_and_inventory io ON i.item_no = io.item_no 
  JOIN detailed_order do ON do.item_no = i.item_no ;















