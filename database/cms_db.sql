-- Adminer 4.7.8 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `branches`;
CREATE TABLE `branches` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `branch_code` varchar(50) NOT NULL,
  `street` text NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `zip_code` varchar(50) NOT NULL,
  `country` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `branches` (`id`, `branch_code`, `street`, `city`, `state`, `zip_code`, `country`, `contact`, `date_created`) VALUES
(3,	'KyIab3mYBgAX71t',	'SAmple',	'Cebu',	'Cebu',	'6000',	'Philippines',	'+1234567489',	'2020-11-26 16:45:05'),
(4,	'dIbUK5mEh96f0Zc',	'Sample',	'Sample',	'Sample',	'123456',	'Philippines',	'123456',	'2020-11-27 13:31:49');

DROP TABLE IF EXISTS `parcels`;
CREATE TABLE `parcels` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(100) NOT NULL,
  `sender_name` text NOT NULL,
  `sender_address` text NOT NULL,
  `sender_contact` text NOT NULL,
  `recipient_name` text NOT NULL,
  `recipient_address` text NOT NULL,
  `recipient_contact` text NOT NULL,
  `type` int(1) NOT NULL COMMENT '1 = Deliver, 2=Pickup',
  `from_branch_id` varchar(30) NOT NULL,
  `to_branch_id` varchar(30) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `height` varchar(100) NOT NULL,
  `width` varchar(100) NOT NULL,
  `length` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `parcels` (`id`, `reference_number`, `sender_name`, `sender_address`, `sender_contact`, `recipient_name`, `recipient_address`, `recipient_contact`, `type`, `from_branch_id`, `to_branch_id`, `weight`, `height`, `width`, `length`, `price`, `status`, `date_created`) VALUES
(1,	'201406231415',	'John Smith',	'Sample',	'+123456',	'Claire Blake',	'Sample',	'Sample',	1,	'1',	'0',	'30kg',	'12in',	'12in',	'15in',	2500,	7,	'2020-11-26 16:15:46'),
(2,	'117967400213',	'John Smith',	'Sample',	'+123456',	'Claire Blake',	'Sample',	'Sample',	2,	'1',	'3',	'30kg',	'12in',	'12in',	'15in',	2500,	1,	'2020-11-26 16:46:03'),
(3,	'983186540795',	'John Smith',	'Sample',	'+123456',	'Claire Blake',	'Sample',	'Sample',	2,	'1',	'3',	'20Kg',	'10in',	'10in',	'10in',	1500,	2,	'2020-11-26 16:46:03'),
(4,	'514912669061',	'Claire Blake',	'Sample',	'+123456',	'John Smith',	'Sample Address',	'+12345',	2,	'4',	'1',	'23kg',	'12in',	'12in',	'15in',	1900,	0,	'2020-11-27 13:52:14'),
(5,	'897856905844',	'Claire Blake',	'Sample',	'+123456',	'John Smith',	'Sample Address',	'+12345',	2,	'4',	'1',	'30kg',	'10in',	'10in',	'10in',	1450,	0,	'2020-11-27 13:52:14'),
(6,	'505604168988',	'John Smith',	'Sample',	'+123456',	'Sample',	'Sample',	'+12345',	1,	'1',	'0',	'23kg',	'12in',	'12in',	'15in',	2500,	1,	'2020-11-27 14:06:42'),
(7,	'530797125145',	'Manay Shankar',	'Gurgaaon',	'9911002233',	'Amit Shah',	'Delhi',	'9900112233',	2,	'3',	'1',	'23',	'1',	'1',	'3',	200,	0,	'2022-10-30 17:44:49'),
(8,	'228309007866',	'Manay Shankar',	'Gurgaaon',	'9911002233',	'Amit Shah',	'Delhi',	'9900112233',	2,	'3',	'1',	'50',	'3',	'7',	'6',	300,	0,	'2022-10-30 17:44:49');

DROP TABLE IF EXISTS `parcel_tracks`;
CREATE TABLE `parcel_tracks` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `parcel_id` int(30) NOT NULL,
  `status` int(2) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `parcel_tracks` (`id`, `parcel_id`, `status`, `date_created`) VALUES
(1,	2,	1,	'2020-11-27 09:53:27'),
(2,	3,	1,	'2020-11-27 09:55:17'),
(3,	1,	1,	'2020-11-27 10:28:01'),
(4,	1,	2,	'2020-11-27 10:28:10'),
(5,	1,	3,	'2020-11-27 10:28:16'),
(6,	1,	4,	'2020-11-27 11:05:03'),
(7,	1,	5,	'2020-11-27 11:05:17'),
(8,	1,	7,	'2020-11-27 11:05:26'),
(9,	3,	2,	'2020-11-27 11:05:41'),
(10,	6,	1,	'2020-11-27 14:06:57');

DROP TABLE IF EXISTS `restricted_items`;
CREATE TABLE `restricted_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_code` varchar(200) NOT NULL,
  `item_name` varchar(60) NOT NULL,
  `reason` varchar(200) NOT NULL,
  `allowed_flag` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_code` (`item_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `restricted_items` (`id`, `item_code`, `item_name`, `reason`, `allowed_flag`, `created_at`, `updated_at`) VALUES
(2,	't15l2hJDdb',	'Petrol',	'Flammable987',	'0',	'2022-11-01 18:31:14',	'2022-11-01 18:15:50');

DROP TABLE IF EXISTS `system_settings`;
CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `cover_img` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `address`, `cover_img`) VALUES
(1,	'Courier Management System',	'info@sample.comm',	'+6948 8542 623',	'2102  Caldwell Road, Rochester, New York, 14608',	'');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1 = admin, 2 = staff',
  `branch_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `type`, `branch_id`, `date_created`) VALUES
(1,	'Administrator',	'',	'admin@admin.com',	'e10adc3949ba59abbe56e057f20f883e',	1,	0,	'2020-11-26 10:57:04'),
(2,	'John',	'Smith',	'jsmith@sample.com',	'1254737c076cf867dc53d60a0364f38e',	2,	1,	'2020-11-26 11:52:04'),
(3,	'George',	'Wilson',	'gwilson@sample.com',	'd40242fb23c45206fadee4e2418f274f',	2,	4,	'2020-11-27 13:32:12'),
(4,	'Branch Staff',	'101',	'staff1@gmail.com',	'e10adc3949ba59abbe56e057f20f883e',	2,	3,	'2022-10-30 17:39:41');

-- 2022-11-02 17:32:41
