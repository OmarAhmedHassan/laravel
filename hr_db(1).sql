-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 03, 2023 at 12:44 PM
-- Server version: 5.7.36
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hr_db`
--

DELIMITER $$
--
-- Functions
--
DROP FUNCTION IF EXISTS `upperfirst`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `upperfirst` (`x` VARCHAR(255)) RETURNS VARCHAR(255) CHARSET latin1  RETURN concat( upper(substring(x,1,1)),lower(substring(x,2)) )$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `country_id` char(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key of countries table.',
  `country_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'country name',
  `region_id` tinyint(4) DEFAULT NULL COMMENT 'region id for the country. foreign key to region_id column in the departments table.',
  PRIMARY KEY (`country_id`),
  KEY `countr_reg_fk` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='country table. contains 25 rows. references with locations table.';

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES
('ar', 'argentina', 2),
('au', 'australia', 3),
('be', 'belgium', 1),
('br', 'italy25', 2),
('ca', 'canada', 2),
('ch', 'switzerland', 1),
('cn', 'china', 3),
('de', 'germany', 1),
('dk', 'denmark', 1),
('fr', 'france', 1),
('in', 'india', 3),
('it', 'italy25', 2),
('jp', 'japan', 3),
('ml', 'malaysia', 3),
('mx', 'mexico', 2),
('nl', 'netherlands', 1),
('sg', 'singapore', 3),
('uk', 'united kingdom', 1),
('us', 'united states of america', 2);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `department_id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'primary key column of departments table.',
  `department_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'a not null column that shows name of a department. administration,\r\nmarketing, purchasing, human resources, shipping, it, executive, public\r\nrelations, sales, finance, and accounting. ',
  `manager_id` int(6) DEFAULT NULL COMMENT 'manager_id of a department. foreign key to employee_id column of employees table. the manager_id column of the employee table references this column.',
  `location_id` smallint(4) DEFAULT NULL COMMENT 'location id where a department is located. foreign key to location_id column of locations table.',
  PRIMARY KEY (`department_id`),
  KEY `dept_location_ix` (`location_id`),
  KEY `dept_mgr_fk` (`manager_id`),
  KEY `dept_loc_fk` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='departments table that shows details of departments where employees\r\nwork. contains 27 rows; references with locations, employees, and job_history tables.';

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`) VALUES
(10, 'ADMINISTRATION', 200, 1700),
(30, 'PURCH', 114, 1700),
(40, 'HUMAN RESOURCES', 203, 2400),
(50, 'SHIPPING', 121, 1500),
(60, 'IT', 103, 1400),
(80, 'SALES', 145, 2500),
(90, 'EXECUTIVE', 100, 1700),
(100, 'FINANCE', 108, 1700),
(120, 'TREASURY', NULL, 1700),
(130, 'CORPORATE TAX', NULL, 1700),
(140, 'CONTROL AND CREDIT', NULL, 1700),
(150, 'SHAREHOLDER SERVICES', NULL, 1700),
(160, 'BENEFITS', NULL, 1700),
(170, 'MANUFACTURING', NULL, 1700),
(180, 'CONSTRUCTION', NULL, 1700),
(190, 'CONTRACTING', NULL, 1700),
(200, 'OPERATIONS', NULL, 1700),
(210, 'IT SUPPORT', NULL, 1700),
(220, 'NOC', NULL, 1700),
(230, 'IT HELPDESK', NULL, 1700),
(240, 'GOVERNMENT SALES', NULL, 1700),
(250, 'RETAIL SALES', NULL, 1700),
(260, 'RECRUITING', NULL, 1700),
(270, 'PAYROLL', NULL, 1700),
(280, 'NEW DEPT', 101, 1700),
(290, 'TESTING GROUP', 114, 1800),
(300, 'newdep', 114, 1700),
(301, 'ahDep', NULL, NULL),
(310, 'ibrahimDep', 114, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `employee_id` int(6) NOT NULL AUTO_INCREMENT COMMENT 'primary key of employees table.',
  `first_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'first name of the employee. a not null column.',
  `last_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'last name of the employee. a not null column.',
  `email` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'email id of the employee',
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'phone number of the employee; includes country code and area code',
  `hire_date` datetime NOT NULL COMMENT 'date when the employee started on this job. a not null column.',
  `job_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'current job of the employee; foreign key to job_id column of the\r\njobs table. a not null column.',
  `salary` decimal(8,2) DEFAULT NULL COMMENT 'monthly salary of the employee. must be greater\r\nthan zero (enforced by constraint emp_salary_min)',
  `commission_pct` decimal(2,2) DEFAULT NULL COMMENT 'commission percentage of the employee; only employees in sales\r\ndepartment elgible for commission percentage',
  `manager_id` int(6) DEFAULT NULL COMMENT 'manager id of the employee; has same domain as manager_id in\r\ndepartments table. foreign key to employee_id column of employees table.\r\n(useful for reflexive joins and connect by query)',
  `department_id` int(8) DEFAULT NULL COMMENT 'department id where employee works; foreign key to department_id\r\ncolumn of the departments table',
  `gender` int(1) DEFAULT '0',
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `emp_email_uk` (`email`),
  KEY `emp_name_ix` (`last_name`,`first_name`),
  KEY `emp_department_ix` (`department_id`),
  KEY `emp_job_ix` (`job_id`),
  KEY `emp_manager_ix` (`manager_id`),
  KEY `emp_job_fk` (`job_id`),
  KEY `emp_manager_fk` (`manager_id`),
  KEY `emp_dept_fk` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='employees table. contains 107 rows. references with departments,\r\njobs, job_history tables. contains a self reference.';

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`, `gender`) VALUES
(100, 'Steven', 'King', 'SKING', '515.123.4567', '2003-06-17 00:00:00', 'AD_PRES', '25000.56', NULL, NULL, 90, 0),
(101, 'Neena', '$Kochhar', 'NKOCHHAR', '515.123.4568', '2005-09-21 00:00:00', 'AD_VP', '28152.40', NULL, 100, 90, 1),
(102, 'Lex', 'De haan ', 'LDEHAAN', '515.123.4569', '2001-01-13 00:00:00', 'AD_VP', '32603.99', NULL, 100, 90, 0),
(103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '2021-04-03 08:48:19', 'IT_PROG', NULL, NULL, 102, 60, 1),
(104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '2001-01-13 00:00:00', 'IT_PROG', '12520.00', NULL, 103, 60, 1),
(105, 'David', 'Austin', 'DAUSTIN', '590.423.4569', '2001-01-13 00:00:00', 'IT_PROG', '16360.00', NULL, 103, 60, 1),
(106, 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', '2001-01-13 00:00:00', 'IT_PROG', '6760.00', NULL, 103, 60, 0),
(108, 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', '2001-01-13 00:00:00', 'FI_MGR', '12008.00', NULL, 101, 100, 0),
(109, 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', '2001-01-13 00:00:00', 'FI_ACCOUNT', '10350.00', NULL, 108, 100, 0),
(110, 'amr', 'gamal', 'amr@gmail.com', '515.124.4269', '2001-01-13 00:00:00', 'FI_ACCOUNT', '11000.00', NULL, 108, 100, 1),
(111, 'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', '2001-01-13 00:00:00', 'FI_ACCOUNT', '8855.00', NULL, 108, 100, 0),
(112, 'Jose manuel', 'Urman', 'JMURMAN', '515.124.4469', '2001-01-13 00:00:00', 'FI_ACCOUNT', '8970.00', NULL, 108, 100, 0),
(113, 'Luis', 'Popp', 'LPOPP', '515.124.4567', '2001-01-13 00:00:00', 'FI_ACCOUNT', '7935.00', NULL, 108, 100, 1),
(114, 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561', '2001-01-13 00:00:00', 'PU_MAN', '11000.00', NULL, 100, 30, 0),
(115, 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', '2001-01-13 00:00:00', 'PU_CLERK', '11000.00', NULL, 114, 30, 1),
(116, 'Shelli', 'Baida', 'SBAIDA', '515.127.4563', '2001-01-13 00:00:00', 'PU_CLERK', '2900.00', NULL, 114, 30, 0),
(117, 'Sigal', 'Tobias', 'STOBIAS', '515.127.4564', '2001-01-13 00:00:00', 'PU_CLERK', '2800.00', NULL, 114, 30, 1),
(118, 'Guy', 'Himuro', 'GHIMURO', '515.127.4565', '2001-01-13 00:00:00', 'PU_CLERK', '2600.00', NULL, 114, 30, 0),
(119, 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', '2001-01-13 00:00:00', 'PU_CLERK', '2500.00', NULL, 114, 30, 0),
(120, 'Matthew', 'Weiss', 'MWEISS', '650.123.1234', '2001-01-13 00:00:00', 'ST_MAN', '8000.00', NULL, 100, 50, 1),
(121, 'Adam', 'Fripp', 'AFRIPP', '650.123.2234', '2001-01-13 00:00:00', 'ST_MAN', '8200.00', NULL, 100, 50, 0),
(122, 'Payam', 'Kaufling', 'PKAUFLIN', '650.123.3234', '2001-01-13 00:00:00', 'ST_MAN', '7900.00', NULL, 100, 50, 0),
(123, 'Shanta', 'Vollman', 'SVOLLMAN', '650.123.4234', '2001-01-13 00:00:00', 'ST_MAN', '6500.00', NULL, 100, 50, 0),
(124, 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', '2001-01-13 00:00:00', 'ST_MAN', '1111.00', NULL, 100, 50, 0),
(125, 'Julia', 'Nayer', 'JNAYER', '650.124.1214', '2001-01-13 00:00:00', 'ST_CLERK', '3200.00', NULL, 120, 50, 0),
(126, 'Irene', 'Mikkilineni', 'IMIKKILI', '650.124.1224', '2001-01-13 00:00:00', 'ST_CLERK', '2700.00', NULL, 120, 50, 0),
(127, 'James', 'Landry', 'JLANDRY', '650.124.1334', '2001-01-13 00:00:00', 'ST_CLERK', '2400.00', NULL, 120, 50, 0),
(128, 'Steven', 'Markle', 'SMARKLE', '650.124.1434', '2001-01-13 00:00:00', 'ST_CLERK', '2200.00', NULL, 120, 50, 0),
(129, 'Laura', 'Bissot', 'LBISSOT', '650.124.5234', '2001-01-13 00:00:00', 'ST_CLERK', '3300.00', NULL, 121, 50, 0),
(130, 'Mozhe', 'Atkinson', 'MATKINSO', '650.124.6234', '2001-01-13 00:00:00', 'ST_CLERK', '2800.00', NULL, 121, 50, 0),
(131, 'James', 'Marlow', 'JAMRLOW', '650.124.7234', '2001-01-13 00:00:00', 'ST_CLERK', '2500.00', NULL, 121, 50, 0),
(132, 'Tj', 'Olson', 'TJOLSON', '650.124.8234', '2001-01-13 00:00:00', 'ST_CLERK', '2100.00', NULL, 121, 50, 0),
(133, 'Jason', 'Mallin', 'JMALLIN', '650.127.1934', '2001-01-13 00:00:00', 'ST_CLERK', '3300.00', NULL, 122, 50, 0),
(134, 'Michael', 'Rogers', 'MROGERS', '650.127.1834', '2001-01-13 00:00:00', 'ST_CLERK', '2900.00', NULL, 122, 50, 0),
(135, 'Ki', 'Gee', 'KGEE', '650.127.1734', '2001-01-13 00:00:00', 'ST_CLERK', '2400.00', NULL, 122, 50, 0),
(136, 'Hazel', 'Philtanker', 'HPHILTAN', '650.127.1634', '2001-01-13 00:00:00', 'ST_CLERK', '2200.00', NULL, 122, 50, 0),
(137, 'Renske', 'Ladwig', 'RLADWIG', '650.121.1234', '2001-01-13 00:00:00', 'ST_CLERK', '3600.00', NULL, 123, 50, 0),
(138, 'Stephen', 'Stiles', 'SSTILES', '650.121.2034', '2001-01-13 00:00:00', 'ST_CLERK', '3200.00', NULL, 123, 50, 0),
(139, 'John', 'Seo', 'JSEO', '650.121.2019', '2001-01-13 00:00:00', 'ST_CLERK', '2700.00', NULL, 123, 50, 0),
(140, 'Joshua', 'Patel', 'JPATEL', '650.121.1834', '2001-01-13 00:00:00', 'ST_CLERK', '2500.00', NULL, 123, 50, 0),
(141, 'Trenna', 'Rajs', 'TRAJS', '650.121.8009', '2001-01-13 00:00:00', 'ST_CLERK', '3500.00', NULL, 124, 50, 0),
(142, 'Curtis', 'Davies', 'CDAVIES', '650.121.2994', '2001-01-13 00:00:00', 'ST_CLERK', '3100.00', NULL, 124, 50, 0),
(143, 'Randall', 'Matos', 'RMATOS', '650.121.2874', '2001-01-13 00:00:00', 'ST_CLERK', '2600.00', NULL, 124, 50, 0),
(144, 'Peter', 'Vargas', 'PVARGAS', '650.121.2004', '2001-01-13 00:00:00', 'ST_CLERK', '2500.00', NULL, 124, 50, 0),
(145, 'John', 'Russell', 'JRUSSEL', '011.44.1344.429268', '2001-01-13 00:00:00', 'SA_MAN', '14000.00', '0.40', 100, 80, 0),
(146, 'Karen', 'Partners', 'KPARTNER', '011.44.1344.467268', '2001-01-13 00:00:00', 'SA_MAN', '13500.00', '0.30', 100, 80, 0),
(147, 'Alberto', 'Errazuriz', 'AERRAZUR', '011.44.1344.429278', '2001-01-13 00:00:00', 'SA_MAN', '12000.00', '0.30', 100, 80, 0),
(148, 'Gerald', 'Camlt', 'GCAMBRAU', '011.44.1344.619268', '2001-01-13 00:00:00', 'SA_MAN', '11000.00', '0.30', 100, 80, 0),
(149, 'Eleni', 'Zlotkey', 'EZLOTKEY', '011.44.1344.429018', '2001-01-13 00:00:00', 'SA_MAN', '10500.00', '0.20', 100, 80, 0),
(150, 'Peter', 'Tucker', 'PTUCKER', '011.44.1344.129268', '2001-01-13 00:00:00', 'SA_REP', '10000.00', '0.30', 145, 80, 0),
(151, 'David', 'Bernstein', 'DBERNSTE', '011.44.1344.345268', '2001-01-13 00:00:00', 'SA_REP', '9500.00', '0.25', 145, 80, 0),
(152, 'Peter', 'Hall', 'PHALL', '011.44.1344.478968', '2001-01-13 00:00:00', 'SA_REP', '9000.00', '0.25', 145, 80, 0),
(153, 'Christopher', 'Olsen', 'COLSEN', '011.44.1344.498718', '2001-01-13 00:00:00', 'SA_REP', '8000.00', '0.20', 145, 80, 0),
(154, 'Nanette', 'Cambrault', 'NCAMBRAU', '011.44.1344.987668', '2001-01-13 00:00:00', 'SA_REP', '7500.00', '0.20', 145, 80, 0),
(155, 'Oliver', 'Tuvault', 'OTUVAULT', '011.44.1344.486508', '2001-01-13 00:00:00', 'SA_REP', '7000.00', '0.15', 145, 80, 0),
(156, 'Janette', '  King ', 'JKING', '011.44.1345.429268', '2001-01-13 00:00:00', 'SA_REP', '10000.00', '0.35', 146, 80, 0),
(157, 'Patrick', 'Sully', 'PSULLY', '011.44.1345.929268', '2001-01-13 00:00:00', 'SA_REP', '9500.00', '0.35', 146, 80, 0),
(158, 'Allan', 'Mcewen', 'AMCEWEN', '011.44.1345.829268', '2001-01-13 00:00:00', 'SA_REP', '9000.00', '0.35', 146, 80, 0),
(159, 'Lindsey', 'Smith', 'LSMITH', '011.44.1345.729268', '2001-01-13 00:00:00', 'SA_REP', '8000.00', '0.30', 146, 80, 0),
(160, 'Louise', 'Doran', 'LDORAN', '011.44.1345.629268', '2001-01-13 00:00:00', 'SA_REP', '7500.00', '0.30', 146, 80, 0),
(161, 'Sarath', 'Sewall', 'SSEWALL', '011.44.1345.529268', '2001-01-13 00:00:00', 'SA_REP', '7000.00', '0.25', 146, 80, 0),
(162, 'Clara', 'Vishney', 'CVISHNEY', '011.44.1346.129268', '2001-01-13 00:00:00', 'SA_REP', '10500.00', '0.25', 147, 80, 0),
(163, 'Danielle', 'Greene', 'DGREENE', '011.44.1346.229268', '2001-01-13 00:00:00', 'SA_REP', '9500.00', '0.15', 147, 80, 0),
(164, 'Mattea', 'Marvins', 'MMARVINS', '011.44.1346.329268', '2001-01-13 00:00:00', 'SA_REP', '7200.00', '0.10', 147, 80, 0),
(165, 'David', 'Lee', 'DLEE', '011.44.1346.529268', '2001-01-13 00:00:00', 'SA_REP', '6800.00', '0.10', 147, 80, 0),
(166, 'Sundar', 'Ande', 'SANDE', '011.44.1346.629268', '2001-01-13 00:00:00', 'SA_REP', '6400.00', '0.10', 147, 80, 0),
(167, 'Amit', 'Banda', 'ABANDA', '011.44.1346.729268', '2001-01-13 00:00:00', 'SA_REP', '6200.00', '0.10', 147, 80, 0),
(168, 'Lisa', 'Ozer', 'LOZER', '011.44.1343.929268', '2001-01-13 00:00:00', 'SA_REP', '11500.00', '0.25', 148, 80, 0),
(169, 'Harrison', 'Bloom', 'HBLOOM', '011.44.1343.829268', '2001-01-13 00:00:00', 'SA_REP', '10000.00', '0.20', 148, 80, 0),
(170, 'Tayler', 'Fox', 'TFOX', '011.44.1343.729268', '2001-01-13 00:00:00', 'SA_REP', '9600.00', '0.20', 148, 80, 0),
(171, 'William', 'Smith', 'WSMITH', '011.44.1343.629268', '2001-01-13 00:00:00', 'SA_REP', '7400.00', '0.15', 148, 80, 0),
(172, 'Elizabeth', 'Bates', 'EBATES', '011.44.1343.529268', '2001-01-13 00:00:00', 'SA_REP', '7300.00', '0.15', 148, 80, 0),
(173, 'Sundita', 'Kumar', 'SKUMAR', '011.44.1343.329268', '2001-01-13 00:00:00', 'SA_REP', '6100.00', '0.10', 148, 80, 0),
(174, 'Ellen', 'Abel', 'EABEL', '011.44.1644.429267', '2001-01-13 00:00:00', 'SA_REP', '11000.00', '0.30', 149, NULL, 0),
(175, 'Alyssa', 'Hutton', 'AHUTTON', '011.44.1644.429266', '2001-01-13 00:00:00', 'SA_REP', '8800.00', '0.25', 149, 80, 0),
(176, 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1644.429265', '2001-01-13 00:00:00', 'SA_REP', '8600.00', '0.20', 149, 80, 0),
(177, 'Jack', 'Livingston', 'JLIVINGS', '011.44.1644.429264', '2001-01-13 00:00:00', 'SA_REP', '8400.00', '0.20', 149, 80, 0),
(178, 'Kimberely', 'ed', 'KGRANT', '011.44.1644.429263', '2001-01-13 00:00:00', 'SA_REP', '7000.00', '0.15', 149, NULL, 0),
(179, 'Charles', 'Johnson', 'CJOHNSON', '011.44.1644.429262', '2001-01-13 00:00:00', 'SA_REP', '6200.00', '0.10', 149, 80, 0),
(180, 'Winston', 'Taylor', 'WTAYLOR', '650.507.9876', '2001-01-13 00:00:00', 'SH_CLERK', '3200.00', NULL, 120, 50, 0),
(181, 'Jean', 'Fleaur', 'JFLEAUR', '650.507.9877', '2001-01-13 00:00:00', 'SH_CLERK', '3100.00', NULL, 120, 50, 0),
(182, 'Martha', 'Sullivan', 'MSULLIVA', '650.507.9878', '2001-01-13 00:00:00', 'SH_CLERK', '2500.00', NULL, 120, 50, 0),
(183, 'Girard', 'Geoni', 'GGEONI', '650.507.9879', '2001-01-13 00:00:00', 'SH_CLERK', '2800.00', NULL, 120, 50, 0),
(184, 'Nandita', 'Sarchand', 'NSARCHAN', '650.509.1876', '2001-01-13 00:00:00', 'SH_CLERK', '4200.00', NULL, 121, 50, 0),
(185, 'Alexis', 'Bull', 'ABULL', '650.509.2876', '2001-01-13 00:00:00', 'SH_CLERK', '4100.00', NULL, 121, 50, 0),
(186, 'Julia', 'Dellinger', 'JDELLING', '650.509.3876', '2001-01-13 00:00:00', 'SH_CLERK', '3400.00', NULL, 121, 50, 0),
(187, 'Anthony', 'Cabrio', 'ACABRIO', '650.509.4876', '2001-01-13 00:00:00', 'SH_CLERK', '3000.00', NULL, 121, 50, 0),
(188, 'Kelly', 'Chung', 'KCHUNG', '650.505.1876', '2001-01-13 00:00:00', 'SH_CLERK', '3800.00', NULL, 122, 50, 0),
(189, 'Jennifer', 'Dilly', 'JDILLY', '650.505.2876', '2001-01-13 00:00:00', 'SH_CLERK', '3600.00', NULL, 122, 50, 0),
(190, 'Timothy', 'Gates', 'TGATES', '650.505.3876', '2001-01-13 00:00:00', 'SH_CLERK', '2900.00', NULL, 122, 50, 0),
(191, 'Randall', 'Perkins', 'RPERKINS', '650.505.4876', '2001-01-13 00:00:00', 'SH_CLERK', '2500.00', NULL, 122, 50, 0),
(192, 'Sarah', 'Bell', 'SBELL', '650.501.1876', '2001-01-13 00:00:00', 'SH_CLERK', '4000.00', NULL, 123, 50, 0),
(193, 'Britney', 'Everett', 'BEVERETT', '650.501.2876', '2001-01-13 00:00:00', 'SH_CLERK', '3900.00', NULL, 123, 50, 0),
(194, 'Samuel', 'Mccain', 'SMCCAIN', '650.501.3876', '2001-01-13 00:00:00', 'SH_CLERK', '3200.00', NULL, 123, 50, 0),
(195, 'Vance', 'Jones', 'VJONES', '650.501.4876', '2001-01-13 00:00:00', 'SH_CLERK', '2800.00', NULL, 123, 50, 0),
(196, 'Alana', 'Walsh', 'AWALSH', '650.507.9811', '2001-01-13 00:00:00', 'SH_CLERK', '3100.00', NULL, 124, 50, 0),
(197, 'Kevin', 'Feeney', 'KFEENEY', '650.507.9822', '2001-01-13 00:00:00', 'SH_CLERK', '1111.00', NULL, 124, 50, 0),
(198, 'Donald', 'Oconnell', 'DOCONNEL', '650.507.9833', '2001-01-13 00:00:00', 'SH_CLERK', '2600.00', NULL, 124, 50, 0),
(199, 'Douglas', 'Grant', 'DGRANT', '650.507.9844', '2001-01-13 00:00:00', 'SH_CLERK', '2600.00', NULL, 124, 50, 0),
(200, 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', '2001-01-13 00:00:00', 'AD_ASST', '4400.00', NULL, 101, 10, 0),
(203, 'Susan', 'Mavris', 'SMAVRIS', '515.123.7777', '2001-01-13 00:00:00', 'HR_REP', '6500.00', NULL, 101, 40, 0),
(209, 'MOSTAFA', 'Momtaz', 'yahia@gggmail.com', NULL, '2016-03-10 00:00:00', 'MK_MAN', '7000.00', NULL, NULL, 280, 0),
(212, 'ahmed', '#sayed', 'ahmed@gmail.com', '1005323668', '2012-07-17 00:00:00', 'AD_PRES', '1000.00', NULL, NULL, NULL, 0),
(213, 'aaaaa0', 'bbbbb', 'ddsdfs', '5468456464', '1999-05-06 00:00:00', 'AD_PRES', '55644.00', '0.03', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `empss`
--

DROP TABLE IF EXISTS `empss`;
CREATE TABLE IF NOT EXISTS `empss` (
  `employee_id` int(6) NOT NULL DEFAULT '0' COMMENT 'primary key of employees table.',
  `first_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'first name of the employee. a not null column.',
  `last_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'last name of the employee. a not null column.',
  `email` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'email id of the employee',
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'phone number of the employee; includes country code and area code',
  `hire_date` datetime NOT NULL COMMENT 'date when the employee started on this job. a not null column.',
  `job_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'current job of the employee; foreign key to job_id column of the\r\njobs table. a not null column.',
  `salary` decimal(8,2) DEFAULT NULL COMMENT 'monthly salary of the employee. must be greater\r\nthan zero (enforced by constraint emp_salary_min)',
  `commission_pct` decimal(2,2) DEFAULT NULL COMMENT 'commission percentage of the employee; only employees in sales\r\ndepartment elgible for commission percentage',
  `manager_id` int(6) DEFAULT NULL COMMENT 'manager id of the employee; has same domain as manager_id in\r\ndepartments table. foreign key to employee_id column of employees table.\r\n(useful for reflexive joins and connect by query)',
  `department_id` int(8) DEFAULT NULL COMMENT 'department id where employee works; foreign key to department_id\r\ncolumn of the departments table',
  `gender` int(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `empss`
--

INSERT INTO `empss` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`, `gender`) VALUES
(103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '2021-04-03 08:48:19', 'IT_PROG', NULL, NULL, 102, 60, 1),
(104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '2001-01-13 00:00:00', 'IT_PROG', '12520.00', NULL, 103, 60, 1),
(105, 'David', 'Austin', 'DAUSTIN', '590.423.4569', '2001-01-13 00:00:00', 'IT_PROG', '16360.00', NULL, 103, 60, 1),
(106, 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', '2001-01-13 00:00:00', 'IT_PROG', '6760.00', NULL, 103, 60, 0),
(500, 'mahmoud', 'ahmed', 'a@a.com', NULL, '2022-07-07 00:00:00', 'AD_VP', NULL, NULL, NULL, 60, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `job_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'primary key of jobs table.',
  `job_title` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'a not null column that shows job title, e.g. ad_vp, fi_accountant',
  `min_salary` int(6) DEFAULT NULL COMMENT 'minimum salary for a job title.',
  `max_salary` int(6) DEFAULT NULL COMMENT 'maximum salary for a job title',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='jobs table with job titles and salary ranges. contains 19 rows.\r\nreferences with employees and job_history table.';

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES
('ac_account', 'public accountant', 4200, 9000),
('ac_mgr', 'accounting manager', 8200, 16000),
('ad_asst', 'administration assistant', 3000, 6000),
('ad_pres', 'president', 20080, 40000),
('ad_vp', 'administration vice president', 15000, 30000),
('fi_account', 'accountant', 4200, 9000),
('fi_mgr', 'finance manager', 8200, 16000),
('hr_rep', 'human resources representative', 4000, 9000),
('it_prog', 'programmer', 4000, 10000),
('mk_man', 'marketing manager', 9000, 15000),
('mk_rep', 'marketing representative', 4000, 9000),
('pr_rep', 'public relations representative', 4500, 10500),
('pu_clerk', 'purchasing clerk', 2500, 5500),
('pu_man', 'purchasing manager', 8000, 15000),
('sa_man', 'sales manager', 10000, 20080),
('sa_rep', 'sales representative', 6000, 12008),
('sh_clerk', 'shipping clerk', 2500, 5500),
('st_clerk', 'stock clerk', 2008, 5000),
('st_man', 'stock manager', 5500, 8500);

-- --------------------------------------------------------

--
-- Table structure for table `job_history`
--

DROP TABLE IF EXISTS `job_history`;
CREATE TABLE IF NOT EXISTS `job_history` (
  `employee_id` int(6) NOT NULL COMMENT 'a not null column in the complex primary key employee_id+start_date.\r\nforeign key to employee_id column of the employee table',
  `start_date` datetime NOT NULL COMMENT 'a not null column in the complex primary key employee_id+start_date.\r\nmust be less than the end_date of the job_history table. (enforced by\r\nconstraint jhist_date_interval)',
  `end_date` datetime NOT NULL COMMENT 'last day of the employee in this job role. a not null column. must be\r\ngreater than the start_date of the job_history table.\r\n(enforced by constraint jhist_date_interval)',
  `job_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'job role in which the employee worked in the past; foreign key to\r\njob_id column in the jobs table. a not null column.',
  `department_id` int(8) DEFAULT NULL COMMENT 'department id in which the employee worked in the past; foreign key to deparment_id column in the departments table',
  PRIMARY KEY (`employee_id`,`start_date`),
  KEY `jhist_department_ix` (`department_id`),
  KEY `jhist_employee_ix` (`employee_id`),
  KEY `jhist_job_ix` (`job_id`),
  KEY `jhist_emp_fk` (`employee_id`),
  KEY `jhist_job_fk` (`job_id`),
  KEY `jhist_dept_fk` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='table that stores job history of the employees. if an employee\r\nchanges departments within the job or changes jobs within the department,\r\nnew rows get inserted into this table with old job information of the\r\nemployee. contains a complex primary key: employee_id+start_date.\r\ncontains 25 rows. references with jobs, employees, and departments tables.';

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE IF NOT EXISTS `locations` (
  `location_id` smallint(4) NOT NULL AUTO_INCREMENT COMMENT 'primary key of locations table',
  `street_address` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'street address of an office, warehouse, or production site of a company.\r\ncontains building number and street name',
  `postal_code` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'postal code of the location of an office, warehouse, or production site\r\nof a company. ',
  `city` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'a not null column that shows city where an office, warehouse, or\r\nproduction site of a company is located. ',
  `state_province` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'state or province where an office, warehouse, or production site of a\r\ncompany is located.',
  `country_id` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'country where an office, warehouse, or production site of a company is\r\nlocated. foreign key to country_id column of the countries table.',
  PRIMARY KEY (`location_id`),
  KEY `loc_city_ix` (`city`),
  KEY `loc_state_province_ix` (`state_province`),
  KEY `loc_country_ix` (`country_id`),
  KEY `loc_c_id_fk` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='locations table that contains specific address of a specific office,\r\nwarehouse, and/or production site of a company. does not store addresses /\r\nlocations of customers. contains 23 rows; references with the\r\ndepartments and countries tables.';

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES
(1000, '1297 via cola di rie', '00989', 'roma', NULL, 'it'),
(1100, '93091 calle della testa', '10934', 'venice', NULL, 'it'),
(1200, '2017 shinjuku-ku', '1689', 'tokyo', 'tokyo prefecture', 'jp'),
(1300, '9450 kamiya-cho', '6823', 'hiroshima', NULL, 'jp'),
(1400, '2014 jabberwocky rd', '26192', 'southlake', 'texas', 'us'),
(1500, '2011 interiors blvd', '99236', 'south san francisco', 'california', 'us'),
(1600, '2007 zagora st', '50090', 'south brunswick', 'new jersey', 'us'),
(1700, '2004 charade rd', '98199', 'seattle', 'washington', 'us'),
(1800, '147 spadina ave', 'm5v 2l7', 'toronto', 'ontario', 'ca'),
(1900, '6092 boxwood st', 'ysw 9t2', 'whitehorse', 'yukon', 'ca'),
(2000, '40-5-12 laogianggen', '190518', 'beijing', NULL, 'cn'),
(2100, '1298 vileparle (e)', '490231', 'bombay', 'maharashtra', 'in'),
(2200, '12-98 victoria street', '2901', 'sydney', 'new south wales', 'au'),
(2300, '198 clementi north', '540198', 'singapore', NULL, 'sg'),
(2400, '8204 arthur st', NULL, 'london', NULL, 'uk'),
(2500, 'magdalen centre, the oxford science park', 'ox9 9zb', 'oxford', 'oxford', 'uk'),
(2600, '9702 chester road', '09629850293', 'stretford', 'manchester', 'uk'),
(2700, 'schwanthalerstr. 7031', '80925', 'munich', 'bavaria', 'de'),
(2800, 'rua frei caneca 1360 ', '01307-002', 'sao paulo', 'sao paulo', 'br'),
(2900, '20 rue des corps-saints', '1730', 'geneva', 'geneve', 'ch'),
(3000, 'murtenstrasse 921', '3095', 'bern', 'be', 'ch'),
(3100, 'pieter breughelstraat 837', '3029sk', 'utrecht', 'utrecht', 'nl'),
(3200, 'mariano escobedo 9991', '11932', 'mexico city', 'distrito federal,', 'mx');

-- --------------------------------------------------------

--
-- Table structure for table `my_emps`
--

DROP TABLE IF EXISTS `my_emps`;
CREATE TABLE IF NOT EXISTS `my_emps` (
  `emp_id` int(10) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_salary` double NOT NULL,
  `join_date` date DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `my_emps`
--

INSERT INTO `my_emps` (`emp_id`, `emp_name`, `emp_salary`, `join_date`) VALUES
(1, 'ahmed', 30.2333, '2022-04-01'),
(2, 'sayed', 50.4879, '2022-03-06');

-- --------------------------------------------------------

--
-- Table structure for table `newtable`
--

DROP TABLE IF EXISTS `newtable`;
CREATE TABLE IF NOT EXISTS `newtable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newtable`
--

INSERT INTO `newtable` (`id`, `name`) VALUES
(1, 'rttg'),
(2, 'aaaa'),
(3, 'aaa');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
CREATE TABLE IF NOT EXISTS `regions` (
  `region_id` tinyint(4) NOT NULL,
  `region_name` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`region_id`, `region_name`) VALUES
(1, 'europe'),
(2, 'americas'),
(3, 'asia'),
(4, 'middle east and africa');

-- --------------------------------------------------------

--
-- Table structure for table `somedepartments`
--

DROP TABLE IF EXISTS `somedepartments`;
CREATE TABLE IF NOT EXISTS `somedepartments` (
  `department_id` int(8) NOT NULL DEFAULT '0' COMMENT 'primary key column of departments table.',
  `department_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'a not null column that shows name of a department. administration,\r\nmarketing, purchasing, human resources, shipping, it, executive, public\r\nrelations, sales, finance, and accounting. ',
  `manager_id` int(6) DEFAULT NULL COMMENT 'manager_id of a department. foreign key to employee_id column of employees table. the manager_id column of the employee table references this column.',
  `location_id` smallint(4) DEFAULT NULL COMMENT 'location id where a department is located. foreign key to location_id column of locations table.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `somedepartments`
--

INSERT INTO `somedepartments` (`department_id`, `department_name`, `manager_id`, `location_id`) VALUES
(60, 'IT', 103, 1400),
(50, 'SHIPPING', 121, 1500);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `countries`
--
ALTER TABLE `countries`
  ADD CONSTRAINT `countr_reg_fk` FOREIGN KEY (`region_id`) REFERENCES `regions` (`region_id`) ON UPDATE CASCADE;

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `dept_loc_fk` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dept_mgr_fk` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `emp_dept_fk` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emp_job_fk` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `emp_manager_fk` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job_history`
--
ALTER TABLE `job_history`
  ADD CONSTRAINT `jhist_dept_fk` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `jhist_emp_fk` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `jhist_job_fk` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON UPDATE CASCADE;

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `loc_c_id_fk` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
