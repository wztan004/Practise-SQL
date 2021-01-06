
DROP SCHEMA IF EXISTS Online_Sales;
CREATE SCHEMA Online_Sales;
USE Online_Sales;

DROP TABLE IF EXISTS `buy_sell`;
CREATE TABLE `buy_sell` (
  `seller_id` int NOT NULL,
  `buyer_id` int NOT NULL,
  `purchase_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `buy_sell` (`seller_id`, `buyer_id`, `purchase_date`) VALUES
(1, 2, '2016-06-03'),
(1, 3, '2016-06-08'),
(2, 3, '2016-06-08'),
(3, 4, '2016-06-09');

