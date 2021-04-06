-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 06, 2021 at 01:07 PM
-- Server version: 5.7.33-0ubuntu0.18.04.1
-- PHP Version: 7.2.34-13+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nz`
--

-- --------------------------------------------------------

--
-- Table structure for table `CUSTOMER_W_TER`
--

CREATE TABLE `CUSTOMER_W_TER` (
  `CUSTOMERNUMBER` int(11) NOT NULL,
  `CUSTOMERNAME` varchar(50) NOT NULL,
  `PHONE` varchar(50) NOT NULL,
  `ADDRESS` varchar(50) NOT NULL,
  `CITY` varchar(50) NOT NULL,
  `STATE` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `DIM_TIME`
--

CREATE TABLE `DIM_TIME` (
  `TIME_ID` varchar(10) NOT NULL,
  `MONTH_ID` int(11) NOT NULL,
  `QTR_ID` int(11) NOT NULL,
  `YEAR_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ORDERFACT`
--

CREATE TABLE `ORDERFACT` (
  `ORDERNUMBER` int(11) NOT NULL,
  `PRODUCTCODE` varchar(50) NOT NULL,
  `CUSTOMERNUMBER` int(11) NOT NULL,
  `TIME_ID` varchar(10) NOT NULL,
  `QUANTITYORDERED` int(11) NOT NULL,
  `PRICEEACH` decimal(10,0) NOT NULL,
  `TOTALPRICE` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ORDERS`
--

CREATE TABLE `ORDERS` (
  `ORDERNUMBER` int(11) NOT NULL,
  `ORDERDATE` timestamp NULL DEFAULT NULL,
  `REQUIREDDATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `SHIPPEDDATE` timestamp NULL DEFAULT NULL,
  `CUSTOMERNUMBER` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PRODUCTS`
--

CREATE TABLE `PRODUCTS` (
  `PRODUCTCODE` varchar(50) NOT NULL,
  `PRODUCTNAME` varchar(70) NOT NULL,
  `PRODUCTVENDOR` varchar(50) NOT NULL,
  `STOCK` smallint(6) NOT NULL,
  `PRICEIINNZDOLLAR` bigint(20) NOT NULL,
  `MSRP` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CUSTOMER_W_TER`
--
ALTER TABLE `CUSTOMER_W_TER`
  ADD PRIMARY KEY (`CUSTOMERNUMBER`);

--
-- Indexes for table `DIM_TIME`
--
ALTER TABLE `DIM_TIME`
  ADD PRIMARY KEY (`TIME_ID`);

--
-- Indexes for table `ORDERFACT`
--
ALTER TABLE `ORDERFACT`
  ADD KEY `ORDERNUMBER` (`ORDERNUMBER`),
  ADD KEY `PRODUCTCODE` (`PRODUCTCODE`),
  ADD KEY `CUSTOMERNUMBER` (`CUSTOMERNUMBER`),
  ADD KEY `TIME_ID` (`TIME_ID`);

--
-- Indexes for table `ORDERS`
--
ALTER TABLE `ORDERS`
  ADD PRIMARY KEY (`ORDERNUMBER`);

--
-- Indexes for table `PRODUCTS`
--
ALTER TABLE `PRODUCTS`
  ADD PRIMARY KEY (`PRODUCTCODE`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ORDERFACT`
--
ALTER TABLE `ORDERFACT`
  ADD CONSTRAINT `ORDERFACT_ibfk_1` FOREIGN KEY (`ORDERNUMBER`) REFERENCES `ORDERS` (`ORDERNUMBER`) ON DELETE CASCADE,
  ADD CONSTRAINT `ORDERFACT_ibfk_2` FOREIGN KEY (`PRODUCTCODE`) REFERENCES `PRODUCTS` (`PRODUCTCODE`) ON DELETE CASCADE,
  ADD CONSTRAINT `ORDERFACT_ibfk_3` FOREIGN KEY (`CUSTOMERNUMBER`) REFERENCES `CUSTOMER_W_TER` (`CUSTOMERNUMBER`),
  ADD CONSTRAINT `ORDERFACT_ibfk_4` FOREIGN KEY (`TIME_ID`) REFERENCES `DIM_TIME` (`TIME_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
