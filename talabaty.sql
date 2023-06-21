-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2023 at 07:40 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `talabaty`
--

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('250800f087b9dd76939b2657040478bc7916736d', '2023-06-19 14:13:46.577232', 1),
('561469a7f1b9570daa4232eaa9ae28012588ca86', '2023-06-19 15:22:46.784636', 5),
('7aa09c017ecc4ac705e63dafa0ea5454f0dffa28', '2023-06-19 14:45:50.668106', 3),
('897ab3ddfe03c987bec8c0b4383a3dca6a607b70', '2023-06-19 15:00:02.117155', 4),
('edde35d700febc02e835c0e9e951226ab24f9486', '2023-06-19 14:27:48.148419', 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add Token', 6, 'add_token'),
(22, 'Can change Token', 6, 'change_token'),
(23, 'Can delete Token', 6, 'delete_token'),
(24, 'Can view Token', 6, 'view_token'),
(25, 'Can add token', 7, 'add_tokenproxy'),
(26, 'Can change token', 7, 'change_tokenproxy'),
(27, 'Can delete token', 7, 'delete_tokenproxy'),
(28, 'Can view token', 7, 'view_tokenproxy'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add user profile', 9, 'add_userprofile'),
(34, 'Can change user profile', 9, 'change_userprofile'),
(35, 'Can delete user profile', 9, 'delete_userprofile'),
(36, 'Can view user profile', 9, 'view_userprofile'),
(37, 'Can add category', 10, 'add_category'),
(38, 'Can change category', 10, 'change_category'),
(39, 'Can delete category', 10, 'delete_category'),
(40, 'Can view category', 10, 'view_category'),
(41, 'Can add menu', 11, 'add_menu'),
(42, 'Can change menu', 11, 'change_menu'),
(43, 'Can delete menu', 11, 'delete_menu'),
(44, 'Can view menu', 11, 'view_menu'),
(45, 'Can add order menu', 12, 'add_ordermenu'),
(46, 'Can change order menu', 12, 'change_ordermenu'),
(47, 'Can delete order menu', 12, 'delete_ordermenu'),
(48, 'Can view order menu', 12, 'view_ordermenu'),
(49, 'Can add order', 13, 'add_order'),
(50, 'Can change order', 13, 'change_order'),
(51, 'Can delete order', 13, 'delete_order'),
(52, 'Can view order', 13, 'view_order'),
(53, 'Can add site', 14, 'add_site'),
(54, 'Can change site', 14, 'change_site'),
(55, 'Can delete site', 14, 'delete_site'),
(56, 'Can view site', 14, 'view_site');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(6, 'authtoken', 'token'),
(7, 'authtoken', 'tokenproxy'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(14, 'sites', 'site'),
(10, 'talabaty', 'category'),
(11, 'talabaty', 'menu'),
(13, 'talabaty', 'order'),
(12, 'talabaty', 'ordermenu'),
(8, 'talabaty', 'user'),
(9, 'talabaty', 'userprofile');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-06-19 14:11:12.700141'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-06-19 14:11:12.738650'),
(3, 'auth', '0001_initial', '2023-06-19 14:11:12.851934'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-06-19 14:11:12.884477'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-06-19 14:11:12.888478'),
(6, 'auth', '0004_alter_user_username_opts', '2023-06-19 14:11:12.891978'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-06-19 14:11:12.896479'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-06-19 14:11:12.897981'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-06-19 14:11:12.901481'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-06-19 14:11:12.904481'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-06-19 14:11:12.908981'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-06-19 14:11:12.920984'),
(13, 'auth', '0011_update_proxy_permissions', '2023-06-19 14:11:12.924484'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-06-19 14:11:12.927484'),
(15, 'talabaty', '0001_initial', '2023-06-19 14:11:13.068525'),
(16, 'admin', '0001_initial', '2023-06-19 14:11:13.115036'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-06-19 14:11:13.121036'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-06-19 14:11:13.126538'),
(19, 'authtoken', '0001_initial', '2023-06-19 14:11:13.194815'),
(20, 'authtoken', '0002_auto_20160226_1747', '2023-06-19 14:11:13.209317'),
(21, 'authtoken', '0003_tokenproxy', '2023-06-19 14:11:13.211317'),
(22, 'sessions', '0001_initial', '2023-06-19 14:11:13.229320'),
(23, 'talabaty', '0002_userprofile_alter_user_role', '2023-06-19 14:11:13.239360'),
(24, 'talabaty', '0003_alter_userprofile_profile_image', '2023-06-19 14:11:13.251862'),
(25, 'talabaty', '0004_alter_userprofile_profile_image', '2023-06-19 14:11:13.262864'),
(26, 'talabaty', '0005_userprofile_banner_image', '2023-06-19 14:11:13.273866'),
(27, 'talabaty', '0006_user_phone', '2023-06-19 14:11:13.287369'),
(28, 'talabaty', '0007_category', '2023-06-19 14:11:13.303371'),
(29, 'talabaty', '0008_menu', '2023-06-19 14:11:13.385175'),
(30, 'talabaty', '0009_order_ordermenu', '2023-06-19 16:58:57.782906'),
(31, 'sites', '0001_initial', '2023-06-20 15:05:18.813859'),
(32, 'sites', '0002_alter_domain_unique', '2023-06-20 15:05:18.824360');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE `django_site` (
  `id` int(11) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `talabaty_category`
--

CREATE TABLE `talabaty_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `talabaty_category`
--

INSERT INTO `talabaty_category` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Beef', 'beef', '1973-04-23 15:06:17.000000', '1982-04-28 17:44:00.000000'),
(2, 'Chicken', 'chicken', '2021-11-08 16:37:18.000000', '1983-12-07 17:17:09.000000'),
(3, 'Pizza', 'pizza', '2014-06-13 04:33:42.000000', '1972-04-10 21:43:24.000000'),
(4, 'Beverage', 'beverage', '1987-12-16 12:47:47.000000', '2013-03-12 22:31:28.000000'),
(5, 'Rice', 'rice', '1976-10-15 14:06:00.000000', '2018-01-23 00:48:17.000000'),
(6, 'Salad', 'salad', '2004-01-11 22:44:50.000000', '2019-04-10 07:31:49.000000'),
(7, 'Burger', 'burger', '1990-03-15 18:43:51.000000', '2011-07-24 00:23:23.000000'),
(8, 'Shawarma', 'shawarma', '2007-02-17 11:41:35.000000', '2007-03-12 05:35:54.000000'),
(9, 'Vegetables', 'vegetables', '2021-12-26 13:11:55.000000', '2010-08-30 00:04:49.000000'),
(10, 'Burrito', 'burrito', '1975-05-26 17:36:38.000000', '2006-12-22 01:24:12.000000'),
(11, 'Kebab', 'kebab', '1999-04-25 06:00:38.000000', '1996-10-25 22:09:41.000000'),
(12, 'Potato', 'potato', '1980-04-28 20:17:26.000000', '1993-09-18 09:54:54.000000');

-- --------------------------------------------------------

--
-- Table structure for table `talabaty_menu`
--

CREATE TABLE `talabaty_menu` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `price` varchar(255) NOT NULL,
  `discount_price` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `profile_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`profile_images`)),
  `status` tinyint(1) NOT NULL,
  `is_favorite` tinyint(1) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `talabaty_menu`
--

INSERT INTO `talabaty_menu` (`id`, `name`, `description`, `price`, `discount_price`, `slug`, `uid`, `profile_images`, `status`, `is_favorite`, `is_featured`, `created_at`, `updated_at`, `category_id`, `user_id`) VALUES
(1, 'Beef Steak', 'Beef Steak', '8000', '0', 'beef-steak', '1687184312782', '[\"/media/Beef steak_BU82iio.jpg\"]', 1, 0, 0, '2023-06-19 14:18:32.792712', '2023-06-19 14:19:55.179535', 1, 1),
(2, 'Boneless Chicken', 'Boneless Chicken', '6000', '0', 'boneless-chicken', '1687184376590', '[\"/media/Boneless chicken _IhZ2eDz.jpg\"]', 1, 0, 0, '2023-06-19 14:19:36.601580', '2023-06-19 14:19:36.601580', 2, 1),
(3, 'Chicken Pizza', 'Chicken Pizza', '6000', '0', 'chicken-pizza', '1687184432177', '[\"/media/Chicken pizza_V0HIJNR.jpg\"]', 1, 0, 0, '2023-06-19 14:20:32.189032', '2023-06-19 14:20:32.189032', 3, 1),
(4, 'Chicken Steak', 'Chicken Steak', '6000', '0', 'chicken-steak', '1687184461297', '[\"/media/Chicken steak_ujtnWLI.jpg\"]', 1, 0, 0, '2023-06-19 14:21:01.308253', '2023-06-19 14:21:01.308253', 2, 1),
(5, 'Cola Cans (200ml.)', 'Cola Cans (200ml.)', '1000', '0', 'cola-cans-200ml-', '1687184533134', '[\"/media/Cola cans_06q8Ta5.jpg\"]', 1, 0, 0, '2023-06-19 14:22:13.143687', '2023-06-19 14:22:13.143687', 4, 1),
(6, 'Cola Cans (300ml.)', 'Cola Cans (300ml.)', '1500', '0', 'cola-cans-300ml-', '1687184559169', '[\"/media/Cola cans (2)_fd3M6gq.jpg\"]', 1, 0, 0, '2023-06-19 14:22:39.179324', '2023-06-19 14:22:39.179324', 4, 1),
(7, 'Quzi Al-Sham', 'Quzi Al-Sham', '7000', '0', 'quzi-al-sham', '1687184596445', '[\"/media/Quzi Al-Sham_PpL3rU4.jpg\"]', 1, 0, 0, '2023-06-19 14:23:16.455577', '2023-06-19 14:23:16.455577', 5, 1),
(8, 'Salad 1', 'Salad 1', '3000', '0', 'salad-1', '1687184646295', '[\"/media/Salad1.jpg\"]', 1, 0, 0, '2023-06-19 14:24:06.304401', '2023-06-19 14:24:06.304401', 6, 1),
(9, 'Salad 2', 'Salad 2', '3000', '0', 'salad-2', '1687184661978', '[\"/media/Salad2_xwp3Zgs.jpg\"]', 1, 0, 0, '2023-06-19 14:24:21.987959', '2023-06-19 14:24:21.987959', 6, 1),
(10, 'Salad 3', 'Salad 3', '3000', '0', 'salad-3', '1687184679505', '[\"/media/Salad3.jpg\"]', 1, 0, 0, '2023-06-19 14:24:39.515687', '2023-06-19 14:24:39.515687', 6, 1),
(11, 'Traditional Quzi', 'Traditional Quzi', '8000', '0', 'traditional-quzi', '1687184708304', '[\"/media/Traditional Quzi_xMoZNFJ.jpg\"]', 1, 0, 0, '2023-06-19 14:25:08.313952', '2023-06-19 14:25:08.313952', 5, 1),
(12, 'Zinger', 'Zinger', '6000', '0', 'zinger', '1687184742688', '[\"/media/Zinger_0piQEs8.jpg\"]', 1, 0, 0, '2023-06-19 14:25:42.698234', '2023-06-19 14:25:42.698234', 2, 1),
(13, 'Beef Burger with Botatto', 'Beef Burger with Botatto', '6000', '0', 'beef-burger-with-botatto', '1687185475981', '[\"/media/Beef burger with botatto.jpg\"]', 1, 0, 0, '2023-06-19 14:37:56.020740', '2023-06-19 14:37:56.020740', 7, 2),
(14, 'Bottle of Cola', 'Bottle of Cola', '1000', '0', 'bottle-of-cola', '1687185614961', '[\"/media/Bottle of cola.jpg\"]', 1, 0, 0, '2023-06-19 14:40:14.973463', '2023-06-19 14:40:14.973463', 4, 2),
(15, 'Burger with Lettuce And Tomato', 'Burger with Lettuce And Tomato', '6000', '0', 'burger-with-lettuce-and-tomato', '1687185644376', '[\"/media/Burger With Lettuce And Tomato.jpg\"]', 1, 0, 0, '2023-06-19 14:40:44.414974', '2023-06-19 14:40:44.414974', 7, 2),
(16, 'Cans of Drinks', 'Cans of Drinks', '500', '0', 'cans-of-drinks', '1687185669228', '[\"/media/Cans of Drinks.jpg\"]', 1, 0, 0, '2023-06-19 14:41:09.239378', '2023-06-19 14:41:09.239879', 4, 2),
(17, 'Four Seasons Pizza', 'Four Seasons Pizza', '7000', '0', 'four-seasons-pizza', '1687185749050', '[\"/media/Four seasons Pizza.jpg\"]', 1, 0, 0, '2023-06-19 14:42:29.081329', '2023-06-19 14:42:29.081329', 3, 2),
(18, 'Grilled Chicken', 'Grilled Chicken', '8000', '0', 'grilled-chicken', '1687185776068', '[\"/media/Grilled chicken.jpg\"]', 1, 0, 0, '2023-06-19 14:42:56.078528', '2023-06-19 14:42:56.078528', 2, 2),
(19, 'Pizza with Egg', 'Pizza with Egg', '6000', '0', 'pizza-with-egg', '1687185800537', '[\"/media/Pizza with egg.jpg\"]', 1, 0, 0, '2023-06-19 14:43:20.552732', '2023-06-19 14:43:20.552732', 3, 2),
(20, 'Pizza with Mushrooms', 'Pizza with Mushrooms', '6000', '0', 'pizza-with-mushrooms', '1687185823360', '[\"/media/Pizza with Mushrooms.jpg\"]', 1, 0, 0, '2023-06-19 14:43:43.380283', '2023-06-19 14:43:43.380283', 3, 2),
(21, 'Pizza with Peppers', 'Pizza with Peppers', '6000', '0', 'pizza-with-peppers', '1687185847336', '[\"/media/Pizza with Peppers.jpg\"]', 1, 0, 0, '2023-06-19 14:44:07.369437', '2023-06-19 14:44:07.369437', 3, 2),
(22, 'Sausage Pizza', 'Sausage Pizza', '7000', '0', 'sausage-pizza', '1687185871926', '[\"/media/Sausage Pizza.jpg\"]', 1, 0, 0, '2023-06-19 14:44:31.960926', '2023-06-19 14:44:31.960926', 3, 2),
(23, 'Beef & Veggie Shawarma', 'Beef & Veggie Shawarma', '5000', '0', 'beef-veggie-shawarma', '1687186075408', '[\"/media/beef and veggie shawarma.jpg\"]', 1, 0, 0, '2023-06-19 14:47:55.418425', '2023-06-19 14:47:55.418425', 8, 3),
(24, 'Beef Burger', 'Beef Burger', '5000', '0', 'beef-burger', '1687186102094', '[\"/media/Beef burger.jpeg\"]', 1, 0, 0, '2023-06-19 14:48:22.104979', '2023-06-19 14:48:22.104979', 7, 3),
(25, 'Bottle of Cola (1 ltr.)', 'Bottle of Cola (1 ltr.)', '2000', '0', 'bottle-of-cola-1-ltr-', '1687186189115', '[\"/media/Bottle of cola_0qu3KzW.jpg\"]', 1, 0, 0, '2023-06-19 14:49:49.126745', '2023-06-19 14:49:49.126745', 4, 3),
(26, 'Bread Chicken Beef Shawarma', 'Bread Chicken Beef Shawarma', '4000', '0', 'bread-chicken-beef-shawarma', '1687186226349', '[\"/media/bread chicken beef shawarma.jpg\"]', 1, 0, 0, '2023-06-19 14:50:26.360861', '2023-06-19 14:50:26.360861', 8, 3),
(27, 'Burger with Cheese & Sauce', 'Burger with Cheese & Sauce', '4000', '0', 'burger-with-cheese-sauce', '1687186315710', '[\"/media/Burger with cheese and sauce.jpg\"]', 1, 0, 0, '2023-06-19 14:51:55.742997', '2023-06-19 14:51:55.742997', 7, 3),
(28, 'Burrito with Grilled Chicken & Vegetables', 'Burrito with Grilled Chicken & Vegetables', '4000', '0', 'burrito-with-grilled-chicken-vegetables', '1687186351943', '[\"/media/Burrito with grilled chicken and vegetables.jpg\"]', 1, 0, 0, '2023-06-19 14:52:31.954990', '2023-06-19 14:52:31.954990', 10, 3),
(29, 'Chicken Burger', 'Chicken Burger', '4000', '0', 'chicken-burger', '1687186395945', '[\"/media/Chicken burger.jpeg\"]', 1, 0, 0, '2023-06-19 14:53:15.955567', '2023-06-19 14:53:15.955567', 7, 3),
(30, 'Doner Kebab', 'Doner Kebab on a plate with French Fries & Salad', '6000', '0', 'doner-kebab', '1687186505626', '[\"/media/Doner kebab on a plate with french fries and salad.jpg\"]', 1, 0, 0, '2023-06-19 14:55:05.636444', '2023-06-19 14:55:05.636444', 11, 3),
(31, 'Bottle of Cola (250 ml.)', 'Bottle of Cola (250 ml.)', '1000', '0', 'bottle-of-cola-250-ml-', '1687186553427', '[\"/media/Drinks.jpg\"]', 1, 0, 0, '2023-06-19 14:55:53.437390', '2023-06-19 14:55:53.437390', 4, 3),
(32, 'Traditional Turkish Kebab', 'Traditional Turkish Kebab', '7000', '0', 'traditional-turkish-kebab', '1687186591620', '[\"/media/kebab. Traditional turkish.jpg\"]', 1, 0, 0, '2023-06-19 14:56:31.630885', '2023-06-19 14:56:31.630885', 11, 3),
(33, 'Filled Shawarma with Meat & Sauce', 'Filled Shawarma with Meat & Sauce', '5000', '0', 'filled-shawarma-with-meat-sauce', '1687186649568', '[\"/media/Shawarma Filled shawarma with meat and sauce.jpg\"]', 1, 0, 0, '2023-06-19 14:57:29.578261', '2023-06-19 14:57:29.578261', 8, 3),
(34, 'Shawarma with Fries', 'Shawarma with Fries', '5000', '0', 'shawarma-with-fries', '1687186677625', '[\"/media/Shawarma With Fries.jpg\"]', 1, 0, 0, '2023-06-19 14:57:57.635227', '2023-06-19 14:57:57.635227', 8, 3),
(35, 'Special Shawarma', 'Special Shawarma', '6000', '0', 'special-shawarma', '1687186702306', '[\"/media/Special Shawarma.jpg\"]', 1, 0, 0, '2023-06-19 14:58:22.315760', '2023-06-19 14:58:22.315760', 8, 3),
(36, 'Traditional Arab Shawarma', 'Traditional Arab Shawarma', '4000', '0', 'traditional-arab-shawarma', '1687186731213', '[\"/media/Traditional Arab shawarma.jpg\"]', 1, 0, 0, '2023-06-19 14:58:51.224191', '2023-06-19 14:58:51.224191', 8, 3),
(37, 'Bottle of Cola (300 ml.)', 'Bottle of Cola (300 ml.)', '1000', '0', 'bottle-of-cola-300-ml-', '1687186947812', '[\"/media/Bottle of Cola_NMaGYkz.jpg\"]', 1, 0, 0, '2023-06-19 15:02:27.829472', '2023-06-19 15:02:27.829472', 4, 4),
(38, 'Burger & Fries with Egg', 'Burger & Fries with Egg', '5000', '0', 'burger-fries-with-egg', '1687186978422', '[\"/media/Burger and Fries with egg.jpg\"]', 1, 0, 0, '2023-06-19 15:02:58.440704', '2023-06-19 15:02:58.440704', 7, 4),
(39, 'Burger with Pipers', 'Burger with Pipers', '6000', '0', 'burger-with-pipers', '1687187008746', '[\"/media/Burger with pipers.jpg\"]', 1, 0, 0, '2023-06-19 15:03:28.764639', '2023-06-19 15:03:28.764639', 7, 4),
(40, 'Burger & Fries‏', 'Burger & Fries‏', '5000', '0', 'burger-fries-', '1687187044484', '[\"/media/Burgers and Fries.jpg\"]', 1, 0, 0, '2023-06-19 15:04:04.497388', '2023-06-19 15:04:04.497388', 7, 4),
(41, 'Can of Cola (250 ml.)', 'Can of Cola (250 ml.)', '500', '0', 'can-of-cola-250-ml-', '1687187078351', '[\"/media/Cola.jpg\"]', 1, 0, 0, '2023-06-19 15:04:38.369570', '2023-06-19 15:04:38.369570', 4, 4),
(42, 'Hamburger & Potato Fries', 'Hamburger & Potato Fries', '5000', '0', 'hamburger-potato-fries', '1687187108608', '[\"/media/Hamburgers and Potato Fries.jpg\"]', 1, 0, 0, '2023-06-19 15:05:08.628179', '2023-06-19 15:05:08.628179', 7, 4),
(43, 'Kentucky', 'Kentucky', '5000', '0', 'kentucky', '1687187136133', '[\"/media/Kentucky.jpg\"]', 1, 0, 0, '2023-06-19 15:05:36.149195', '2023-06-19 15:05:36.149195', 2, 4),
(44, 'Rice with Chicken 1', 'Rice with Chicken 1', '7000', '0', 'rice-with-chicken-1', '1687187167047', '[\"/media/Rice with chicken1.jpg\"]', 1, 0, 0, '2023-06-19 15:06:07.078226', '2023-06-19 15:06:07.078226', 5, 4),
(45, 'Rice with Chicken 2', 'Rice with Chicken 2', '7000', '0', 'rice-with-chicken-2', '1687187184877', '[\"/media/Rice with chicken2.jpg\"]', 1, 0, 0, '2023-06-19 15:06:24.898225', '2023-06-19 15:06:24.898225', 5, 4),
(46, 'Special Biryani', 'Special Biryani', '8000', '0', 'special-biryani', '1687187218963', '[\"/media/Special Biriany.jpeg\"]', 1, 0, 0, '2023-06-19 15:06:58.973476', '2023-06-19 15:06:58.973476', 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `talabaty_order`
--

CREATE TABLE `talabaty_order` (
  `id` bigint(20) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `net_amount` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `remarks` longtext DEFAULT NULL,
  `estimated_time` varchar(255) DEFAULT NULL,
  `delivery_charge` varchar(255) DEFAULT NULL,
  `completed_at` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `rider_id` bigint(20) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `talabaty_order`
--

INSERT INTO `talabaty_order` (`id`, `uid`, `amount`, `net_amount`, `status`, `location`, `phone`, `remarks`, `estimated_time`, `delivery_charge`, `completed_at`, `created_at`, `updated_at`, `customer_id`, `rider_id`, `shop_id`) VALUES
(1, 'test', '50.99', '55.99', 'delivered', '123 Main St', '1234567890', 'No onions, please', '5 minutes', '10.00', NULL, '2023-06-19 17:03:11.809923', '2023-06-20 19:10:07.091706', 5, NULL, 1),
(2, 'test1', '50.99', '55.99', 'prepared', '123 Main St', '1234567890', 'No onions, please', '1 minutes', '5.00', NULL, '2023-06-20 15:42:46.432610', '2023-06-21 14:12:10.027939', 5, NULL, 1),
(3, '1687356194961', '28500', '28650', 'delivered', 'Yekaterinburg', '+79655136436', 'Extra sauce if available.', '10 minutes', '150', NULL, '2023-06-21 14:03:14.970678', '2023-06-21 14:11:46.354965', 5, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `talabaty_ordermenu`
--

CREATE TABLE `talabaty_ordermenu` (
  `id` bigint(20) NOT NULL,
  `unit_price` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` varchar(255) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `talabaty_ordermenu`
--

INSERT INTO `talabaty_ordermenu` (`id`, `unit_price`, `quantity`, `total_price`, `menu_id`, `order_id`) VALUES
(1, '10.99', 2, '21.98', 1, 1),
(2, '7.99', 1, '7.99', 2, 1),
(3, '10.99', 2, '21.98', 1, 2),
(4, '7.99', 1, '7.99', 2, 2),
(5, '1500', 3, '4500', 6, 3),
(6, '6000', 4, '24000', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `talabaty_user`
--

CREATE TABLE `talabaty_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(10) NOT NULL,
  `phone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `talabaty_user`
--

INSERT INTO `talabaty_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `role`, `phone`) VALUES
(1, 'pbkdf2_sha256$600000$IoGL9KE5swkrIfiUWSXeLp$r4yj8M76B93r5+Gg4b3vKtwJh6ENC3j8InZpcOt6Mw0=', NULL, 0, 'turquoise.restaurant', 'Turquoise Restaurant', '', 'turquoise.restaurant@talabaty.com', 0, 1, '2023-06-19 14:13:28.666834', 'shop', '+9647501845544'),
(2, 'pbkdf2_sha256$600000$4NTUU5IY9v2kggMigghnV3$G19aAyk16QvONc0I7qMCTlWe3+ngyH0/T4dLkBCTOQw=', NULL, 0, 'al.Mahmood.restaurant', 'Al-Mahmood Restaurant', '', 'al.Mahmood.restaurant@talabaty.com', 0, 1, '2023-06-19 14:27:37.569284', 'shop', '+9647702232221'),
(3, 'pbkdf2_sha256$600000$bzfYYIu6N4NvkEx4zyrGEs$OYh1yFMTWCWITPxQ2V8/3C4YBqjzP0CJePJSerO9C+4=', NULL, 0, 'shawarma.land', 'Shawarma Land', '', 'shawarma.land@talabaty.com', 0, 1, '2023-06-19 14:45:44.532070', 'shop', '+9647722744664'),
(4, 'pbkdf2_sha256$600000$QgKUSZiC4bNNBCnpodaXKO$cv9NU9nb8FNLpa7tLnnujce4ajCagxjJTp7HXm3NBGo=', NULL, 0, 'qashkawan.restaurant', 'Qashkawan Restaurant', '', 'qashkawan.restaurant@talabaty.com', 0, 1, '2023-06-19 14:59:50.084047', 'shop', '+9647746964961'),
(5, 'pbkdf2_sha256$600000$rzB6CR3zrtXgHswS3lwTW6$WsHI6FPdrip4fzsPr+m+HjjeoZ9HbW6kaSSK1E/NIsw=', NULL, 0, 's.iftakhairul', 'S M Iftakhairul', '', 's.m.iftakhairul@gmail.com', 0, 1, '2023-06-19 15:21:23.312682', 'customer', '+79655136436');

-- --------------------------------------------------------

--
-- Table structure for table `talabaty_userprofile`
--

CREATE TABLE `talabaty_userprofile` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `description` longtext NOT NULL,
  `banner_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `talabaty_userprofile`
--

INSERT INTO `talabaty_userprofile` (`id`, `user_id`, `profile_image`, `location`, `description`, `banner_image`) VALUES
(1, 1, 'profile_images/images.png', 'near the gas station.-First Branch: Mosul - tourist forests, Second Branch: The cultural group', 'Turquoise Resturant: address Address: Mosul / the first branch / tourist forests, the second branch: the cultural group / near the gas station, Tel:\r\n+964 750 184 5544', ''),
(2, 2, 'profile_images/almahmood.png', 'Iraq/Mosul/Mosul Forest / in front of the Sudair Tourist Complex.', 'Al-Mahmood Resturant: address Iraq/Mosul/Mosul Forest / in front of the Sudair Tourist Complex, Tel: +964 770 223 2221', ''),
(3, 3, 'profile_images/bf9a06227c5334292b0b8e9aa426aef8.jpg', 'Al-Mothanaa district-Iraq-Mosul', 'Al-Mothanaa district, Tel: +9647722744664\r\n-Shawarma Land: address Iraq-Mosul', ''),
(4, 4, 'profile_images/348s.jpg', 'Al-Zobaat district-Iraq-Mosul', 'Al-Zobaat district, Tel: +9647746964961-Qashkawan Resturant: address Iraq-Mosul', ''),
(5, 5, 'profile_images/np-crpp_3fdARkr.jpg', 'Yekaterinburg', 'Professional Procrastinator.', 'banner_images/np-crpp.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `talabaty_user_groups`
--

CREATE TABLE `talabaty_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `talabaty_user_user_permissions`
--

CREATE TABLE `talabaty_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_talabaty_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `django_site`
--
ALTER TABLE `django_site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`);

--
-- Indexes for table `talabaty_category`
--
ALTER TABLE `talabaty_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `talabaty_menu`
--
ALTER TABLE `talabaty_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`),
  ADD KEY `talabaty_menu_category_id_961af733_fk_talabaty_category_id` (`category_id`),
  ADD KEY `talabaty_menu_user_id_2ad60c04_fk_talabaty_user_id` (`user_id`);

--
-- Indexes for table `talabaty_order`
--
ALTER TABLE `talabaty_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`),
  ADD KEY `talabaty_order_customer_id_8524fc25_fk_talabaty_user_id` (`customer_id`),
  ADD KEY `talabaty_order_rider_id_8b358c9d_fk_talabaty_user_id` (`rider_id`),
  ADD KEY `talabaty_order_shop_id_a1d5ae9a_fk_talabaty_user_id` (`shop_id`);

--
-- Indexes for table `talabaty_ordermenu`
--
ALTER TABLE `talabaty_ordermenu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `talabaty_ordermenu_menu_id_4c66725b_fk_talabaty_menu_id` (`menu_id`),
  ADD KEY `talabaty_ordermenu_order_id_16fa0be5_fk_talabaty_order_id` (`order_id`);

--
-- Indexes for table `talabaty_user`
--
ALTER TABLE `talabaty_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `talabaty_userprofile`
--
ALTER TABLE `talabaty_userprofile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `talabaty_user_groups`
--
ALTER TABLE `talabaty_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `talabaty_user_groups_user_id_group_id_8ab95929_uniq` (`user_id`,`group_id`),
  ADD KEY `talabaty_user_groups_group_id_e64467cc_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `talabaty_user_user_permissions`
--
ALTER TABLE `talabaty_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `talabaty_user_user_permi_user_id_permission_id_dba8743f_uniq` (`user_id`,`permission_id`),
  ADD KEY `talabaty_user_user_p_permission_id_a9448b5d_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `django_site`
--
ALTER TABLE `django_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `talabaty_category`
--
ALTER TABLE `talabaty_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `talabaty_menu`
--
ALTER TABLE `talabaty_menu`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `talabaty_order`
--
ALTER TABLE `talabaty_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `talabaty_ordermenu`
--
ALTER TABLE `talabaty_ordermenu`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `talabaty_user`
--
ALTER TABLE `talabaty_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `talabaty_userprofile`
--
ALTER TABLE `talabaty_userprofile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `talabaty_user_groups`
--
ALTER TABLE `talabaty_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `talabaty_user_user_permissions`
--
ALTER TABLE `talabaty_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_talabaty_user_id` FOREIGN KEY (`user_id`) REFERENCES `talabaty_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_talabaty_user_id` FOREIGN KEY (`user_id`) REFERENCES `talabaty_user` (`id`);

--
-- Constraints for table `talabaty_menu`
--
ALTER TABLE `talabaty_menu`
  ADD CONSTRAINT `talabaty_menu_category_id_961af733_fk_talabaty_category_id` FOREIGN KEY (`category_id`) REFERENCES `talabaty_category` (`id`),
  ADD CONSTRAINT `talabaty_menu_user_id_2ad60c04_fk_talabaty_user_id` FOREIGN KEY (`user_id`) REFERENCES `talabaty_user` (`id`);

--
-- Constraints for table `talabaty_order`
--
ALTER TABLE `talabaty_order`
  ADD CONSTRAINT `talabaty_order_customer_id_8524fc25_fk_talabaty_user_id` FOREIGN KEY (`customer_id`) REFERENCES `talabaty_user` (`id`),
  ADD CONSTRAINT `talabaty_order_rider_id_8b358c9d_fk_talabaty_user_id` FOREIGN KEY (`rider_id`) REFERENCES `talabaty_user` (`id`),
  ADD CONSTRAINT `talabaty_order_shop_id_a1d5ae9a_fk_talabaty_user_id` FOREIGN KEY (`shop_id`) REFERENCES `talabaty_user` (`id`);

--
-- Constraints for table `talabaty_ordermenu`
--
ALTER TABLE `talabaty_ordermenu`
  ADD CONSTRAINT `talabaty_ordermenu_menu_id_4c66725b_fk_talabaty_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `talabaty_menu` (`id`),
  ADD CONSTRAINT `talabaty_ordermenu_order_id_16fa0be5_fk_talabaty_order_id` FOREIGN KEY (`order_id`) REFERENCES `talabaty_order` (`id`);

--
-- Constraints for table `talabaty_user_groups`
--
ALTER TABLE `talabaty_user_groups`
  ADD CONSTRAINT `talabaty_user_groups_group_id_e64467cc_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `talabaty_user_groups_user_id_541f3930_fk_talabaty_user_id` FOREIGN KEY (`user_id`) REFERENCES `talabaty_user` (`id`);

--
-- Constraints for table `talabaty_user_user_permissions`
--
ALTER TABLE `talabaty_user_user_permissions`
  ADD CONSTRAINT `talabaty_user_user_p_permission_id_a9448b5d_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `talabaty_user_user_p_user_id_e7ae0d4a_fk_talabaty_` FOREIGN KEY (`user_id`) REFERENCES `talabaty_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
