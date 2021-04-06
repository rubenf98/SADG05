-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 31-Mar-2021 às 19:41
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `australia_db`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `customers_w_ter`
--

CREATE TABLE `customers_w_ter` (
  `CUSTOMERNUMBER` int(11) DEFAULT NULL,
  `CUSTOMERNAME` varchar(50) DEFAULT NULL,
  `PHONE` varchar(50) DEFAULT NULL,
  `ADDRESSLINE1` varchar(50) DEFAULT NULL,
  `CITY` varchar(50) DEFAULT NULL,
  `STATE` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `customers_w_ter`
--

INSERT INTO `customers_w_ter` (`CUSTOMERNUMBER`, `CUSTOMERNAME`, `PHONE`, `ADDRESSLINE1`, `CITY`, `STATE`) VALUES
(114, 'Australian Collectors, Co.', '03 9520 4555', '636 St Kilda Road', 'Melbourne', 'Victoria'),
(276, 'Anna\'s Decorations, Ltd', '02 9936 8555', '201 Miller Street', 'North Sydney', 'NSW'),
(282, 'Souveniers And Things Co.', '+61 2 9495 8555', 'Monitor Money Building, 815 Pacific Hwy', 'Chatswood', 'NSW'),
(333, 'Australian Gift Network, Co', '61-7-3844-6555', '31 Duncan St. West End', 'South Brisbane', 'Queensland'),
(471, 'Australian Collectables, Ltd', '61-9-3844-6555', '7 Allen Street', 'Glen Waverly', 'Victoria');

-- --------------------------------------------------------

--
-- Estrutura da tabela `dim_time`
--

CREATE TABLE `dim_time` (
  `TIME_ID` varchar(10) DEFAULT NULL,
  `MONTH_ID` int(11) DEFAULT NULL,
  `QTR_ID` int(11) DEFAULT NULL,
  `YEAR_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `dim_time`
--

INSERT INTO `dim_time` (`TIME_ID`, `MONTH_ID`, `QTR_ID`, `YEAR_ID`) VALUES
('2003-04-29', 4, 2, 2003),
('2003-05-21', 5, 2, 2003),
('2003-07-16', 7, 3, 2003),
('2003-09-11', 9, 3, 2003),
('2003-09-25', 9, 3, 2003),
('2003-11-04', 11, 4, 2003),
('2003-11-06', 11, 4, 2003),
('2003-11-21', 11, 4, 2003),
('2004-02-20', 2, 1, 2004),
('2004-07-02', 7, 3, 2004),
('2004-07-19', 7, 3, 2004),
('2004-11-24', 11, 4, 2004),
('2004-11-29', 11, 4, 2004),
('2004-12-17', 12, 4, 2004),
('2005-01-20', 1, 1, 2005),
('2005-02-02', 2, 1, 2005),
('2005-03-09', 3, 1, 2005),
('2005-05-09', 5, 2, 2005),
('2005-05-29', 5, 2, 2005);

-- --------------------------------------------------------

--
-- Estrutura da tabela `orderfact`
--

CREATE TABLE `orderfact` (
  `ORDERNUMBER` int(11) DEFAULT NULL,
  `PRODUCTCODE` varchar(50) DEFAULT NULL,
  `CUSTOMERNUMBER` int(11) DEFAULT NULL,
  `TIME_ID` varchar(10) DEFAULT NULL,
  `QUANTITYORDERED` int(11) DEFAULT NULL,
  `PRICEEACH` decimal(16,2) DEFAULT NULL,
  `TOTALPRICE` decimal(16,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `orderfact`
--

INSERT INTO `orderfact` (`ORDERNUMBER`, `PRODUCTCODE`, `CUSTOMERNUMBER`, `TIME_ID`, `QUANTITYORDERED`, `PRICEEACH`, `TOTALPRICE`) VALUES
(10120, 'S10_2016', 114, '2003-04-29', 29, '126.21', '3659.96'),
(10120, 'S10_4698', 114, '2003-04-29', 46, '131.00', '12136.97'),
(10120, 'S18_2581', 114, '2003-04-29', 29, '94.07', '2728.06'),
(10120, 'S18_2625', 114, '2003-04-29', 46, '76.18', '3504.12'),
(10120, 'S24_1578', 114, '2003-04-29', 35, '128.45', '4495.59'),
(10120, 'S24_1785', 114, '2003-04-29', 39, '131.00', '6093.50'),
(10120, 'S24_2000', 114, '2003-04-29', 34, '109.76', '3732.01'),
(10120, 'S24_4278', 114, '2003-04-29', 29, '111.99', '3247.77'),
(10120, 'S32_1374', 114, '2003-04-29', 22, '131.00', '3224.38'),
(10120, 'S32_4289', 114, '2003-04-29', 29, '94.62', '2744.02'),
(10120, 'S50_1341', 114, '2003-04-29', 49, '66.31', '3249.30'),
(10120, 'S700_1691', 114, '2003-04-29', 47, '107.70', '5061.67'),
(10120, 'S700_2466', 114, '2003-04-29', 24, '131.00', '3386.09'),
(10120, 'S700_2834', 114, '2003-04-29', 24, '131.00', '4476.43'),
(10120, 'S700_3167', 114, '2003-04-29', 43, '99.56', '4281.08'),
(10125, 'S18_1342', 114, '2003-05-21', 32, '131.00', '4263.68'),
(10125, 'S18_2795', 114, '2003-05-21', 34, '131.00', '8493.33'),
(10139, 'S18_1342', 282, '2003-07-16', 31, '131.00', '4172.27'),
(10139, 'S18_1367', 282, '2003-07-16', 49, '56.50', '2768.51'),
(10139, 'S18_2795', 282, '2003-07-16', 41, '131.00', '10422.96'),
(10139, 'S18_2949', 282, '2003-07-16', 46, '131.00', '7264.95'),
(10139, 'S18_2957', 282, '2003-07-16', 20, '93.27', '1865.44'),
(10139, 'S18_3136', 282, '2003-07-16', 20, '117.98', '2359.57'),
(10139, 'S18_3320', 282, '2003-07-16', 30, '131.00', '4054.97'),
(10139, 'S24_4258', 282, '2003-07-16', 29, '131.00', '4291.73'),
(10148, 'S18_1129', 276, '2003-09-11', 23, '131.00', '3539.67'),
(10148, 'S18_1589', 276, '2003-09-11', 47, '131.00', '7661.77'),
(10148, 'S18_1984', 276, '2003-09-11', 25, '131.00', '5543.92'),
(10148, 'S18_2870', 276, '2003-09-11', 27, '131.00', '4622.15'),
(10148, 'S18_3232', 276, '2003-09-11', 32, '131.00', '7098.73'),
(10148, 'S18_3685', 276, '2003-09-11', 28, '131.00', '4767.67'),
(10148, 'S18_4409', 276, '2003-09-11', 34, '131.00', '4713.67'),
(10148, 'S18_4933', 276, '2003-09-11', 29, '106.44', '3086.69'),
(10148, 'S24_1046', 276, '2003-09-11', 25, '78.94', '1973.52'),
(10148, 'S24_1628', 276, '2003-09-11', 47, '74.47', '3500.25'),
(10148, 'S24_2766', 276, '2003-09-11', 21, '96.42', '2024.74'),
(10148, 'S24_2887', 276, '2003-09-11', 34, '131.00', '5753.68'),
(10148, 'S24_3191', 276, '2003-09-11', 31, '96.44', '2989.71'),
(10148, 'S24_3432', 276, '2003-09-11', 27, '131.00', '4545.04'),
(10152, 'S18_4027', 333, '2003-09-25', 35, '131.00', '5926.57'),
(10152, 'S24_1444', 333, '2003-09-25', 25, '85.56', '2138.90'),
(10152, 'S24_4048', 333, '2003-09-25', 23, '131.00', '3670.74'),
(10152, 'S32_3207', 333, '2003-09-25', 33, '66.74', '2202.57'),
(10169, 'S12_1099', 276, '2003-11-04', 30, '131.00', '6576.07'),
(10169, 'S12_2823', 276, '2003-11-04', 35, '131.00', '6077.42'),
(10169, 'S12_3990', 276, '2003-11-04', 36, '83.63', '3010.69'),
(10169, 'S18_3278', 276, '2003-11-04', 32, '92.70', '2966.26'),
(10169, 'S18_3482', 276, '2003-11-04', 36, '131.00', '5822.85'),
(10169, 'S18_3782', 276, '2003-11-04', 38, '89.59', '3404.45'),
(10169, 'S18_4721', 276, '2003-11-04', 33, '131.00', '6432.62'),
(10169, 'S24_2360', 276, '2003-11-04', 38, '97.08', '3689.20'),
(10169, 'S24_3371', 276, '2003-11-04', 34, '65.78', '2236.35'),
(10169, 'S24_4620', 276, '2003-11-04', 24, '123.90', '2973.60'),
(10169, 'S32_2206', 276, '2003-11-04', 26, '52.18', '1356.61'),
(10169, 'S32_4485', 276, '2003-11-04', 34, '131.00', '5136.35'),
(10169, 'S50_4713', 276, '2003-11-04', 48, '105.52', '5064.98'),
(10174, 'S10_1949', 333, '2003-11-06', 34, '131.00', '10499.41'),
(10174, 'S12_1666', 333, '2003-11-06', 43, '131.00', '8930.56'),
(10174, 'S18_1097', 333, '2003-11-06', 48, '122.28', '5869.22'),
(10174, 'S18_2949', 333, '2003-11-06', 46, '131.00', '7325.81'),
(10174, 'S18_4668', 333, '2003-11-06', 49, '58.66', '2874.43'),
(10193, 'S18_1342', 471, '2003-11-21', 28, '131.00', '4070.01'),
(10193, 'S18_1367', 471, '2003-11-21', 46, '69.91', '3216.08'),
(10193, 'S18_1749', 471, '2003-11-21', 21, '131.00', '4115.50'),
(10193, 'S18_2248', 471, '2003-11-21', 42, '77.72', '3264.34'),
(10193, 'S18_2325', 471, '2003-11-21', 44, '131.00', '6082.17'),
(10193, 'S18_2795', 471, '2003-11-21', 22, '131.00', '4814.67'),
(10193, 'S18_2949', 471, '2003-11-21', 28, '122.11', '3418.94'),
(10193, 'S18_2957', 471, '2003-11-21', 24, '67.91', '1629.85'),
(10193, 'S18_3136', 471, '2003-11-21', 23, '131.00', '3628.56'),
(10193, 'S18_3320', 471, '2003-11-21', 32, '103.97', '3327.19'),
(10193, 'S18_4409', 471, '2003-11-21', 24, '127.79', '3066.97'),
(10193, 'S18_4933', 471, '2003-11-21', 25, '99.90', '2497.52'),
(10193, 'S24_1937', 471, '2003-11-21', 26, '38.27', '994.89'),
(10193, 'S24_2022', 471, '2003-11-21', 20, '66.31', '1326.24'),
(10193, 'S24_3969', 471, '2003-11-21', 22, '53.75', '1182.48'),
(10193, 'S24_4258', 471, '2003-11-21', 20, '131.00', '2985.49'),
(10223, 'S10_1678', 114, '2004-02-20', 37, '131.00', '5195.01'),
(10223, 'S10_2016', 114, '2004-02-20', 47, '131.00', '7103.33'),
(10223, 'S10_4698', 114, '2004-02-20', 49, '131.00', '12803.98'),
(10223, 'S18_2581', 114, '2004-02-20', 47, '131.00', '6189.63'),
(10223, 'S18_2625', 114, '2004-02-20', 28, '79.35', '2221.71'),
(10223, 'S24_1578', 114, '2004-02-20', 32, '119.59', '3826.88'),
(10223, 'S24_1785', 114, '2004-02-20', 34, '131.00', '4727.48'),
(10223, 'S24_2000', 114, '2004-02-20', 38, '90.80', '3450.25'),
(10223, 'S24_4278', 114, '2004-02-20', 23, '97.75', '2248.30'),
(10223, 'S32_1374', 114, '2004-02-20', 21, '131.00', '3242.60'),
(10223, 'S32_4289', 114, '2004-02-20', 20, '86.51', '1730.25'),
(10223, 'S50_1341', 114, '2004-02-20', 41, '60.60', '2484.62'),
(10223, 'S700_1691', 114, '2004-02-20', 25, '131.00', '3320.52'),
(10223, 'S700_2834', 114, '2004-02-20', 29, '131.00', '4191.82'),
(10223, 'S700_3167', 114, '2004-02-20', 26, '88.03', '2288.83'),
(10265, 'S18_3278', 471, '2004-07-02', 45, '113.76', '5119.22'),
(10265, 'S18_3482', 471, '2004-07-02', 49, '131.00', '11039.40'),
(10270, 'S10_1949', 282, '2004-07-19', 21, '131.00', '6426.06'),
(10270, 'S10_4962', 282, '2004-07-19', 32, '131.00', '5635.72'),
(10270, 'S12_1666', 282, '2004-07-19', 28, '131.00', '5364.08'),
(10270, 'S18_1097', 282, '2004-07-19', 43, '126.86', '5455.00'),
(10270, 'S18_2949', 282, '2004-07-19', 31, '126.07', '3908.31'),
(10270, 'S18_3136', 282, '2004-07-19', 38, '131.00', '6255.35'),
(10270, 'S18_4600', 282, '2004-07-19', 38, '131.00', '7051.83'),
(10270, 'S18_4668', 282, '2004-07-19', 44, '76.45', '3363.87'),
(10270, 'S32_1268', 282, '2004-07-19', 32, '112.29', '3593.38'),
(10270, 'S32_3522', 282, '2004-07-19', 21, '82.99', '1742.76'),
(10270, 'S700_2824', 282, '2004-07-19', 46, '115.28', '5302.88'),
(10342, 'S18_1129', 114, '2004-11-24', 40, '131.00', '8455.26'),
(10342, 'S18_1889', 114, '2004-11-24', 55, '85.74', '4715.67'),
(10342, 'S18_1984', 114, '2004-11-24', 22, '131.00', '4140.57'),
(10342, 'S18_3232', 114, '2004-11-24', 30, '131.00', '6588.64'),
(10342, 'S18_3278', 114, '2004-11-24', 25, '87.43', '2185.74'),
(10342, 'S18_3482', 114, '2004-11-24', 55, '131.00', '8578.27'),
(10342, 'S18_3782', 114, '2004-11-24', 26, '73.29', '1905.66'),
(10342, 'S18_4721', 114, '2004-11-24', 38, '131.00', '8222.16'),
(10342, 'S24_2972', 114, '2004-11-24', 39, '52.92', '2064.04'),
(10342, 'S24_3371', 114, '2004-11-24', 48, '81.81', '3926.86'),
(10342, 'S24_3856', 114, '2004-11-24', 42, '131.00', '6567.74'),
(10347, 'S10_1949', 114, '2004-11-29', 30, '131.00', '5167.56'),
(10347, 'S10_4962', 114, '2004-11-29', 27, '131.00', '5800.68'),
(10347, 'S12_1666', 114, '2004-11-29', 29, '131.00', '4698.22'),
(10347, 'S18_1097', 114, '2004-11-29', 42, '64.98', '2728.99'),
(10347, 'S18_1367', 114, '2004-11-29', 21, '77.22', '1621.71'),
(10347, 'S18_2432', 114, '2004-11-29', 50, '131.00', '8953.20'),
(10347, 'S18_2795', 114, '2004-11-29', 21, '131.00', '6308.04'),
(10347, 'S18_2949', 114, '2004-11-29', 48, '131.00', '6306.86'),
(10347, 'S18_2957', 114, '2004-11-29', 34, '85.10', '2893.32'),
(10347, 'S18_3136', 114, '2004-11-29', 45, '131.00', '6482.14'),
(10347, 'S18_3320', 114, '2004-11-29', 26, '131.00', '3480.59'),
(10347, 'S18_4600', 114, '2004-11-29', 45, '131.00', '7708.89'),
(10361, 'S10_1678', 282, '2004-12-17', 20, '95.04', '1900.81'),
(10361, 'S10_2016', 282, '2004-12-17', 26, '67.01', '1742.17'),
(10361, 'S24_3420', 282, '2004-12-17', 34, '131.00', '5072.22'),
(10361, 'S24_3949', 282, '2004-12-17', 26, '131.00', '4861.38'),
(10361, 'S24_4278', 282, '2004-12-17', 25, '81.82', '2045.56'),
(10361, 'S32_4289', 282, '2004-12-17', 49, '94.75', '4642.86'),
(10361, 'S50_1341', 282, '2004-12-17', 33, '108.19', '3570.37'),
(10361, 'S700_1691', 282, '2004-12-17', 20, '79.31', '1586.15'),
(10361, 'S700_2047', 282, '2004-12-17', 24, '59.46', '1427.06'),
(10361, 'S700_2466', 282, '2004-12-17', 26, '131.00', '3608.66'),
(10361, 'S700_2834', 282, '2004-12-17', 44, '94.87', '4174.29'),
(10361, 'S700_3167', 282, '2004-12-17', 44, '131.00', '6552.52'),
(10361, 'S700_4002', 282, '2004-12-17', 35, '131.00', '5603.33'),
(10361, 'S72_1253', 282, '2004-12-17', 23, '124.71', '2868.38'),
(10370, 'S10_4962', 276, '2005-01-20', 35, '85.98', '3009.14'),
(10370, 'S12_1666', 276, '2005-01-20', 49, '131.00', '11095.88'),
(10370, 'S18_1097', 276, '2005-01-20', 27, '131.00', '5124.05'),
(10370, 'S18_2319', 276, '2005-01-20', 22, '131.00', '5173.19'),
(10370, 'S18_2432', 276, '2005-01-20', 22, '126.89', '2791.51'),
(10370, 'S18_3232', 276, '2005-01-20', 27, '74.47', '2010.78'),
(10370, 'S18_4600', 276, '2005-01-20', 29, '75.36', '2185.56'),
(10370, 'S18_4668', 276, '2005-01-20', 20, '131.00', '3576.30'),
(10370, 'S32_3522', 276, '2005-01-20', 25, '131.00', '4139.93'),
(10374, 'S10_2016', 333, '2005-02-02', 39, '131.00', '6927.29'),
(10374, 'S10_4698', 333, '2005-02-02', 22, '131.00', '5023.04'),
(10374, 'S18_2581', 333, '2005-02-02', 42, '90.74', '3811.24'),
(10374, 'S18_2625', 333, '2005-02-02', 22, '69.82', '1536.11'),
(10374, 'S24_1578', 333, '2005-02-02', 38, '131.00', '5498.20'),
(10374, 'S24_1785', 333, '2005-02-02', 46, '123.27', '5670.47'),
(10391, 'S10_1949', 276, '2005-03-09', 24, '131.00', '3165.69'),
(10391, 'S10_4962', 276, '2005-03-09', 37, '61.44', '2273.24'),
(10391, 'S12_1666', 276, '2005-03-09', 39, '82.79', '3228.89'),
(10391, 'S18_1097', 276, '2005-03-09', 29, '111.48', '3232.95'),
(10391, 'S18_1342', 276, '2005-03-09', 35, '131.00', '7269.06'),
(10391, 'S18_1367', 276, '2005-03-09', 42, '131.00', '6547.38'),
(10391, 'S18_2432', 276, '2005-03-09', 44, '50.44', '2219.14'),
(10391, 'S18_2949', 276, '2005-03-09', 32, '59.28', '1896.88'),
(10391, 'S24_1937', 276, '2005-03-09', 33, '131.00', '10931.57'),
(10391, 'S24_2022', 276, '2005-03-09', 24, '131.00', '5295.12'),
(10415, 'S18_3856', 471, '2005-05-09', 51, '131.00', '8134.12'),
(10415, 'S24_2841', 471, '2005-05-09', 21, '88.84', '1865.73'),
(10415, 'S24_3420', 471, '2005-05-09', 18, '91.31', '1643.53'),
(10415, 'S700_2047', 471, '2005-05-09', 32, '125.69', '4022.22'),
(10415, 'S72_1253', 471, '2005-05-09', 42, '75.47', '3169.70'),
(10420, 'S18_1749', 282, '2005-05-29', 37, '131.00', '6921.52'),
(10420, 'S18_2248', 282, '2005-05-29', 36, '83.28', '2997.96'),
(10420, 'S18_2325', 282, '2005-05-29', 45, '131.00', '6519.87'),
(10420, 'S18_4409', 282, '2005-05-29', 66, '121.76', '8036.46'),
(10420, 'S18_4933', 282, '2005-05-29', 36, '75.63', '2722.55'),
(10420, 'S24_1046', 282, '2005-05-29', 60, '84.72', '5083.06'),
(10420, 'S24_1628', 282, '2005-05-29', 37, '79.08', '2926.13'),
(10420, 'S24_1937', 282, '2005-05-29', 45, '35.21', '1584.58'),
(10420, 'S24_2766', 282, '2005-05-29', 39, '131.00', '5153.45'),
(10420, 'S24_2887', 282, '2005-05-29', 55, '126.15', '6938.42'),
(10420, 'S24_3191', 282, '2005-05-29', 35, '126.73', '4435.53'),
(10420, 'S24_3432', 282, '2005-05-29', 26, '131.00', '3428.48'),
(10420, 'S24_3969', 282, '2005-05-29', 15, '56.97', '854.58');

-- --------------------------------------------------------

--
-- Estrutura da tabela `orders`
--

CREATE TABLE `orders` (
  `ORDERNUMBER` int(11) DEFAULT NULL,
  `ORDERDATE` datetime DEFAULT NULL,
  `REQUIREDDATE` datetime DEFAULT NULL,
  `SHIPPEDDATE` datetime DEFAULT NULL,
  `CUSTOMERNUMBER` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `orders`
--

INSERT INTO `orders` (`ORDERNUMBER`, `ORDERDATE`, `REQUIREDDATE`, `SHIPPEDDATE`, `CUSTOMERNUMBER`) VALUES
(10120, '2003-04-29 00:00:00', '2003-05-08 00:00:00', '2003-05-01 00:00:00', 114),
(10125, '2003-05-21 00:00:00', '2003-05-27 00:00:00', '2003-05-24 00:00:00', 114),
(10139, '2003-07-16 00:00:00', '2003-07-23 00:00:00', '2003-07-21 00:00:00', 282),
(10148, '2003-09-11 00:00:00', '2003-09-21 00:00:00', '2003-09-15 00:00:00', 276),
(10152, '2003-09-25 00:00:00', '2003-10-03 00:00:00', '2003-10-01 00:00:00', 333),
(10169, '2003-11-04 00:00:00', '2003-11-14 00:00:00', '2003-11-09 00:00:00', 276),
(10174, '2003-11-06 00:00:00', '2003-11-15 00:00:00', '2003-11-10 00:00:00', 333),
(10193, '2003-11-21 00:00:00', '2003-11-28 00:00:00', '2003-11-27 00:00:00', 471),
(10223, '2004-02-20 00:00:00', '2004-02-29 00:00:00', '2004-02-24 00:00:00', 114),
(10265, '2004-07-02 00:00:00', '2004-07-09 00:00:00', '2004-07-07 00:00:00', 471),
(10270, '2004-07-19 00:00:00', '2004-07-27 00:00:00', '2004-07-24 00:00:00', 282),
(10342, '2004-11-24 00:00:00', '2004-12-01 00:00:00', '2004-11-29 00:00:00', 114),
(10347, '2004-11-29 00:00:00', '2004-12-07 00:00:00', '2004-11-30 00:00:00', 114),
(10361, '2004-12-17 00:00:00', '2004-12-24 00:00:00', '2004-12-20 00:00:00', 282),
(10370, '2005-01-20 00:00:00', '2005-02-01 00:00:00', '2005-01-25 00:00:00', 276),
(10374, '2005-02-02 00:00:00', '2005-02-09 00:00:00', '2005-02-03 00:00:00', 333),
(10391, '2005-03-09 00:00:00', '2005-03-20 00:00:00', '2005-03-15 00:00:00', 276),
(10415, '2005-05-09 00:00:00', '2005-05-20 00:00:00', '2005-05-12 00:00:00', 471),
(10420, '2005-05-29 00:00:00', '2005-06-07 00:00:00', NULL, 282);

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--

CREATE TABLE `products` (
  `PRODUCTCODE` varchar(50) DEFAULT NULL,
  `PRODUCTNAME` varchar(70) DEFAULT NULL,
  `PRODUCTVENDOR` varchar(50) DEFAULT NULL,
  `QUANTITYINSTOCK` int(11) DEFAULT NULL,
  `BUYPRICE` decimal(16,2) DEFAULT NULL,
  `MSRP` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `products`
--

INSERT INTO `products` (`PRODUCTCODE`, `PRODUCTNAME`, `PRODUCTVENDOR`, `QUANTITYINSTOCK`, `BUYPRICE`, `MSRP`) VALUES
('S10_1678', '1969 Harley Davidson Ultimate Chopper', 'Min Lin Diecast', 7933, '64.19', 96),
('S10_1678', '1969 Harley Davidson Ultimate Chopper', 'Min Lin Diecast', 7933, '64.19', 96),
('S10_1949', '1952 Alpine Renault 1300', 'Classic Metal Creations', 7305, '129.69', 214),
('S10_1949', '1952 Alpine Renault 1300', 'Classic Metal Creations', 7305, '129.69', 214),
('S10_1949', '1952 Alpine Renault 1300', 'Classic Metal Creations', 7305, '129.69', 214),
('S10_1949', '1952 Alpine Renault 1300', 'Classic Metal Creations', 7305, '129.69', 214),
('S10_2016', '1996 Moto Guzzi 1100i', 'Highway 66 Mini Classics', 6625, '90.39', 119),
('S10_2016', '1996 Moto Guzzi 1100i', 'Highway 66 Mini Classics', 6625, '90.39', 119),
('S10_2016', '1996 Moto Guzzi 1100i', 'Highway 66 Mini Classics', 6625, '90.39', 119),
('S10_2016', '1996 Moto Guzzi 1100i', 'Highway 66 Mini Classics', 6625, '90.39', 119),
('S10_4698', '2003 Harley-Davidson Eagle Drag Bike', 'Red Start Diecast', 5582, '119.21', 194),
('S10_4698', '2003 Harley-Davidson Eagle Drag Bike', 'Red Start Diecast', 5582, '119.21', 194),
('S10_4698', '2003 Harley-Davidson Eagle Drag Bike', 'Red Start Diecast', 5582, '119.21', 194),
('S10_4962', '1962 LanciaA Delta 16V', 'Second Gear Diecast', 6791, '134.93', 148),
('S10_4962', '1962 LanciaA Delta 16V', 'Second Gear Diecast', 6791, '134.93', 148),
('S10_4962', '1962 LanciaA Delta 16V', 'Second Gear Diecast', 6791, '134.93', 148),
('S10_4962', '1962 LanciaA Delta 16V', 'Second Gear Diecast', 6791, '134.93', 148),
('S12_1099', '1968 Ford Mustang', 'Autoart Studio Design', 68, '124.45', 195),
('S12_1666', '1958 Setra Bus', 'Welly Diecast Productions', 1579, '102.18', 137),
('S12_1666', '1958 Setra Bus', 'Welly Diecast Productions', 1579, '102.18', 137),
('S12_1666', '1958 Setra Bus', 'Welly Diecast Productions', 1579, '102.18', 137),
('S12_1666', '1958 Setra Bus', 'Welly Diecast Productions', 1579, '102.18', 137),
('S12_1666', '1958 Setra Bus', 'Welly Diecast Productions', 1579, '102.18', 137),
('S12_2823', '2002 Suzuki XREO', 'Unimax Art Galleries', 9997, '86.46', 151),
('S12_3990', '1970 Plymouth Hemi Cuda', 'Studio M Art Models', 5663, '41.92', 80),
('S18_1097', '1940 Ford Pickup Truck', 'Studio M Art Models', 2613, '75.98', 117),
('S18_1097', '1940 Ford Pickup Truck', 'Studio M Art Models', 2613, '75.98', 117),
('S18_1097', '1940 Ford Pickup Truck', 'Studio M Art Models', 2613, '75.98', 117),
('S18_1097', '1940 Ford Pickup Truck', 'Studio M Art Models', 2613, '75.98', 117),
('S18_1097', '1940 Ford Pickup Truck', 'Studio M Art Models', 2613, '75.98', 117),
('S18_1129', '1993 Mazda RX-7', 'Highway 66 Mini Classics', 3975, '110.04', 142),
('S18_1129', '1993 Mazda RX-7', 'Highway 66 Mini Classics', 3975, '110.04', 142),
('S18_1342', '1937 Lincoln Berline', 'Motor City Art Classics', 8693, '79.91', 103),
('S18_1342', '1937 Lincoln Berline', 'Motor City Art Classics', 8693, '79.91', 103),
('S18_1342', '1937 Lincoln Berline', 'Motor City Art Classics', 8693, '79.91', 103),
('S18_1342', '1937 Lincoln Berline', 'Motor City Art Classics', 8693, '79.91', 103),
('S18_1367', '1936 Mercedes-Benz 500K Special Roadster', 'Studio M Art Models', 8635, '31.44', 54),
('S18_1367', '1936 Mercedes-Benz 500K Special Roadster', 'Studio M Art Models', 8635, '31.44', 54),
('S18_1367', '1936 Mercedes-Benz 500K Special Roadster', 'Studio M Art Models', 8635, '31.44', 54),
('S18_1367', '1936 Mercedes-Benz 500K Special Roadster', 'Studio M Art Models', 8635, '31.44', 54),
('S18_1589', '1965 Aston Martin DB5', 'Classic Metal Creations', 9042, '86.46', 124),
('S18_1749', '1917 Grand Touring Sedan', 'Welly Diecast Productions', 2724, '113.97', 170),
('S18_1749', '1917 Grand Touring Sedan', 'Welly Diecast Productions', 2724, '113.97', 170),
('S18_1889', '1948 Porsche 356-A Roadster', 'Gearbox Collectibles', 8826, '70.74', 77),
('S18_1984', '1995 Honda Civic', 'Min Lin Diecast', 9772, '123.14', 142),
('S18_1984', '1995 Honda Civic', 'Min Lin Diecast', 9772, '123.14', 142),
('S18_2248', '1911 Ford Town Car', 'Motor City Art Classics', 540, '43.23', 61),
('S18_2248', '1911 Ford Town Car', 'Motor City Art Classics', 540, '43.23', 61),
('S18_2319', '1964 Mercedec Tour Bus', 'Unimax Art Galleries', 8258, '98.25', 123),
('S18_2325', '1932 Model A Ford J-Coupe', 'Autoart Studio Design', 9354, '75.98', 127),
('S18_2325', '1932 Model A Ford J-Coupe', 'Autoart Studio Design', 9354, '75.98', 127),
('S18_2432', '1926 Ford Fire Engine', 'Carousel DieCast Legends', 2018, '32.75', 61),
('S18_2432', '1926 Ford Fire Engine', 'Carousel DieCast Legends', 2018, '32.75', 61),
('S18_2432', '1926 Ford Fire Engine', 'Carousel DieCast Legends', 2018, '32.75', 61),
('S18_2581', 'P-51-D Mustang', 'Gearbox Collectibles', 992, '64.19', 84),
('S18_2581', 'P-51-D Mustang', 'Gearbox Collectibles', 992, '64.19', 84),
('S18_2581', 'P-51-D Mustang', 'Gearbox Collectibles', 992, '64.19', 84),
('S18_2625', '1936 Harley Davidson El Knucklehead', 'Welly Diecast Productions', 4357, '31.44', 61),
('S18_2625', '1936 Harley Davidson El Knucklehead', 'Welly Diecast Productions', 4357, '31.44', 61),
('S18_2625', '1936 Harley Davidson El Knucklehead', 'Welly Diecast Productions', 4357, '31.44', 61),
('S18_2795', '1928 Mercedes-Benz SSK', 'Gearbox Collectibles', 548, '95.63', 169),
('S18_2795', '1928 Mercedes-Benz SSK', 'Gearbox Collectibles', 548, '95.63', 169),
('S18_2795', '1928 Mercedes-Benz SSK', 'Gearbox Collectibles', 548, '95.63', 169),
('S18_2795', '1928 Mercedes-Benz SSK', 'Gearbox Collectibles', 548, '95.63', 169),
('S18_2870', '1999 Indy 500 Monte Carlo SS', 'Red Start Diecast', 8164, '74.67', 132),
('S18_2949', '1913 Ford Model T Speedster', 'Carousel DieCast Legends', 4189, '79.91', 101),
('S18_2949', '1913 Ford Model T Speedster', 'Carousel DieCast Legends', 4189, '79.91', 101),
('S18_2949', '1913 Ford Model T Speedster', 'Carousel DieCast Legends', 4189, '79.91', 101),
('S18_2949', '1913 Ford Model T Speedster', 'Carousel DieCast Legends', 4189, '79.91', 101),
('S18_2949', '1913 Ford Model T Speedster', 'Carousel DieCast Legends', 4189, '79.91', 101),
('S18_2949', '1913 Ford Model T Speedster', 'Carousel DieCast Legends', 4189, '79.91', 101),
('S18_2957', '1934 Ford V8 Coupe', 'Min Lin Diecast', 5649, '44.54', 62),
('S18_2957', '1934 Ford V8 Coupe', 'Min Lin Diecast', 5649, '44.54', 62),
('S18_2957', '1934 Ford V8 Coupe', 'Min Lin Diecast', 5649, '44.54', 62),
('S18_3136', '18th Century Vintage Horse Carriage', 'Red Start Diecast', 5992, '79.91', 105),
('S18_3136', '18th Century Vintage Horse Carriage', 'Red Start Diecast', 5992, '79.91', 105),
('S18_3136', '18th Century Vintage Horse Carriage', 'Red Start Diecast', 5992, '79.91', 105),
('S18_3136', '18th Century Vintage Horse Carriage', 'Red Start Diecast', 5992, '79.91', 105),
('S18_3232', '1992 Ferrari 360 Spider red', 'Unimax Art Galleries', 8347, '102.18', 169),
('S18_3232', '1992 Ferrari 360 Spider red', 'Unimax Art Galleries', 8347, '102.18', 169),
('S18_3232', '1992 Ferrari 360 Spider red', 'Unimax Art Galleries', 8347, '102.18', 169),
('S18_3278', '1969 Dodge Super Bee', 'Min Lin Diecast', 1917, '64.19', 80),
('S18_3278', '1969 Dodge Super Bee', 'Min Lin Diecast', 1917, '64.19', 80),
('S18_3278', '1969 Dodge Super Bee', 'Min Lin Diecast', 1917, '64.19', 80),
('S18_3320', '1917 Maxwell Touring Car', 'Exoto Designs', 7913, '75.98', 99),
('S18_3320', '1917 Maxwell Touring Car', 'Exoto Designs', 7913, '75.98', 99),
('S18_3320', '1917 Maxwell Touring Car', 'Exoto Designs', 7913, '75.98', 99),
('S18_3482', '1976 Ford Gran Torino', 'Gearbox Collectibles', 9127, '95.63', 147),
('S18_3482', '1976 Ford Gran Torino', 'Gearbox Collectibles', 9127, '95.63', 147),
('S18_3482', '1976 Ford Gran Torino', 'Gearbox Collectibles', 9127, '95.63', 147),
('S18_3685', '1948 Porsche Type 356 Roadster', 'Gearbox Collectibles', 8990, '81.22', 141),
('S18_3782', '1957 Vespa GS150', 'Studio M Art Models', 7689, '43.23', 62),
('S18_3782', '1957 Vespa GS150', 'Studio M Art Models', 7689, '43.23', 62),
('S18_3856', '1941 Chevrolet Special Deluxe Cabriolet', 'Exoto Designs', 2378, '85.15', 106),
('S18_4027', '1970 Triumph Spitfire', 'Min Lin Diecast', 5545, '120.52', 144),
('S18_4409', '1932 Alfa Romeo 8C2300 Spider Sport', 'Exoto Designs', 6553, '56.33', 92),
('S18_4409', '1932 Alfa Romeo 8C2300 Spider Sport', 'Exoto Designs', 6553, '56.33', 92),
('S18_4409', '1932 Alfa Romeo 8C2300 Spider Sport', 'Exoto Designs', 6553, '56.33', 92),
('S18_4600', '1940s Ford truck', 'Motor City Art Classics', 3128, '111.35', 121),
('S18_4600', '1940s Ford truck', 'Motor City Art Classics', 3128, '111.35', 121),
('S18_4600', '1940s Ford truck', 'Motor City Art Classics', 3128, '111.35', 121),
('S18_4668', '1939 Cadillac Limousine', 'Studio M Art Models', 6645, '30.13', 50),
('S18_4668', '1939 Cadillac Limousine', 'Studio M Art Models', 6645, '30.13', 50),
('S18_4668', '1939 Cadillac Limousine', 'Studio M Art Models', 6645, '30.13', 50),
('S18_4721', '1957 Corvette Convertible', 'Classic Metal Creations', 1249, '91.70', 149),
('S18_4721', '1957 Corvette Convertible', 'Classic Metal Creations', 1249, '91.70', 149),
('S18_4933', '1957 Ford Thunderbird', 'Studio M Art Models', 3209, '44.54', 71),
('S18_4933', '1957 Ford Thunderbird', 'Studio M Art Models', 3209, '44.54', 71),
('S18_4933', '1957 Ford Thunderbird', 'Studio M Art Models', 3209, '44.54', 71),
('S24_1046', '1970 Chevy Chevelle SS 454', 'Unimax Art Galleries', 1005, '64.19', 73),
('S24_1046', '1970 Chevy Chevelle SS 454', 'Unimax Art Galleries', 1005, '64.19', 73),
('S24_1444', '1970 Dodge Coronet', 'Highway 66 Mini Classics', 4074, '41.92', 58),
('S24_1578', '1997 BMW R 1100 S', 'Autoart Studio Design', 7003, '79.91', 113),
('S24_1578', '1997 BMW R 1100 S', 'Autoart Studio Design', 7003, '79.91', 113),
('S24_1578', '1997 BMW R 1100 S', 'Autoart Studio Design', 7003, '79.91', 113),
('S24_1628', '1966 Shelby Cobra 427 S/C', 'Carousel DieCast Legends', 8197, '37.99', 50),
('S24_1628', '1966 Shelby Cobra 427 S/C', 'Carousel DieCast Legends', 8197, '37.99', 50),
('S24_1785', '1928 British Royal Navy Airplane', 'Classic Metal Creations', 3627, '87.77', 109),
('S24_1785', '1928 British Royal Navy Airplane', 'Classic Metal Creations', 3627, '87.77', 109),
('S24_1785', '1928 British Royal Navy Airplane', 'Classic Metal Creations', 3627, '87.77', 109),
('S24_1937', '1939 Chevrolet Deluxe Coupe', 'Motor City Art Classics', 7332, '30.13', 33),
('S24_1937', '1939 Chevrolet Deluxe Coupe', 'Motor City Art Classics', 7332, '30.13', 33),
('S24_1937', '1939 Chevrolet Deluxe Coupe', 'Motor City Art Classics', 7332, '30.13', 33),
('S24_2000', '1960 BSA Gold Star DBD34 1960', 'Highway 66 Mini Classics', 15, '48.47', 76),
('S24_2000', '1960 BSA Gold Star DBD34 1960', 'Highway 66 Mini Classics', 15, '48.47', 76),
('S24_2022', '1938 Cadillac V-16 Presidential Limousine', 'Classic Metal Creations', 2847, '27.51', 45),
('S24_2022', '1938 Cadillac V-16 Presidential Limousine', 'Classic Metal Creations', 2847, '27.51', 45),
('S24_2360', '1982 Ducati 900 Monster', 'Highway 66 Mini Classics', 6840, '61.57', 69),
('S24_2766', '1949 Jaguar XK 120', 'Classic Metal Creations', 2350, '61.57', 91),
('S24_2766', '1949 Jaguar XK 120', 'Classic Metal Creations', 2350, '61.57', 91),
('S24_2841', '1900s Vintage Bi-Plane', 'Autoart Studio Design', 5942, '44.54', 69),
('S24_2887', '1952 Citroen-15CV', 'Exoto Designs', 1452, '95.63', 117),
('S24_2887', '1952 Citroen-15CV', 'Exoto Designs', 1452, '95.63', 117),
('S24_2972', '1982 Lamborghini Diablo', 'Second Gear Diecast', 7723, '20.96', 38),
('S24_3191', '1969 Chevrolet Camaro Z28', 'Exoto Designs', 4695, '66.81', 86),
('S24_3191', '1969 Chevrolet Camaro Z28', 'Exoto Designs', 4695, '66.81', 86),
('S24_3371', '1971 Alpine Renault 1600s', 'Welly Diecast Productions', 7995, '51.09', 61),
('S24_3371', '1971 Alpine Renault 1600s', 'Welly Diecast Productions', 7995, '51.09', 61),
('S24_3420', '1937 Horch 930V Limousine', 'Autoart Studio Design', 2902, '34.06', 66),
('S24_3420', '1937 Horch 930V Limousine', 'Autoart Studio Design', 2902, '34.06', 66),
('S24_3432', '2002 Chevy Corvette', 'Gearbox Collectibles', 9446, '81.22', 107),
('S24_3432', '2002 Chevy Corvette', 'Gearbox Collectibles', 9446, '81.22', 107),
('S24_3856', '1956 Porsche 356A Coupe', 'Classic Metal Creations', 6600, '128.38', 140),
('S24_3949', 'Corsair F4U ( Bird Cage)', 'Second Gear Diecast', 6812, '37.99', 68),
('S24_3969', '1936 Mercedes Benz 500k Roadster', 'Red Start Diecast', 2081, '28.82', 41),
('S24_3969', '1936 Mercedes Benz 500k Roadster', 'Red Start Diecast', 2081, '28.82', 41),
('S24_4048', '1992 Porsche Cayenne Turbo Silver', 'Exoto Designs', 6582, '91.70', 118),
('S24_4258', '1936 Chrysler Airflow', 'Second Gear Diecast', 4710, '74.67', 97),
('S24_4258', '1936 Chrysler Airflow', 'Second Gear Diecast', 4710, '74.67', 97),
('S24_4278', '1900s Vintage Tri-Plane', 'Unimax Art Galleries', 2756, '47.16', 72),
('S24_4278', '1900s Vintage Tri-Plane', 'Unimax Art Galleries', 2756, '47.16', 72),
('S24_4278', '1900s Vintage Tri-Plane', 'Unimax Art Galleries', 2756, '47.16', 72),
('S24_4620', '1961 Chevrolet Impala', 'Classic Metal Creations', 7869, '41.92', 81),
('S32_1268', '1980?s GM Manhattan Express', 'Motor City Art Classics', 5099, '70.74', 96),
('S32_1374', '1997 BMW F650 ST', 'Exoto Designs', 178, '87.77', 100),
('S32_1374', '1997 BMW F650 ST', 'Exoto Designs', 178, '87.77', 100),
('S32_2206', '1982 Ducati 996 R', 'Gearbox Collectibles', 9241, '31.44', 40),
('S32_3207', '1950\'s Chicago Surface Lines Streetcar', 'Gearbox Collectibles', 8601, '35.37', 62),
('S32_3522', '1996 Peterbilt 379 Stake Bed with Outrigger', 'Red Start Diecast', 814, '44.54', 65),
('S32_3522', '1996 Peterbilt 379 Stake Bed with Outrigger', 'Red Start Diecast', 814, '44.54', 65),
('S32_4289', '1928 Ford Phaeton Deluxe', 'Highway 66 Mini Classics', 136, '43.23', 69),
('S32_4289', '1928 Ford Phaeton Deluxe', 'Highway 66 Mini Classics', 136, '43.23', 69),
('S32_4289', '1928 Ford Phaeton Deluxe', 'Highway 66 Mini Classics', 136, '43.23', 69),
('S32_4485', '1974 Ducati 350 Mk3 Desmo', 'Second Gear Diecast', 3341, '73.36', 102),
('S50_1341', '1930 Buick Marquette Phaeton', 'Studio M Art Models', 7062, '35.37', 44),
('S50_1341', '1930 Buick Marquette Phaeton', 'Studio M Art Models', 7062, '35.37', 44),
('S50_1341', '1930 Buick Marquette Phaeton', 'Studio M Art Models', 7062, '35.37', 44),
('S50_4713', '2002 Yamaha YZR M1', 'Autoart Studio Design', 600, '44.54', 81),
('S700_1691', 'American Airlines: B767-300', 'Min Lin Diecast', 5841, '66.81', 91),
('S700_1691', 'American Airlines: B767-300', 'Min Lin Diecast', 5841, '66.81', 91),
('S700_1691', 'American Airlines: B767-300', 'Min Lin Diecast', 5841, '66.81', 91),
('S700_2047', 'HMS Bounty', 'Unimax Art Galleries', 3501, '52.40', 91),
('S700_2047', 'HMS Bounty', 'Unimax Art Galleries', 3501, '52.40', 91),
('S700_2466', 'America West Airlines B757-200', 'Motor City Art Classics', 9653, '90.39', 100),
('S700_2466', 'America West Airlines B757-200', 'Motor City Art Classics', 9653, '90.39', 100),
('S700_2824', '1982 Camaro Z28', 'Carousel DieCast Legends', 6934, '61.57', 101),
('S700_2834', 'ATA: B757-300', 'Highway 66 Mini Classics', 7106, '77.29', 119),
('S700_2834', 'ATA: B757-300', 'Highway 66 Mini Classics', 7106, '77.29', 119),
('S700_2834', 'ATA: B757-300', 'Highway 66 Mini Classics', 7106, '77.29', 119),
('S700_3167', 'F/A 18 Hornet 1/72', 'Motor City Art Classics', 551, '70.74', 80),
('S700_3167', 'F/A 18 Hornet 1/72', 'Motor City Art Classics', 551, '70.74', 80),
('S700_3167', 'F/A 18 Hornet 1/72', 'Motor City Art Classics', 551, '70.74', 80),
('S700_4002', 'American Airlines: MD-11S', 'Second Gear Diecast', 8820, '47.16', 74),
('S72_1253', 'Boeing X-32A JSF', 'Motor City Art Classics', 4857, '43.23', 50),
('S72_1253', 'Boeing X-32A JSF', 'Motor City Art Classics', 4857, '43.23', 50);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
