DROP SCHEMA IF EXISTS 03_MAU;
CREATE SCHEMA 03_MAU;
USE 03_MAU;


-- --------------------------------------------------------

--
-- Table structure for table `UserHistory`
--

DROP TABLE IF EXISTS `UserHistory`;
CREATE TABLE `UserHistory` (
  `user_id` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `action` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `UserHistory` (`user_id`, `date`, `action`) VALUES
('sanhoo', '2019-01-01', 'logged_on'),
('niceguy', '2019-01-22', 'logged_on'),
('shaw123', '2019-02-03', 'logged_on'),
('shaw123', '2019-02-20', 'logged_on'),
('sanhoo', '2019-02-27', 'logged_on'),
('shaw123', '2019-03-12', 'signed_up');

ALTER TABLE `UserHistory`
  ADD PRIMARY KEY (`user_id`, `date`);