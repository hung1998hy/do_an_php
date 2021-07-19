-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 19, 2021 at 05:41 PM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `superfoodphp`
--

-- --------------------------------------------------------

--
-- Table structure for table `link_product_tag`
--

CREATE TABLE IF NOT EXISTS `link_product_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `link_product_tag`
--

INSERT INTO `link_product_tag` (`id`, `product_id`, `tag_id`) VALUES
(1, 11, 2),
(3, 11, 3),
(4, 8, 2),
(5, 8, 1),
(6, 8, 3),
(7, 6, 1),
(9, 3, 2),
(10, 3, 4),
(13, 10, 1),
(14, 10, 4),
(15, 2, 3),
(16, 5, 2),
(17, 5, 4),
(18, 12, 3),
(19, 14, 2),
(20, 14, 1),
(21, 17, 6),
(22, 17, 3),
(23, 18, 6),
(24, 18, 1),
(25, 19, 1),
(26, 19, 3),
(27, 19, 4),
(28, 20, 2),
(29, 21, 6),
(30, 22, 3),
(31, 23, 6),
(32, 23, 2),
(33, 24, 2),
(34, 25, 6);

-- --------------------------------------------------------

--
-- Table structure for table `link_role_permission`
--

CREATE TABLE IF NOT EXISTS `link_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=264 ;

--
-- Dumping data for table `link_role_permission`
--

INSERT INTO `link_role_permission` (`id`, `role_id`, `permission_id`) VALUES
(221, 15, 6),
(222, 15, 2),
(223, 15, 13),
(234, 3, 2),
(235, 3, 4),
(236, 3, 3),
(237, 3, 1),
(238, 3, 10),
(239, 3, 12),
(240, 3, 11),
(241, 3, 9),
(242, 3, 14),
(243, 3, 16),
(244, 3, 15),
(245, 3, 13),
(254, 2, 2),
(255, 2, 4),
(256, 2, 3),
(257, 2, 1),
(258, 2, 10),
(259, 2, 11),
(260, 2, 9),
(261, 2, 14),
(262, 2, 15),
(263, 2, 13);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `code`, `name`) VALUES
(1, 'product_view', 'Xem đồ án và giảng viên'),
(2, 'product_add', 'Thêm đồ án và giảng viên'),
(3, 'product_edit', 'Sửa đồ án và giảng viên'),
(4, 'product_delete', 'Xóa đồ án và giảng viên'),
(9, 'role_view', 'Xem quyền'),
(10, 'role_add', 'Thêm quyền'),
(11, 'role_edit', 'Sửa quyền'),
(12, 'role_delete', 'Xóa quyền'),
(13, 'user_view', 'Xem người dùng'),
(14, 'user_add', 'Thêm người dùng'),
(15, 'user_edit', 'Sửa người dùng'),
(16, 'user_delete', 'Xóa người dùng');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `images` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `status`, `images`, `category_id`) VALUES
(24, 'Đồ án web1', 'Đồ án web 1', 1, '../../../../public/admin/assets/images/productImages/60f46db333386.sql', 35),
(25, 's', 'd', 0, '../../../../public/admin/assets/images/productImages/sql', 34);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `parent_id`) VALUES
(33, 'CNTT', 0),
(34, 'ATTT', 0),
(35, 'Thầy Cường', 0),
(36, 'Thầy Long', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_tags`
--

CREATE TABLE IF NOT EXISTS `product_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `product_tags`
--

INSERT INTO `product_tags` (`id`, `name`) VALUES
(1, 'ATTT'),
(2, 'CNTT');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `code`, `name`) VALUES
(2, 'giang_vien', 'Giảng Viên'),
(3, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `images` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `images`, `firstname`, `lastname`, `email`, `password`, `created_at`, `is_active`, `status`, `role_id`) VALUES
(27, '', 'admin', 'admin', 'admin@vlance.vn', '2b4110cde52d9be3748854a44e1105af', '2021-07-19 03:04:26', 1, 1, 3),
(30, '', 'Hưng', 'Vũ Việt', 'hung1998@gmail.com', '2b4110cde52d9be3748854a44e1105af', '2021-07-19 22:12:43', 1, 1, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
