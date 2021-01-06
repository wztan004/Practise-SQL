
DROP SCHEMA IF EXISTS Salary;
CREATE SCHEMA Salary;
USE Salary;

DROP TABLE IF EXISTS `Salary`;
CREATE TABLE `Salary` (
    `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `salary_usd` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `Salary` (`id`, `salary_usd`) VALUES
(1, 100),
(2, 200),
(3, 100),
(4, 200),
(5, 300),
(6, 50),
(7, 60),
(8, 500),
(9, 300)
;

