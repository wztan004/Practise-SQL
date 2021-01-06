SELECT name, CS106B AS grade, "CS106B" as course FROM course_grade_pivoted
UNION
SELECT name, CS229 AS grade, "CS229" as course FROM course_grade_pivoted
UNION
SELECT name, CS224N AS grade, "CS224N" as course FROM course_grade_pivoted
