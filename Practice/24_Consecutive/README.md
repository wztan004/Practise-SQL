WITH T1 AS (SELECT *, DATE_ADD(date, INTERVAL -ROW_NUMBER() OVER(PARTITION BY uid ORDER BY date) DAY) counter FROM 24_Consecutive.user_read
WHERE logged_in
),

T2 AS (
SELECT date, uid, MIN(date) OVER(PARTITION BY uid, counter) min_date, MAX(date) OVER(PARTITION BY uid, counter) max_date
FROM T1)

SELECT date, uid, min_date, max_date, max_date - min_date + 1 FROM T2;


-- Solution 1: if you don't care about start date and end date
-- SELECT uid, count(*) FROM T1
-- WHERE counter IS NOT NULL
-- GROUP BY 1;