WITH Friendship AS (
SELECT user_id, friend_id FROM Friendship
UNION
SELECT friend_id, user_id FROM Friendship)

SELECT f1.user_id, f2.user_id, COUNT(*) AS counter FROM Friendship f1
JOIN Friendship f2 ON f1.friend_id = f2.friend_id
WHERE f1.user_id <> f2.user_id
GROUP BY 1,2
HAVING counter >= 3
;

-- EXPLANATION
-- It's not necessary to do a cross-join or union to find mutual friends (note distinction against followers).
-- By joining the two tables against friend_id, we will have two user_ids with a common friend_id.
-- Grouping the two users will allow us to count the number of common friends these two users have.