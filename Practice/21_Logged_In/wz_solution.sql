
WITH t3 AS (SELECT DISTINCT t1.user_id, t2.date
FROM Logged_In t1
CROSS JOIN Logged_In t2),

t5 AS (
SELECT t3.user_id user_id, t3.date date,  IFNULL(t4.logged_in,FALSE) logged_in FROM t3
LEFT JOIN Logged_In t4 ON t4.user_id = t3.user_id AND t4.date = t3.date)

SELECT COUNT(DISTINCT user_id) FROM (
SELECT *, SUM(logged_in) OVER (PARTITION BY user_id ORDER BY date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW ) counter FROM t5) t6
WHERE counter >= 3;