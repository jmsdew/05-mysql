# MYSQL

<img src=./image.png>

### order by

- DESC = 내림차순 정렬
- ASC = 오름차순 정렬 ( 기본값)
- 연속으로 사용이 가능하다.

```sql
SELECT 
 	MENU_CODE ,
 	MENU_NAME ,
 	MENU_PRICE 
  FROM TBL_MENU
 ORDER BY
 	MENU_PRICE DESC , -- 가격을 내림차순으로 정리 하는데
 	MENU_CODE ASC;    -- 가격이 같을 시 코드 오름차순으로 정렬 하겠다.
```

### Where

- 어떤 조건의 값을 꺼내올지 지정하는 키워드

```sql
SELECT 
 	menu_code ,
 	menu_name ,
 	menu_price                 -- 3
  FROM tbl_menu                -- 동작흐름 1
  WHERE menu_price >= 20000    -- 2 
  ORDER BY menu_code DESC;     -- 4      -- ORDER BY 가 제일 나중에 실행 where보다 위에 오면 에러
```

- And : 여러 개의 where 조건이 주어지면 and 키워드를 사용한다.
- OR : 조건이 A거나 B인 목록 조회 시 사용
- BETWEEN  AND : 범위 지정 연산자. (between a and b) a와 b 사이의 값
- Like :  값이 포함되어 있는지 확인하는 방법
    - ‘%값%’ : 검색어가 가운데 있을 때
    - ‘%값’ : 검색어가 뒤에 있을 때
    - ‘값%’ : 검색어가 앞에 있을 때
- NOT LIKE :   LIKE의 부정문

### Group by

- 대상 값을 하나로 묶음
- 카운트가 된다.
- , 로 중복 묶음이 가능하다.

```sql
SELECT 
 	category_code ,
 	menu_price ,
 	count(*) 
  FROM tbl_menu 
 GROUP BY category_code , menu_price ;  -- category code 가 같으면서 menu price 가 같은 것들
```

- HAVING 으로 묶음에 조건을 걸 수 있다.

```sql
SELECT 
	category_code
  FROM tbl_menu 
  -- WHERE menu_name = "과메기커틀릿" -- 이렇게도 가능
  WHERE  menu_name NOT IN ('과메기커틀릿')
  GROUP BY category_code 
  HAVING category_code BETWEEN 5 AND 8;
```

- gruop by 끝에 with rollup 을 작성하면 묶인 그룹의 총 합이 출력된다.

### 서브쿼리

- 쿼리 안에 생성된 쿼리

```sql
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
```

- 서브쿼리 안 칼럼을 대상으로 쓰려면 별칭을 지정해야 한다.
- 가상의 테이블을 생성하면 별칭을 붙여야 한다.
    - With As 문으로 가상테이블 생성도 가능하다.
    
    ```sql
    SELECT 
     	a.menu_code , 
     	a.menu_name ,
     	a.menu_price ,
     	a.category_code ,
     	a.orderable_status
      FROM tbl_menu a
      JOIN (SELECT
      			menu_code ,
      			menu_price ,
      			category_code ,
      			orderable_status
      		 FROM tbl_menu  
      		 WHERE menu_price < 9000) b  ON (a.menu_code = b.menu_code)  -- b에서 셀렉트값만 조회 이름 안붙혀주면 에러
     WHERE a.category_code = 10;
    ```