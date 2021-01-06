-- SOLUTION
select f1.user_id as user1, f2.user_id as user2, count(*) as num_in_common
from Friendship f1 join
     Friendship f2
     on f1.friend_id = f2.friend_id
WHERE f1.user_id <> f2.user_id
group by 1,2 
HAVING num_in_common >= 3;


-- 1. UNIDIRECTIONAL
-- answers how many users are connected to a friend_id
select *
from Friendship f1 join
     Friendship f2
     on f1.friend_id = f2.friend_id;

-- 2. EXCLUDE SAME PERSON
select *
from Friendship f1 join
     Friendship f2
     on f1.friend_id = f2.friend_id
     WHERE f1.user_id <> f2.user_id; -- new line

-- EXPLANATION
-- It's not necessary to do a cross-join or union to find mutual friends (note distinction against followers).
-- By joining the two tables against friend_id, we will have two user_ids with a common friend_id.
-- Grouping the two users will allow us to count the number of common friends these two users have.