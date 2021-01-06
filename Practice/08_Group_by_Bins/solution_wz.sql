SELECT 
CASE
	WHEN creditLimit <50000 THEN 'Below 50k' 
	WHEN creditLimit BETWEEN 50000 AND 100000 THEN '50 ~ 100k' 
    ELSE '>100k' 
END AS credit_range,
count(*)

FROM classicmodels.customers
group by 1