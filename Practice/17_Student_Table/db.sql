
DROP SCHEMA IF EXISTS Student;
CREATE SCHEMA Student;
USE Student;

DROP TABLE IF EXISTS `Student`;
CREATE TABLE `Student` (
  `Id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Name` varchar(10) NOT NULL,
  `Grade` int NOT NULL,
  `ClassId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `Class`;
CREATE TABLE `Class` (
  `Id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Name` enum('Math','English') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `Student` (`Name`, `Grade`, `ClassId`) VALUES
('Joe', 70, 1),
('Jim', 90, 1),
('Henry', 80, 2),
('Sam', 60, 2),
('Max', 90, 1);

INSERT INTO `Class` (`Name`) VALUES
('Math'),
('English');