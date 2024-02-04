INSERT INTO user
VALUES(2,'null');

INSERT INTO admin 
VALUES(1,'123','123');




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
	(NULL,"소화기",1,'Y',"2023-12-19",NULL,null);

INSERT INTO praise_category 
VALUES
	(NULL,"끈기");

INSERT INTO praise 
VALUES
	(NULL,2,"착함",20,4,"2023-12-18",'Y',"2023-12-18",NULL,null);

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