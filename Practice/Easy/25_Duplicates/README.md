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