
DROP SCHEMA IF EXISTS UserRead;
CREATE SCHEMA UserRead;
USE UserRead;

DROP TABLE IF EXISTS `user_read`;
CREATE TABLE `user_read` (
    `date` date,
    `uid` int,
    `news_id` int,
    `topic` varchar(20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
    `uid` int,
    `gender` varchar(20),
    `age` int,
    `city` varchar(20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `user_registration`;
CREATE TABLE `user_registration` (
    `uid` int,
    `registration_date` date,
    `channel_id` int,
    `Channel_type` varchar(20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `user_read` (`date`, `uid`, `news_id`, `topic`) VALUES
("2018-07-10", 101, 2001, "PE"),
("2018-07-10", 101, 2002, "Game"),
("2018-07-10", 101, 2005, "PE"),
("2018-07-11", 101, 2001, "PE"),
("2018-07-11", 101, 2002, "Game"),
("2018-07-13", 101, 2005, "PE"),
("2018-07-15", 101, 2007, "Econ"),


("2018-07-10", 102, 2001, "PE"),
("2018-07-10", 102, 2003, "Finance"),
("2018-07-10", 102, 2006, "PE"),
("2018-07-12", 102, 2001, "PE"),
("2018-07-12", 102, 2003, "Finance"),
("2018-07-13", 102, 2006, "PE"),
("2018-07-15", 102, 2007, "Econ"),

("2018-07-10", 103, 2007, "Econ"),
("2018-07-11", 103, 2007, "Econ"),
("2018-07-14", 103, 2007, "Econ"),
("2018-07-14", 103, 2007, "Econ"),
("2018-07-16", 103, 2007, "Econ"),
("2018-07-17", 103, 2007, "Econ"),
("2018-07-18", 103, 2007, "Econ")
;



INSERT INTO `user_info` (`uid`, `gender`, `age`, `city`) VALUES
(101, "male", 21, "HK"),
(102, "female", 27, "SG"),
(103, "female", 33, "MY")
;

INSERT INTO `user_registration` (`uid`, `registration_date`, `channel_id`, `channel_type`) VALUES
(101, "2018-08-15", 11010, "Chain store"),
(102, "2018-08-22", 13010, "Game store"),
(103, "2018-08-30", 12010, "App store")
;

