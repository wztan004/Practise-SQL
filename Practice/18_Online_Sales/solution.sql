WITH T2 AS (
SELECT id, SUM(_count) agg_count FROM (
		(SELECT seller_id AS id, COUNT(seller_id) _count FROM buy_sell GROUP BY seller_id)
		UNION ALL
		(SELECT buyer_id AS id, COUNT(buyer_id) AS _count FROM buy_sell GROUP BY buyer_id)
	) T1 GROUP BY 1
)

SELECT * FROM T2 WHERE agg_count = (SELECT MAX(agg_count) FROM T2);