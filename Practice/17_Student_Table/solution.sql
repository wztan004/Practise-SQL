WITH T1 AS (
SELECT s.Name Student, Grade, c.Name As Course, RANK() OVER (PARTITION BY c.Name ORDER BY Grade DESC) _Rank
FROM Student s
INNER JOIN Class c
	ON s.ClassId = c.Id)
    
SELECT Course, Student, Grade FROM T1 WHERE _Rank = 1;