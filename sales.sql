-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2022 at 08:55 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sales`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) NOT NULL,
  `categoryId` int(10) NOT NULL,
  `categoryName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryId`, `categoryName`) VALUES
(1, 1, 'Clothes'),
(2, 2, 'Electronics'),
(7, 3, 'Grocery'),
(4, 4, 'Furniture'),
(5, 5, 'Medicine'),
(8, 6, 'Books'),
(6, 7, 'Toys');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Id` int(10) NOT NULL,
  `productId` int(10) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `fk_category_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Id`, `productId`, `productName`, `fk_category_id`) VALUES
(1, 1, 'Shirt ', 1),
(2, 2, 'Doll', 7),
(3, 3, 'Rice', 3),
(4, 4, 'Wheat', 3),
(5, 5, 'Crocin', 5),
(6, 6, 'Dolo-650', 5),
(7, 7, 'Building-Block', 7),
(8, 8, 'Table', 4),
(9, 9, 'Pant', 1),
(10, 10, 'T-Shirt', 1),
(11, 11, 'Milk', 3),
(12, 12, 'Computer', 2),
(13, 13, 'Sweater', 1),
(14, 14, 'In Search of Lost Time by Marcel Proust', 6),
(15, 15, 'Cradle', 4),
(16, 16, 'Hydrocodone', 5),
(17, 17, 'Bread', 3),
(18, 18, 'Basket chair', 4),
(19, 19, 'Air purifier', 2),
(20, 20, 'Barbie', 7),
(21, 21, 'Jacket', 1),
(22, 22, 'Ulysses by James Joyce', 6),
(23, 23, 'Don Quixote by Miguel de Cervantes', 6),
(24, 24, 'Bench', 4),
(25, 25, 'Seafood', 3),
(26, 26, 'Metformin', 5),
(27, 27, 'Coat', 1),
(28, 28, 'One Hundred Years of Solitude by Gabriel Garcia Marquez', 6),
(29, 29, 'couch', 4),
(30, 30, 'chicken', 3),
(31, 31, 'Losartan', 5),
(32, 32, 'Dominoes', 7),
(33, 33, 'stool', 4),
(34, 34, 'jeans', 1),
(35, 35, 'The Great Gatsby by F. Scott Fitzgerald', 6),
(36, 36, 'cabinets', 4),
(37, 37, 'socks', 1),
(38, 38, 'Pasta', 3),
(39, 39, 'Antibiotics', 5),
(40, 40, 'Frisbee', 7),
(41, 41, 'Alarm clock', 2),
(42, 42, 'Moby Dick by Herman Melville\r', 6),
(43, 43, 'Calculator', 2),
(44, 44, 'shorts', 1),
(45, 45, 'wardrobe', 4),
(46, 46, 'Tomato sauce', 3),
(47, 47, 'G.I. Joe', 7),
(48, 48, 'Ceiling fan', 2),
(49, 49, 'tracksuit', 1),
(50, 50, 'War and Peace by Leo Tolstoy', 6),
(51, 51, 'Chair', 4),
(52, 52, 'Hamlet by William Shakespeare', 6),
(53, 53, 'vest', 1),
(54, 54, 'Mustard', 3),
(55, 55, 'Albuterol', 5),
(56, 56, 'Hula Hoop', 7),
(57, 57, 'Gabapentin', 5),
(58, 58, 'Coffee maker', 2),
(59, 59, 'Stool', 4),
(60, 60, 'pajamas', 1),
(61, 61, 'Antihistamines', 5),
(62, 62, 'Digital camera', 2),
(63, 63, 'The Odyssey by Homer', 6),
(64, 64, 'raincoat', 1),
(65, 65, 'vinegar', 3),
(66, 66, 'teddy bear.', 7),
(67, 67, 'Recliner', 4),
(68, 68, 'Electric grill', 2),
(69, 69, 'rubber ducky', 7),
(70, 70, 'Omeprazole', 5),
(71, 71, 'kite.', 7),
(72, 72, 'tanktop', 1),
(73, 73, 'Earphones', 2),
(74, 74, 'Levothyroxine', 5),
(75, 75, 'pepper', 3),
(76, 76, 'Sofa bed', 4),
(77, 77, 'Atorvastatin', 5),
(78, 78, 'swimsuit', 1),
(79, 79, 'Madame Bovary by Gustave Flaubert', 6),
(80, 80, 'Fidget Spinner', 7),
(81, 81, 'Washing machine', 2),
(82, 82, 'shawl', 1),
(83, 83, 'Lolita by Vladimir Nabokov', 6),
(84, 84, 'Bathroom cabinet', 4),
(85, 85, 'suit', 1),
(86, 86, 'The Divine Comedy by Dante Alighieri', 6),
(87, 87, 'blouse', 1),
(88, 88, 'Cupboard', 4),
(89, 89, 'Vacuum cleaner', 2),
(90, 90, 'Wuthering Heights by Emily Brontë', 6),
(91, 91, 'dress', 1),
(92, 92, 'Hot Wheels', 7),
(93, 93, 'Laser printer', 2),
(94, 94, 'Crime and Punishment by Fyodor Dostoyevsky', 6),
(95, 95, 'stockings', 1),
(96, 96, 'Desk', 4),
(97, 97, 'Television', 2),
(98, 98, 'He-Man', 7),
(99, 99, 'skirt', 1),
(100, 100, 'The Brothers Karamazov by Fyodor Dostoyevsky', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_category_id` (`fk_category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`fk_category_id`) REFERENCES `category` (`categoryId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
