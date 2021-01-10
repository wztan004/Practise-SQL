WITH T1 AS (
SELECT a.user_id, 
CASE
-- this can be further optimized but I'll leave it as it is for clarity
	WHEN status = "NEW" AND paid IS NOT NULL THEN "EXISTING"
    WHEN status = "NEW" AND paid IS NULL THEN "CHURN"
    WHEN status = "EXISTING" AND paid IS NOT NULL THEN "EXISTING"
    WHEN status = "EXISTING" AND paid IS NULL THEN "CHURN"
    WHEN status = "CHURN" AND paid IS NOT NULL THEN "RESURRECT"
    WHEN status = "CHURN" AND paid IS NULL THEN "CHURN"
    WHEN status = "RESURRECT" AND paid IS NOT NULL THEN "EXISTING"
    WHEN status = "RESURRECT" AND paid IS NULL THEN "CHURN"
    END new_status
 FROM Advertiser a
LEFT JOIN DailyPay d ON a.user_id = d.user_id),

T2 AS (
SELECT d.user_id, "NEW" status FROM DailyPay d
LEFT JOIN Advertiser AS a
ON d.user_id = a.user_id
WHERE a.user_id IS NULL)

SELECT * FROM T1 UNION ALL
SELECT * FROM T2

;