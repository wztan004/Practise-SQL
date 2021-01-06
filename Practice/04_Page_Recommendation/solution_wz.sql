

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