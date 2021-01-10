WITH T1 AS (
SELECT 
b.id AS b_id, b.origin AS b_origin, b.destination AS b_destination, b.time AS b_time
, p.id AS p_id, p.origin AS p_origin, p.destination AS p_destination, p.time AS p_time
, b.time >= p.time AS eligible_to_board
FROM buses b
LEFT JOIN passengers p ON b.origin = p.origin AND b.destination = p.destination
ORDER BY p.id, b.time),

T2 AS (
SELECT *, ROW_NUMBER() OVER (PARTITION BY p_id, eligible_to_board ORDER BY b_time) rownum FROM T1), 

T3 AS (
SELECT b_id, eligible_to_board FROM T2
WHERE rownum = 1 OR p_id IS NULL)

SELECT b_id, SUM(CASE WHEN eligible_to_board IS NULL THEN 0 ELSE eligible_to_board END) num_of_passengers
FROM T3
GROUP BY 1
ORDER BY b_id
;

