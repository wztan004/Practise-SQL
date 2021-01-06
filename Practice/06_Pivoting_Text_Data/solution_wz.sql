SELECT name,
MAX(CASE WHEN course = 'CS106B' THEN t1.grade END) CS106B,
MAX(CASE WHEN t1.course = 'CS229' THEN t1.grade END) CS229,
MAX(CASE WHEN t1.course = 'CS224N' THEN t1.grade END) CS224N
FROM Practice.CourseGrade t1
GROUP BY 1
;