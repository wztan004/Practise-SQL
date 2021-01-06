-- set @todayx = "2019-03-01"; 
-- select User.name, User.phone_num, MAX(date)  from UserHistory
-- INNER JOIN User ON UserHistory.user_id = User.user_id
-- WHERE date >= DATE_ADD(@todayx, INTERVAL -30 DAY)
-- AND action = "logged_on"
-- GROUP BY 1, 2;

SELECT * FROM User
LEFT JOIN UserHistory ON User.user_id = UserHistory.user_id
WHERE UserHistory.user_id IS NULL
;