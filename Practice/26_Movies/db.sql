
DROP SCHEMA IF EXISTS 26_Movies;
CREATE SCHEMA 26_Movies;
USE 26_Movies;

DROP TABLE IF EXISTS `movies`;
CREATE TABLE `movies` (
    `id` int,
    `name` varchar(20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ticket_reservation`;
CREATE TABLE `ticket_reservation` (
    `id` int,
    `movie_id` int,
    `quantity` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `movies` (`id`, `name`) VALUES
(1, "Beauty and the Beast"),
(2, "Coco"),
(3, "Cinderella")
;

INSERT INTO `ticket_reservation` (`id`, `movie_id`, `quantity`) VALUES
(1, 1, 2),
(2, 1, 5),
(3, 1, 3),
(4, 2, 8),
(5, 2, 3)
;



