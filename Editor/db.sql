-- mysql < db.sql -uroot -p 
-- Select all occurences: Ctrl+F2 
DROP SCHEMA IF EXISTS Editor;
CREATE SCHEMA Editor;
USE Editor;

DROP TABLE IF EXISTS `Movie`;
CREATE TABLE `Students` (
  `Id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `year_released` varchar(10) NOT NULL,
  `box_office` int NOT NULL,
  `director_id` int NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `Class`;
CREATE TABLE `Class` (
  `Id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Name` enum('Math','English') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `Students` (`Name`, `Grade`, `ClassId`,`Date`) VALUES
('Joe', 70, 1,'2017-01-04'),
('Jim', 90, 1,'2017-01-04'),
('Henry', 80, 2,'2017-01-04'),
('Sam', 60, 2,'2017-01-04'),
('Max', 90, 1,'2017-01-04');

INSERT INTO `Class` (`Name`) VALUES
('Math'),
('English');