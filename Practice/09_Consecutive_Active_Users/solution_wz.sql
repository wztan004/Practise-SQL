
SELECT *, DATEDIFF(ts,t3) FROM (
SELECT *, LAG(ts,3) OVER() t3 FROM WAU.Login) t11
LIMIT 100;

-- this will automatically include >=3 as well.