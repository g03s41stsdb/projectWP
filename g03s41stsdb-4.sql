-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 15, 2023 at 05:13 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `g03s41stsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `attend`
--

CREATE TABLE `attend` (
  `Attendance_Reference` varchar(100) NOT NULL,
  `staffID` varchar(50) NOT NULL,
  `trainingID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffID` varchar(10) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `icNumber` varchar(50) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `contactNumber` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `dateOfEmployment` date NOT NULL,
  `position` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffID`, `firstName`, `lastName`, `icNumber`, `dateOfBirth`, `contactNumber`, `email`, `dateOfEmployment`, `position`) VALUES
('c99', 'Muhammad ', 'Amin', '030424-14-9981', '2003-04-24', '019-1234567', 'amin@gmail.com', '2023-04-15', 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

CREATE TABLE `training` (
  `trainingID` varchar(50) NOT NULL,
  `staffID` varchar(10) NOT NULL,
  `trainingName` varchar(150) NOT NULL,
  `trainingStart` date NOT NULL,
  `trainingEnd` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserId` varchar(50) DEFAULT NULL,
  `Password` varchar(11) DEFAULT NULL,
  `userType` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserId`, `Password`, `userType`) VALUES
('admin', 'admin', 'ADMIN'),
('C01', 'C01', 'CUSTOMER'),
('S01', 'S01', 'STAFF'),
('C02', 'C02', 'CUSTOMER'),
('c99', 'c99', 'STAFF');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attend`
--
ALTER TABLE `attend`
  ADD PRIMARY KEY (`Attendance_Reference`),
  ADD KEY `staffID` (`staffID`),
  ADD KEY `trainingID` (`trainingID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffID`);

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`trainingID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attend`
--
ALTER TABLE `attend`
  ADD CONSTRAINT `attend_ibfk_1` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffId`),
  ADD CONSTRAINT `attend_ibfk_2` FOREIGN KEY (`trainingID`) REFERENCES `training` (`trainingID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
