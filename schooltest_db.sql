-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2026 at 03:41 AM
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
-- Database: `schooltest_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_sessions`
--

CREATE TABLE `academic_sessions` (
  `id` int(11) NOT NULL,
  `session_name` varchar(20) NOT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acc_accounts`
--

CREATE TABLE `acc_accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` enum('school_fund','fine','board_fees','mdm','grant','festival','other') NOT NULL DEFAULT 'other',
  `bank_name` varchar(100) DEFAULT NULL,
  `branch` varchar(100) DEFAULT NULL,
  `account_no` varchar(30) DEFAULT NULL,
  `ifsc` varchar(11) DEFAULT NULL,
  `opening_date` date NOT NULL,
  `opening_cash` decimal(12,2) NOT NULL DEFAULT 0.00,
  `opening_bank` decimal(12,2) NOT NULL DEFAULT 0.00,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acc_entries`
--

CREATE TABLE `acc_entries` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `entry_date` date NOT NULL,
  `kind` enum('fee','income','expense','deposit','withdraw','transfer') NOT NULL,
  `direction` enum('in','out') NOT NULL,
  `mode` enum('cash','bank') NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `head_id` int(11) DEFAULT NULL,
  `fee_type_id` int(11) DEFAULT NULL,
  `fee_receipt_id` int(11) DEFAULT NULL,
  `fee_invoice_id` int(11) DEFAULT NULL,
  `fy` char(7) NOT NULL,
  `series` enum('PV','RV','CV') DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `voucher_no` varchar(30) DEFAULT NULL,
  `party` varchar(150) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `bill_no` varchar(50) DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `pair_id` int(11) DEFAULT NULL,
  `cleared_on` date DEFAULT NULL,
  `status` enum('valid','cancelled') NOT NULL DEFAULT 'valid',
  `cancelled_at` datetime DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL,
  `cancel_reason` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acc_heads`
--

CREATE TABLE `acc_heads` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `kind` enum('income','expense') NOT NULL,
  `for_type` enum('school_fund','fine','board_fees','mdm','grant','festival','other') DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acc_settings`
--

CREATE TABLE `acc_settings` (
  `id` int(11) NOT NULL,
  `fee_account_id` int(11) DEFAULT NULL,
  `lock_date` date DEFAULT NULL,
  `signatures` varchar(255) NOT NULL DEFAULT 'Prepared by|Headmaster / TIC|Secretary / President',
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_logs`
--

CREATE TABLE `admin_logs` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `record_id` varchar(64) DEFAULT NULL,
  `old_data` text DEFAULT NULL,
  `new_data` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admission_applications`
--

CREATE TABLE `admission_applications` (
  `id` int(11) NOT NULL,
  `application_ref` varchar(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `guardian_name` varchar(150) DEFAULT NULL,
  `guardian_relation` varchar(50) DEFAULT NULL,
  `guardian_mobile` varchar(15) DEFAULT NULL,
  `guardian_email` varchar(100) DEFAULT NULL,
  `father_name` varchar(150) DEFAULT NULL,
  `father_aadhaar` varchar(12) DEFAULT NULL,
  `father_aadhaar_not_available` tinyint(1) NOT NULL DEFAULT 0,
  `father_voter_id` varchar(20) DEFAULT NULL,
  `father_mobile` varchar(15) DEFAULT NULL,
  `father_occupation` varchar(100) DEFAULT NULL,
  `father_qualification` varchar(100) DEFAULT NULL,
  `annual_income` decimal(12,2) DEFAULT NULL,
  `mother_name` varchar(150) DEFAULT NULL,
  `mother_aadhaar` varchar(12) DEFAULT NULL,
  `mother_aadhaar_not_available` tinyint(1) NOT NULL DEFAULT 0,
  `mother_voter_id` varchar(20) DEFAULT NULL,
  `mother_occupation` varchar(100) DEFAULT NULL,
  `previous_school` varchar(200) DEFAULT NULL,
  `previous_class` varchar(20) DEFAULT NULL,
  `previous_result` varchar(100) DEFAULT NULL,
  `tc_no` varchar(50) DEFAULT NULL,
  `third_language_id` int(11) DEFAULT NULL,
  `mp_board` varchar(50) DEFAULT NULL,
  `mp_year` varchar(10) DEFAULT NULL,
  `mp_roll_no` varchar(30) DEFAULT NULL,
  `mp_registration_no` varchar(50) DEFAULT NULL,
  `mp_subjects_json` text DEFAULT NULL,
  `mp_total_marks` decimal(10,2) DEFAULT NULL,
  `mp_total_full_marks` decimal(10,2) DEFAULT NULL,
  `mp_percentage` decimal(5,2) DEFAULT NULL,
  `xi_main_subject_1` int(11) DEFAULT NULL,
  `xi_main_subject_2` int(11) DEFAULT NULL,
  `xi_main_subject_3` int(11) DEFAULT NULL,
  `xi_additional_subject` int(11) DEFAULT NULL,
  `compulsory_1` int(11) DEFAULT NULL COMMENT 'Compulsory subject 1 (usually Bengali) for Class XI',
  `compulsory_2` int(11) DEFAULT NULL COMMENT 'Compulsory subject 2 (usually English) for Class XI',
  `main_1` int(11) DEFAULT NULL COMMENT 'Main subject 1 for Class XI',
  `main_2` int(11) DEFAULT NULL COMMENT 'Main subject 2 for Class XI',
  `main_3` int(11) DEFAULT NULL COMMENT 'Main subject 3 for Class XI',
  `additional` int(11) DEFAULT NULL COMMENT 'Additional subject for Class XI',
  `is_same_school_student` tinyint(4) DEFAULT 0 COMMENT '1 if student is promoted from Class X of same school',
  `previous_student_id` varchar(30) DEFAULT NULL,
  `banglarshiksha_id` varchar(50) DEFAULT NULL,
  `pen_id` varchar(50) DEFAULT NULL,
  `apaar_id` varchar(100) DEFAULT NULL,
  `house` varchar(30) DEFAULT NULL,
  `name_as_per_aadhaar` varchar(150) DEFAULT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `caste` varchar(50) DEFAULT NULL,
  `sub_caste` varchar(50) DEFAULT NULL,
  `disability` varchar(50) DEFAULT NULL,
  `disability_type` varchar(100) DEFAULT NULL,
  `birth_registration_number` varchar(50) DEFAULT NULL,
  `student_aadhaar` varchar(20) DEFAULT NULL,
  `student_mobile` varchar(15) DEFAULT NULL,
  `student_email` varchar(100) DEFAULT NULL,
  `village` varchar(100) DEFAULT NULL,
  `post_office` varchar(100) DEFAULT NULL,
  `police_station` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `pin_code` varchar(10) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `account_number` varchar(30) DEFAULT NULL,
  `ifsc_code` varchar(20) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `birth_certificate` varchar(255) DEFAULT NULL,
  `student_aadhaar_image` varchar(255) DEFAULT NULL,
  `tc_doc` varchar(255) DEFAULT NULL,
  `marksheet_doc` varchar(255) DEFAULT NULL,
  `payment_status` enum('NotRequired','Pending','Paid','Failed') NOT NULL DEFAULT 'Pending',
  `payment_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `razorpay_order_id` varchar(100) DEFAULT NULL,
  `razorpay_payment_id` varchar(100) DEFAULT NULL,
  `application_status` enum('Pending','Admitted','Waitlisted','Rejected','Enrolled') NOT NULL DEFAULT 'Pending',
  `centre_id` int(11) DEFAULT NULL,
  `docs_checked` tinyint(1) NOT NULL DEFAULT 0,
  `merit_rank` int(11) DEFAULT NULL,
  `admin_note` varchar(255) DEFAULT NULL,
  `reject_reason` varchar(255) DEFAULT NULL,
  `admitted_student_id` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admission_centres`
--

CREATE TABLE `admission_centres` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `owner_name` varchar(100) DEFAULT NULL,
  `place` varchar(150) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `username` varchar(40) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `last_login_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admission_field_settings`
--

CREATE TABLE `admission_field_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `field_name` varchar(100) NOT NULL,
  `is_compulsory` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admission_requirements`
--

CREATE TABLE `admission_requirements` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `stage` varchar(20) NOT NULL,
  `item` varchar(50) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Details and documents each stage must give';

-- --------------------------------------------------------

--
-- Table structure for table `admission_subject_seats`
--

CREATE TABLE `admission_subject_seats` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `seats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Seats for each Class XI subject';

-- --------------------------------------------------------

--
-- Table structure for table `admission_villages`
--

CREATE TABLE `admission_villages` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(11) NOT NULL,
  `student_id` varchar(30) NOT NULL,
  `certificate_type` enum('CHARACTER','BONAFIDE') NOT NULL,
  `certificate_no` varchar(50) NOT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `issue_date` date NOT NULL,
  `verification_token` varchar(64) NOT NULL,
  `is_revoked` tinyint(1) NOT NULL DEFAULT 0,
  `revoked_reason` varchar(255) DEFAULT NULL,
  `revoked_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `class_name` varchar(10) NOT NULL,
  `stage` enum('primary','upper_primary','secondary','higher_secondary') NOT NULL DEFAULT 'upper_primary',
  `board_exam` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_admission_seats`
--

CREATE TABLE `class_admission_seats` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `seats` int(11) DEFAULT NULL,
  `min_percent` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_subjects`
--

CREATE TABLE `class_subjects` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `has_exam` tinyint(1) NOT NULL DEFAULT 1,
  `is_third_language` tinyint(1) NOT NULL DEFAULT 0,
  `periods_per_week` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'routine builder: periods a week',
  `max_per_day` tinyint(4) NOT NULL DEFAULT 1,
  `pref_band` enum('any','early','late') NOT NULL DEFAULT 'any',
  `slot_mode` enum('normal','combined') NOT NULL DEFAULT 'normal' COMMENT 'combined = every section of the class in one room'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `closed_classes`
--

CREATE TABLE `closed_classes` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `closed_date` date NOT NULL,
  `reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `closed_periods`
--

CREATE TABLE `closed_periods` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `period_id` int(11) NOT NULL,
  `closed_date` date NOT NULL,
  `reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_queries`
--

CREATE TABLE `contact_queries` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `status` enum('New','Read','Replied') NOT NULL DEFAULT 'New',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `exam_name` varchar(100) NOT NULL,
  `exam_type` enum('v-x','hs') DEFAULT 'v-x',
  `exam_order` int(11) DEFAULT 1,
  `counts_in_final` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = added into the annual result',
  `exam_date_from` date DEFAULT NULL,
  `exam_date_to` date DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_class_shift`
--

CREATE TABLE `exam_class_shift` (
  `id` int(11) NOT NULL,
  `exam_source` enum('v-x','hs') NOT NULL DEFAULT 'v-x',
  `exam_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `shift_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `exam_class_subjects`
-- (See below for the actual view)
--
CREATE TABLE `exam_class_subjects` (
`id` int(11)
,`session_id` int(11)
,`class_id` int(11)
,`subject_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `exam_duty_roster`
--

CREATE TABLE `exam_duty_roster` (
  `id` int(11) NOT NULL,
  `exam_source` enum('v-x','hs') NOT NULL DEFAULT 'v-x',
  `exam_id` int(11) NOT NULL,
  `exam_date` date NOT NULL,
  `shift` varchar(50) NOT NULL,
  `room_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `duty_type` enum('Invigilator','Reserve') NOT NULL DEFAULT 'Invigilator'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_duty_temp_exclusions`
--

CREATE TABLE `exam_duty_temp_exclusions` (
  `id` int(11) NOT NULL,
  `exam_source` enum('v-x','hs') NOT NULL DEFAULT 'v-x',
  `exam_id` int(11) NOT NULL,
  `exam_date` date NOT NULL,
  `staff_id` int(11) NOT NULL,
  `reason` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_rooms`
--

CREATE TABLE `exam_rooms` (
  `id` int(11) NOT NULL,
  `room_name` varchar(50) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `default_gender` enum('Boys','Girls','Any') NOT NULL DEFAULT 'Any',
  `benches` int(11) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_room_usage`
--

CREATE TABLE `exam_room_usage` (
  `id` int(11) NOT NULL,
  `exam_source` enum('v-x','hs') NOT NULL DEFAULT 'v-x',
  `exam_id` int(11) NOT NULL,
  `shift_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `gender` enum('Boys','Girls') NOT NULL,
  `benches_used` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_routine`
--

CREATE TABLE `exam_routine` (
  `id` int(11) NOT NULL,
  `exam_source` enum('v-x','hs') NOT NULL DEFAULT 'v-x',
  `exam_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `exam_date` date NOT NULL,
  `shift_id` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_seating_plan`
--

CREATE TABLE `exam_seating_plan` (
  `id` int(11) NOT NULL,
  `exam_source` enum('v-x','hs') NOT NULL DEFAULT 'v-x',
  `exam_id` int(11) NOT NULL,
  `shift_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `student_id` varchar(30) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `bench_no` int(11) NOT NULL,
  `seat_in_bench` int(11) NOT NULL,
  `seat_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_seating_settings`
--

CREATE TABLE `exam_seating_settings` (
  `id` int(11) NOT NULL,
  `exam_source` enum('v-x','hs') NOT NULL DEFAULT 'v-x',
  `exam_id` int(11) NOT NULL,
  `seats_per_bench` int(11) NOT NULL DEFAULT 2,
  `arrangement_mode` enum('mixed','not_mixed','alternate') NOT NULL DEFAULT 'mixed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_shifts`
--

CREATE TABLE `exam_shifts` (
  `id` int(11) NOT NULL,
  `exam_source` enum('v-x','hs') NOT NULL DEFAULT 'v-x',
  `exam_id` int(11) NOT NULL,
  `shift_order` int(11) NOT NULL DEFAULT 1,
  `shift_name` varchar(50) NOT NULL,
  `default_start_time` time DEFAULT NULL,
  `default_end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_subject_marks`
--

CREATE TABLE `exam_subject_marks` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `written_full_marks` decimal(5,2) NOT NULL DEFAULT 0.00,
  `written_pass_marks` decimal(5,2) NOT NULL DEFAULT 0.00,
  `project_full_marks` decimal(5,2) NOT NULL DEFAULT 0.00,
  `project_pass_marks` decimal(5,2) NOT NULL DEFAULT 0.00,
  `total_full_marks` decimal(5,2) NOT NULL DEFAULT 0.00,
  `total_pass_marks` decimal(5,2) NOT NULL DEFAULT 0.00,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_invoices`
--

CREATE TABLE `fee_invoices` (
  `id` int(11) NOT NULL,
  `student_id` varchar(30) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `category` enum('admission','monthly','registration','form_fillup','fine','other') NOT NULL DEFAULT 'admission',
  `title` varchar(150) NOT NULL DEFAULT '',
  `period` char(7) DEFAULT NULL,
  `demand_key` varchar(40) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_type` enum('percentage','fixed') DEFAULT 'percentage',
  `discount_value` decimal(10,2) DEFAULT 0.00,
  `discount_reason` varchar(200) DEFAULT NULL,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('pending','partial','paid','cancelled') NOT NULL DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `cancelled_at` datetime DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL,
  `cancel_reason` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_invoice_items`
--

CREATE TABLE `fee_invoice_items` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `fee_type_id` int(11) NOT NULL,
  `description` varchar(150) NOT NULL DEFAULT '',
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `net` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='The heads of a bill';

-- --------------------------------------------------------

--
-- Table structure for table `fee_receipts`
--

CREATE TABLE `fee_receipts` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `book` enum('main','cash') NOT NULL DEFAULT 'main',
  `seq` int(11) NOT NULL,
  `receipt_no` varchar(30) NOT NULL,
  `student_id` varchar(30) NOT NULL,
  `receipt_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `method` enum('cash','upi','bank','cheque') NOT NULL DEFAULT 'cash',
  `reference_no` varchar(100) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `slip_given` tinyint(1) NOT NULL DEFAULT 1,
  `received_by` int(11) DEFAULT NULL,
  `status` enum('valid','cancelled') NOT NULL DEFAULT 'valid',
  `cancelled_at` datetime DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL,
  `cancel_reason` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Money receipts; cancelled, never deleted';

-- --------------------------------------------------------

--
-- Table structure for table `fee_settings`
--

CREATE TABLE `fee_settings` (
  `id` tinyint(4) NOT NULL,
  `receipt_prefix` varchar(10) NOT NULL DEFAULT 'R',
  `cash_prefix` varchar(10) NOT NULL DEFAULT 'C',
  `receipt_copies` tinyint(4) NOT NULL DEFAULT 2,
  `slip_title` varchar(60) NOT NULL DEFAULT 'MONEY RECEIPT',
  `slip_fields` varchar(500) DEFAULT NULL,
  `monthly_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `receipt_note` varchar(255) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Fees options: one row';

-- --------------------------------------------------------

--
-- Table structure for table `fee_structures`
--

CREATE TABLE `fee_structures` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `fee_type_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `due_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_transactions`
--

CREATE TABLE `fee_transactions` (
  `id` int(11) NOT NULL,
  `receipt_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `student_id` varchar(30) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_types`
--

CREATE TABLE `fee_types` (
  `id` int(11) NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `type_code` varchar(20) DEFAULT NULL,
  `category` enum('admission','monthly','registration','form_fillup','fine','other') NOT NULL DEFAULT 'admission',
  `charge` enum('session','any') NOT NULL DEFAULT 'session',
  `who_pays` enum('everyone','some','new','continuing','sentup') NOT NULL DEFAULT 'everyone',
  `slip` tinyint(1) NOT NULL DEFAULT 1,
  `account_id` int(11) DEFAULT NULL,
  `default_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `for_students` enum('all','new','continuing') NOT NULL DEFAULT 'all',
  `discountable` tinyint(1) NOT NULL DEFAULT 1,
  `is_mandatory` tinyint(1) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `formative_settings`
--

CREATE TABLE `formative_settings` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `f1a_full_marks` int(11) DEFAULT 20,
  `f1b_full_marks` int(11) DEFAULT 20,
  `f1c_full_marks` int(11) DEFAULT 20,
  `f2a_full_marks` int(11) DEFAULT 20,
  `f2b_full_marks` int(11) DEFAULT 20,
  `f2c_full_marks` int(11) DEFAULT 20,
  `f3a_full_marks` int(11) DEFAULT 20,
  `f3b_full_marks` int(11) DEFAULT 20,
  `f3c_full_marks` int(11) DEFAULT 20
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grade_bands`
--

CREATE TABLE `grade_bands` (
  `id` int(11) NOT NULL,
  `class_group` enum('primary','upper_primary','secondary','higher_secondary') NOT NULL,
  `grade` varchar(3) NOT NULL,
  `min_pct` decimal(5,2) NOT NULL,
  `max_pct` decimal(5,2) NOT NULL,
  `remark` varchar(60) NOT NULL DEFAULT '',
  `sort_order` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guardians`
--

CREATE TABLE `guardians` (
  `guardian_id` int(10) UNSIGNED NOT NULL,
  `father_name` varchar(150) NOT NULL,
  `father_aadhaar` varchar(12) NOT NULL,
  `father_aadhaar_not_available` tinyint(1) NOT NULL DEFAULT 0,
  `father_voter_id` varchar(20) DEFAULT NULL,
  `father_mobile` varchar(15) DEFAULT NULL,
  `father_occupation` varchar(100) DEFAULT NULL,
  `father_qualification` varchar(100) DEFAULT NULL,
  `annual_income` decimal(12,2) DEFAULT NULL,
  `mother_name` varchar(150) NOT NULL,
  `mother_aadhaar` varchar(12) NOT NULL,
  `mother_aadhaar_not_available` tinyint(1) NOT NULL DEFAULT 0,
  `mother_voter_id` varchar(20) DEFAULT NULL,
  `mother_occupation` varchar(100) DEFAULT NULL,
  `guardian_name` varchar(150) DEFAULT NULL,
  `guardian_relation` varchar(50) DEFAULT NULL,
  `guardian_contact` varchar(15) DEFAULT NULL,
  `guardian_email` varchar(100) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(11) NOT NULL,
  `holiday_name` varchar(200) NOT NULL,
  `holiday_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `holiday_type` enum('public','school','exam','event') DEFAULT 'public',
  `description` text DEFAULT NULL,
  `is_long_vacation` tinyint(1) DEFAULT 0,
  `total_days` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `colour` varchar(7) NOT NULL DEFAULT '#1f8a4c',
  `teacher_id` int(11) DEFAULT NULL,
  `motto` varchar(100) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Houses the students are divided into';

-- --------------------------------------------------------

--
-- Table structure for table `hprc_behavior`
--

CREATE TABLE `hprc_behavior` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `student_id` varchar(30) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `evaluation_no` int(11) DEFAULT 1,
  `self_awareness` varchar(10) DEFAULT NULL,
  `communication_skill` varchar(10) DEFAULT NULL,
  `collaborative_thinking` varchar(10) DEFAULT NULL,
  `experiential_learning` varchar(10) DEFAULT NULL,
  `critical_thinking` varchar(10) DEFAULT NULL,
  `computational_thinking` varchar(10) DEFAULT NULL,
  `problem_solving` varchar(10) DEFAULT NULL,
  `decision_making` varchar(10) DEFAULT NULL,
  `creative_presentation` varchar(10) DEFAULT NULL,
  `aesthetic_appreciation` varchar(10) DEFAULT NULL,
  `teacher_perception` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hprc_formative`
--

CREATE TABLE `hprc_formative` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `student_id` varchar(30) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `f1a` decimal(5,2) DEFAULT NULL,
  `f1b` decimal(5,2) DEFAULT NULL,
  `f1c` decimal(5,2) DEFAULT NULL,
  `f2a` decimal(5,2) DEFAULT NULL,
  `f2b` decimal(5,2) DEFAULT NULL,
  `f2c` decimal(5,2) DEFAULT NULL,
  `f3a` decimal(5,2) DEFAULT NULL,
  `f3b` decimal(5,2) DEFAULT NULL,
  `f3c` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hprc_learning`
--

CREATE TABLE `hprc_learning` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `student_id` varchar(30) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `evaluation_no` int(11) DEFAULT 1,
  `pattern_of_intelligence` varchar(100) DEFAULT NULL,
  `area_of_interest` varchar(100) DEFAULT NULL,
  `positive_attitude` varchar(100) DEFAULT NULL,
  `exceptional_ability` varchar(100) DEFAULT NULL,
  `features_of_anxiety` varchar(100) DEFAULT NULL,
  `learning_gaps` varchar(100) DEFAULT NULL,
  `specific_learning_difficulties` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hprc_personality_lifeskills`
--

CREATE TABLE `hprc_personality_lifeskills` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `student_id` varchar(30) NOT NULL,
  `listening_skill` varchar(10) DEFAULT NULL,
  `communication_skill` varchar(10) DEFAULT NULL,
  `empathy_skill` varchar(10) DEFAULT NULL,
  `cooperation_skill` varchar(10) DEFAULT NULL,
  `conversation_skill` varchar(10) DEFAULT NULL,
  `friendship_skill` varchar(10) DEFAULT NULL,
  `conflict_resolution` varchar(10) DEFAULT NULL,
  `stress_coping` varchar(10) DEFAULT NULL,
  `decision_making` varchar(10) DEFAULT NULL,
  `interpersonal_skill` varchar(10) DEFAULT NULL,
  `organisation_skill` varchar(10) DEFAULT NULL,
  `emotion_control` varchar(10) DEFAULT NULL,
  `respect_skill` varchar(10) DEFAULT NULL,
  `assertiveness_skill` varchar(10) DEFAULT NULL,
  `leadership` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hs_board_exam`
--

CREATE TABLE `hs_board_exam` (
  `id` int(11) NOT NULL,
  `registration_id` int(11) NOT NULL COMMENT 'hs_registration.id',
  `exam_year` year(4) NOT NULL COMMENT 'HS year: Class XII of session 2026 -> 2027 (Sem 3, Sem 4 and the result)',
  `sem3_roll` varchar(20) DEFAULT NULL,
  `sem3_no` varchar(20) DEFAULT NULL,
  `sem3_marks` decimal(6,2) DEFAULT NULL,
  `sem4_roll` varchar(20) DEFAULT NULL,
  `sem4_no` varchar(20) DEFAULT NULL,
  `sem4_marks` decimal(6,2) DEFAULT NULL,
  `result_status` enum('PASS','FAIL','ABSENT','COMPARTMENT') DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='WBCHSE board exam of a student: Sem 3 and Sem 4 admits and marks, the result';

-- --------------------------------------------------------

--
-- Table structure for table `hs_exam`
--

CREATE TABLE `hs_exam` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL COMMENT 'Class XI or XII (classes.id)',
  `semester` tinyint(1) NOT NULL COMMENT '1,2 for XI | 3,4 for XII',
  `has_practical` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = this semester includes practical/project marks',
  `exam_date_from` date DEFAULT NULL,
  `exam_date_to` date DEFAULT NULL,
  `exam_name` varchar(150) NOT NULL COMMENT 'Display label, e.g. Semester 1 Examination',
  `academic_year` year(4) NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ;

-- --------------------------------------------------------

--
-- Table structure for table `hs_exam_subject_marks`
--

CREATE TABLE `hs_exam_subject_marks` (
  `id` int(11) NOT NULL,
  `hs_exam_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `theory_full_marks` decimal(5,2) NOT NULL DEFAULT 40.00,
  `theory_pass_marks` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'theory is passed on its own',
  `practical_full_marks` decimal(5,2) NOT NULL DEFAULT 0.00,
  `practical_pass_marks` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'practical/project is passed on its own',
  `total_full_marks` decimal(5,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hs_marks`
--

CREATE TABLE `hs_marks` (
  `id` int(11) NOT NULL,
  `hs_exam_id` int(11) NOT NULL,
  `student_id` varchar(30) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `theory_marks` decimal(5,2) DEFAULT NULL,
  `theory_supplementary_marks` decimal(5,2) DEFAULT NULL COMMENT 'NA unless student appears in supplementary',
  `theory_absent` tinyint(1) NOT NULL DEFAULT 0,
  `practical_marks` decimal(5,2) DEFAULT NULL COMMENT 'Practical / Project marks, only when exam.has_practical=1',
  `practical_absent` tinyint(1) NOT NULL DEFAULT 0,
  `entered_by` int(11) DEFAULT NULL,
  `subject_grade` varchar(5) DEFAULT NULL COMMENT 'O, A+, A, B+, B, C, D, F',
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hs_registration`
--

CREATE TABLE `hs_registration` (
  `id` int(11) NOT NULL,
  `student_id` varchar(30) NOT NULL,
  `board_type` enum('WBCHSE') NOT NULL DEFAULT 'WBCHSE',
  `registration_no` varchar(30) NOT NULL,
  `registration_year` year(4) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='WBCHSE board registration info for HS students';

-- --------------------------------------------------------

--
-- Table structure for table `hs_student_mp_marks`
--

CREATE TABLE `hs_student_mp_marks` (
  `id` int(11) NOT NULL,
  `student_id` varchar(30) NOT NULL,
  `application_id` int(11) DEFAULT NULL COMMENT 'Originating admission_applications.id, if created via Online Admission',
  `mp_board` varchar(50) DEFAULT NULL,
  `mp_year` varchar(10) DEFAULT NULL,
  `mp_roll_no` varchar(30) DEFAULT NULL,
  `mp_total_marks` decimal(10,2) DEFAULT NULL,
  `mp_total_full_marks` decimal(10,2) DEFAULT NULL,
  `mp_percentage` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Madhyamik (Class X board) result summary for Class XI students, one row per student';

-- --------------------------------------------------------

--
-- Table structure for table `hs_student_mp_subject_marks`
--

CREATE TABLE `hs_student_mp_subject_marks` (
  `id` int(11) NOT NULL,
  `mp_marks_id` int(11) NOT NULL,
  `subject_name` varchar(100) NOT NULL,
  `full_marks` decimal(6,2) DEFAULT NULL,
  `marks_obtained` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Subject-wise Madhyamik marks, linked to hs_student_mp_marks';

-- --------------------------------------------------------

--
-- Table structure for table `hs_student_subjects`
--

CREATE TABLE `hs_student_subjects` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `student_id` varchar(30) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `slot` enum('compulsory','elective','additional') NOT NULL DEFAULT 'elective',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='one row per subject a HS student takes';

-- --------------------------------------------------------

--
-- Table structure for table `invigilator_rules`
--

CREATE TABLE `invigilator_rules` (
  `id` int(11) NOT NULL,
  `min_students` int(11) NOT NULL,
  `max_students` int(11) NOT NULL,
  `invigilator_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `library_books`
--

CREATE TABLE `library_books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(150) DEFAULT NULL,
  `publisher` varchar(150) DEFAULT NULL,
  `isbn` varchar(30) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `edition` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `shelf_location` varchar(50) DEFAULT NULL,
  `status` enum('Active','Withdrawn') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `library_book_copies`
--

CREATE TABLE `library_book_copies` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `accession_no` varchar(30) NOT NULL,
  `status` enum('Available','Issued','Damaged','Lost','Withdrawn') NOT NULL DEFAULT 'Available',
  `added_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `library_categories`
--

CREATE TABLE `library_categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `library_issues`
--

CREATE TABLE `library_issues` (
  `id` int(11) NOT NULL,
  `copy_id` int(11) NOT NULL,
  `borrower_type` enum('Student','Staff') NOT NULL,
  `borrower_id` varchar(30) NOT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `renewal_count` tinyint(2) NOT NULL DEFAULT 0,
  `fine_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `fine_paid` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('Issued','Returned','Lost') NOT NULL DEFAULT 'Issued',
  `issued_by` int(11) DEFAULT NULL,
  `returned_to` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `library_settings`
--

CREATE TABLE `library_settings` (
  `id` int(11) NOT NULL DEFAULT 1,
  `loan_period_days` int(11) NOT NULL DEFAULT 15,
  `max_renewals` int(11) NOT NULL DEFAULT 2,
  `fine_per_day` decimal(10,2) NOT NULL DEFAULT 10.00,
  `max_books_per_student` int(11) NOT NULL DEFAULT 2,
  `max_books_per_staff` int(11) NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `library_staff_access`
--

CREATE TABLE `library_staff_access` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `assigned_by` int(11) DEFAULT NULL,
  `assigned_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(100) NOT NULL,
  `attempt_count` int(11) NOT NULL DEFAULT 1,
  `first_attempt_at` datetime NOT NULL,
  `locked_until` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `id` int(11) NOT NULL,
  `student_id` varchar(30) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `exam_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `written_marks` decimal(5,2) DEFAULT 0.00,
  `project_marks` decimal(5,2) DEFAULT 0.00,
  `marks` decimal(5,2) DEFAULT 0.00,
  `grace_marks` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'kept apart from the marks obtained',
  `grace_reason` varchar(120) DEFAULT NULL,
  `is_absent` tinyint(1) DEFAULT 0,
  `entered_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` int(11) NOT NULL,
  `notice_title` varchar(255) NOT NULL,
  `status` enum('Draft','Published') NOT NULL DEFAULT 'Published',
  `notice_details` text DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `attachment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pass_fail_settings`
--

CREATE TABLE `pass_fail_settings` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `no_fail_policy` tinyint(1) NOT NULL DEFAULT 0,
  `puc_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `puc_max_fail_subjects` int(11) NOT NULL DEFAULT 1,
  `puc_min_percentage` decimal(5,2) NOT NULL DEFAULT 25.00,
  `pass_min_percentage` decimal(5,2) NOT NULL DEFAULT 33.00,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `periods`
--

CREATE TABLE `periods` (
  `id` int(11) NOT NULL,
  `period_name` varchar(50) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotion_batches`
--

CREATE TABLE `promotion_batches` (
  `id` int(11) NOT NULL,
  `from_session_id` int(11) NOT NULL,
  `from_class_id` int(11) NOT NULL,
  `to_session_id` int(11) NOT NULL,
  `to_class_id` int(11) NOT NULL,
  `promotion_method` varchar(50) NOT NULL,
  `total_students` int(11) NOT NULL DEFAULT 0,
  `promoted_by` int(11) DEFAULT NULL,
  `promoted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotion_details`
--

CREATE TABLE `promotion_details` (
  `id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `student_id` varchar(30) NOT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `old_class_id` int(11) DEFAULT NULL,
  `old_section_id` int(11) DEFAULT NULL,
  `old_roll_no` varchar(20) DEFAULT NULL,
  `new_class_id` int(11) DEFAULT NULL,
  `new_section_id` int(11) DEFAULT NULL,
  `new_roll_no` varchar(20) DEFAULT NULL,
  `promotion_status` enum('PROMOTED','NOT_PROMOTED','FAILED','TC','DROPOUT') DEFAULT 'PROMOTED',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provisional_routine`
--

CREATE TABLE `provisional_routine` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `day_name` varchar(20) NOT NULL,
  `period_id` int(11) NOT NULL,
  `provisional_date` date NOT NULL,
  `original_teacher_id` int(11) DEFAULT NULL,
  `original_subject_id` int(11) DEFAULT NULL,
  `provisional_teacher_id` int(11) DEFAULT NULL,
  `provisional_subject_id` int(11) DEFAULT NULL,
  `status` enum('assigned','unassigned') DEFAULT 'unassigned',
  `adjustment_type` enum('none','adjusted','closed') NOT NULL DEFAULT 'none' COMMENT 'none = substitute, closed = class not held; adjusted is no longer written',
  `new_period_id` int(11) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `routine`
--

CREATE TABLE `routine` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT 0,
  `day_name` varchar(20) NOT NULL,
  `period_id` int(11) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `routine_drafts`
--

CREATE TABLE `routine_drafts` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `method` enum('auto','semi') NOT NULL,
  `params` longtext DEFAULT NULL,
  `result` longtext NOT NULL,
  `stats` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `routine_settings`
--

CREATE TABLE `routine_settings` (
  `id` int(11) NOT NULL,
  `routine_mode` enum('class_wise','section_wise','group_wise') DEFAULT 'section_wise',
  `saturday_periods` tinyint(4) NOT NULL DEFAULT 4 COMMENT 'Saturday runs up to this period (0 = no classes)',
  `hs_period_weight` decimal(3,2) NOT NULL DEFAULT 1.00 COMMENT 'workload weight of one XI/XII period',
  `teacher_max_per_day` tinyint(4) NOT NULL DEFAULT 5,
  `teacher_max_consecutive` tinyint(4) NOT NULL DEFAULT 3,
  `class_teacher_first_period` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `school_settings`
--

CREATE TABLE `school_settings` (
  `id` int(11) NOT NULL,
  `school_name` varchar(200) DEFAULT NULL,
  `udise_code` varchar(50) DEFAULT NULL,
  `established_year` smallint(6) DEFAULT NULL,
  `school_address` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `site_base_url` varchar(255) DEFAULT NULL,
  `school_code` varchar(50) DEFAULT NULL,
  `hs_code` varchar(50) DEFAULT NULL,
  `vocational_code` varchar(50) DEFAULT NULL,
  `hoi_name` varchar(100) DEFAULT NULL,
  `student_id_prefix` varchar(20) DEFAULT '',
  `logo` varchar(255) DEFAULT NULL,
  `hoi_signature` varchar(255) DEFAULT NULL,
  `admission_open` tinyint(1) NOT NULL DEFAULT 0,
  `admission_mode` enum('public','centres') NOT NULL DEFAULT 'public',
  `admission_village_rule` enum('all','listed') NOT NULL DEFAULT 'all',
  `admission_session_id` int(11) DEFAULT NULL,
  `admission_start` date DEFAULT NULL,
  `admission_end` date DEFAULT NULL,
  `admission_notice` text DEFAULT NULL,
  `razorpay_key_id` varchar(100) DEFAULT NULL,
  `razorpay_key_secret` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `secondary_exam`
--

CREATE TABLE `secondary_exam` (
  `id` int(11) NOT NULL,
  `registration_id` int(11) NOT NULL,
  `exam_year` year(4) NOT NULL,
  `roll_no` varchar(30) DEFAULT NULL,
  `index_no` varchar(30) DEFAULT NULL,
  `school_code` varchar(20) DEFAULT NULL,
  `centre_code` varchar(20) DEFAULT NULL,
  `result_status` enum('PASS','COMPARTMENT','FAIL','ABSENT') DEFAULT NULL,
  `division` varchar(20) DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `secondary_registration`
--

CREATE TABLE `secondary_registration` (
  `id` int(11) NOT NULL,
  `student_id` varchar(30) NOT NULL,
  `board_type` enum('WBBSE','WBBME') NOT NULL,
  `registration_no` varchar(30) NOT NULL,
  `registration_year` year(4) NOT NULL,
  `madhyamik_roll` varchar(20) DEFAULT NULL,
  `madhyamik_number` varchar(20) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_name` varchar(10) NOT NULL,
  `class_teacher_id` int(11) DEFAULT NULL,
  `class_teacher_subject_id` int(11) DEFAULT NULL COMMENT 'the subject the class teacher takes in the first period every day'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `section_groups`
--

CREATE TABLE `section_groups` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `group_name` varchar(20) NOT NULL COMMENT 'e.g. A+B',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `section_group_members`
--

CREATE TABLE `section_group_members` (
  `group_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(30) NOT NULL,
  `state_govt_id` varchar(30) DEFAULT NULL,
  `national_code` varchar(50) DEFAULT NULL,
  `staff_name` varchar(100) NOT NULL,
  `short_code` varchar(20) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `staff_type` enum('Teaching','Non-teaching') NOT NULL DEFAULT 'Teaching',
  `can_login` tinyint(1) NOT NULL DEFAULT 1,
  `show_on_website` tinyint(1) NOT NULL DEFAULT 1,
  `academic_section` varchar(100) DEFAULT NULL,
  `subject_name` varchar(100) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `vacancy_status` varchar(50) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `caste` varchar(50) DEFAULT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `mother_tongue` varchar(50) DEFAULT NULL,
  `marital_status` varchar(50) DEFAULT NULL,
  `spouse_name` varchar(100) DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `joining_date_present_post` date DEFAULT NULL,
  `retirement_date` date DEFAULT NULL,
  `approval_number` varchar(100) DEFAULT NULL,
  `date_of_approval` date DEFAULT NULL,
  `service_status` enum('Active','Transferred','Retired','Deceased') DEFAULT 'Active',
  `status_date` date DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `aadhar_number` varchar(20) DEFAULT NULL,
  `voter_number` varchar(30) DEFAULT NULL,
  `pan_number` varchar(20) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `account_number` varchar(30) DEFAULT NULL,
  `ifsc_code` varchar(20) DEFAULT NULL,
  `present_address` text DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `photo` varchar(500) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `login_password` varchar(255) DEFAULT NULL,
  `pw_must_change` tinyint(1) NOT NULL DEFAULT 0,
  `pw_changed_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` varchar(30) NOT NULL,
  `guardian_id` int(10) UNSIGNED DEFAULT NULL,
  `admission_no` varchar(30) DEFAULT NULL,
  `admission_year` int(4) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `admission_class_id` int(11) DEFAULT NULL,
  `banglarshiksha_id` varchar(14) DEFAULT NULL,
  `pen_id` varchar(50) DEFAULT NULL,
  `apaar_id` varchar(100) DEFAULT NULL,
  `house` varchar(30) DEFAULT NULL,
  `house_id` int(11) DEFAULT NULL,
  `student_name` varchar(100) NOT NULL,
  `name_as_per_aadhaar` varchar(150) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `nationality` varchar(50) NOT NULL DEFAULT 'Indian',
  `mother_tongue` varchar(50) DEFAULT NULL,
  `caste` varchar(50) DEFAULT NULL,
  `sub_caste` varchar(50) DEFAULT NULL,
  `disability` varchar(50) DEFAULT NULL,
  `disability_type` varchar(100) DEFAULT NULL,
  `disability_percentage` decimal(5,2) DEFAULT NULL,
  `birth_registration_number` varchar(50) DEFAULT NULL,
  `student_aadhaar` varchar(20) DEFAULT NULL,
  `village` varchar(100) DEFAULT NULL,
  `post_office` varchar(100) DEFAULT NULL,
  `police_station` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `pin_code` varchar(10) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `account_number` varchar(30) DEFAULT NULL,
  `ifsc_code` varchar(20) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `birth_certificate` varchar(255) DEFAULT NULL,
  `student_aadhaar_image` varchar(255) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `student_status` enum('Active','Deleted','TC','Passed','Deactivated') DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_academic_history`
--

CREATE TABLE `student_academic_history` (
  `id` int(11) NOT NULL,
  `student_id` varchar(30) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `roll_no` varchar(20) DEFAULT NULL,
  `promotion_status` enum('Studying','Promoted','Detained') DEFAULT 'Studying',
  `student_status` enum('Active','Passed','Transferred','Dropped','TC','Deactivated','Deleted') DEFAULT 'Active',
  `academic_status` enum('Current','History') DEFAULT 'Current',
  `previous_school` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_activity_logs`
--

CREATE TABLE `student_activity_logs` (
  `id` int(11) NOT NULL,
  `student_id` varchar(30) NOT NULL,
  `action` varchar(100) NOT NULL,
  `details` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_admit_cards`
--

CREATE TABLE `student_admit_cards` (
  `id` int(11) NOT NULL,
  `student_id` varchar(30) NOT NULL,
  `exam_source` enum('v-x','hs') NOT NULL DEFAULT 'v-x',
  `exam_id` int(11) NOT NULL,
  `verification_token` varchar(64) NOT NULL,
  `issued_date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_attendance`
--

CREATE TABLE `student_attendance` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `student_id` varchar(30) NOT NULL,
  `attendance_date` date NOT NULL,
  `status` enum('Present','Absent','Leave') DEFAULT 'Present',
  `remarks` text DEFAULT NULL,
  `marked_by_type` enum('admin','staff') DEFAULT NULL,
  `marked_by` int(11) DEFAULT NULL,
  `marked_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_discounts`
--

CREATE TABLE `student_discounts` (
  `id` int(11) NOT NULL,
  `student_id` varchar(30) NOT NULL,
  `session_id` int(11) NOT NULL,
  `discount_type` enum('percentage','fixed') DEFAULT 'percentage',
  `discount_value` decimal(10,2) DEFAULT 0.00,
  `discount_reason` varchar(200) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_id_cards`
--

CREATE TABLE `student_id_cards` (
  `id` int(11) NOT NULL,
  `student_id` varchar(30) NOT NULL,
  `session_id` int(11) NOT NULL,
  `verification_token` varchar(64) NOT NULL,
  `issued_date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_merit_ranks`
--

CREATE TABLE `student_merit_ranks` (
  `id` int(11) NOT NULL,
  `academic_session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `student_id` varchar(30) NOT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `final_total` decimal(8,2) NOT NULL,
  `percentage` decimal(5,2) NOT NULL,
  `merit_rank` int(11) NOT NULL,
  `result_status` enum('PASS','PUC','FAIL','COMPARTMENT','ABSENT') NOT NULL DEFAULT 'PASS',
  `remarks` varchar(255) DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_third_language`
--

CREATE TABLE `student_third_language` (
  `id` int(11) NOT NULL,
  `student_id` varchar(30) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `subject_name` varchar(100) NOT NULL,
  `subject_code` varchar(20) DEFAULT NULL,
  `subject_type` enum('academic','optional','co-curricular') DEFAULT 'academic',
  `color_code` varchar(10) DEFAULT '#003366',
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tc_students`
--

CREATE TABLE `tc_students` (
  `id` int(11) NOT NULL,
  `student_id` varchar(30) NOT NULL,
  `tc_no` varchar(50) DEFAULT NULL,
  `tc_date` date DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `conduct` varchar(50) DEFAULT NULL,
  `dues_cleared` tinyint(1) NOT NULL DEFAULT 1,
  `status` enum('Issued','Cancelled') NOT NULL DEFAULT 'Issued',
  `cancelled_at` datetime DEFAULT NULL,
  `cancel_reason` varchar(255) DEFAULT NULL,
  `issued_by` int(11) DEFAULT NULL,
  `verification_token` char(64) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_assignments`
--

CREATE TABLE `teacher_assignments` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_attendance`
--

CREATE TABLE `teacher_attendance` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `attendance_status` enum('present','absent','on_duty','leave') DEFAULT 'present',
  `is_late` tinyint(1) DEFAULT 0,
  `is_early_departure` tinyint(1) DEFAULT 0,
  `late_reason` text DEFAULT NULL,
  `early_reason` text DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `marked_by` int(11) DEFAULT NULL,
  `marked_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_exclusions`
--

CREATE TABLE `teacher_exclusions` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `provisional_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_slot_blocks`
--

CREATE TABLE `teacher_slot_blocks` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `day_name` varchar(20) DEFAULT NULL COMMENT 'NULL = every day',
  `period_id` int(11) NOT NULL,
  `reason` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_subjects`
--

CREATE TABLE `teacher_subjects` (
  `teacher_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_access_permissions`
--

CREATE TABLE `user_access_permissions` (
  `id` int(11) NOT NULL,
  `user_type` enum('student','teacher') NOT NULL,
  `access_key` varchar(80) NOT NULL,
  `is_allowed` tinyint(1) NOT NULL DEFAULT 1,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `website_settings`
--

CREATE TABLE `website_settings` (
  `id` int(11) NOT NULL,
  `hero_title` varchar(255) DEFAULT 'Welcome To Our School',
  `hero_subtitle` varchar(255) DEFAULT 'Education For Better Future',
  `motto` varchar(150) DEFAULT NULL,
  `hero_image` varchar(255) DEFAULT NULL,
  `hoi_name` varchar(150) DEFAULT NULL,
  `hoi_photo` varchar(255) DEFAULT NULL,
  `headmaster_message` text DEFAULT NULL,
  `about_school` text DEFAULT NULL,
  `about_image` varchar(255) DEFAULT NULL,
  `contact_address` text DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `contact_map_url` varchar(500) DEFAULT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `twitter_url` varchar(255) DEFAULT NULL,
  `instagram_url` varchar(255) DEFAULT NULL,
  `youtube_url` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `footer_text` varchar(255) DEFAULT NULL,
  `footer_copyright` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workload_limits`
--

CREATE TABLE `workload_limits` (
  `designation` varchar(50) NOT NULL,
  `max_weekly_periods` int(11) NOT NULL DEFAULT 0 COMMENT '0 = does not teach'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure for view `exam_class_subjects`
--
DROP TABLE IF EXISTS `exam_class_subjects`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `exam_class_subjects`  AS SELECT `class_subjects`.`id` AS `id`, `class_subjects`.`session_id` AS `session_id`, `class_subjects`.`class_id` AS `class_id`, `class_subjects`.`subject_id` AS `subject_id` FROM `class_subjects` WHERE `class_subjects`.`has_exam` = 1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_sessions`
--
ALTER TABLE `academic_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_session_name` (`session_name`),
  ADD KEY `idx_session_status` (`status`);

--
-- Indexes for table `acc_accounts`
--
ALTER TABLE `acc_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_acc_account_name` (`name`),
  ADD KEY `fk_acc_account_admin` (`created_by`);

--
-- Indexes for table `acc_entries`
--
ALTER TABLE `acc_entries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_acc_voucher` (`series`,`fy`,`seq`,`direction`),
  ADD KEY `idx_acc_entry_account` (`account_id`,`status`,`entry_date`),
  ADD KEY `idx_acc_entry_date` (`entry_date`),
  ADD KEY `idx_acc_entry_receipt` (`fee_receipt_id`),
  ADD KEY `idx_acc_entry_pair` (`pair_id`),
  ADD KEY `fk_acc_entry_head` (`head_id`),
  ADD KEY `fk_acc_entry_feetype` (`fee_type_id`),
  ADD KEY `fk_acc_entry_creator` (`created_by`),
  ADD KEY `fk_acc_entry_canceller` (`cancelled_by`),
  ADD KEY `idx_acc_entry_invoice` (`fee_invoice_id`);

--
-- Indexes for table `acc_heads`
--
ALTER TABLE `acc_heads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_acc_head` (`kind`,`name`);

--
-- Indexes for table `acc_settings`
--
ALTER TABLE `acc_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_acc_settings_account` (`fee_account_id`),
  ADD KEY `fk_acc_settings_admin` (`updated_by`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `admin_logs`
--
ALTER TABLE `admin_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_admin_id` (`admin_id`),
  ADD KEY `idx_action` (`action`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `admission_applications`
--
ALTER TABLE `admission_applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `application_ref` (`application_ref`),
  ADD KEY `fk_admission_admitted_student` (`admitted_student_id`),
  ADD KEY `idx_app_centre` (`centre_id`);

--
-- Indexes for table `admission_centres`
--
ALTER TABLE `admission_centres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_centre_username` (`username`);

--
-- Indexes for table `admission_field_settings`
--
ALTER TABLE `admission_field_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_admission_field_session` (`session_id`,`field_name`),
  ADD KEY `idx_admission_field_session` (`session_id`);

--
-- Indexes for table `admission_requirements`
--
ALTER TABLE `admission_requirements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_adm_requirement` (`session_id`,`stage`,`item`);

--
-- Indexes for table `admission_subject_seats`
--
ALTER TABLE `admission_subject_seats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_adm_subject_seats` (`session_id`,`subject_id`),
  ADD KEY `fk_adm_seat_subject` (`subject_id`);

--
-- Indexes for table `admission_villages`
--
ALTER TABLE `admission_villages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_village` (`session_id`,`name`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_cert_type_no` (`certificate_type`,`certificate_no`),
  ADD UNIQUE KEY `uq_cert_token` (`verification_token`),
  ADD KEY `idx_student_id` (`student_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_class_name` (`class_name`),
  ADD KEY `idx_class_name` (`class_name`);

--
-- Indexes for table `class_admission_seats`
--
ALTER TABLE `class_admission_seats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `session_class` (`session_id`,`class_id`);

--
-- Indexes for table `class_subjects`
--
ALTER TABLE `class_subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_class_subject_session` (`session_id`,`class_id`,`subject_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `closed_classes`
--
ALTER TABLE `closed_classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cc_session` (`session_id`),
  ADD KEY `fk_cc_class` (`class_id`);

--
-- Indexes for table `closed_periods`
--
ALTER TABLE `closed_periods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cp_session` (`session_id`),
  ADD KEY `fk_cp_period` (`period_id`);

--
-- Indexes for table `contact_queries`
--
ALTER TABLE `contact_queries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created_at` (`created_at`),
  ADD KEY `idx_contact_ip` (`ip_address`,`created_at`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_exam_session_name` (`session_id`,`exam_type`,`exam_name`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `exam_class_shift`
--
ALTER TABLE `exam_class_shift`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_exam_class` (`exam_source`,`exam_id`,`class_id`),
  ADD KEY `idx_shift_id` (`shift_id`);

--
-- Indexes for table `exam_duty_roster`
--
ALTER TABLE `exam_duty_roster`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_duty_slot` (`exam_date`,`shift`,`room_id`,`staff_id`),
  ADD KEY `idx_duty_exam` (`exam_source`,`exam_id`),
  ADD KEY `fk_duty_room` (`room_id`),
  ADD KEY `fk_duty_staff` (`staff_id`);

--
-- Indexes for table `exam_duty_temp_exclusions`
--
ALTER TABLE `exam_duty_temp_exclusions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_temp_exclusion` (`exam_source`,`exam_id`,`exam_date`,`staff_id`),
  ADD KEY `fk_exclusion_staff` (`staff_id`);

--
-- Indexes for table `exam_rooms`
--
ALTER TABLE `exam_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_room_usage`
--
ALTER TABLE `exam_room_usage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_room_shift` (`exam_source`,`exam_id`,`shift_id`,`room_id`),
  ADD KEY `idx_shift` (`shift_id`);

--
-- Indexes for table `exam_routine`
--
ALTER TABLE `exam_routine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_routine_date_shift` (`exam_date`,`shift_id`),
  ADD KEY `idx_routine_shift_id` (`shift_id`),
  ADD KEY `idx_routine_exam` (`exam_source`,`exam_id`,`class_id`);

--
-- Indexes for table `exam_seating_plan`
--
ALTER TABLE `exam_seating_plan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_exam_shift` (`exam_source`,`exam_id`,`shift_id`),
  ADD KEY `idx_room` (`room_id`),
  ADD KEY `idx_student` (`student_id`);

--
-- Indexes for table `exam_seating_settings`
--
ALTER TABLE `exam_seating_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_exam` (`exam_source`,`exam_id`);

--
-- Indexes for table `exam_shifts`
--
ALTER TABLE `exam_shifts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_exam_shift_order` (`exam_source`,`exam_id`,`shift_order`);

--
-- Indexes for table `exam_subject_marks`
--
ALTER TABLE `exam_subject_marks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_esm_config` (`session_id`,`exam_id`,`class_id`,`subject_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `exam_id` (`exam_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `fee_invoices`
--
ALTER TABLE `fee_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_fee_demand` (`student_id`,`session_id`,`demand_key`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `fk_fi_session` (`session_id`),
  ADD KEY `idx_student_session` (`student_id`,`session_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_fi_class` (`session_id`,`class_id`,`section_id`),
  ADD KEY `fk_fi_class` (`class_id`),
  ADD KEY `fk_fi_section` (`section_id`),
  ADD KEY `fk_fi_created_by` (`created_by`),
  ADD KEY `fk_fi_cancelled_by` (`cancelled_by`);

--
-- Indexes for table `fee_invoice_items`
--
ALTER TABLE `fee_invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fii_invoice` (`invoice_id`),
  ADD KEY `idx_fii_type` (`fee_type_id`);

--
-- Indexes for table `fee_receipts`
--
ALTER TABLE `fee_receipts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_receipt_no` (`receipt_no`),
  ADD UNIQUE KEY `uq_receipt_book_seq` (`session_id`,`book`,`seq`),
  ADD KEY `idx_receipt_student` (`student_id`),
  ADD KEY `idx_receipt_date` (`receipt_date`),
  ADD KEY `fk_fr_received_by` (`received_by`),
  ADD KEY `fk_fr_cancelled_by` (`cancelled_by`);

--
-- Indexes for table `fee_settings`
--
ALTER TABLE `fee_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_fset_admin` (`updated_by`);

--
-- Indexes for table `fee_structures`
--
ALTER TABLE `fee_structures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_fee_structure` (`session_id`,`class_id`,`fee_type_id`),
  ADD KEY `fee_type_id` (`fee_type_id`),
  ADD KEY `fk_fs_session` (`session_id`),
  ADD KEY `fk_fs_class` (`class_id`);

--
-- Indexes for table `fee_transactions`
--
ALTER TABLE `fee_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `idx_ft_receipt` (`receipt_id`);

--
-- Indexes for table `fee_types`
--
ALTER TABLE `fee_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_fee_type_name` (`type_name`),
  ADD KEY `fk_fee_type_account` (`account_id`);

--
-- Indexes for table `formative_settings`
--
ALTER TABLE `formative_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_formative_settings` (`session_id`,`class_id`,`subject_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grade_bands`
--
ALTER TABLE `grade_bands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_grade_band` (`class_group`,`grade`);

--
-- Indexes for table `guardians`
--
ALTER TABLE `guardians`
  ADD PRIMARY KEY (`guardian_id`),
  ADD KEY `idx_father_aadhaar` (`father_aadhaar`),
  ADD KEY `idx_mother_aadhaar` (`mother_aadhaar`),
  ADD KEY `idx_father_voter` (`father_voter_id`),
  ADD KEY `idx_mother_voter` (`mother_voter_id`),
  ADD KEY `idx_father_mobile` (`father_mobile`),
  ADD KEY `idx_guardian_contact` (`guardian_contact`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_holiday_date` (`holiday_date`),
  ADD KEY `idx_holiday_type` (`holiday_type`),
  ADD KEY `idx_holiday_start_end` (`start_date`,`end_date`),
  ADD KEY `idx_holiday_range` (`start_date`,`end_date`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_house_name` (`name`),
  ADD KEY `fk_house_teacher` (`teacher_id`);

--
-- Indexes for table `hprc_behavior`
--
ALTER TABLE `hprc_behavior`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_hprc_behavior_eval` (`session_id`,`class_id`,`student_id`,`exam_id`,`evaluation_no`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `fk_hb_session` (`session_id`),
  ADD KEY `fk_hb_class` (`class_id`),
  ADD KEY `fk_hb_section` (`section_id`),
  ADD KEY `fk_hb_exam` (`exam_id`);

--
-- Indexes for table `hprc_formative`
--
ALTER TABLE `hprc_formative`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_hprc_formative` (`session_id`,`class_id`,`student_id`,`subject_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `fk_hf_session` (`session_id`),
  ADD KEY `fk_hf_class` (`class_id`),
  ADD KEY `fk_hf_section` (`section_id`);

--
-- Indexes for table `hprc_learning`
--
ALTER TABLE `hprc_learning`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_hprc_learning_eval` (`session_id`,`class_id`,`student_id`,`exam_id`,`evaluation_no`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `fk_hl_session` (`session_id`),
  ADD KEY `fk_hl_class` (`class_id`),
  ADD KEY `fk_hl_section` (`section_id`),
  ADD KEY `fk_hl_exam` (`exam_id`);

--
-- Indexes for table `hprc_personality_lifeskills`
--
ALTER TABLE `hprc_personality_lifeskills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_hprc_personality_year` (`session_id`,`class_id`,`student_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `fk_hp_session` (`session_id`),
  ADD KEY `fk_hp_class` (`class_id`),
  ADD KEY `fk_hp_section` (`section_id`);

--
-- Indexes for table `hs_board_exam`
--
ALTER TABLE `hs_board_exam`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_hs_board_attempt` (`registration_id`,`exam_year`);

--
-- Indexes for table `hs_exam`
--
ALTER TABLE `hs_exam`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_hs_exam` (`session_id`,`class_id`,`semester`),
  ADD KEY `fk_hs_exam_class` (`class_id`);

--
-- Indexes for table `hs_exam_subject_marks`
--
ALTER TABLE `hs_exam_subject_marks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_hs_esm` (`hs_exam_id`,`subject_id`),
  ADD KEY `fk_hs_esm_subject` (`subject_id`),
  ADD KEY `fk_hs_esm_class` (`class_id`),
  ADD KEY `fk_hesm_session` (`session_id`);

--
-- Indexes for table `hs_marks`
--
ALTER TABLE `hs_marks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_hs_marks` (`hs_exam_id`,`student_id`,`subject_id`),
  ADD KEY `fk_hs_marks_student` (`student_id`),
  ADD KEY `fk_hs_marks_subject` (`subject_id`),
  ADD KEY `fk_hs_marks_entered_by` (`entered_by`);

--
-- Indexes for table `hs_registration`
--
ALTER TABLE `hs_registration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_student` (`student_id`),
  ADD KEY `idx_reg_no` (`registration_no`);

--
-- Indexes for table `hs_student_mp_marks`
--
ALTER TABLE `hs_student_mp_marks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_hsmp_student` (`student_id`),
  ADD KEY `fk_hsmp_application` (`application_id`);

--
-- Indexes for table `hs_student_mp_subject_marks`
--
ALTER TABLE `hs_student_mp_subject_marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hsmpsm_mpmarks` (`mp_marks_id`);

--
-- Indexes for table `hs_student_subjects`
--
ALTER TABLE `hs_student_subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_hss` (`session_id`,`student_id`,`subject_id`),
  ADD KEY `idx_hss_session_class` (`session_id`,`class_id`),
  ADD KEY `idx_hss_student` (`student_id`),
  ADD KEY `fk_hss_class` (`class_id`),
  ADD KEY `fk_hss_subject` (`subject_id`);

--
-- Indexes for table `invigilator_rules`
--
ALTER TABLE `invigilator_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rule_range` (`min_students`,`max_students`);

--
-- Indexes for table `library_books`
--
ALTER TABLE `library_books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `library_book_copies`
--
ALTER TABLE `library_book_copies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accession_no` (`accession_no`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `library_categories`
--
ALTER TABLE `library_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `library_issues`
--
ALTER TABLE `library_issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `copy_id` (`copy_id`),
  ADD KEY `borrower` (`borrower_type`,`borrower_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `library_settings`
--
ALTER TABLE `library_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `library_staff_access`
--
ALTER TABLE `library_staff_access`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff_id` (`staff_id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identifier` (`identifier`),
  ADD KEY `idx_attempt_locked` (`locked_until`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_marks_student_exam_subject` (`student_id`,`session_id`,`exam_id`,`subject_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `exam_id` (`exam_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `fk_marks_section` (`section_id`),
  ADD KEY `idx_student_exam` (`student_id`,`exam_id`),
  ADD KEY `idx_session_class` (`session_id`,`class_id`),
  ADD KEY `fk_marks_entered_by` (`entered_by`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_notice_publish_date` (`publish_date`),
  ADD KEY `idx_notice_live` (`status`,`publish_date`);

--
-- Indexes for table `pass_fail_settings`
--
ALTER TABLE `pass_fail_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_class` (`class_id`);

--
-- Indexes for table `periods`
--
ALTER TABLE `periods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotion_batches`
--
ALTER TABLE `promotion_batches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_promo_from` (`from_session_id`,`from_class_id`),
  ADD KEY `idx_from_session` (`from_session_id`),
  ADD KEY `idx_to_session` (`to_session_id`),
  ADD KEY `fk_pb_from_class` (`from_class_id`),
  ADD KEY `fk_pb_to_class` (`to_class_id`),
  ADD KEY `fk_pb_admin` (`promoted_by`);

--
-- Indexes for table `promotion_details`
--
ALTER TABLE `promotion_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_promotion_batch_student` (`batch_id`,`student_id`),
  ADD KEY `idx_batch` (`batch_id`),
  ADD KEY `idx_student` (`student_id`),
  ADD KEY `fk_pd_old_class` (`old_class_id`),
  ADD KEY `fk_pd_new_class` (`new_class_id`),
  ADD KEY `fk_pd_old_section` (`old_section_id`),
  ADD KEY `fk_pd_new_section` (`new_section_id`);

--
-- Indexes for table `provisional_routine`
--
ALTER TABLE `provisional_routine`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_provisional` (`session_id`,`class_id`,`section_id`,`day_name`,`period_id`,`provisional_date`),
  ADD KEY `fk_prov_class` (`class_id`),
  ADD KEY `fk_prov_section` (`section_id`),
  ADD KEY `fk_prov_period` (`period_id`),
  ADD KEY `fk_prov_orig_teacher` (`original_teacher_id`),
  ADD KEY `fk_prov_orig_subject` (`original_subject_id`),
  ADD KEY `fk_prov_prov_teacher` (`provisional_teacher_id`),
  ADD KEY `fk_prov_prov_subject` (`provisional_subject_id`),
  ADD KEY `idx_new_period` (`new_period_id`);

--
-- Indexes for table `routine`
--
ALTER TABLE `routine`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_routine_slot` (`session_id`,`class_id`,`section_id`,`group_id`,`day_name`,`period_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `period_id` (`period_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `idx_teacher_day` (`teacher_id`,`day_name`);

--
-- Indexes for table `routine_drafts`
--
ALTER TABLE `routine_drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rd_session` (`session_id`);

--
-- Indexes for table `routine_settings`
--
ALTER TABLE `routine_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_settings`
--
ALTER TABLE `school_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `secondary_exam`
--
ALTER TABLE `secondary_exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_secondary_exam_secondary_registration` (`registration_id`);

--
-- Indexes for table `secondary_registration`
--
ALTER TABLE `secondary_registration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_wbbse_registration` (`registration_no`),
  ADD KEY `idx_student` (`student_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_section_session_class_name` (`session_id`,`class_id`,`section_name`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `fk_sections_class_teacher` (`class_teacher_id`),
  ADD KEY `fk_sections_ct_subject` (`class_teacher_subject_id`);

--
-- Indexes for table `section_groups`
--
ALTER TABLE `section_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_session_class_group` (`session_id`,`class_id`,`group_name`),
  ADD KEY `fk_sg_class` (`class_id`);

--
-- Indexes for table `section_group_members`
--
ALTER TABLE `section_group_members`
  ADD PRIMARY KEY (`group_id`,`section_id`),
  ADD UNIQUE KEY `uq_sgm_section` (`section_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_staff_employee_id` (`employee_id`),
  ADD UNIQUE KEY `uq_staff_email` (`email`),
  ADD UNIQUE KEY `uq_staff_aadhar` (`aadhar_number`),
  ADD UNIQUE KEY `uq_staff_pan` (`pan_number`),
  ADD UNIQUE KEY `uq_staff_state_govt_id` (`state_govt_id`),
  ADD UNIQUE KEY `uq_staff_national_code` (`national_code`),
  ADD KEY `idx_staff_name` (`staff_name`),
  ADD KEY `idx_staff_emp_id` (`employee_id`(20)),
  ADD KEY `idx_staff_service_status` (`service_status`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banglarshiksha_id` (`banglarshiksha_id`),
  ADD UNIQUE KEY `uq_students_pen` (`pen_id`),
  ADD UNIQUE KEY `uq_students_apaar` (`apaar_id`),
  ADD KEY `fk_students_guardian` (`guardian_id`),
  ADD KEY `idx_banglarshiksha_id` (`banglarshiksha_id`),
  ADD KEY `idx_student_status` (`student_status`),
  ADD KEY `idx_mobile` (`mobile`),
  ADD KEY `fk_students_admission_class` (`admission_class_id`),
  ADD KEY `fk_student_house` (`house_id`);

--
-- Indexes for table `student_academic_history`
--
ALTER TABLE `student_academic_history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_student_academic_session` (`student_id`,`session_id`),
  ADD UNIQUE KEY `uniq_session_class_section_roll` (`session_id`,`class_id`,`section_id`,`roll_no`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `idx_session_class_section` (`session_id`,`class_id`,`section_id`);

--
-- Indexes for table `student_activity_logs`
--
ALTER TABLE `student_activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_student` (`student_id`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `student_admit_cards`
--
ALTER TABLE `student_admit_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_student_exam` (`student_id`,`exam_source`,`exam_id`),
  ADD KEY `verification_token` (`verification_token`);

--
-- Indexes for table `student_attendance`
--
ALTER TABLE `student_attendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_attendance` (`session_id`,`class_id`,`section_id`,`student_id`,`attendance_date`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `fk_satt_session` (`session_id`),
  ADD KEY `fk_satt_class` (`class_id`),
  ADD KEY `fk_satt_section` (`section_id`),
  ADD KEY `idx_date` (`attendance_date`),
  ADD KEY `idx_att_section_date` (`session_id`,`class_id`,`section_id`,`attendance_date`);

--
-- Indexes for table `student_discounts`
--
ALTER TABLE `student_discounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_student_discount_session` (`student_id`,`session_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `fk_sd_session` (`session_id`),
  ADD KEY `fk_sd_admin` (`created_by`);

--
-- Indexes for table `student_id_cards`
--
ALTER TABLE `student_id_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_student_session` (`student_id`,`session_id`),
  ADD UNIQUE KEY `uq_idcard_token` (`verification_token`),
  ADD KEY `idx_student` (`student_id`);

--
-- Indexes for table `student_merit_ranks`
--
ALTER TABLE `student_merit_ranks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_student_merit` (`academic_session_id`,`class_id`,`student_id`),
  ADD KEY `idx_session` (`academic_session_id`),
  ADD KEY `idx_class` (`class_id`),
  ADD KEY `idx_student` (`student_id`),
  ADD KEY `idx_rank` (`merit_rank`),
  ADD KEY `fk_smr_admin` (`created_by`);

--
-- Indexes for table `student_third_language`
--
ALTER TABLE `student_third_language`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_student` (`student_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_subject_name` (`subject_name`),
  ADD KEY `idx_subject_name` (`subject_name`),
  ADD KEY `idx_subject_active` (`is_active`);

--
-- Indexes for table `tc_students`
--
ALTER TABLE `tc_students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_tc_no` (`tc_no`),
  ADD UNIQUE KEY `uq_tc_token` (`verification_token`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `teacher_assignments`
--
ALTER TABLE `teacher_assignments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_tasg` (`session_id`,`section_id`,`subject_id`),
  ADD KEY `idx_tasg_teacher` (`teacher_id`),
  ADD KEY `fk_tasg_section` (`section_id`),
  ADD KEY `fk_tasg_subject` (`subject_id`);

--
-- Indexes for table `teacher_attendance`
--
ALTER TABLE `teacher_attendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_teacher_attendance` (`teacher_id`,`attendance_date`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `idx_date` (`attendance_date`),
  ADD KEY `idx_teacher_date` (`teacher_id`,`attendance_date`);

--
-- Indexes for table `teacher_exclusions`
--
ALTER TABLE `teacher_exclusions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_teacher_exclusion_date` (`session_id`,`teacher_id`,`provisional_date`),
  ADD KEY `fk_te_session` (`session_id`),
  ADD KEY `fk_te_teacher` (`teacher_id`);

--
-- Indexes for table `teacher_slot_blocks`
--
ALTER TABLE `teacher_slot_blocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_tsb` (`session_id`,`teacher_id`,`day_name`,`period_id`),
  ADD KEY `fk_tsb_teacher` (`teacher_id`),
  ADD KEY `fk_tsb_period` (`period_id`);

--
-- Indexes for table `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  ADD PRIMARY KEY (`teacher_id`,`subject_id`),
  ADD KEY `fk_ts_subject` (`subject_id`);

--
-- Indexes for table `user_access_permissions`
--
ALTER TABLE `user_access_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_type_key` (`user_type`,`access_key`);

--
-- Indexes for table `website_settings`
--
ALTER TABLE `website_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workload_limits`
--
ALTER TABLE `workload_limits`
  ADD PRIMARY KEY (`designation`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_sessions`
--
ALTER TABLE `academic_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acc_accounts`
--
ALTER TABLE `acc_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acc_entries`
--
ALTER TABLE `acc_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acc_heads`
--
ALTER TABLE `acc_heads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_logs`
--
ALTER TABLE `admin_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admission_applications`
--
ALTER TABLE `admission_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admission_centres`
--
ALTER TABLE `admission_centres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admission_field_settings`
--
ALTER TABLE `admission_field_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admission_requirements`
--
ALTER TABLE `admission_requirements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admission_subject_seats`
--
ALTER TABLE `admission_subject_seats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admission_villages`
--
ALTER TABLE `admission_villages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_admission_seats`
--
ALTER TABLE `class_admission_seats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_subjects`
--
ALTER TABLE `class_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `closed_classes`
--
ALTER TABLE `closed_classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `closed_periods`
--
ALTER TABLE `closed_periods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_queries`
--
ALTER TABLE `contact_queries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_class_shift`
--
ALTER TABLE `exam_class_shift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_duty_roster`
--
ALTER TABLE `exam_duty_roster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_duty_temp_exclusions`
--
ALTER TABLE `exam_duty_temp_exclusions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_rooms`
--
ALTER TABLE `exam_rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_room_usage`
--
ALTER TABLE `exam_room_usage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_routine`
--
ALTER TABLE `exam_routine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_seating_plan`
--
ALTER TABLE `exam_seating_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_seating_settings`
--
ALTER TABLE `exam_seating_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_shifts`
--
ALTER TABLE `exam_shifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_subject_marks`
--
ALTER TABLE `exam_subject_marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_invoices`
--
ALTER TABLE `fee_invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_invoice_items`
--
ALTER TABLE `fee_invoice_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_receipts`
--
ALTER TABLE `fee_receipts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_structures`
--
ALTER TABLE `fee_structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_transactions`
--
ALTER TABLE `fee_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_types`
--
ALTER TABLE `fee_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formative_settings`
--
ALTER TABLE `formative_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grade_bands`
--
ALTER TABLE `grade_bands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guardians`
--
ALTER TABLE `guardians`
  MODIFY `guardian_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hprc_behavior`
--
ALTER TABLE `hprc_behavior`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hprc_formative`
--
ALTER TABLE `hprc_formative`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hprc_learning`
--
ALTER TABLE `hprc_learning`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hprc_personality_lifeskills`
--
ALTER TABLE `hprc_personality_lifeskills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hs_board_exam`
--
ALTER TABLE `hs_board_exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hs_exam`
--
ALTER TABLE `hs_exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hs_exam_subject_marks`
--
ALTER TABLE `hs_exam_subject_marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hs_marks`
--
ALTER TABLE `hs_marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hs_registration`
--
ALTER TABLE `hs_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hs_student_mp_marks`
--
ALTER TABLE `hs_student_mp_marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hs_student_mp_subject_marks`
--
ALTER TABLE `hs_student_mp_subject_marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hs_student_subjects`
--
ALTER TABLE `hs_student_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invigilator_rules`
--
ALTER TABLE `invigilator_rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `library_books`
--
ALTER TABLE `library_books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `library_book_copies`
--
ALTER TABLE `library_book_copies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `library_categories`
--
ALTER TABLE `library_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `library_issues`
--
ALTER TABLE `library_issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `library_staff_access`
--
ALTER TABLE `library_staff_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pass_fail_settings`
--
ALTER TABLE `pass_fail_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `periods`
--
ALTER TABLE `periods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotion_batches`
--
ALTER TABLE `promotion_batches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotion_details`
--
ALTER TABLE `promotion_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provisional_routine`
--
ALTER TABLE `provisional_routine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `routine`
--
ALTER TABLE `routine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `routine_drafts`
--
ALTER TABLE `routine_drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `routine_settings`
--
ALTER TABLE `routine_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `school_settings`
--
ALTER TABLE `school_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `secondary_exam`
--
ALTER TABLE `secondary_exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `secondary_registration`
--
ALTER TABLE `secondary_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `section_groups`
--
ALTER TABLE `section_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_academic_history`
--
ALTER TABLE `student_academic_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_activity_logs`
--
ALTER TABLE `student_activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_admit_cards`
--
ALTER TABLE `student_admit_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_attendance`
--
ALTER TABLE `student_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_discounts`
--
ALTER TABLE `student_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_id_cards`
--
ALTER TABLE `student_id_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_merit_ranks`
--
ALTER TABLE `student_merit_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_third_language`
--
ALTER TABLE `student_third_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tc_students`
--
ALTER TABLE `tc_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_assignments`
--
ALTER TABLE `teacher_assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_attendance`
--
ALTER TABLE `teacher_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_exclusions`
--
ALTER TABLE `teacher_exclusions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_slot_blocks`
--
ALTER TABLE `teacher_slot_blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_access_permissions`
--
ALTER TABLE `user_access_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `website_settings`
--
ALTER TABLE `website_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acc_accounts`
--
ALTER TABLE `acc_accounts`
  ADD CONSTRAINT `fk_acc_account_admin` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `acc_entries`
--
ALTER TABLE `acc_entries`
  ADD CONSTRAINT `fk_acc_entry_account` FOREIGN KEY (`account_id`) REFERENCES `acc_accounts` (`id`),
  ADD CONSTRAINT `fk_acc_entry_canceller` FOREIGN KEY (`cancelled_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_acc_entry_creator` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_acc_entry_feetype` FOREIGN KEY (`fee_type_id`) REFERENCES `fee_types` (`id`),
  ADD CONSTRAINT `fk_acc_entry_head` FOREIGN KEY (`head_id`) REFERENCES `acc_heads` (`id`),
  ADD CONSTRAINT `fk_acc_entry_invoice` FOREIGN KEY (`fee_invoice_id`) REFERENCES `fee_invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_acc_entry_receipt` FOREIGN KEY (`fee_receipt_id`) REFERENCES `fee_receipts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `acc_settings`
--
ALTER TABLE `acc_settings`
  ADD CONSTRAINT `fk_acc_settings_account` FOREIGN KEY (`fee_account_id`) REFERENCES `acc_accounts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_acc_settings_admin` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `admin_logs`
--
ALTER TABLE `admin_logs`
  ADD CONSTRAINT `fk_admin_logs_admin` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admission_applications`
--
ALTER TABLE `admission_applications`
  ADD CONSTRAINT `fk_admission_admitted_student` FOREIGN KEY (`admitted_student_id`) REFERENCES `students` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_app_centre` FOREIGN KEY (`centre_id`) REFERENCES `admission_centres` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `admission_subject_seats`
--
ALTER TABLE `admission_subject_seats`
  ADD CONSTRAINT `fk_adm_seat_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admission_villages`
--
ALTER TABLE `admission_villages`
  ADD CONSTRAINT `fk_village_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `fk_certificates_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `class_subjects`
--
ALTER TABLE `class_subjects`
  ADD CONSTRAINT `fk_cs_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cs_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cs_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `closed_classes`
--
ALTER TABLE `closed_classes`
  ADD CONSTRAINT `fk_cc_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cc_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `closed_periods`
--
ALTER TABLE `closed_periods`
  ADD CONSTRAINT `fk_cp_period` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cp_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `fk_exams_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_duty_roster`
--
ALTER TABLE `exam_duty_roster`
  ADD CONSTRAINT `fk_duty_room` FOREIGN KEY (`room_id`) REFERENCES `exam_rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_duty_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exam_duty_temp_exclusions`
--
ALTER TABLE `exam_duty_temp_exclusions`
  ADD CONSTRAINT `fk_exclusion_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exam_seating_plan`
--
ALTER TABLE `exam_seating_plan`
  ADD CONSTRAINT `fk_seating_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_subject_marks`
--
ALTER TABLE `exam_subject_marks`
  ADD CONSTRAINT `fk_esm_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_esm_exam` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_esm_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_esm_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_invoices`
--
ALTER TABLE `fee_invoices`
  ADD CONSTRAINT `fk_fi_cancelled_by` FOREIGN KEY (`cancelled_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_fi_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_fi_created_by` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_fi_section` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_fi_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_fi_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_invoice_items`
--
ALTER TABLE `fee_invoice_items`
  ADD CONSTRAINT `fk_fii_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `fee_invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_fii_type` FOREIGN KEY (`fee_type_id`) REFERENCES `fee_types` (`id`);

--
-- Constraints for table `fee_receipts`
--
ALTER TABLE `fee_receipts`
  ADD CONSTRAINT `fk_fr_cancelled_by` FOREIGN KEY (`cancelled_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_fr_received_by` FOREIGN KEY (`received_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_fr_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`),
  ADD CONSTRAINT `fk_fr_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `fee_settings`
--
ALTER TABLE `fee_settings`
  ADD CONSTRAINT `fk_fset_admin` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `fee_structures`
--
ALTER TABLE `fee_structures`
  ADD CONSTRAINT `fk_fs_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_fs_feetype` FOREIGN KEY (`fee_type_id`) REFERENCES `fee_types` (`id`),
  ADD CONSTRAINT `fk_fs_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_transactions`
--
ALTER TABLE `fee_transactions`
  ADD CONSTRAINT `fk_ft_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `fee_invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ft_receipt` FOREIGN KEY (`receipt_id`) REFERENCES `fee_receipts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ft_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_types`
--
ALTER TABLE `fee_types`
  ADD CONSTRAINT `fk_fee_type_account` FOREIGN KEY (`account_id`) REFERENCES `acc_accounts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `formative_settings`
--
ALTER TABLE `formative_settings`
  ADD CONSTRAINT `fk_fset_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_fset_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_fset_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `houses`
--
ALTER TABLE `houses`
  ADD CONSTRAINT `fk_house_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `staff` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `hprc_behavior`
--
ALTER TABLE `hprc_behavior`
  ADD CONSTRAINT `fk_hb_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hb_exam` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hb_section` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_hb_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hb_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hprc_formative`
--
ALTER TABLE `hprc_formative`
  ADD CONSTRAINT `fk_hf_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hf_section` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_hf_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hf_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hf_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hprc_learning`
--
ALTER TABLE `hprc_learning`
  ADD CONSTRAINT `fk_hl_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hl_exam` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hl_section` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_hl_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hl_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hprc_personality_lifeskills`
--
ALTER TABLE `hprc_personality_lifeskills`
  ADD CONSTRAINT `fk_hp_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hp_section` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_hp_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hp_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_board_exam`
--
ALTER TABLE `hs_board_exam`
  ADD CONSTRAINT `fk_hs_board_exam_registration` FOREIGN KEY (`registration_id`) REFERENCES `hs_registration` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_exam`
--
ALTER TABLE `hs_exam`
  ADD CONSTRAINT `fk_hs_exam_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_hs_exam_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hs_exam_subject_marks`
--
ALTER TABLE `hs_exam_subject_marks`
  ADD CONSTRAINT `fk_hesm_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hs_esm_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_hs_esm_exam` FOREIGN KEY (`hs_exam_id`) REFERENCES `hs_exam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_hs_esm_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hs_marks`
--
ALTER TABLE `hs_marks`
  ADD CONSTRAINT `fk_hs_marks_entered_by` FOREIGN KEY (`entered_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_hs_marks_exam` FOREIGN KEY (`hs_exam_id`) REFERENCES `hs_exam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_hs_marks_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hs_marks_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hs_registration`
--
ALTER TABLE `hs_registration`
  ADD CONSTRAINT `fk_hs_registration_students` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_student_mp_marks`
--
ALTER TABLE `hs_student_mp_marks`
  ADD CONSTRAINT `fk_hsmp_application` FOREIGN KEY (`application_id`) REFERENCES `admission_applications` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_hsmp_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_student_mp_subject_marks`
--
ALTER TABLE `hs_student_mp_subject_marks`
  ADD CONSTRAINT `fk_hsmpsm_mpmarks` FOREIGN KEY (`mp_marks_id`) REFERENCES `hs_student_mp_marks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_student_subjects`
--
ALTER TABLE `hs_student_subjects`
  ADD CONSTRAINT `fk_hss_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_hss_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_hss_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hss_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `library_books`
--
ALTER TABLE `library_books`
  ADD CONSTRAINT `fk_lb_category` FOREIGN KEY (`category_id`) REFERENCES `library_categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `library_book_copies`
--
ALTER TABLE `library_book_copies`
  ADD CONSTRAINT `fk_copy_book` FOREIGN KEY (`book_id`) REFERENCES `library_books` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `library_issues`
--
ALTER TABLE `library_issues`
  ADD CONSTRAINT `fk_issue_copy` FOREIGN KEY (`copy_id`) REFERENCES `library_book_copies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `library_staff_access`
--
ALTER TABLE `library_staff_access`
  ADD CONSTRAINT `fk_lsa_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `fk_marks_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_marks_entered_by` FOREIGN KEY (`entered_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_marks_exam` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_marks_section` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_marks_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_marks_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_marks_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pass_fail_settings`
--
ALTER TABLE `pass_fail_settings`
  ADD CONSTRAINT `fk_pfs_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `promotion_batches`
--
ALTER TABLE `promotion_batches`
  ADD CONSTRAINT `fk_pb_admin` FOREIGN KEY (`promoted_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pb_from_class` FOREIGN KEY (`from_class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pb_from_session` FOREIGN KEY (`from_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pb_to_class` FOREIGN KEY (`to_class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pb_to_session` FOREIGN KEY (`to_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `promotion_details`
--
ALTER TABLE `promotion_details`
  ADD CONSTRAINT `fk_pd_batch` FOREIGN KEY (`batch_id`) REFERENCES `promotion_batches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pd_new_class` FOREIGN KEY (`new_class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pd_new_section` FOREIGN KEY (`new_section_id`) REFERENCES `sections` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pd_old_class` FOREIGN KEY (`old_class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pd_old_section` FOREIGN KEY (`old_section_id`) REFERENCES `sections` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pd_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `provisional_routine`
--
ALTER TABLE `provisional_routine`
  ADD CONSTRAINT `fk_prov_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_prov_orig_subject` FOREIGN KEY (`original_subject_id`) REFERENCES `subjects` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_prov_orig_teacher` FOREIGN KEY (`original_teacher_id`) REFERENCES `staff` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_prov_period` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_prov_prov_subject` FOREIGN KEY (`provisional_subject_id`) REFERENCES `subjects` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_prov_prov_teacher` FOREIGN KEY (`provisional_teacher_id`) REFERENCES `staff` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_prov_section` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_prov_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `routine`
--
ALTER TABLE `routine`
  ADD CONSTRAINT `fk_routine_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_routine_period` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_routine_section` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_routine_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_routine_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_routine_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `staff` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `routine_drafts`
--
ALTER TABLE `routine_drafts`
  ADD CONSTRAINT `fk_rd_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `secondary_exam`
--
ALTER TABLE `secondary_exam`
  ADD CONSTRAINT `fk_secondary_exam_secondary_registration` FOREIGN KEY (`registration_id`) REFERENCES `secondary_registration` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `secondary_registration`
--
ALTER TABLE `secondary_registration`
  ADD CONSTRAINT `fk_secondary_registration_students` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `fk_sections_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sections_class_teacher` FOREIGN KEY (`class_teacher_id`) REFERENCES `staff` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_sections_ct_subject` FOREIGN KEY (`class_teacher_subject_id`) REFERENCES `subjects` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_sections_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `section_groups`
--
ALTER TABLE `section_groups`
  ADD CONSTRAINT `fk_sg_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sg_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `section_group_members`
--
ALTER TABLE `section_group_members`
  ADD CONSTRAINT `fk_sgm_group` FOREIGN KEY (`group_id`) REFERENCES `section_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sgm_section` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_student_house` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_students_admission_class` FOREIGN KEY (`admission_class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_students_guardian` FOREIGN KEY (`guardian_id`) REFERENCES `guardians` (`guardian_id`) ON UPDATE CASCADE;

--
-- Constraints for table `student_academic_history`
--
ALTER TABLE `student_academic_history`
  ADD CONSTRAINT `fk_academic_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sah_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sah_section` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_sah_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_activity_logs`
--
ALTER TABLE `student_activity_logs`
  ADD CONSTRAINT `fk_activity_logs_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_admit_cards`
--
ALTER TABLE `student_admit_cards`
  ADD CONSTRAINT `fk_admit_card_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_attendance`
--
ALTER TABLE `student_attendance`
  ADD CONSTRAINT `fk_satt_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_satt_section` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_satt_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_satt_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_discounts`
--
ALTER TABLE `student_discounts`
  ADD CONSTRAINT `fk_sd_admin` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_sd_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sd_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_id_cards`
--
ALTER TABLE `student_id_cards`
  ADD CONSTRAINT `fk_idcards_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_merit_ranks`
--
ALTER TABLE `student_merit_ranks`
  ADD CONSTRAINT `fk_smr_admin` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_smr_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_smr_session` FOREIGN KEY (`academic_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_smr_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_third_language`
--
ALTER TABLE `student_third_language`
  ADD CONSTRAINT `fk_stl_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_stl_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tc_students`
--
ALTER TABLE `tc_students`
  ADD CONSTRAINT `fk_tc_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teacher_assignments`
--
ALTER TABLE `teacher_assignments`
  ADD CONSTRAINT `fk_tasg_section` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tasg_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tasg_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tasg_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teacher_attendance`
--
ALTER TABLE `teacher_attendance`
  ADD CONSTRAINT `fk_ta_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teacher_exclusions`
--
ALTER TABLE `teacher_exclusions`
  ADD CONSTRAINT `fk_te_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_te_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teacher_slot_blocks`
--
ALTER TABLE `teacher_slot_blocks`
  ADD CONSTRAINT `fk_tsb_period` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tsb_session` FOREIGN KEY (`session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tsb_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  ADD CONSTRAINT `fk_ts_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ts_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
