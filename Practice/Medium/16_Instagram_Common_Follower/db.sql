DROP SCHEMA IF EXISTS 16_Instagram;
CREATE SCHEMA 16_Instagram;
USE 16_Instagram;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `practice`
--

-- --------------------------------------------------------

--
-- Table structure for table `Follow`
--

DROP TABLE IF EXISTS `Follow`;
CREATE TABLE `Follow` (
  `user_id` varchar(10) NOT NULL,
  `follower_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Follow`
--

INSERT INTO `Follow` (`user_id`, `follower_id`) VALUES
('bezos', 'david'),
('bezos', 'james'),
('bezos', 'join'),
('bezos', 'mary'),
('musk', 'david'),
('musk', 'john'),
('ronaldo', 'david'),
('ronaldo', 'james'),
('ronaldo', 'linda'),
('ronaldo', 'mary'),
('trump', 'melinda');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Follow`
--
ALTER TABLE `Follow`
  ADD PRIMARY KEY (`user_id`,`follower_id`);
