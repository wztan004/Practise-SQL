SELECT topic, count(*) FROM (
SELECT DISTINCT date, uid, news_id, topic FROM user_read) q
group by 1