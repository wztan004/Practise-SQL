
DROP SCHEMA IF EXISTS Logged_In;
CREATE SCHEMA Logged_In;
USE Logged_In;

DROP TABLE IF EXISTS `Logged_In`;
CREATE TABLE `Logged_In` (
    `user_id` int,
    `date` date,
    `logged_in` boolean
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `Logged_In` (`user_id`, `date`,`logged_in`) VALUES
(1, '2017-01-01', TRUE),
(1, '2017-01-02', FALSE),
(1, '2017-01-03', FALSE),
(1, '2017-01-04', TRUE),
(1, '2017-01-05', TRUE),
(2, '2017-01-01', TRUE),
(2, '2017-01-02', TRUE),
(2, '2017-01-04', TRUE),
(2, '2017-01-05', TRUE),
(3, '2017-01-01', TRUE),
(3, '2017-01-02', FALSE),
(3, '2017-01-03', TRUE),
(3, '2017-01-04', TRUE),
(3, '2017-01-05', TRUE)
;