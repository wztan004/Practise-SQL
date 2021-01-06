-- full solution
SELECT
  s1.user_id
  ,s2.user_id AS recommended
FROM Song AS s1
JOIN Song AS s2
  ON s1.user_id != s2.user_id
  AND s1.ts = s2.ts
  AND s1.song = s2.song
WHERE (s1.user_id, s2.user_id) NOT IN (
  SELECT user_id, friend_id FROM User
  UNION
  SELECT friend_id, user_id FROM User
)
GROUP BY s1.user_id, s2.user_id, s2.ts
HAVING COUNT(DISTINCT s2.song) >= 3;

-- attempted solution #1 29Dec20 (same output as the correct solution)
WITH T1 AS (
SELECT s1.user_id s1user, s2.user_id s2user, s1.ts, s1.song FROM Song s1
JOIN Song s2 ON s1.song = s2.song AND s1.ts = s2.ts
WHERE s1.user_id <> s2.user_id
GROUP BY 1,2,3,4),

T2 AS (
SELECT s1user, s2user, ts, COUNT(DISTINCT song) dsong
FROM T1
GROUP BY 1,2,3
HAVING dsong >= 3)

SELECT s1user, s2user FROM T2
WHERE (s1user, s2user) NOT IN (SELECT user_id, friend_id FROM User) AND (s1user, s2user) NOT IN (SELECT friend_id, user_id FROM User)
;