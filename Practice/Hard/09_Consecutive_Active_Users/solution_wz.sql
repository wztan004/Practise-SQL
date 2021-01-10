WITH T1 AS (
SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY ts) rn FROM 09_WAU.Login
),

T2 AS (
SELECT user_id, ts, DATE_ADD(ts, INTERVAL -rn DAY) grouped_date FROM T1),

T3 AS (
SELECT
user_id user_id
,COUNT(ts) OVER (PARTITION BY user_id, grouped_date) AS max_consecutive
,MIN(ts) OVER (PARTITION BY user_id, grouped_date) AS start_date
,MAX(ts) OVER (PARTITION BY user_id, grouped_date) AS end_date
FROM T2)

SELECT user_id, max_consecutive, start_date, end_date
FROM T3
GROUP BY 1,2,3,4;