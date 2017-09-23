-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2017 at 10:14 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yx`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(10) NOT NULL DEFAULT '0',
  `book_name` varchar(4000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `book_name`) VALUES
(11, 'c sharp 1'),
(12, 'c sharp 2'),
(71, 'agile book 1'),
(72, 'agile book2');

-- --------------------------------------------------------

--
-- Table structure for table `books0923`
--

CREATE TABLE `books0923` (
  `book_id` int(10) NOT NULL,
  `book_name` varchar(4000) NOT NULL DEFAULT '',
  `author_name` varchar(100) NOT NULL DEFAULT '',
  `yeartime` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books0923`
--

INSERT INTO `books0923` (`book_id`, `book_name`, `author_name`, `yeartime`) VALUES
(1, 'hh', 'kk', 'bx'),
(2, 'Modern Database Management (Tenth Edition)', 'Jeffrey A. Hoffer&V.Ramesh&Heikki Topi', '2011'),
(3, 'An Introduction to Database Systems', 'C.J. Date', '2004'),
(4, 'Beginning Oracle SQL For Oracle Database 12c', 'Tim Gorman& Inger Jorgensen& Melanie Caffrey', '2014'),
(5, 'Relational database design and implementation', 'Jan L. Harrington', '2016'),
(6, 'Database design application development and administration', 'Michael V Mannino', '2004'),
(7, 'Database systems : design implementation and management.', 'Carlos Coronel&Steven Morris ', '2015'),
(8, 'Database systems : a practical approach to design  implementation  and management', 'Thomas M. Connolly& Carolyn E. Beg', '2015'),
(9, 'Learning Data Mining with R', 'Bater Makhabel', '2015'),
(10, 'Social Big Data Mining', 'Hiroshi Ishikawa', '2015'),
(11, 'Data Mining for Business Applications', 'C Soares& R Ghani', '2010'),
(12, 'Proactive data mining with decision trees', 'Haim Dahan& Shahar Cohen& Lior Rokach& Oded Maimon', '2014'),
(13, 'RapidMiner Data Mining Use Cases and Business Analytics Applications', 'Markus Hofmann& Ralf Klinkenberg', '2013'),
(14, 'Data Mining In Time Series Databases', 'Mark Last& Abraham Kandel& Horst Bunke', '2004');

-- --------------------------------------------------------

--
-- Table structure for table `cfield_execution_values`
--

CREATE TABLE `cfield_execution_values` (
  `field_id` int(10) NOT NULL DEFAULT '0',
  `execution_id` int(10) NOT NULL DEFAULT '0',
  `testplan_id` int(10) NOT NULL DEFAULT '0',
  `tcversion_id` int(10) NOT NULL DEFAULT '0',
  `value` varchar(4000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cfield_execution_values`
--

INSERT INTO `cfield_execution_values` (`field_id`, `execution_id`, `testplan_id`, `tcversion_id`, `value`) VALUES
(10, 1, 1, 1, 'qwreqwer');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(10) NOT NULL DEFAULT '0',
  `course_name` varchar(4000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`) VALUES
(1, 'C#'),
(7, 'agile');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `number` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`number`, `name`, `birthday`) VALUES
(34, '\0', '2017-09-04');

-- --------------------------------------------------------

--
-- Table structure for table `person_courses`
--

CREATE TABLE `person_courses` (
  `person_id` int(10) NOT NULL DEFAULT '0',
  `course_id` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `person_courses`
--

INSERT INTO `person_courses` (`person_id`, `course_id`) VALUES
(1, 1),
(8, 1),
(8, 7);

-- --------------------------------------------------------

--
-- Table structure for table `recommend_courses_books`
--

CREATE TABLE `recommend_courses_books` (
  `person_id` int(10) NOT NULL DEFAULT '0',
  `course_id` int(10) NOT NULL DEFAULT '0',
  `book_id` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recommend_courses_books`
--

INSERT INTO `recommend_courses_books` (`person_id`, `course_id`, `book_id`) VALUES
(1, 1, 11),
(1, 1, 72),
(1, 7, 71),
(8, 7, 12),
(8, 7, 72);

-- --------------------------------------------------------

--
-- Table structure for table `student_books_notes`
--

CREATE TABLE `student_books_notes` (
  `note_id` int(10) NOT NULL,
  `person_id` int(10) NOT NULL DEFAULT '0',
  `book_id` int(10) NOT NULL DEFAULT '0',
  `value` varchar(4000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_books_notes`
--

INSERT INTO `student_books_notes` (`note_id`, `person_id`, `book_id`, `value`) VALUES
(15, 8, 71, 'welcome adding notes  nnnnnn\r\n'),
(16, 8, 71, 'welcome adding notes  hhhhhhhh\r\n'),
(18, 8, 71, 'welcome adding notes\r\n729'),
(19, 8, 71, 'welcome adding notes  fffffff\r\n'),
(20, 8, 71, 'welcome adding notes\r\n730'),
(21, 8, 71, 'welcome adding notes   2050\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `student_courses_books`
--

CREATE TABLE `student_courses_books` (
  `person_id` int(10) NOT NULL DEFAULT '0',
  `course_id` int(10) NOT NULL DEFAULT '0',
  `book_id` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_courses_books`
--

INSERT INTO `student_courses_books` (`person_id`, `course_id`, `book_id`) VALUES
(8, 7, 71),
(8, 7, 72);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` char(8) NOT NULL,
  `passcode` char(8) NOT NULL,
  `userflag` int(11) DEFAULT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `passcode`, `userflag`, `ID`) VALUES
('admin', 'admin123', 0, 0),
('sam', '1', 1, 1),
('yx', '2', 2, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `books0923`
--
ALTER TABLE `books0923`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `cfield_execution_values`
--
ALTER TABLE `cfield_execution_values`
  ADD PRIMARY KEY (`field_id`,`execution_id`,`testplan_id`,`tcversion_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `person_courses`
--
ALTER TABLE `person_courses`
  ADD PRIMARY KEY (`person_id`,`course_id`);

--
-- Indexes for table `recommend_courses_books`
--
ALTER TABLE `recommend_courses_books`
  ADD PRIMARY KEY (`person_id`,`course_id`,`book_id`);

--
-- Indexes for table `student_books_notes`
--
ALTER TABLE `student_books_notes`
  ADD PRIMARY KEY (`note_id`);

--
-- Indexes for table `student_courses_books`
--
ALTER TABLE `student_courses_books`
  ADD PRIMARY KEY (`person_id`,`course_id`,`book_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books0923`
--
ALTER TABLE `books0923`
  MODIFY `book_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `student_books_notes`
--
ALTER TABLE `student_books_notes`
  MODIFY `note_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
