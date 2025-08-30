-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2025 at 02:33 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `go_unc`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_gbm`
--

CREATE TABLE `admin_gbm` (
  `admin_id` varchar(8) NOT NULL,
  `f_name` varchar(25) NOT NULL,
  `m_name` varchar(25) DEFAULT NULL,
  `l_name` varchar(25) NOT NULL,
  `email_acc` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_user`
--

CREATE TABLE `app_user` (
  `user_id` varchar(8) NOT NULL,
  `f_name` varchar(25) NOT NULL,
  `m_name` varchar(25) DEFAULT NULL,
  `l_name` varchar(25) NOT NULL,
  `email_acc` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bldg`
--

CREATE TABLE `bldg` (
  `bldg_id` varchar(5) NOT NULL,
  `room_id` varchar(5) DEFAULT NULL,
  `bldg_name` varchar(25) NOT NULL,
  `description` varchar(50) NOT NULL,
  `floor_lvl` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` varchar(5) NOT NULL,
  `loc_ref_id` varchar(5) DEFAULT NULL,
  `user_id` varchar(8) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `landmark`
--

CREATE TABLE `landmark` (
  `landmark_id` varchar(5) NOT NULL,
  `landmark_name` varchar(25) NOT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `map_data`
--

CREATE TABLE `map_data` (
  `map_data_id` varchar(5) NOT NULL,
  `admin_id` varchar(8) DEFAULT NULL,
  `bldg_id` varchar(5) DEFAULT NULL,
  `pathway_id` varchar(5) DEFAULT NULL,
  `landmark_id` varchar(5) DEFAULT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pathway`
--

CREATE TABLE `pathway` (
  `pathway_id` varchar(5) NOT NULL,
  `pathway_name` varchar(25) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reloc_data`
--

CREATE TABLE `reloc_data` (
  `reloc_data_id` varchar(5) NOT NULL,
  `new_loc_id` varchar(5) DEFAULT NULL,
  `org_loc_id` varchar(5) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `renov_data`
--

CREATE TABLE `renov_data` (
  `renov_data_id` varchar(5) NOT NULL,
  `map_data_id` varchar(5) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` varchar(5) NOT NULL,
  `room_name` varchar(25) NOT NULL,
  `room_description` varchar(50) NOT NULL,
  `room_type` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `r_query`
--

CREATE TABLE `r_query` (
  `r_query_id` varchar(5) NOT NULL,
  `start_loc` varchar(5) DEFAULT NULL,
  `end_loc` varchar(5) DEFAULT NULL,
  `user_id` varchar(8) DEFAULT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `upd_map_data`
--

CREATE TABLE `upd_map_data` (
  `upd_map_data_id` varchar(5) NOT NULL,
  `map_data_id` varchar(5) DEFAULT NULL,
  `admin_id` varchar(8) DEFAULT NULL,
  `reloc_data_id` varchar(5) DEFAULT NULL,
  `renov_data_id` varchar(5) DEFAULT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_gbm`
--
ALTER TABLE `admin_gbm`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `app_user`
--
ALTER TABLE `app_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `bldg`
--
ALTER TABLE `bldg`
  ADD PRIMARY KEY (`bldg_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `landmark`
--
ALTER TABLE `landmark`
  ADD PRIMARY KEY (`landmark_id`);

--
-- Indexes for table `map_data`
--
ALTER TABLE `map_data`
  ADD PRIMARY KEY (`map_data_id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `bldg_id` (`bldg_id`),
  ADD KEY `pathway_id` (`pathway_id`),
  ADD KEY `landmark_id` (`landmark_id`);

--
-- Indexes for table `pathway`
--
ALTER TABLE `pathway`
  ADD PRIMARY KEY (`pathway_id`);

--
-- Indexes for table `reloc_data`
--
ALTER TABLE `reloc_data`
  ADD PRIMARY KEY (`reloc_data_id`);

--
-- Indexes for table `renov_data`
--
ALTER TABLE `renov_data`
  ADD PRIMARY KEY (`renov_data_id`),
  ADD KEY `map_data_id` (`map_data_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `r_query`
--
ALTER TABLE `r_query`
  ADD PRIMARY KEY (`r_query_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `upd_map_data`
--
ALTER TABLE `upd_map_data`
  ADD PRIMARY KEY (`upd_map_data_id`),
  ADD KEY `map_data_id` (`map_data_id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `reloc_data_id` (`reloc_data_id`),
  ADD KEY `renov_data_id` (`renov_data_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bldg`
--
ALTER TABLE `bldg`
  ADD CONSTRAINT `bldg_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`user_id`);

--
-- Constraints for table `map_data`
--
ALTER TABLE `map_data`
  ADD CONSTRAINT `map_data_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin_gbm` (`admin_id`),
  ADD CONSTRAINT `map_data_ibfk_2` FOREIGN KEY (`bldg_id`) REFERENCES `bldg` (`bldg_id`),
  ADD CONSTRAINT `map_data_ibfk_3` FOREIGN KEY (`pathway_id`) REFERENCES `pathway` (`pathway_id`),
  ADD CONSTRAINT `map_data_ibfk_4` FOREIGN KEY (`landmark_id`) REFERENCES `landmark` (`landmark_id`);

--
-- Constraints for table `renov_data`
--
ALTER TABLE `renov_data`
  ADD CONSTRAINT `renov_data_ibfk_1` FOREIGN KEY (`map_data_id`) REFERENCES `map_data` (`map_data_id`);

--
-- Constraints for table `r_query`
--
ALTER TABLE `r_query`
  ADD CONSTRAINT `r_query_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`user_id`);

--
-- Constraints for table `upd_map_data`
--
ALTER TABLE `upd_map_data`
  ADD CONSTRAINT `upd_map_data_ibfk_1` FOREIGN KEY (`map_data_id`) REFERENCES `map_data` (`map_data_id`),
  ADD CONSTRAINT `upd_map_data_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admin_gbm` (`admin_id`),
  ADD CONSTRAINT `upd_map_data_ibfk_3` FOREIGN KEY (`reloc_data_id`) REFERENCES `reloc_data` (`reloc_data_id`),
  ADD CONSTRAINT `upd_map_data_ibfk_4` FOREIGN KEY (`renov_data_id`) REFERENCES `renov_data` (`renov_data_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
