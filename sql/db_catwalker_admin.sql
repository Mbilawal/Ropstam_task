-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 04, 2020 at 03:01 PM
-- Server version: 8.0.22-0ubuntu0.20.04.3
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_catwalker_admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admins`
--

CREATE TABLE `tbl_admins` (
  `id` int NOT NULL,
  `firstname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `role_id` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_admins`
--

INSERT INTO `tbl_admins` (`id`, `firstname`, `lastname`, `status`, `username`, `password`, `keyword`, `image`, `email`, `phone`, `address`, `role_id`) VALUES
(1, NULL, NULL, 1, 'admin', NULL, 'admin', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cities`
--

CREATE TABLE `tbl_cities` (
  `city_id` int NOT NULL,
  `city_meta` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_cities`
--

INSERT INTO `tbl_cities` (`city_id`, `city_meta`) VALUES
(1, 'Rawalpindi'),
(2, 'Mardan'),
(3, 'Sawabi'),
(4, 'Peshawar'),
(5, 'Chakwal'),
(6, 'Sindh'),
(7, 'Multan'),
(8, 'Peshawarr'),
(9, 'HariPur');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menus`
--

CREATE TABLE `tbl_menus` (
  `id` int NOT NULL,
  `menu_title` varchar(500) NOT NULL,
  `description` varchar(255) NOT NULL,
  `parent_id` int NOT NULL COMMENT 'if 0, means it is the parent Menu',
  `set_as_default` tinyint(1) NOT NULL COMMENT 'Set the Roles always marked as checked',
  `icon_class_name` varchar(255) NOT NULL,
  `url_link` varchar(500) NOT NULL DEFAULT '',
  `display_order` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_menus`
--

INSERT INTO `tbl_menus` (`id`, `menu_title`, `description`, `parent_id`, `set_as_default`, `icon_class_name`, `url_link`, `display_order`, `status`) VALUES
(1, 'Dashboard', 'Admin', 0, 0, 'fa fa-home', 'dashboard/', 1, 1),
(6, 'Manage Users', 'Admin', 0, 0, 'fa fa-users', 'user/', 6, 1),
(23, 'Manage Roles', 'Admin', 0, 0, 'fa fa-american-sign-language-interpreting', 'setting/manage-roles/', 15, 1),
(24, 'Manage Roles', 'Admin', 23, 0, 'fa fa-american-sign-language-interpreting', 'setting/manage-roles/', 2, 1),
(25, 'Manage Menu', 'Admin', 23, 0, 'fa fa-list', 'setting/manage-menus/', 4, 1),
(27, 'New Role', 'Admin', 23, 0, 'fa fa-list', 'setting/add-role/', 1, 1),
(28, 'New Menu', 'Admin', 23, 0, 'fa fa-list', 'setting/add-menu/', 3, 1),
(29, 'Logout', 'Admin', 0, 0, 'fa fa-sign-out-alt', 'login/log-out/', 100, 1),
(30, 'New Admin', 'Admin', 31, 0, 'fa fa-list', 'signup/', 5, 1),
(31, 'Manage Admin', 'Admin', 0, 0, 'fa fa-list', 'signup/admins/', 6, 1),
(32, 'Manage Products', '(Admin)', 0, 0, 'flaticon2-line-chart', 'product/index/', 2, 1),
(33, 'Manage Brands', '(Admin)', 0, 0, 'fa fa-tag', 'brand/index/', 3, 1),
(34, 'Settings', '(Admin / User)', 0, 0, 'fa fa-cog', 'setting/', 99, 1),
(35, 'Meta Tag', '(Admin / User)', 34, 0, 'fa fa-cog', 'setting/meta-tag', 1, 1),
(37, 'Pages', '(Admin / User)', 38, 0, 'fa fa-page', 'setting/pages', 1, 1),
(38, 'Manage Pages', '(Admin / User)', 0, 0, 'fa fa-file', 'setting/pages', 98, 1),
(39, 'Admins', '(Admin / User)', 31, 0, 'fa fa-list', 'signup/admins/', 1, 1),
(40, 'Global Settings', '(Admin / User)', 34, 0, 'fa fa-cog', 'setting/global', 1, 1),
(41, 'Banners', '(Admin / User)', 42, 0, 'fa fa-banner', 'setting/banners', 1, 1),
(42, 'Manage Banners', '(Admin / User)', 0, 0, 'fa fa-file', 'setting/banners', 98, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notes`
--

CREATE TABLE `tbl_notes` (
  `note_id` int NOT NULL,
  `note_meta` text,
  `note_amount` double NOT NULL DEFAULT '0',
  `note_quantity` varchar(255) DEFAULT '0',
  `note_date` date DEFAULT NULL,
  `note_status` int NOT NULL DEFAULT '0',
  `note_user` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `id` int NOT NULL,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_rights` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL COMMENT '0 In active , 1 active'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`id`, `role_name`, `role_description`, `role_rights`, `status`) VALUES
(1, 'Admin', 'for admins only', '1,32,33,6,31,39,30,23,27,24,28,25,38,41,37,42,34,40,35,29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `setting_id` int NOT NULL,
  `setting_meta` varchar(255) DEFAULT NULL,
  `setting_value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`setting_id`, `setting_meta`, `setting_value`) VALUES
(1, 'currency', 'Rs');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_units`
--

CREATE TABLE `tbl_units` (
  `unit_id` int NOT NULL,
  `unit_meta` varchar(255) DEFAULT NULL,
  `unit_child_value` double NOT NULL DEFAULT '0',
  `unit_child` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int NOT NULL,
  `user_name` text,
  `user_address` text,
  `user_email` varchar(255) DEFAULT NULL,
  `user_city` int NOT NULL DEFAULT '0',
  `user_phone` varchar(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `user_type` int NOT NULL DEFAULT '0' COMMENT '// 0 for customers , 1 for suppliers, 2 for both'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `user_name`, `user_address`, `user_email`, `user_city`, `user_phone`, `created_date`, `last_updated_date`, `status`, `user_type`) VALUES
(1, 'waleed khalid', 'Alaska (AK)', 'akwaleed728@gmail.com', 0, '91897', '2020-06-15 20:04:45', '2020-06-15 20:04:45', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_bank_details`
--

CREATE TABLE `tbl_user_bank_details` (
  `id` int NOT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  `branch_code` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admins`
--
ALTER TABLE `tbl_admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `id` (`id`),
  ADD KEY `status_2` (`status`);

--
-- Indexes for table `tbl_cities`
--
ALTER TABLE `tbl_cities`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `tbl_menus`
--
ALTER TABLE `tbl_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_notes`
--
ALTER TABLE `tbl_notes`
  ADD PRIMARY KEY (`note_id`);

--
-- Indexes for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `tbl_units`
--
ALTER TABLE `tbl_units`
  ADD PRIMARY KEY (`unit_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_user_bank_details`
--
ALTER TABLE `tbl_user_bank_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admins`
--
ALTER TABLE `tbl_admins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_cities`
--
ALTER TABLE `tbl_cities`
  MODIFY `city_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_menus`
--
ALTER TABLE `tbl_menus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tbl_notes`
--
ALTER TABLE `tbl_notes`
  MODIFY `note_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `setting_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_units`
--
ALTER TABLE `tbl_units`
  MODIFY `unit_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_user_bank_details`
--
ALTER TABLE `tbl_user_bank_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
