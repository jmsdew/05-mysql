
	INSERT INTO praise 
VALUES
    (
        NULL,
        11,
        '착석',
        10,
        (SELECT 
        	student_code 
        FROM student 
        WHERE student_name = '${student.name}' 
        AND user_code = 1) AS student,
        CURRENT_DATE,
        'Y',
        CURRENT_DATE,
        NULL,
        NULL
    );



INSERT INTO user
VALUES(null,'jmsdew@naver.com');

INSERT INTO admin 
VALUES(1,'123','123');

INSERT INTO user_info 
VALUES
	(1,"구로초등학교",3,2,'Y',"2023-12-21",NULL,null);


INSERT INTO schedule 
VALUES
	(NULL,"끝내주게 밥 먹기","2023-12-20","밥도 많이 먹을 예정",1,"Y","2023-12-20",NULL,null);

SELECT 
	Schedule_title,
	Schedule_content 
  FROM schedule 
 WHERE user_code =1;



INSERT INTO student 
VALUES
	(NULL,"정민식",1,'Y',"2023-12-19",NULL,null),
	(NULL,"김기유",1,'Y',"2023-12-19",NULL,null),
	(NULL,"백종환",1,'Y',"2023-12-19",NULL,null),
	(NULL,"정1식",1,'Y',"2023-12-19",NULL,null),
	(NULL,"정2식",1,'Y',"2023-12-19",NULL,null),
	(NULL,"정3식",1,'Y',"2023-12-19",NULL,null),
	(NULL,"정4식",1,'Y',"2023-12-19",NULL,null),
	(NULL,"정5식",1,'Y',"2023-12-19",NULL,null),
	(NULL,"정6식",1,'Y',"2023-12-19",NULL,null),
	(NULL,"정7식",1,'Y',"2023-12-19",NULL,null),
	(NULL,"정8식",1,'Y',"2023-12-19",NULL,null),
	(NULL,"정9식",1,'Y',"2023-12-19",NULL,null),
	(NULL,"이상우",1,'Y',"2023-12-19",NULL,null),
	(NULL,"엄준식",1,'Y',"2023-12-19",NULL,null),
	(NULL,"백준",1,'Y',"2023-12-19",NULL,null),
	(NULL,"정메시",1,'Y',"2023-12-19",NULL,null);

INSERT INTO praise_category 
VALUES
	(NULL,"착석");
	
INSERT INTO praise 
VALUES
	(NULL,10,"착함",20,18,"2023-12-18",'Y',"2023-12-18",NULL,null);

SELECT
	a.student_name,
	sum(b.score) AS score
  FROM student a
  JOIN praise b ON (a.student_code = b.student_code)
  GROUP BY a.student_name
  ORDER BY score DESC
  LIMIT 3;
 
SELECT
	a.student_name,
	sum(b.score) AS score
  FROM student a
  JOIN praise b ON (a.student_code = b.student_code)
  WHERE b.category_code =1
  GROUP BY a.student_name
  ORDER BY score DESC
  LIMIT 10; 
 
 SELECT 
 	category_name 
   FROM praise_category 
   WHERE category_code =1;
 	
 
 SELECT
 	STUDENT_NAME
   FROM student 
  WHERE user_code =1;
 
 SELECT 
 	C.category_NAME,
 	A.STUDENT_NAME,
 	b.score 
   FROM STUDENT A
   JOIN PRAISE B ON (A.student_code = B.student_code)
   JOIN praise_category C ON (B.category_code = C.category_code)
   ORDER BY SCORE DESC;
  

   
   
  SELECT 
  		c.student_name ,
  		sum(b.score)
    FROM praise_category a
    JOIN praise b ON (a.category_code = b.category_code)
    JOIN student c ON (b.student_code = c.student_code)
    WHERE c.user_code =1
    GROUP BY c.student_code ;


        WITH RankedResults AS (
         SELECT
            C.category_NAME,
            A.STUDENT_NAME,
          SUM(B.score) AS total_score,
          ROW_NUMBER() OVER (PARTITION BY C.category_NAME ORDER BY SUM(B.score) DESC) AS row_num
          FROM
          STUDENT A
          JOIN PRAISE B ON A.student_code = B.student_code
          JOIN praise_category C ON B.category_code = C.category_code
         GROUP BY C.category_NAME, A.STUDENT_NAME
        )
        SELECT
            category_NAME,
            STUDENT_NAME,
            total_score
          FROM RankedResults
         WHERE row_num = 1
         ORDER BY category_NAME;