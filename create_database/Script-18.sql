        SELECT
            a.student_name,
            sum(b.score) AS score
        FROM student a
        JOIN praise b ON (a.student_code = b.student_code)
        GROUP BY a.student_name;
       	
       
       JOIN (
            SELECT category_code
            FROM praise_category
            WHERE category_name = '${keyword}'
        ) c ON (b.category_code = c.category_code)
            GROUP BY a.student_name
            ORDER BY score DESC
        LIMIT 10;