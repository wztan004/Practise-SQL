-- attempt 1
WITH two_way_friendship AS(
SELECT 
  user_id
  ,friend_id
FROM Friendship
UNION
SELECT 
  friend_id
  ,user_id
FROM Friendship
)
SELECT
 f.user_id, p.page_id, count(*)
FROM two_way_friendship AS f
LEFT JOIN PageFollow AS p
  ON f.friend_id = p.user_id
  WHERE (f.user_id, p.page_id) NOT IN (
  SELECT user_id, page_id FROM PageFollow
)
group by 1,2;


-- attempt 2
WITH Friendship AS (
SELECT user_id, friend_id FROM Friendship
UNION
SELECT friend_id, user_id FROM Friendship),

T1 AS (
SELECT f.user_id, f.friend_id, p.page_id FROM Friendship f
JOIN PageFollow p ON f.friend_id = p.user_id),

T2 AS (
SELECT T1.user_id, T1.friend_id, T1.page_id
FROM T1
WHERE (T1.user_id, T1.page_id) NOT IN (SELECT user_id, page_id FROM PageFollow))

SELECT user_id, page_id, COUNT(friend_id)
FROM T2
GROUP BY 1,2;