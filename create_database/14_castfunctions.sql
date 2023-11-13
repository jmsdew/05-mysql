/* CAST Functions */

/*
 * 명시적 형변환(explicit Conversion)
 * cast (expression as 데이터 형식[(길이)]
 * convert (expression, 데이터 형식[(길이)] )
 * 데이터 형식으로 가능한 것은 Binary, char, date, datetime, decimal
 * json, signed Integer, Time, unsigned integer 등이 있다.
 * */

SELECT avg(menu_price) FROM tbl_menu;
SELECT * FROM tbl_menu ;

SELECT cast(avg(menu_price) AS  signed Integer) AS '평균가격' FROM tbl_menu ;
SELECT CONVERT (avg(menu_price), signed Integer) AS '평균가격' FROM tbl_menu ;

SELECT CAST('2023$6$30' AS date);
SELECT CAST('2023/6@30' AS date);
SELECT CAST('2023@6/30' AS date);

