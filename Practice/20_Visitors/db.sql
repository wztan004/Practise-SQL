
DROP SCHEMA IF EXISTS Visitors;
CREATE SCHEMA Visitors;
USE Visitors;

DROP TABLE IF EXISTS `visitors`;
CREATE TABLE `visitors` (
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `visit_date` date,
  `people` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `visitors` (`visit_date`, `people`) VALUES
('2017-01-01', 10),
('2017-01-02', 109),
('2017-01-03', 150),
('2017-01-04', 99),
('2017-01-05', 145),
('2017-01-06', 1455),
('2017-01-07', 199),
('2017-01-08', 188);