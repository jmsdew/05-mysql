SELECT * FROM EMPLOYEE;
SELECT * FROM job;

SELECT 
	* ,
	max(salary)
  FROM EMPLOYEE ;
 
 SELECT 
    EMP_ID,
    EMP_NAME,
    PHONE,
    SALARY
FROM EMPLOYEE
ORDER BY SALARY DESC
LIMIT 1;


 
 SELECT
 	*
   FROM employee a 
   JOIN JOB b ON a.job_code = b.job_code
  WHERE a.emp_id = 200;
