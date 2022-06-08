-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2022 at 01:59 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leafnow`
--

-- --------------------------------------------------------

--
-- Table structure for table `donate`
--

CREATE TABLE `donate` (
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `did` int(11) NOT NULL,
  `productname` varchar(100) NOT NULL,
  `productdesc` text NOT NULL,
  `price` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donate`
--

INSERT INTO `donate` (`username`, `email`, `did`, `productname`, `productdesc`, `price`) VALUES
('Prarthana', 'prarthana@gmail.com', 11100, 'Tropical Hibiscus Plant', 'Type- Flowering Plant(orange).\r\nPlant Placement- Outdoors.\r\nPlant Height- Upto 9 inches.\r\nOrigin- Asia and the Pacific islands.', 1),
('Prithvi', 'prithvi@gmail.com', 11101, 'Pumpkin Seeds', 'Type Of Seed Is Vegetable. Organic Is No. Quantity Is 20 Per Packet. Suitable For Is Outdoor.', 1),
('Gautami', 'gautami@gmail.com', 11102, 'Coconut Plant', 'Type: Fruit\r\nSuitable Location: Outdoor\r\nContainer Type: Plastic Bag\r\nHeight: 150 mm', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sell`
--

CREATE TABLE `sell` (
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pid` int(11) NOT NULL,
  `productname` varchar(100) NOT NULL,
  `productdesc` text NOT NULL,
  `price` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sell`
--

INSERT INTO `sell` (`username`, `email`, `pid`, `productname`, `productdesc`, `price`) VALUES
('Prarthana', 'prarthana@gmail.com', 100, 'Papaya Seeds', 'Type Of Seed Is Fruit. \r\nOrganic Is No. Quantity Is 20 Per Packet.\r\nSuitable For Is Outdoor.', 50),
('Prithvi', 'prithvi@gmail.com', 101, 'Basil Plant', 'Plant Type- Herbal Plant. \r\n Plant Placement- Both Indoors and Outdoors. Plant Height- Upto 9 inches Origin- India.', 100),
('Gautami', 'gautami@gmail.com', 102, 'Cotton Plant', 'Plant height: 14 - 26-inches.\r\nLight requirements: sun. Soil / water: average', 200);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(1, 'Prarthana', 'prarthana@gmail.com', 'pbkdf2:sha256:260000$MovkfOnyYN7Iys0o$1122eb466042dd09349d096fc2fc9aa96dfaddf6e1f8ce6e643ee276d8ec910a'),
(2, 'Prithvi', 'prithvi@gmail.com', 'pbkdf2:sha256:260000$ktYPLKsUGVGAGBFw$53d38d9f6ab976e3e5c3849026b93591dad540b3379f7ee8ab8cff718647441a'),
(3, 'Gautami', 'gautami@gmail.com', 'pbkdf2:sha256:260000$yfButv9ewfwqyqTX$59c31c6f8dc7e932eab80ab5c02447f132abd67541aec3ac6a0306a69c29c8dd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `donate`
--
ALTER TABLE `donate`
  ADD PRIMARY KEY (`did`),
  ADD KEY `did` (`did`);

--
-- Indexes for table `sell`
--
ALTER TABLE `sell`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `donate`
--
ALTER TABLE `donate`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11103;

--
-- AUTO_INCREMENT for table `sell`
--
ALTER TABLE `sell`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
