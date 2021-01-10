-- Method 1
SELECT * FROM (
-- important to use dense rank because if 1st position is tied, there's no second place.
SELECT *, DENSE_RANK() OVER(ORDER BY salary DESC) _rank FROM Employees) q
WHERE _rank = 2;

-- Method 2
SELECT * FROM Employees 
WHERE salary= (SELECT DISTINCT(salary) 
FROM Employees ORDER BY salary LIMIT 3,1);