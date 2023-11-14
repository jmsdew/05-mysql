SELECT * FROM application;
SELECT * FROM student;
SELECT * FROM score;
SELECT * FROM lecture;
SELECT * FROM class;
SELECT * FROM professor;
SELECT * FROM criteria;
SELECT * FROM report ;

DESCRIBE report;
-- 본인의 성적이 마음에 들지 않은 호날두는 여자친구에게 보여줄 성적표를 위조하기 위해 데이터에 성적을 올 A+로 바꿔서 사용한 후
-- 완전범죄를 위해 다시 원래 성적으로 바꾸려고 한다. 이를 실행해보자

SET FOREIGN_key_checks=1;


UPDATE application SET grade = "A+" WHERE student_code = 'S015';

UPDATE application SET grade = "D+" WHERE application_code = 'A057';
UPDATE application SET grade = "C+" WHERE application_code = 'A058';
UPDATE application SET grade = "A0" WHERE application_code = 'A059';
UPDATE application SET grade = "B+" WHERE application_code = 'A060';


-- 수업에서 학점(grade)이 B0 보다 높은 학생들 중 출석점수(score_attend)가 80점 이상인 학생들에게 상장을 수여하려고 한다.
-- 제작해야 하는 학점 별 상장의 갯수를 알기 위한 쿼리를 작성 해 주세요.
-- 출력되는 컬럼명은 학점, 인원 으로 작성하고 학점이 높은 순서로 나열 해 주세요.
SELECT 
	a.grade AS '학점',
	count(*) AS '인원'
  FROM application a
  JOIN score b ON a.application_code = b.application_code 
 WHERE a.grade IN ('A+', 'A0', 'B+', 'B0')
   AND b.score_attend >= 80
  GROUP BY a.grade
  ORDER BY a.grade ;




/*대학교에서 장학금을 지급하려고 한다.
듣는 강의 중에서 하나라도 A 이상을 받은 학생은 장학금을 받을 수 있다.
A 학점을 하나라도 받지 못한 학생은 평균 성적이 괜찮더라도 장학금을 받지 못한다.


전화번호와 사는 지역 모두 입력이 안된 학생은 장학금을 
받지 못하므로  A 학점을 받았더라도 제외한다.

장학금을 받을 학생들의 이름과 A 학점 이상을 증명할 성적을 출력하세요.*/

 SELECT DISTINCT 
    a.student_name ,
    min(b.grade) AS grade 
   FROM student a
   JOIN application b ON a.student_code = b.student_code 
  WHERE a.student_phone IS NOT NULL AND b.grade IN ('A+', 'A0')
    or a.student_address IS NOT NULL AND b.grade IN ('A+', 'A0')
   GROUP BY a.student_code 
  ORDER BY grade , a.student_name  ;



SELECT 
  application.lecture_code,
  class.class_name,
  student.student_name,
  max(COALESCE(score_attend, 0) + COALESCE(score_midterm, 0) + COALESCE(score_final, 0) + COALESCE(score_task, 0)) AS test 
FROM application
JOIN lecture ON application.lecture_code = lecture.lecture_code
JOIN professor ON lecture.professor_code = professor.professor_code 
JOIN student ON application.student_code = student.student_code 
JOIN class ON lecture.class_code = class.class_code 
JOIN score ON application.application_code = score.application_code 
WHERE grade LIKE '%A%'
GROUP BY lecture.lecture_code, class.class_name, student.student_name
ORDER BY lecture.lecture_code;

WITH RankedScores AS (
  SELECT 
    application.lecture_code,
    class.class_name,
    student.student_name,
    application.grade,
    COALESCE(score_attend, 0) + COALESCE(score_midterm, 0) + COALESCE(score_final, 0) + COALESCE(score_task, 0) AS test,
    ROW_NUMBER() OVER (PARTITION BY application.lecture_code ORDER BY COALESCE(score_attend, 0) + COALESCE(score_midterm, 0) + COALESCE(score_final, 0) + COALESCE(score_task, 0) DESC) AS row_num
  FROM application
  JOIN lecture ON application.lecture_code = lecture.lecture_code
  JOIN professor ON lecture.professor_code = professor.professor_code 
  JOIN student ON application.student_code = student.student_code 
  JOIN class ON lecture.class_code = class.class_code 
  JOIN score ON application.application_code = score.application_code 
  WHERE grade LIKE '%A%'
)
SELECT lecture_code, class_name, student_name, grade, test
FROM RankedScores
WHERE row_num = 1;


SELECT 
	a.lecture_code ,
	min(e.class_name) AS class_name ,
	min(a.grade) AS grade ,
	 max(COALESCE(f.score_attend, 0) + COALESCE(f.score_midterm, 0) + COALESCE(f.score_final, 0) + COALESCE(f.score_task, 0)) AS test 
  FROM application a
  JOIN lecture b ON a.lecture_code = b.lecture_code 
  JOIN professor c ON c.professor_code  = b.professor_code 
  JOIN student d ON d.student_code = a.student_code 
  JOIN class e ON e.class_code = b.class_code 
  JOIN score f ON f.application_code = a.application_code 
  WHERE grade LIKE '%A%'
  GROUP BY lecture_code
  ORDER BY lecture_code 








