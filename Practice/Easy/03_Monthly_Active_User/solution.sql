SET @today := "2019-03-01";

SELECT user_id, action, max(date) FROM UserHistory
WHERE DATEDIFF(@today, date) <= 30
GROUP BY 1,2
;