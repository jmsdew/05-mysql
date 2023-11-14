SELECT 
	a.student_code ,
	a.student_name ,
	b.application_code ,
	b.grade 
  FROM student a
  JOIN application b ON a.student_code = b.student_code 
  
  
 