-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: fdb1029.awardspace.net
-- Generation Time: Jan 05, 2025 at 09:33 PM
-- Server version: 8.0.32
-- PHP Version: 8.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `4567886_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `chapters`
--

CREATE TABLE `chapters` (
  `id` int NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `chapter_name` varchar(255) NOT NULL,
  `status` enum('completed','incomplete') DEFAULT 'incomplete'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chapters`
--

INSERT INTO `chapters` (`id`, `user_id`, `chapter_name`, `status`) VALUES
(7, '22', 'Chapter 1', 'completed'),
(8, '22', 'Chapter 2', 'completed'),
(9, '22', 'Chapter 3', 'completed'),
(10, '22', 'Chapter 4', 'completed'),
(13, '8', 'Chapter 1', 'completed'),
(14, '8', 'Chapter 2', 'completed'),
(15, '8', 'Chapter 3', 'completed'),
(16, '8', 'Chapter 4', 'completed'),
(17, '8', 'Chapter 5', 'completed'),
(21, '22', 'Chapter 5', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `option1` text NOT NULL,
  `option2` text NOT NULL,
  `option3` text NOT NULL,
  `option4` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `answer`, `option1`, `option2`, `option3`, `option4`) VALUES
(1, 'what is the data type tof a number that dont have a decimal', 'int', 'double', 'int', 'string', 'float'),
(2, 'What is the default value of a boolean variable in Java?', 'false', 'true', 'false', 'null', 'undefined'),
(3, 'Which of the following is not a primitive data type in Java?', 'String', 'int', 'char', 'boolean', 'String'),
(4, 'What is the size of a byte in Java?', '1 byte', '2 bytes', '4 bytes', '8 bytes', '1 byte'),
(5, 'Which keyword is used to define a class in Java?', 'class', 'public', 'static', 'final', 'class'),
(6, 'What is the default value of an integer variable in Java?', '0', '1', 'null', 'undefined', '0'),
(7, 'Which of these is used to declare a constant variable in Java?', 'final', 'static', 'const', 'immutable', 'final'),
(8, 'Which method is called when the Java program is executed?', 'main()', 'run()', 'start()', 'execute()', 'main()'),
(9, 'What is the result of the expression \"5 + 10 + \'20\'\" in Java?', '15', '15 + \"20\"', '520', '20', '520'),
(10, 'Which method is used to find the length of a string in Java?', 'length()', 'size()', 'getLength()', 'lengthOf()', 'length()'),
(11, 'Which of the following is the parent class of all classes in Java?', 'Object', 'String', 'Class', 'Throwable', 'Object'),
(12, 'What is the output of the following code: \"System.out.println(2 + 3 + 5);\"', '10', '23', '5', '8', '10'),
(13, 'Which loop is guaranteed to execute at least once in Java?', 'do-while', 'while', 'for', 'foreach', 'do-while'),
(14, 'What is the keyword used to inherit a class in Java?', 'extends', 'implements', 'super', 'this', 'extends'),
(15, 'What does JVM stand for in Java?', 'Java Virtual Machine', 'Java Visual Machine', 'Java Verified Machine', 'Java Variable Manager', 'Java Virtual Machine'),
(16, 'Which collection class in Java implements the List interface?', 'ArrayList', 'HashSet', 'HashMap', 'TreeSet', 'ArrayList'),
(17, 'Which operator is used to compare two values in Java?', '==', 'equals()', 'compare()', 'isEqual()', '=='),
(18, 'What is the purpose of the `public static void main(String[] args)` method in Java?', 'It is the entry point of the program.', 'It runs the program in the background.', 'It initializes the class.', 'It stores the user input.', 'It is the entry point of the program.'),
(19, 'Which of these statements is true regarding Java constructors?', 'They have the same name as the class.', 'They return a value.', 'They are declared with the keyword \"constructor\".', 'They cannot accept parameters.', 'They have the same name as the class.'),
(20, 'What will be the output of the following code: \"System.out.println(10 / 3);\"', '3', '3.0', '3.333', '4', '3'),
(21, 'Which of the following is not a valid Java identifier?', '1variable', 'variable1', 'var_name', 'Variable', '1variable');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `question_id` int NOT NULL,
  `score` int NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `age` int NOT NULL,
  `grade` varchar(50) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `age`, `grade`, `gender`) VALUES
(5, 'Sajed', 'Sajed@gmail.com', '$2y$10$g61j9RJuqEx5SH0Zr.4RL.2vT6Rxcxen26Os3ziLmRraIu.ygejOe', 12, '5th grade', 'Male'),
(6, 'Sami', 'Sami@gmail.com', '$2y$10$M3i2.Ys28sXGhnC27RdIeO.doU/zjRD3H0fOizqQa1INzrgatqlV.', 14, '7th grade', 'Male'),
(7, 'karim', 'kimla5@gmail.com', '$2y$10$dZSdb8AqRCddY.QiC1.37uNgvE3Og9bXAjd0oBIVddZq/zsxzFRAe', 6, '5', 'Male'),
(8, 'karim', 'kimolali5@gmail.com', '$2y$10$AM8gOqLtrStTBSiST6MnkeWmaUBXBaJSfOHBg8Mr2OtkykUFqaVSu', 6, '6', 'Male'),
(13, 'khaled', 'khald@email.com', '$2y$10$u1qoHrPA5v4oem..XIGzrunvi9nOdjsey7ZnNRmG/2oituUPApRo.', 12, '6', 'Female'),
(22, 'samir', 'samir@gmail.com', '$2y$10$ACT5lm3EDPtNPCZcfrJp6uboY3aS5JACLuE2y5LKxdJX3uid7qP8.', 6, '8', 'Male');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`chapter_name`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `test_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `test_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
