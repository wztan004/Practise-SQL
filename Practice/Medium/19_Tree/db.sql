
DROP SCHEMA IF EXISTS 19_Tree;
CREATE SCHEMA 19_Tree;
USE 19_Tree;

DROP TABLE IF EXISTS `tree`;
CREATE TABLE `tree` (
  `id` int NOT NULL,
  `p_id` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `tree` (`id`, `p_id`) VALUES
(1, NULL),
(2, 1),
(3, 1),
(4, 2),
(5, 2);