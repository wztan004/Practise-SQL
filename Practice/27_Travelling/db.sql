
DROP SCHEMA IF EXISTS 27_Travelling;
CREATE SCHEMA 27_Travelling;
USE 27_Travelling;

DROP TABLE IF EXISTS `buses`;
CREATE TABLE `buses` (
    `id` int,
    `origin` varchar(30),
    `destination` varchar(30),
    `time` varchar(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `passengers`;
CREATE TABLE `passengers` (
    `id` int,
    `origin` varchar(30),
    `destination` varchar(30),
    `time` varchar(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `buses` (`id`, `origin`, `destination`, `time`) VALUES
(10, "Warsaw", "Berlin", "10:55"),
(20, "Berlin", "Paris", "06:20"),
(21, "Berlin", "Paris", "14:00"),
(22, "Berlin", "Paris", "21:40"),
(30, "Paris", "Madrid", "13:30"),
(100, "Munich", "Rome", "15:30"),
(200, "Munich", "Rome", "20:00")
;

INSERT INTO `passengers` (`id`, `origin`, `destination`, `time`) VALUES
(1, "Paris", "Madrid", "13:30"),
(2, "Paris", "Madrid", "13:31"),
(10, "Warsaw", "Paris", "10:00"),
(11, "Warsaw", "Berlin", "22:31"),
(40, "Berlin", "Paris", "06:15"),
(41, "Berlin", "Paris", "06:50"),
(42, "Berlin", "Paris", "07:12"),
(43, "Berlin", "Paris", "12:03"),
(44, "Berlin", "Paris", "20:00")
;



