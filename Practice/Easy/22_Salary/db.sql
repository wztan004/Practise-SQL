
DROP SCHEMA IF EXISTS 22_Employees;
CREATE SCHEMA 22_Employees;
USE 22_Employees;

DROP TABLE IF EXISTS `Employees`;
CREATE TABLE `Employees` (
    `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `salary` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `Employees` (`id`, `salary`) VALUES
(1, 100),
(2, 200),
(3, 100),
(4, 200),
(5, 300),
(6, 50),
(7, 60),
(8, 500),
(9, 300),
(10, 200)
;

