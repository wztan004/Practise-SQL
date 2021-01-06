-- Since user_read does not have channel_id data, I'll first search for the user_id who read the most consecutive days

WITH has_user_read AS (
-- find out if a user has read in any day
	SELECT date, uid, channel_type, counter>=1 AS has_read FROM (
		SELECT t_reg.uid, t_read.date, t_reg.channel_type, COUNT(*) AS counter
		FROM user_registration t_reg
		INNER JOIN user_read t_read ON t_reg.uid = t_read.uid
		INNER JOIN user_info t_info ON t_reg.uid = t_info.uid
		WHERE t_info.gender = 'male' AND t_info.age > 30
		AND t_read.date >= "2018-01-01" AND t_read.date <= "2018-12-31"
		GROUP BY 1,2,3 
	) t1
),

is_consecutive AS (
SELECT  uid,
        date,
        has_read,
        channel_type,
        
        -- First, we get row numbers, partitioned by date and user id.
        -- Then we subtract the row numbers from the date column, resulting in a new column "grouped_date"
        -- In this "grouped_date" column, any group of consecutive dates will share the same value.
        -- If a date is skipped, the next consecutive group will share the same value within the group, but different values between the groups.
        -- This is how we differentiate if a group of dates is consecutive.
        DATE_ADD(date, INTERVAL -ROW_NUMBER() OVER(PARTITION BY uid ORDER BY date) DAY) AS grouped_date
FROM  has_user_read),

consecutive_day_table AS (
SELECT uid, grouped_date, channel_type, SUM(has_read) consecutive_days FROM is_consecutive
group by 1,2,3)


SELECT *
FROM consecutive_day_table
WHERE consecutive_days = (SELECT MAX(consecutive_days) FROM consecutive_day_table);



