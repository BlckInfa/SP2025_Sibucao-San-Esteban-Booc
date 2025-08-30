-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2025 at 06:28 PM
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
  `room_id` varchar(20) DEFAULT NULL,
  `bldg_name` varchar(25) NOT NULL,
  `description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bldg`
--

INSERT INTO `bldg` (`bldg_id`, `room_id`, `bldg_name`, `description`) VALUES
('B001', 'JH-1a', 'JH', 'Reinforced Concrete'),
('B002', 'AMS100', 'AMS', 'Reinforced Concrete'),
('B003', NULL, 'Chapel', 'Reinforced Concrete'),
('B004', NULL, 'Old Elem', 'Mixed Concrete and Timber Structure'),
('B005', 'DHS101A', 'DHS', 'Reinforced Concrete'),
('B006', 'L-1', 'E-Library', 'Reinforced Concrete; Wooden Floor and Floor Joist '),
('B007', NULL, 'New Building', 'Reinforced Concrete'),
('B008', 'HS-101', 'HS', 'Reinforced Concrete'),
('B009', 'SC101', 'SC', 'Reinforced Concrete'),
('B010', 'EN101', 'Old EN', 'Reinforced Concrete'),
('B011', 'EN201', 'New EN', 'Reinforced Concrete'),
('B012', 'ME101', 'ME', 'Reinforced Concrete'),
('B013', 'PA-1', 'Practical Arts', 'Reinforced Concrete'),
('B014', 'SP-1', 'Sports Palace', 'Reinforced Concrete'),
('B015', NULL, 'Covered Court', 'Reinforced Concrete');

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
  `room_id` varchar(20) NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `room_description` varchar(255) NOT NULL,
  `room_type` varchar(50) DEFAULT NULL,
  `floor_lvl` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_name`, `room_description`, `room_type`, `floor_lvl`) VALUES
('AMS100', 'GRADUATE SCHOOL DEAN\'S OFFICE', 'Graduate School Dean Office', 'Office', '1'),
('AMS101', 'CBA DEAN\'S OFFICE', 'College of Business Administration Dean', 'Office', '1'),
('AMS102', 'CBA FACULTY ROOM', 'Faculty Room for CBA', 'Office', '1'),
('AMS103', 'CJE FACULTY ROOM', 'Faculty Room for CJE', 'Office', '1'),
('AMS104a', 'CJE CONSULTATION ROOM', 'Consultation Room for CJE', 'Office', '1'),
('AMS105', 'VPAAS OFFICE', 'Vice President for Academic Affairs', 'Office', '1'),
('AMS105b', 'AS FACULTY ROOM', 'Arts & Sciences Faculty Room', 'Office', '1'),
('AMS107', 'PEP LAB', 'Physical Education Program Lab', 'Laboratory', '1'),
('AMS108A', 'CJE DEAN\'S OFFICE', 'CJE Dean Office', 'Office', '1'),
('AMS108B', 'CAS DEAN\'S OFFICE', 'College of Arts & Sciences Dean Office', 'Office', '1'),
('AMS109a', 'DSAA OFFICE', 'DSAA Office', 'Office', '1'),
('AMS110', 'TESTING CENTER', 'Testing Center', 'Laboratory', '1'),
('AMS111', 'COLLEGE GUIDANCE OFFICE', 'Guidance Office', 'Office', '1'),
('AMS112', 'CAREER AND PLACEMENT OFFICE', 'Career & Placement Services', 'Office', '1'),
('AMS114', 'DANCE STUDIO', 'Dance Studio', 'Laboratory', '1'),
('AMS115', 'STUDENT AND PARENT LOUNGE', 'Student & Parent Lounge', 'Lounge', '1'),
('AMS116A', 'CED DEAN\'S OFFICE', 'College of Education Dean Office', 'Office', '1'),
('AMS116B', 'EDUC. FACULTY ROOM', 'Education Faculty Room', 'Office', '1'),
('AMS118', 'SCHOLARSHIP AND GRANTS', 'Scholarship & Grants Office', 'Office', '1'),
('AMS119A', 'PQM OFFICE', 'PQM Office', 'Office', '1'),
('AMS119B', 'AMSCO', 'AMS Coordination Office', 'Office', '1'),
('AMS120', 'FFC OFFICE', 'FFC Office', 'Office', '1'),
('AMS201', 'HYBRID CLASSROOM', 'Hybrid Classroom', 'Classroom', '2'),
('AMS202B', 'SHS CLASSROOM', 'Senior High School Classroom', 'Classroom', '2'),
('AMS203', 'SHS CLASSROOM', 'Senior High School Classroom', 'Classroom', '2'),
('AMS204', 'SHS ASST. PRINCIPAL\'S OFFICE', 'Assistant Principal Office', 'Office', '2'),
('AMS205', 'SHS CLASSROOM', 'Senior High School Classroom', 'Classroom', '2'),
('AMS206', 'SHS CLASSROOM', 'Senior High School Classroom', 'Classroom', '2'),
('AMS207', 'SHS CLASSROOM', 'Senior High School Classroom', 'Classroom', '2'),
('AMS208', 'SHS CLASSROOM', 'Senior High School Classroom', 'Classroom', '2'),
('AMS209', 'SHS CLASSROOM', 'Senior High School Classroom', 'Classroom', '2'),
('AMS210', 'SHS CLASSROOM', 'Senior High School Classroom', 'Classroom', '2'),
('AMS211', 'SHS CLASSROOM', 'Senior High School Classroom', 'Classroom', '2'),
('AMS212', 'SHS SERVER ROOM', 'Server Room for SHS', 'Server Room', '2'),
('AMS213', 'SHS CLASSROOM', 'Senior High School Classroom', 'Classroom', '2'),
('AMS214', 'SHS CLASSROOM', 'Senior High School Classroom', 'Classroom', '2'),
('AMS215', 'SHS CLASSROOM', 'Senior High School Classroom', 'Classroom', '2'),
('AMS216', 'SHS CLASSROOM', 'Senior High School Classroom', 'Classroom', '2'),
('AMS217', 'SHS CLASSROOM', 'Senior High School Classroom', 'Classroom', '2'),
('AMS218', 'SHS CLASSROOM', 'Senior High School Classroom', 'Classroom', '2'),
('AMS219', 'USG', 'University Student Government Office', 'Office', '2'),
('AMS300', 'SAS STOCK ROOM', 'Stock Room for SAS', 'Stockroom', '3'),
('AMS301', 'SHS CLASSROOM', 'Senior High School Classroom', 'Classroom', '3'),
('AMS302', 'SHS CLASSROOM', 'Senior High School Classroom', 'Classroom', '3'),
('AMS303', 'SHS CLASSROOM', 'Senior High School Classroom', 'Classroom', '3'),
('AMS304', 'SHS GUIDANCE OFFICE', 'Guidance Office for SHS', 'Office', '3'),
('AMS305', 'CRIME LABORATORY', 'Crime Laboratory', 'Laboratory', '3'),
('AMS306', 'POLICE SCIENCE LAB ROOM', 'Police Science Lab', 'Laboratory', '3'),
('AMS307', 'CJE LABORATORY', 'CJE Laboratory', 'Laboratory', '3'),
('AMS308', 'SHS CLASSROOM', 'Senior High School Classroom', 'Classroom', '3'),
('AMS309', 'DH SISON GALLERY ROOM (Museum)', 'Museum Gallery Room', 'Gallery', '3'),
('AMS310', 'SHS CLASSROOM', 'Senior High School Classroom', 'Classroom', '3'),
('AMS311', 'SHS CLASSROOM', 'Senior High School Classroom', 'Classroom', '3'),
('AMS312', 'PSYCHOLOGY LAB (small classroom)', 'Psychology Lab', 'Laboratory', '3'),
('AMS313', 'MUSEUM ARCHIVE', 'Museum Archive', 'Archive', '3'),
('AMS314', 'AS PSYCHOLOGY LAB', 'Arts & Sciences Psychology Lab', 'Laboratory', '3'),
('AMS315', 'CLASSROOM', 'General Classroom', 'Classroom', '3'),
('AMS316', 'CLASSROOM', 'General Classroom', 'Classroom', '3'),
('AMS317', 'CLASSROOM', 'General Classroom', 'Classroom', '3'),
('AMS318', 'CLASSROOM', 'General Classroom', 'Classroom', '3'),
('AMS319', 'SHS SSG OFFICE', 'Student Supreme Government Office', 'Office', '3'),
('DHS101A', 'ELEM. PRINCIPAL\'S OFFICE', 'Elementary Principal Office', 'Office', '1'),
('DHS101B', 'ELEM. GUIDANCE OFFICE', 'Elementary Guidance Office', 'Office', '1'),
('DHS102', 'KINDER CLASSROOM', 'Kindergarten Classroom', 'Classroom', '1'),
('DHS103', 'KINDER CLASSROOM', 'Kindergarten Classroom', 'Classroom', '1'),
('DHS104', 'G-1 CLASSROOM', 'Grade 1 Classroom', 'Classroom', '1'),
('DHS105', 'G-1 CLASSROOM', 'Grade 1 Classroom', 'Classroom', '1'),
('DHS106', 'G-2 CLASSROOM', 'Grade 2 Classroom', 'Classroom', '1'),
('DHS107', 'G-2 CLASSROOM', 'Grade 2 Classroom', 'Classroom', '1'),
('DHS108', 'DEAN\'S OFFICE COLL. OF NURSING', 'College of Nursing Dean Office', 'Office', '1'),
('DHS200', 'HRM MOCK HOTEL', 'Hospitality & Restaurant Management Mock Hotel', 'Lab', '2'),
('DHS201', 'HRM LABORATORY', 'HRM Laboratory', 'Laboratory', '2'),
('DHS202', 'HRM LABORATORY', 'HRM Laboratory', 'Laboratory', '2'),
('DHS203', 'HRM LABORATORY', 'HRM Laboratory', 'Laboratory', '2'),
('DHS204', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('DHS205', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('DHS206', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('DHS207', 'ELEM STEAM CLASSROOM', 'Elementary STEAM Classroom', 'Classroom', '2'),
('DHS208', 'ELEM STEAM CLASSROOM', 'Elementary STEAM Classroom', 'Classroom', '2'),
('DHS209', 'NAT SCI LAB STOCKROOM', 'Natural Science Laboratory Stockroom', 'Stockroom', '2'),
('DHS301', 'CLASSROOM', 'General Classroom', 'Classroom', '3'),
('DHS302', 'CLASSROOM', 'General Classroom', 'Classroom', '3'),
('DHS303', 'CLASSROOM', 'General Classroom', 'Classroom', '3'),
('DHS304', 'CLASSROOM', 'General Classroom', 'Classroom', '3'),
('DHS305', 'CLASSROOM', 'General Classroom', 'Classroom', '3'),
('DHS306', 'ELEM. TLE LAB', 'Elementary TLE Laboratory', 'Laboratory', '3'),
('DHS307', 'ELEM. COMPUTER LAB.', 'Elementary Computer Laboratory', 'Laboratory', '3'),
('DHS308', 'ELEM. FACULTY ROOM', 'Elementary Faculty Room', 'Office', '3'),
('DHS401', 'NURSING LAB', 'Nursing Laboratory', 'Laboratory', '4'),
('DHS402', 'MICRO-LABORATORY', 'Microbiology Laboratory', 'Laboratory', '4'),
('DHS403', 'ANATOMY LABORATORY', 'Anatomy Laboratory', 'Laboratory', '4'),
('DHS404', 'DEMO ROOM (assembly area)', 'Demonstration/Assembly Room', 'Hall', '4'),
('DHS405', 'NURSERY', 'Nursery Classroom', 'Classroom', '4'),
('DHS406', 'CENTRAL SUPPLY ROOM', 'Central Supply Room', 'Stockroom', '4'),
('DHS407', 'NURSING ARTS LABORATORY', 'Nursing Arts Laboratory', 'Laboratory', '4'),
('EN101', 'CLASSROOM', 'General Classroom', 'Classroom', '1'),
('EN102', 'CLASSROOM', 'General Classroom', 'Classroom', '1'),
('EN103', 'CLASSROOM', 'General Classroom', 'Classroom', '1'),
('EN104', 'CLASSROOM', 'General Classroom', 'Classroom', '1'),
('EN105', 'CLASSROOM', 'General Classroom', 'Classroom', '1'),
('EN106', 'C.E. LABORATORY', 'Civil Engineering Laboratory', 'Laboratory', '1'),
('EN107', 'ENGG COLLEGE BOARD OFC.', 'Engineering College Board Office', 'Office', '1'),
('EN108', 'VISUAL LABORATORY (ARCH.)', 'Architecture Visual Laboratory', 'Laboratory', '1'),
('EN109', 'DRAFTING ROOM', 'Drafting Room', 'Laboratory', '1'),
('EN110', 'BUILDING TECH & UTILITIES LAB.', 'Building Technology & Utilities Lab', 'Laboratory', '1'),
('EN111', 'DRAFTING ROOM', 'Drafting Room', 'Laboratory', '1'),
('EN113', 'UTM LABORATORY', 'UTM Laboratory', 'Laboratory', '1'),
('EN114', 'M.E. LAB ROOM', 'Mechanical Engineering Lab Room', 'Laboratory', '1'),
('EN115', 'M.E. SHOP', 'Mechanical Engineering Shop', 'Laboratory', '1'),
('EN116', 'DRAFTING ROOM', 'Drafting Room', 'Laboratory', '1'),
('EN201', 'TBI LABORATORY', 'TBI Laboratory', 'Laboratory', '2'),
('EN203', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('EN204', 'DRAWING ROOM', 'Drawing Room', 'Laboratory', '2'),
('EN205', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('EN206', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('EN207', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('EN208', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('EN209', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('EN210', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('EN211', 'EELAB CUSTODIAN OFFICE', 'Electrical Engineering Lab Custodian Office', 'Office', '2'),
('EN212', 'ECE LAB', 'Electronics & Communications Engineering Lab', 'Laboratory', '2'),
('EN213', 'EE LAB', 'Electrical Engineering Lab', 'Laboratory', '2'),
('EN214', 'ECE LAB', 'Electronics & Communications Engineering Lab', 'Laboratory', '2'),
('EN215', 'DEAN\'S OFFICE -ENGINEERING', 'Engineering Dean\'s Office', 'Office', '2'),
('EN216', 'EA REVIEW ROOM', 'Engineering Academy Review Room', 'Office', '2'),
('EN217', 'ENGG FACULTY ROOM', 'Engineering Faculty Room', 'Office', '2'),
('EN218', 'EA REVIEW ROOM', 'Engineering Academy Review Room', 'Office', '2'),
('EN219', 'PHYSICS LABORATORY', 'Physics Laboratory', 'Laboratory', '2'),
('EN220', 'FACULTY ROOM', 'Faculty Room', 'Office', '2'),
('EN221', 'PHYSICS STOCKROOM', 'Physics Stockroom', 'Stockroom', '2'),
('HS-101', 'JHS STEAM CLASSROOM', 'Junior High STEAM Classroom', 'Classroom', '1'),
('HS-102', 'JHS STEAM CLASSROOM', 'Junior High STEAM Classroom', 'Classroom', '1'),
('HS-103', 'CLASSROOM', 'General Classroom', 'Classroom', '1'),
('HS-104', 'CLASSROOM', 'General Classroom', 'Classroom', '1'),
('HS-105', 'CLASSROOM', 'General Classroom', 'Classroom', '1'),
('HS-106', 'CLASSROOM', 'General Classroom', 'Classroom', '1'),
('HS-107', 'CLASSROOM', 'General Classroom', 'Classroom', '1'),
('HS-108', 'CLASSROOM', 'General Classroom', 'Classroom', '1'),
('HS-109', 'CLASSROOM', 'General Classroom', 'Classroom', '1'),
('HS-110', 'H/S REGISTRAR\'S OFFICE', 'High School Registrar Office', 'Office', '1'),
('HS-111', 'H/S PRINCIPAL OFFICE', 'High School Principal Office', 'Office', '1'),
('HS-112', 'UNIVERSITY CLINIC', 'University Clinic', 'Clinic', '1'),
('HS-113', 'H/S GUIDANCE OFFICE', 'High School Guidance Office', 'Office', '1'),
('HS-114', 'UNIVERSITY CLINIC EXTENSION', 'Clinic Extension', 'Clinic', '1'),
('HS-201', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('HS-202', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('HS-203', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('HS-204', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('HS-205', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('HS-206', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('HS-207', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('HS-208', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('HS-209', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('HS-210', 'H/S FACULTY ROOM', 'High School Faculty Room', 'Office', '2'),
('HS-211', 'SRA & SPEECH LAB', 'Speech and SRA Laboratory', 'Laboratory', '2'),
('HS-212', 'H/S TLE LAB', 'High School TLE Laboratory', 'Laboratory', '2'),
('JH-10', 'RESEARCH OFFICE', 'Research Office', 'Office', '1'),
('JH-11', 'UPEC OFFICE', 'University Planning and Evaluation Committee', 'Office', '1'),
('JH-1a', 'RESOURCE STOCK ROOM', 'Supplies and resources storage', 'Stockroom', '1'),
('JH-1b', 'PURCHASING OFFICE', 'Office for procurement', 'Office', '1'),
('JH-2', 'COLLEGE REGISTRAR\'S OFFICE', 'Registrar Office', 'Office', '1'),
('JH-20', 'ENGG COMP. LABORATORY', 'Engineering Computer Lab', 'Laboratory', '2'),
('JH-20a', 'TECHNICAL STOCK ROOM', 'Technical supplies', 'Stockroom', '2'),
('JH-22', 'COMPUTER LAB. ROOM', 'Computer Laboratory', 'Laboratory', '2'),
('JH-23', 'COMPUTER LAB. ROOM', 'Computer Laboratory', 'Laboratory', '2'),
('JH-24', 'CCS DEAN\'S OFFICE', 'College of Computer Studies Dean', 'Office', '2'),
('JH-25A', 'SERVER ROOM', 'Server Room', 'Server Room', '2'),
('JH-25B', 'SERVER ROOM', 'Server Room', 'Server Room', '2'),
('JH-25C', 'EIE OFFICE', 'Electronics and Industrial Engineering Office', 'Office', '2'),
('JH-26', 'MACLAB', 'Mac Computer Laboratory', 'Laboratory', '2'),
('JH-27', 'COMPUTER LABORATORY (H/S)', 'High School Computer Lab', 'Laboratory', '2'),
('JH-28', 'COMPUTER LABORATORY', 'Computer Laboratory', 'Laboratory', '2'),
('JH-29', 'SHS FACULTY ROOM', 'Senior High School Faculty', 'Office', '2'),
('JH-29A', 'TECHNICAL OFFICE', 'Technical Office', 'Office', '2'),
('JH-29B', 'SHS PRINCIPAL\'S OFFICE', 'Senior High Principal Office', 'Office', '2'),
('JH-3', 'UNKNOWN', 'Room description not provided', 'Office', '1'),
('JH-30', 'CLASSROOM', 'General classroom', 'Classroom', '3'),
('JH-31', 'CLASSROOM', 'General classroom', 'Classroom', '3'),
('JH-32', 'CLASSROOM (HYFLEX)', 'HyFlex Classroom', 'Classroom', '3'),
('JH-33', 'JHS ICT LAB', 'ICT Laboratory', 'Laboratory', '3'),
('JH-34', 'COMPUTER LABORATORY (CBA)', 'Computer Lab for CBA', 'Laboratory', '3'),
('JH-34B', 'STOCKROOM (REGISTRAR)', 'Registrar Stockroom', 'Stockroom', '3'),
('JH-35 A', 'SMALL CLASSROOM', 'Small Classroom', 'Classroom', '3'),
('JH-35 B', 'SPEECH LABORATORY', 'Speech Laboratory', 'Laboratory', '3'),
('JH-36', 'SOCIAL HALL (Assembly Area)', 'Assembly Hall', 'Hall', '3'),
('JH-37', 'STOCKROOM COLL. REGISTRAR & ACCOUNTING', 'Stockroom for Registrar & Accounting', 'Stockroom', '3'),
('JH-4', 'ACCOUNTING & BUDGET OFFICE', 'Accounting and Budgeting', 'Office', '1'),
('JH-5', 'TREASURER\'S OFFICE', 'Treasurer Office', 'Office', '1'),
('JH-6A', 'PRESIDENT\'S OFFICE', 'President Office', 'Office', '1'),
('JH-6B', 'CONFERENCE ROOM', 'Meeting room', 'Conference', '1'),
('JH-7', 'VPAA OFFICE', 'Vice President for Academic Affairs', 'Office', '1'),
('JH-8', 'HUMAN RESOURCES OFFICE', 'HR Office', 'Office', '1'),
('JH-9', 'VPREL OFFICE', 'Vice President for Religious Affairs', 'Office', '1'),
('L-1', 'HIGH SCHOOL LIBRARY', 'High School Library', 'Library', '1'),
('L-10', 'SERVER ROOM', 'Library Server Room', 'Server Room', '1'),
('L-2', 'ELEMENTARY LIBRARY', 'Elementary Library', 'Library', '1'),
('L-3', 'AVR', 'Audio Visual Room', 'AV Room', '1'),
('L-4', 'LEARNING COMMONS', 'Learning Commons Area', 'Commons', '1'),
('L-5', 'LAW LIBRARY', 'Law Library', 'Library', '1'),
('L-6', 'G/S LIBRARY', 'Graduate/School Library', 'Library', '1'),
('L-7', 'ENGINEERING LIBRARY', 'Engineering Library', 'Library', '1'),
('L-8', 'INTERNET ROOM', 'Internet Room', 'Lab', '1'),
('L-9', 'READING AREA', 'Reading Area', 'Commons', '1'),
('LM-1', 'CIRCULATION', 'Library Circulation Desk', 'Office', '1'),
('LM-2', 'TECHNICAL SECTION', 'Library Technical Section', 'Office', '1'),
('LM-3', 'UNIV. LIBRARIAN OFFICE', 'University Librarian Office', 'Office', '1'),
('ME101', 'ROTC OFFICE', 'ROTC Office', 'Office', '1'),
('ME102', 'CLASSROOM', 'General Classroom', 'Classroom', '1'),
('ME201', 'MUSEUM CURATOR OFFICE', 'Museum Curator Office', 'Office', '2'),
('ME202', 'MUSEUM', 'Museum Display and Archive', 'Museum', '2'),
('NB-101', 'ICES OFFICE', 'ICES Office', 'Office', '1'),
('NB-102', 'BAR OPS OFFICE', 'BAR Operations Office', 'Office', '1'),
('NB-103', 'MASTER OF LAW CLASSROOM', 'Master of Law Classroom', 'Classroom', '1'),
('NB-104', 'LAW DEAN\'S OFFICE', 'Law Dean Office', 'Office', '1'),
('NB-105', 'LAW READING AREA', 'Law Reading Area', 'Commons', '1'),
('NB-106', 'LAW LIBRARY', 'Law Library', 'Library', '1'),
('NB-107', 'MOOTCOURT', 'Moot Court Room', 'Laboratory', '1'),
('NB-201', 'CLASSROOM (LAW)', 'Law Classroom', 'Classroom', '2'),
('NB-202', 'CLASSROOM (LAW)', 'Law Classroom', 'Classroom', '2'),
('NB-203', 'CLASSROOM (LAW)', 'Law Classroom', 'Classroom', '2'),
('NB-204', 'CLEP LAB', 'CLEP Laboratory', 'Laboratory', '2'),
('NB-205', 'SERVER ROOM', 'Server Room', 'Server Room', '2'),
('NB-206', 'CLASSROOM (LAW)', 'Law Classroom', 'Classroom', '2'),
('NB-207', 'CLASSROOM (LAW)', 'Law Classroom', 'Classroom', '2'),
('NB-208', 'CLASSROOM (LAW)', 'Law Classroom', 'Classroom', '2'),
('NB-209', 'CLASSROOM (LAW)', 'Law Classroom', 'Classroom', '2'),
('NB-210', 'CLASSROOM (LAW)', 'Law Classroom', 'Classroom', '2'),
('NB-211', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('NB-301', 'ARCHITECTURE AVR', 'Architecture Audio-Visual Room', 'AV Room', '3'),
('NB-302', 'DRAFTING ROOM', 'Drafting Room', 'Laboratory', '3'),
('NB-303', 'DRAFTING ROOM', 'Drafting Room', 'Laboratory', '3'),
('NB-304', 'DRAFTING ROOM', 'Drafting Room', 'Laboratory', '3'),
('NB-305', 'CLASSROOM (ARCHITECTURE)', 'Architecture Classroom', 'Classroom', '3'),
('NB-306', 'CLASSROOM (ARCHITECTURE)', 'Architecture Classroom', 'Classroom', '3'),
('NB-307', 'CLASSROOM', 'General Classroom', 'Classroom', '3'),
('NB-308', 'EDUC LAB', 'Education Laboratory', 'Laboratory', '3'),
('NB-309', 'EDUC LAB', 'Education Laboratory', 'Laboratory', '3'),
('PA-1', 'SSG OFFICE', 'Student Supreme Government Office', 'Office', '1'),
('PA-2', 'BSP', 'Boy Scouts of the Philippines Office', 'Office', '1'),
('PA-3', 'GSP', 'Girl Scouts of the Philippines Office', 'Office', '1'),
('SC101', 'CLASSROOM', 'General Classroom', 'Classroom', '1'),
('SC102', 'CLASSROOM', 'General Classroom', 'Classroom', '1'),
('SC103', 'CLASSROOM', 'General Classroom', 'Classroom', '1'),
('SC104', 'CLASSROOM', 'General Classroom', 'Classroom', '1'),
('SC105', 'CLASSROOM', 'General Classroom', 'Classroom', '1'),
('SC106', 'CLASSROOM', 'General Classroom', 'Classroom', '1'),
('SC107', 'CLASSROOM', 'General Classroom', 'Classroom', '1'),
('SC108', 'CLASSROOM', 'General Classroom', 'Classroom', '1'),
('SC201', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('SC202', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('SC203', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('SC204', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('SC205', 'CLASSROOM', 'General Classroom', 'Classroom', '2'),
('SC206', 'H/S BIOLOGY LAB', 'High School Biology Laboratory', 'Laboratory', '2'),
('SC207', 'H/S CHEMISTRY LAB', 'High School Chemistry Laboratory', 'Laboratory', '2'),
('SC208', 'H/S TRAILBLAZER OFFICE', 'Trailblazer Office', 'Office', '2'),
('SC300', 'CHEMISTRY STOCKROOM', 'Chemistry Stockroom', 'Stockroom', '3'),
('SC301', 'ENGG CHEMISTRY LABORATORY', 'Engineering Chemistry Laboratory', 'Laboratory', '3'),
('SC302', 'CHEMISTRY LAB. CUSTODIAN OFFICE', 'Chemistry Lab Custodian Office', 'Office', '3'),
('SC303', 'CHEMISTRY LABORATORY', 'Chemistry Laboratory', 'Laboratory', '3'),
('SC304', 'JHS PHYSICS LAB', 'Junior High Physics Laboratory', 'Laboratory', '3'),
('SC305', 'NATURAL SCIENCE LABORATORY', 'Natural Science Lab', 'Laboratory', '3'),
('SC306', 'BIO/BOT/ENV. SC LAB ROOM', 'Biology/Botany/Environmental Science Lab', 'Laboratory', '3'),
('SC307', 'NATSCI. LAB CUSTODIAN OFFICE', 'Natural Science Lab Custodian Office', 'Office', '3'),
('SP-1', 'BAND ROOM', 'Band Room for music practice', 'Laboratory', '1'),
('SP-10', 'CAT OFFICE', 'CAT Office', 'Office', '1'),
('SP-11', 'PROPERTY OFFICE', 'Property Office', 'Office', '1'),
('SP-12', 'PROPERTY STOCKROOM', 'Property Stockroom', 'Stockroom', '1'),
('SP-2', 'DLC ROOM', 'DLC Room', 'Room', '1'),
('SP-3', 'DEMOCRAT OFFICE', 'Democrat Office', 'Office', '1'),
('SP-4', 'MAINTENANCE OFFICE', 'Maintenance Office', 'Office', '1'),
('SP-5', 'SPORTS DIRECTOR OFFICE', 'Sports Director Office', 'Office', '1'),
('SP-6', 'P.E. OFFICE', 'Physical Education Office', 'Office', '1'),
('SP-7', 'RESOURCE CENTER', 'Resource Center', 'Office', '1'),
('SP-8', 'RESOURCE CENTER', 'Resource Center', 'Office', '1'),
('SP-9', 'MAPEH OFFICE', 'Music, Arts, PE, and Health Office', 'Office', '1');

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
  ADD PRIMARY KEY (`bldg_id`);

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
