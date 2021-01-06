WITH existing_friendships AS (
	select user_id, friend_id
	from Friendship t1
	UNION
	select friend_id, user_id
	from Friendship t1
), 

all_users AS (
	SELECT t1.user_id FROM Friendship t1
	UNION
	SELECT t2.friend_id FROM Friendship t2
),

all_possible_friendships AS (
SELECT t1.user_id user_id, t2.user_id friend_id FROM all_users t1
CROSS JOIN  all_users t2
WHERE t1.user_id <> t2.user_id
),

not_friends AS (
SELECT p.user_id, p.friend_id FROM all_possible_friendships p
WHERE (p.user_id, p.friend_id) NOT IN (SELECT user_id, friend_id FROM Friendship)
AND (p.friend_id, p.user_id) NOT IN (SELECT user_id, friend_id FROM Friendship))

SELECT t1.user_id, t2.user_id, COUNT(*) counter FROM existing_friendships t1 JOIN existing_friendships t2 ON t1.friend_id = t2.friend_id AND t1.user_id <> t2.user_id
WHERE (t1.user_id, t2.user_id) IN (SELECT user_id, friend_id FROM not_friends)
GROUP BY 1,2
ORDER BY counter DESC;

