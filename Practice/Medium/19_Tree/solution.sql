WITH T1 AS (
-- Add a new child column called c_id
SELECT t1.id, t1.p_id, t2.id as c_id FROM tree t1 LEFT JOIN tree t2 ON t1.id = t2.p_id 
)
SELECT
	T1.id,
    CASE
		WHEN p_id IS NULL THEN 'Root'
        WHEN p_id IS NOT NULL AND c_id IS NOT NULL THEN 'Inner'
        WHEN c_id IS NULL THEN 'Leaf'
        END AS Type
FROM T1
GROUP BY 1,2;