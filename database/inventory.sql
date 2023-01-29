-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2023 at 08:17 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `firm_id` int(11) DEFAULT NULL,
  `customer_c_name` varchar(30) DEFAULT NULL,
  `customer_name` varchar(30) NOT NULL,
  `customer_contact` bigint(20) NOT NULL,
  `customer_email` varchar(40) NOT NULL,
  `customer_address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `firm`
--

CREATE TABLE `firm` (
  `firm_id` int(11) NOT NULL,
  `firm_name` varchar(30) NOT NULL,
  `firm_alias` varchar(20) DEFAULT NULL,
  `firm_logo` longblob DEFAULT NULL,
  `firm_person` varchar(30) DEFAULT NULL,
  `firm_contact` bigint(20) DEFAULT NULL,
  `firm_user` varchar(20) NOT NULL,
  `firm_pass` varchar(20) NOT NULL,
  `firm_email` varchar(30) DEFAULT NULL,
  `firm_web` varchar(30) DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `reset_link` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `firm_id` int(11) DEFAULT NULL,
  `item_name` varchar(30) DEFAULT NULL,
  `unit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `category_id` int(11) NOT NULL,
  `firm_id` int(11) DEFAULT NULL,
  `category_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `purchase_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `firm_id` int(11) DEFAULT NULL,
  `p_inv_no` int(11) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_amt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_item`
--

CREATE TABLE `purchase_item` (
  `purchase_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `firm_id` int(11) DEFAULT NULL,
  `p_inv_no` int(11) DEFAULT NULL,
  `purchase_price` int(11) DEFAULT NULL,
  `purchase_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return`
--

CREATE TABLE `purchase_return` (
  `p_return_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `firm_id` int(11) DEFAULT NULL,
  `p_inv_no` int(11) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_amt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_item`
--

CREATE TABLE `purchase_return_item` (
  `p_return_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `firm_id` int(11) DEFAULT NULL,
  `p_inv_no` int(11) DEFAULT NULL,
  `purchase_price` int(11) DEFAULT NULL,
  `purchase_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sales_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `firm_id` int(11) DEFAULT NULL,
  `s_inv_no` int(11) DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `sales_amt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_item`
--

CREATE TABLE `sales_item` (
  `sales_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `firm_id` int(11) DEFAULT NULL,
  `s_inv_no` int(11) DEFAULT NULL,
  `sales_price` int(11) DEFAULT NULL,
  `sales_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_return`
--

CREATE TABLE `sales_return` (
  `s_return_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `firm_id` int(11) DEFAULT NULL,
  `s_inv_no` int(11) DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `sales_amt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_return_item`
--

CREATE TABLE `sales_return_item` (
  `s_return_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `firm_id` int(11) DEFAULT NULL,
  `s_inv_no` int(11) DEFAULT NULL,
  `sales_price` int(11) DEFAULT NULL,
  `sales_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `firm_id` int(11) DEFAULT NULL,
  `supplier_c_name` varchar(30) DEFAULT NULL,
  `supplier_name` varchar(30) NOT NULL,
  `supplier_contact` bigint(20) NOT NULL,
  `supplier_email` varchar(40) NOT NULL,
  `supplier_address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL,
  `firm_id` int(11) DEFAULT NULL,
  `unit_name` varchar(30) DEFAULT NULL,
  `unit_symbol` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `firm_id` (`firm_id`);

--
-- Indexes for table `firm`
--
ALTER TABLE `firm`
  ADD PRIMARY KEY (`firm_id`),
  ADD UNIQUE KEY `firm_id` (`firm_id`),
  ADD KEY `firm_id_2` (`firm_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `firm_id` (`firm_id`,`unit_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `category_id_2` (`category_id`,`firm_id`),
  ADD KEY `firm_id` (`firm_id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchase_id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `purchase_id_2` (`purchase_id`,`firm_id`);

--
-- Indexes for table `purchase_item`
--
ALTER TABLE `purchase_item`
  ADD KEY `purchase_id` (`purchase_id`,`category_id`,`item_id`,`firm_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `purchase_return`
--
ALTER TABLE `purchase_return`
  ADD PRIMARY KEY (`p_return_id`),
  ADD KEY `p_return_id` (`p_return_id`),
  ADD KEY `p_return_id_2` (`p_return_id`,`supplier_id`,`firm_id`);

--
-- Indexes for table `purchase_return_item`
--
ALTER TABLE `purchase_return_item`
  ADD KEY `p_return_id` (`p_return_id`,`category_id`,`item_id`,`firm_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`),
  ADD KEY `sales_id` (`sales_id`),
  ADD KEY `sales_id_2` (`sales_id`,`customer_id`,`firm_id`);

--
-- Indexes for table `sales_item`
--
ALTER TABLE `sales_item`
  ADD KEY `sales_id` (`sales_id`,`category_id`,`item_id`,`firm_id`);

--
-- Indexes for table `sales_return`
--
ALTER TABLE `sales_return`
  ADD PRIMARY KEY (`s_return_id`),
  ADD KEY `s_return_id` (`s_return_id`),
  ADD KEY `customer_id` (`customer_id`,`firm_id`);

--
-- Indexes for table `sales_return_item`
--
ALTER TABLE `sales_return_item`
  ADD UNIQUE KEY `s_return_id` (`s_return_id`,`category_id`,`item_id`,`firm_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `firm_id` (`firm_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`unit_id`),
  ADD UNIQUE KEY `unit_id` (`unit_id`),
  ADD KEY `unit_id_2` (`unit_id`),
  ADD KEY `firm_id` (`firm_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `firm`
--
ALTER TABLE `firm`
  MODIFY `firm_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_return`
--
ALTER TABLE `purchase_return`
  MODIFY `p_return_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_return`
--
ALTER TABLE `sales_return`
  MODIFY `s_return_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `firm`
--
ALTER TABLE `firm`
  ADD CONSTRAINT `firm_ibfk_1` FOREIGN KEY (`firm_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `firm_ibfk_2` FOREIGN KEY (`firm_id`) REFERENCES `supplier` (`supplier_id`),
  ADD CONSTRAINT `firm_ibfk_3` FOREIGN KEY (`firm_id`) REFERENCES `unit` (`firm_id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`firm_id`) REFERENCES `firm` (`firm_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`firm_id`) REFERENCES `firm` (`firm_id`);

--
-- Constraints for table `purchase_item`
--
ALTER TABLE `purchase_item`
  ADD CONSTRAINT `purchase_item_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`purchase_id`),
  ADD CONSTRAINT `purchase_item_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `product` (`category_id`);

--
-- Constraints for table `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`firm_id`) REFERENCES `firm` (`firm_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
