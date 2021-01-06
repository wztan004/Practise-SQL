Table Salary. 
The following table is called salary which contains thousands of rows. Try to use 2 different methods to find the 2nd highest salary and its corresponding id from salary table. GIVE ME Both SALARY and ID!!!!
+——+—————--------—+
| Id | salary_usd |
+——+—————--------—+
| 1  | 100    		|
| 2  | 200    		|
| 3  | 100    		|
| 4  | 200        |
| …  |…				    |
+——--+————------——+


-- Method 1
SELECT id, salary_usd FROM (
SELECT id, salary_usd, RANK(salary_usd) OVER (ORDER BY salary_usd DESC) _rank FROM Salary)
WHERE _rank = 2

-- Method 2
WITH second_max AS (
SELECT salary_usd FROM (
SELECT DISTINCT salary_usd FROM Salary
ORDER BY salary_usd DESC
LIMIT 2)
ORDER BY salary_usd
LIMIT 1)

SELECT id, salary_usd FROM Salary
WHERE salary_usd = (SELECT * FROM second_max)

-----------------------------




Table User_Read. It contains records as the following table. More records in a certain news topic indicate higher public attention. We would like to figure out which topic has the highest attention,
and which one has the lowest attention. It’s possible that duplicated records exist in the table.
(Please find the topic with most distinct records, and with least distinct records within 1 query.)
+—————-----+——----+————-----+———----+
 |date     | uid  | news_id | topic |
+—————-----+——----+———-----—+———----+
 |20180710 | 101  | 2001    | PE    |
 |20180710 | 101  | 2002    | Game  |
 |20180710 | 102  | 2001    | PE    |
 |20180710 | 102  | 2003    |Finance|
 |20180710 | 101  | 2005    | PE    |
 |20180710 | 102  | 2005    | PE    |
 |20180711 | 103  | 2007	  | Econ  |
 |…		     |…	    |…		    |…	    |
+————-----—+——----+————-----+———----+


SELECT topic, COUNT(DISTINCT *)
FROM (SELECT date, uid, news_id, topic --deduplicate
FROM User_Read
GROUP BY 1,2,3,4)
GROUP BY 1

-----------------------------

Table User_Read. 
+—————-----+——----+————-----+———----+
 |date     | uid  | news_id | topic |
+—————-----+——----+———-----—+———----+
 |20180710 | 101  | 2001    | PE    |
 |20180710 | 101  | 2002    | Game  |
 |20180710 | 102  | 2001    | PE    |
 |20180710 | 102  | 2003    |Finance|
 |20180710 | 101  | 2005    | PE    |
 |20180710 | 102  | 2005    | PE    |
 |20180711 | 103  | 2007	  | Econ  |
 |…		     |…	    |…		    |…	    |
+————-----—+——----+————-----+———----+
Table user_info. This is the dimension table of above Table 1 user_read, which contains user’s id, gender, age, and city.
+—————+————----+———--—+——------+
 |uid | gender | age  | city   |
+—————+——----——+————--+—-----—-+
 |101 | male   | 21   | HK     |
 |108 | female | 27	  | SG     |
 |…		|…	     |…		  |…	     |
+—————+——------+———--—+———----—+
Table user_registeration. 
+-—---+—————-----------—-+——————--------+————----------+
|uid  |registration_date | channel_id   | Channel_type |
+——---+—————------------—+———---------—-+——————--------+
|101  | 2018-08-15       | 11010        | Chain store  |
|103  | 2018-08-30       | 12010        | App store    |
|…	  |…	               |…		          |…			       |
+——---+——————+——————-----+———------—---—+--------------+
(Please find which channel attracts the person who come to read consecutively for most days in 2018 among HK male readers above 30.)

WITH T1 AS (
SELECT DISTINCT t1.date, t2.uid
FROM User_Read t1
CROSS JOIN User_Read t2)

T2 AS (
  -- those with NULL values indicate the user did not read the article.
  SELECT * FROM T1
  LEFT JOIN User_Read ON T1.date = T2.date AND T2.uid = T2.uid
  )

SELECT c_id, MAX(counter+counter_1,

SELECT c_id, counter, LAG(counter,1) counter_1 FROM (
SELECT read.date, read.uid, registration.channel_id AS c_id, COUNT(IFNULL(registration.news_id,0,1)) OVER (PARTITION BY read.uid, registration.channel_id) AS counter
FROM T1 read
INNER JOIN user_info info ON read.uid = info.uid
INNER JOIN user_registration registration ON read.uid = registration.uid
WHERE read.gender = male AND read.age > 30
AND read.date >= 20180101 AND read.date <= 20181231)
ORDER BY counter
GROUP BY 1,2,3;

















