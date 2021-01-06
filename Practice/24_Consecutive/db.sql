
DROP SCHEMA IF EXISTS 24_Consecutive;
CREATE SCHEMA 24_Consecutive;
USE 24_Consecutive;

DROP TABLE IF EXISTS `complete_dates`;
CREATE TABLE `user_read` (
    `date` date,
    `uid` int,
    `logged_in` boolean
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `user_read` (`date`, `uid`, `logged_in`) VALUES
("2018-01-01", 100, 1),
("2018-01-02", 100, 1),
("2018-01-03", 100, 0),
("2018-01-04", 100, 0),
("2018-01-05", 100, 1),

("2018-01-01", 200, 1),
("2018-01-02", 200, 0),
("2018-01-03", 200, 1),
("2018-01-04", 200, 1),
("2018-01-05", 200, 1),

("2018-01-01", 300, 1),
("2018-01-02", 300, 1),
("2018-01-03", 300, 1),
("2018-01-04", 300, 1),
("2018-01-05", 300, 0)
;


