SELECT 
	a.student_code ,
	a.student_name ,
	b.application_code ,
	b.grade 
  FROM student a
  JOIN application b ON a.student_code = b.student_code 
  
  
SELECT 
	a.student_name ,
	d.professor_name ,
	e.class_name , 
	b.grade 
  FROM student a
  JOIN application b ON a.student_code = b.student_code 
  JOIN lecture c ON b.lecture_code = c.lecture_code  
  JOIN professor d ON c.professor_code = d.professor_code
  JOIN class e ON c.class_code  = e.class_code 
  WHERE d.professor_code IN ('P001','P004')
  ORDER BY grade;
  
 -- 우리 학과에는 운동을 좋아하는 사람들을 위해 무에타이와 주짓수 클래스가 있다.
 -- 이를 듣는 사람의 이름과 담당 교수와 수업 이름, 학점을 출력해주세요. 학점이 높은 순서대로 출력 해주세요
 
 
 
 SELECT 
 	a.class_name ,
 	d.student_name ,
 	c.grade 
   FROM class a
   JOIN lecture b ON a.class_code = b.class_code 
   JOIN application c ON b.lecture_code = c.lecture_code 
   JOIN student d ON c.student_code = d.student_code 
  ORDER BY grade;

 
 
 