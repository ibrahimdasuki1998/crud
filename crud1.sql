-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2019 at 06:12 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crud`
--

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `nim` varchar(12) NOT NULL,
  `nohplama` varchar(13) NOT NULL,
  `nohpbaru` varchar(13) NOT NULL,
  `tglubah` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `nim`, `nohplama`, `nohpbaru`, `tglubah`) VALUES
(1, '161240000550', '089653666400', '089653666400', '2019-11-11 00:05:31');

-- --------------------------------------------------------

--
-- Table structure for table `uts`
--

CREATE TABLE `uts` (
  `id` int(10) NOT NULL,
  `nim` varchar(12) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `jk` text NOT NULL,
  `alamat` varchar(300) NOT NULL,
  `nohp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uts`
--

INSERT INTO `uts` (`id`, `nim`, `nama`, `jk`, `alamat`, `nohp`) VALUES
(1, '161240000550', 'Ibrahim Dasuki', 'Laki-Laki', 'Jepara', '089653666476'),
(2, '161240000551', 'Farid', 'Laki-Laki', 'Jepara', '085225424799'),
(3, '161240000553', 'Hikam', 'Laki-Laki', 'Kauman Jepara', '089665435122'),
(5, '161240000558', 'Maming', 'Laki-Laki', 'Jepara', '089654332416'),
(4, '161240000559', 'Dicky ', 'Laki-Laki', 'Kalongan', '082324500987');

--
-- Triggers `uts`
--
DELIMITER $$
CREATE TRIGGER `BEFORE_UPDATE` BEFORE UPDATE ON `uts` FOR EACH ROW BEGIN
	INSERT INTO log
    SET id = OLD.id,
    nim = OLD.nim,
    nohplama = OLD.nohp,
    nohpbaru = OLD.nohp,
    tglubah = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `uuts`
-- (See below for the actual view)
--
CREATE TABLE `uuts` (
`id` int(10)
,`nim` varchar(12)
,`nama` varchar(200)
,`jk` text
,`alamat` varchar(300)
,`nohp` varchar(13)
);

-- --------------------------------------------------------

--
-- Structure for view `uuts`
--
DROP TABLE IF EXISTS `uuts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `uuts`  AS  (select `uts`.`id` AS `id`,`uts`.`nim` AS `nim`,`uts`.`nama` AS `nama`,`uts`.`jk` AS `jk`,`uts`.`alamat` AS `alamat`,`uts`.`nohp` AS `nohp` from `uts`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `uts`
--
ALTER TABLE `uts`
  ADD PRIMARY KEY (`nim`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
