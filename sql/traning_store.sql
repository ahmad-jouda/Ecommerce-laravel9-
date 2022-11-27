-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2022 at 03:39 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `traning_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `super_admin` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `password`, `phone_number`, `super_admin`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Prof. Amani Nikolaus DVM', 'lmoore@example.org', 'ywunsch', '$2y$10$MQkIIEhWzdRV.dV7XYQuzug.Gy9oNWHQn4VMDvaeWO9Uic68Bwnj6', '646-474-9116', 1, 'active', '2022-11-20 14:25:19', '2022-11-20 14:25:19'),
(2, 'Winifred Kirlin DVM', 'shanahan.mitchell@example.net', 'georgianna29', '$2y$10$Ms0/a0pdAYwxHdFFfgN86.d67ISojlFoZ4EpqyrJb39YtWqbuFOFy', '585-222-4908', 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20'),
(3, 'Mozelle Ratke', 'zpollich@example.com', 'wpacocha', '$2y$10$/InUMxfu8JTKdtQGBhk1KeaPcWuKahfgEGXpvMxoIGHgKAa6rKOo6', '(256) 481-6616', 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','archived') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `slug`, `description`, `image`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Baby, Electronics & Computers', 'baby-electronics-computers', 'Doloremque aut molestiae qui autem in repellendus vitae consequuntur id qui nisi.', 'https://via.placeholder.com/640x480.png/003311?text=impedit', 'active', NULL, '2022-11-20 14:25:20', '2022-11-24 01:17:14'),
(2, NULL, 'Electronics', 'electronics', 'Est quia deserunt repellat nemo doloribus voluptates facilis vel ut nemo labore suscipit deserunt ipsam.', 'https://via.placeholder.com/640x480.png/00ddaa?text=accusamus', 'active', NULL, '2022-11-20 14:25:20', '2022-11-20 14:25:20'),
(3, NULL, 'Automotive', 'automotive', 'Aut minima unde eum est omnis quas et provident architecto laudantium officia et voluptas amet dolorum praesentium excepturi at molestiae corporis.', 'https://via.placeholder.com/640x480.png/00bb77?text=error', 'active', NULL, '2022-11-20 14:25:20', '2022-11-20 14:25:20'),
(4, NULL, 'Home, Grocery & Tools', 'home-grocery-tools', 'Aspernatur fugit autem voluptatibus quae quidem non veniam ullam voluptas temporibus aliquam ut.', 'https://via.placeholder.com/640x480.png/006611?text=soluta', 'active', NULL, '2022-11-20 14:25:20', '2022-11-20 14:25:20'),
(5, NULL, 'Sports, Outdoors & Tools', 'sports-outdoors-tools', 'Ullam voluptas corporis provident et cupiditate eos natus nobis incidunt.', 'https://via.placeholder.com/640x480.png/000000?text=ut', 'active', NULL, '2022-11-20 14:25:20', '2022-11-20 14:25:20'),
(6, NULL, 'Garden & Outdoors', 'garden-outdoors', 'Pariatur in consectetur ipsa aspernatur aut et voluptatem fugiat cumque iusto eius possimus vero.', 'https://via.placeholder.com/640x480.png/0011aa?text=illo', 'active', NULL, '2022-11-20 14:25:20', '2022-11-20 14:25:20'),
(7, NULL, 'Health, Games & Baby', 'health-games-baby', 'Omnis porro ut voluptate quis et quaerat ut laboriosam dolorem sit et enim nobis corporis eos autem.', 'https://via.placeholder.com/640x480.png/00ddcc?text=animi', 'active', NULL, '2022-11-20 14:25:20', '2022-11-20 14:25:20'),
(8, NULL, 'Electronics & Automotive', 'electronics-automotive', 'Dolores voluptatem qui officiis mollitia eaque et ut necessitatibus aperiam quia repudiandae.', 'https://via.placeholder.com/640x480.png/008844?text=voluptas', 'active', NULL, '2022-11-20 14:25:20', '2022-11-20 14:25:20'),
(9, NULL, 'Toys', 'toys', 'Perferendis dolor minima molestiae magnam quaerat eaque eius vero animi harum consequatur.', 'https://via.placeholder.com/640x480.png/00dd33?text=voluptate', 'active', NULL, '2022-11-20 14:25:20', '2022-11-20 14:25:20'),
(10, NULL, 'Sports', 'sports', 'Non sint natus omnis aliquam itaque omnis dolor vero voluptas.', 'https://via.placeholder.com/640x480.png/0033dd?text=saepe', 'active', NULL, '2022-11-20 14:25:20', '2022-11-20 14:25:20');

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `current_location` point DEFAULT NULL,
  `status` enum('pending','in-progress','delivered') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`id`, `order_id`, `current_location`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 0x0000000001010000003b1856968d3c41407b1e92109b8a3f40, 'pending', '2022-11-27 01:11:53', '2022-11-27 02:13:55');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '847bac2e-a286-4ba4-a4b3-4082ead42081', 'database', 'import', '{\"uuid\":\"847bac2e-a286-4ba4-a4b3-4082ead42081\",\"displayName\":\"App\\\\Jobs\\\\ImportProducts\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ImportProducts\",\"command\":\"O:23:\\\"App\\\\Jobs\\\\ImportProducts\\\":3:{s:8:\\\"\\u0000*\\u0000count\\\";s:6:\\\"100000\\\";s:5:\\\"queue\\\";s:6:\\\"import\\\";s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-11-24 04:21:32.331665\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Asia\\/Gaza\\\";}}\"}}', 'Illuminate\\Queue\\MaxAttemptsExceededException: App\\Jobs\\ImportProducts has been attempted too many times or run too long. The job may have previously timed out. in D:\\Developer\\Project BackEnd\\store_traning\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php:755\nStack trace:\n#0 D:\\Developer\\Project BackEnd\\store_traning\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(505): Illuminate\\Queue\\Worker->maxAttemptsExceededException(Object(Illuminate\\Queue\\Jobs\\DatabaseJob))\n#1 D:\\Developer\\Project BackEnd\\store_traning\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(415): Illuminate\\Queue\\Worker->markJobAsFailedIfAlreadyExceedsMaxAttempts(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), 1)\n#2 D:\\Developer\\Project BackEnd\\store_traning\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(375): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#3 D:\\Developer\\Project BackEnd\\store_traning\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(173): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#4 D:\\Developer\\Project BackEnd\\store_traning\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(150): Illuminate\\Queue\\Worker->daemon(\'database\', \'import\', Object(Illuminate\\Queue\\WorkerOptions))\n#5 D:\\Developer\\Project BackEnd\\store_traning\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(134): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'import\')\n#6 D:\\Developer\\Project BackEnd\\store_traning\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#7 D:\\Developer\\Project BackEnd\\store_traning\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#8 D:\\Developer\\Project BackEnd\\store_traning\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#9 D:\\Developer\\Project BackEnd\\store_traning\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#10 D:\\Developer\\Project BackEnd\\store_traning\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(651): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#11 D:\\Developer\\Project BackEnd\\store_traning\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(178): Illuminate\\Container\\Container->call(Array)\n#12 D:\\Developer\\Project BackEnd\\store_traning\\vendor\\symfony\\console\\Command\\Command.php(308): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#13 D:\\Developer\\Project BackEnd\\store_traning\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(148): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#14 D:\\Developer\\Project BackEnd\\store_traning\\vendor\\symfony\\console\\Application.php(1014): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#15 D:\\Developer\\Project BackEnd\\store_traning\\vendor\\symfony\\console\\Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#16 D:\\Developer\\Project BackEnd\\store_traning\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 D:\\Developer\\Project BackEnd\\store_traning\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(102): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 D:\\Developer\\Project BackEnd\\store_traning\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(155): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#19 D:\\Developer\\Project BackEnd\\store_traning\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 {main}', '2022-11-24 02:23:28');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(3, 'default', '{\"uuid\":\"7a32a186-783e-4043-a1a8-a5fa40fd8b54\",\"displayName\":\"Illuminate\\\\Notifications\\\\Events\\\\BroadcastNotificationCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":13:{s:5:\\\"event\\\";O:60:\\\"Illuminate\\\\Notifications\\\\Events\\\\BroadcastNotificationCreated\\\":3:{s:10:\\\"notifiable\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:42:\\\"App\\\\Notifications\\\\OrderCreatedNotification\\\":2:{s:8:\\\"\\u0000*\\u0000order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:2:{i:0;s:8:\\\"products\\\";i:1;s:14:\\\"billingAddress\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"2227a0fb-24d2-468d-9f10-f26199a52e8c\\\";}s:4:\\\"data\\\";a:4:{s:4:\\\"body\\\";s:59:\\\"A new order (#20220001) created by ahmad joda from Bahamas.\\\";s:4:\\\"icon\\\";s:11:\\\"fas fa-file\\\";s:3:\\\"url\\\";s:31:\\\"http:\\/\\/localhost:8000\\/dashboard\\\";s:8:\\\"order_id\\\";i:1;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1669329345, 1669329345),
(4, 'default', '{\"uuid\":\"0d3d9e0a-7631-457e-b9a6-c592acd5c380\",\"displayName\":\"Illuminate\\\\Notifications\\\\Events\\\\BroadcastNotificationCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":13:{s:5:\\\"event\\\";O:60:\\\"Illuminate\\\\Notifications\\\\Events\\\\BroadcastNotificationCreated\\\":3:{s:10:\\\"notifiable\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:42:\\\"App\\\\Notifications\\\\OrderCreatedNotification\\\":2:{s:8:\\\"\\u0000*\\u0000order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:2:{i:0;s:8:\\\"products\\\";i:1;s:14:\\\"billingAddress\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"f6563c2c-4ab5-4cd9-8aa1-fcd46db7dd0f\\\";}s:4:\\\"data\\\";a:4:{s:4:\\\"body\\\";s:59:\\\"A new order (#20220002) created by ahmad joda from Bahamas.\\\";s:4:\\\"icon\\\";s:11:\\\"fas fa-file\\\";s:3:\\\"url\\\";s:31:\\\"http:\\/\\/localhost:8000\\/dashboard\\\";s:8:\\\"order_id\\\";i:3;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1669333842, 1669333842),
(5, 'default', '{\"uuid\":\"4ec01d3a-188e-4b5c-9743-416f8ee37147\",\"displayName\":\"Illuminate\\\\Notifications\\\\Events\\\\BroadcastNotificationCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":13:{s:5:\\\"event\\\";O:60:\\\"Illuminate\\\\Notifications\\\\Events\\\\BroadcastNotificationCreated\\\":3:{s:10:\\\"notifiable\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:42:\\\"App\\\\Notifications\\\\OrderCreatedNotification\\\":2:{s:8:\\\"\\u0000*\\u0000order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:2:{i:0;s:8:\\\"products\\\";i:1;s:14:\\\"billingAddress\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"id\\\";s:36:\\\"e3c6c1c2-6699-4508-9f50-38878aab79e5\\\";}s:4:\\\"data\\\";a:4:{s:4:\\\"body\\\";s:57:\\\"A new order (#20220003) created by ahmad joda from Aruba.\\\";s:4:\\\"icon\\\";s:11:\\\"fas fa-file\\\";s:3:\\\"url\\\";s:31:\\\"http:\\/\\/localhost:8000\\/dashboard\\\";s:8:\\\"order_id\\\";i:4;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1669335203, 1669335203),
(6, 'default', '{\"uuid\":\"9379d7a6-62c7-4175-919d-c3a41fa33560\",\"displayName\":\"App\\\\Events\\\\DeliveryLocationUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":13:{s:5:\\\"event\\\";O:34:\\\"App\\\\Events\\\\DeliveryLocationUpdated\\\":3:{s:3:\\\"lat\\\";d:34.8920761;s:3:\\\"lng\\\";d:31.8858954;s:11:\\\"\\u0000*\\u0000delivery\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:19:\\\"App\\\\Models\\\\Delivery\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1669512038, 1669512038),
(7, 'default', '{\"uuid\":\"e17b006d-1228-4dac-8ea5-9b17d6a42b57\",\"displayName\":\"App\\\\Events\\\\DeliveryLocationUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":13:{s:5:\\\"event\\\";O:34:\\\"App\\\\Events\\\\DeliveryLocationUpdated\\\":3:{s:3:\\\"lat\\\";d:31.5414286;s:3:\\\"lng\\\";d:34.4730709;s:11:\\\"\\u0000*\\u0000delivery\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:19:\\\"App\\\\Models\\\\Delivery\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1669515125, 1669515125),
(8, 'default', '{\"uuid\":\"b27e464a-161f-4888-a99b-30eb60e5de53\",\"displayName\":\"App\\\\Events\\\\DeliveryLocationUpdated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":13:{s:5:\\\"event\\\";O:34:\\\"App\\\\Events\\\\DeliveryLocationUpdated\\\":3:{s:3:\\\"lat\\\";d:31.5414286;s:3:\\\"lng\\\";d:34.4730709;s:11:\\\"\\u0000*\\u0000delivery\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:19:\\\"App\\\\Models\\\\Delivery\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1669515179, 1669515179);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_11_02_181301_create_stores_table', 1),
(7, '2022_11_02_181348_create_categories_table', 1),
(8, '2022_11_07_232526_add_soft_delete_to_categories_table', 1),
(9, '2022_11_08_033125_create_products_table', 1),
(10, '2022_11_08_041043_add_store_id_to_users_table', 1),
(11, '2022_11_08_191316_create_profiles_table', 1),
(12, '2022_11_09_174611_create_tags_table', 1),
(13, '2022_11_09_174928_create_product_tag_table', 1),
(14, '2022_11_13_011112_add_type_column_to_users_table', 1),
(15, '2022_11_13_011512_add_last_active_at_column_to_users_table', 1),
(16, '2022_11_13_013236_create_carts_table', 1),
(17, '2022_11_13_174405_create_orders_table', 1),
(18, '2022_11_13_174926_create_order_items_table', 1),
(19, '2022_11_13_175925_create_order_addresses_table', 1),
(20, '2022_11_13_191714_add_quantity_column_to_products_table', 1),
(21, '2022_11_16_154442_create_notifications_table', 1),
(22, '2022_11_18_173856_create_admins_table', 1),
(23, '2022_11_23_163747_create_roles_table', 2),
(24, '2022_11_23_164551_create_role_abilities_table', 2),
(25, '2022_11_23_164921_create_role_user_table', 2),
(26, '2022_11_24_041320_create_jobs_table', 3),
(27, '2022_11_24_143107_add_social_provider_columns_to_users_table', 4),
(28, '2022_11_24_232957_create_payments_table', 5),
(29, '2022_11_27_024844_create_deliveries_table', 6),
(30, '2022_11_27_025404_add_pending_status_to_deliveries_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('2227a0fb-24d2-468d-9f10-f26199a52e8c', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 1, '{\"body\":\"A new order (#20220001) created by ahmad joda from Bahamas.\",\"icon\":\"fas fa-file\",\"url\":\"http:\\/\\/localhost:8000\\/dashboard\",\"order_id\":1}', NULL, '2022-11-24 22:35:45', '2022-11-24 22:35:45'),
('e3c6c1c2-6699-4508-9f50-38878aab79e5', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 1, '{\"body\":\"A new order (#20220003) created by ahmad joda from Aruba.\",\"icon\":\"fas fa-file\",\"url\":\"http:\\/\\/localhost:8000\\/dashboard\",\"order_id\":4}', NULL, '2022-11-25 00:13:23', '2022-11-25 00:13:23'),
('f6563c2c-4ab5-4cd9-8aa1-fcd46db7dd0f', 'App\\Notifications\\OrderCreatedNotification', 'App\\Models\\User', 1, '{\"body\":\"A new order (#20220002) created by ahmad joda from Bahamas.\",\"icon\":\"fas fa-file\",\"url\":\"http:\\/\\/localhost:8000\\/dashboard\",\"order_id\":3}', NULL, '2022-11-24 23:50:42', '2022-11-24 23:50:42');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','processing','delivering','completed','cancelled','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_status` enum('pending','paid','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `shipping` double(8,2) NOT NULL DEFAULT 0.00,
  `tax` double(8,2) NOT NULL DEFAULT 0.00,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `total` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `store_id`, `user_id`, `number`, `payment_method`, `status`, `payment_status`, `shipping`, `tax`, `discount`, `total`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '20220001', 'cod', 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2022-11-24 22:35:41', '2022-11-24 22:35:41'),
(3, 3, 1, '20220002', 'cod', 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2022-11-24 23:50:38', '2022-11-24 23:50:38'),
(4, 3, 1, '20220003', 'cod', 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2022-11-25 00:13:18', '2022-11-25 00:13:18');

-- --------------------------------------------------------

--
-- Table structure for table `order_addresses`
--

CREATE TABLE `order_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('billing','shipping') COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` char(2) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_addresses`
--

INSERT INTO `order_addresses` (`id`, `order_id`, `type`, `first_name`, `last_name`, `email`, `phone_number`, `street_address`, `city`, `postal_code`, `state`, `country`) VALUES
(1, 1, 'billing', 'ahmad', 'joda', 'a@joda.com', '0597101386', 'فلسطين', 'رفح', '00972', 'gaza', 'BS'),
(2, 1, 'shipping', 'ahmad', 'joda', 'a@joda.com', '0597101386', 'فلسطين', 'رفح', '00972', 'gaza', 'AT'),
(4, 3, 'billing', 'ahmad', 'joda', 'a@joda.com', '0597101386', 'فلسطين', 'رفح', '00972', 'gaza', 'BS'),
(5, 3, 'shipping', 'ahmad', 'joda', 'a@joda.com', '0597101386', 'فلسطين', 'رفح', '00972', 'gaza', 'DZ'),
(6, 4, 'billing', 'ahmad', 'joda', 'a@joda.com', '0597101386', 'gaza', 'gaza', '980', 'gaza', 'AW'),
(7, 4, 'shipping', 'ahmad', 'joda', 'a@joda.com', '0597101386', 'gaza', 'gaza', '980', 'gaza', 'AM');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `price`, `quantity`, `options`) VALUES
(1, 1, 1, 'Lightweight Marble Pants', 175.90, 2, NULL),
(3, 3, 1, 'Lightweight Marble Pants', 175.90, 3, NULL),
(4, 4, 1, 'Lightweight Marble Pants', 175.90, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL,
  `currency` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','completed','failed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`transaction_data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'PostmanRuntime/7.29.2', '71f22e1731f0f1ce2145cbdb038079c68f61d747d62729abdc14fece9d2104d5', '[\"*\"]', NULL, NULL, '2022-11-20 14:32:37', '2022-11-20 14:32:37'),
(2, 'App\\Models\\User', 1, 'PostmanRuntime/7.29.2', '751a1fac26bacb6068a6c0604af664eff8f7169d3d701396ed86c5b115e6b5ee', '[\"*\"]', '2022-11-20 14:33:32', NULL, '2022-11-20 14:33:21', '2022-11-20 14:33:32'),
(5, 'App\\Models\\User', 2, 'PostmanRuntime/7.29.2', 'ebaa77ee287e3bdf8de5e72aded50ee26a622d269d75a3a308cb4688ce28b674', '[\"*\"]', '2022-11-20 14:46:26', NULL, '2022-11-20 14:46:19', '2022-11-20 14:46:26'),
(8, 'App\\Models\\User', 1, 'PostmanRuntime/7.29.2', '4666e94b2f33deb246138d0ff56c17d96cbc1377005b246ce0e56ee036f718e4', '[\"*\"]', '2022-11-20 14:47:30', NULL, '2022-11-20 14:47:16', '2022-11-20 14:47:30'),
(9, 'App\\Models\\User', 1, 'PostmanRuntime/7.29.2', '03f3698ca8faae640d597f34006796afeee7210c8922af88ef3544bc22e156b5', '[\"products.create\",\"products.update\"]', '2022-11-20 14:54:02', NULL, '2022-11-20 14:50:33', '2022-11-20 14:54:02'),
(10, 'App\\Models\\User', 1, 'PostmanRuntime/7.29.2', 'ea45e4b76df8f777e158970179afe25775f7d38d8c92e54b33829ab1104d1b7c', '[\"products.create\",\"products.update\",\"products.delete\"]', '2022-11-20 14:56:45', NULL, '2022-11-20 14:56:35', '2022-11-20 14:56:45');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `compare_price` double(8,2) DEFAULT NULL,
  `quantity` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `rating` double(8,2) NOT NULL DEFAULT 0.00,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('active','draft','archived') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `store_id`, `category_id`, `name`, `slug`, `description`, `image`, `price`, `compare_price`, `quantity`, `options`, `rating`, `featured`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 5, 'Lightweight Marble Pants', 'lightweight-marble-pants', 'Minus quia ut quos et est quasi nostrum enim minima id id ipsum amet quo quos quia eum illum.', 'https://via.placeholder.com/600x600.png/008844?text=dignissimos', 175.90, 877.10, 4, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-25 00:13:18', NULL),
(2, 3, 8, 'Enormous Iron Lamp', 'enormous-iron-lamp', 'Qui quaerat et aliquam id sed maiores porro architecto ea sed ut est perspiciatis eius odio.', 'https://via.placeholder.com/600x600.png/003322?text=error', 183.80, 757.50, 10, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(3, 4, 5, 'Fantastic Bronze Bottle', 'fantastic-bronze-bottle', 'Consequatur et sit delectus voluptas earum dolorem autem non omnis id atque.', 'https://via.placeholder.com/600x600.png/00ccee?text=sint', 39.40, 688.20, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(4, 4, 2, 'Ergonomic Paper Bottle', 'ergonomic-paper-bottle', 'Nihil deleniti quia sapiente qui dolorem aspernatur deleniti ipsum consequatur consequatur saepe enim ut.', 'https://via.placeholder.com/600x600.png/0044dd?text=quidem', 268.70, 980.80, 10, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(5, 2, 9, 'Ergonomic Plastic Gloves', 'ergonomic-plastic-gloves', 'Architecto reprehenderit aut aut et vero minima voluptatem non nisi est veritatis saepe id repellendus quia dolor.', 'https://via.placeholder.com/600x600.png/00dd22?text=aut', 297.30, 989.50, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(6, 3, 9, 'Small Granite Bottle', 'small-granite-bottle', 'Voluptates exercitationem placeat aut omnis modi in sit voluptate nihil autem iste quia et.', 'https://via.placeholder.com/600x600.png/003322?text=voluptatem', 282.00, 508.40, 10, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(7, 1, 7, 'Durable Steel Gloves', 'durable-steel-gloves', 'Eveniet vel voluptas dolorem eos nemo id sed dolorum dicta modi repellat qui.', 'https://via.placeholder.com/600x600.png/0044cc?text=corrupti', 334.90, 512.30, 10, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(8, 3, 7, 'Heavy Duty Silk Plate', 'heavy-duty-silk-plate', 'Rem dolorem at quos sed ad accusamus voluptates quam totam sunt sit et enim sed.', 'https://via.placeholder.com/600x600.png/00ffff?text=minus', 46.80, 841.20, 10, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(9, 3, 1, 'Mediocre Leather Coat', 'mediocre-leather-coat', 'Doloremque quam cum officia nihil et neque suscipit quo quas molestias enim nesciunt.', 'https://via.placeholder.com/600x600.png/0011cc?text=quam', 128.50, 668.90, 10, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(10, 3, 5, 'Practical Silk Shirt', 'practical-silk-shirt', 'At quia nesciunt aut quae eum aperiam non repudiandae et sapiente veritatis eum expedita sunt facere inventore.', 'https://via.placeholder.com/600x600.png/00dd44?text=aut', 176.70, 728.10, 10, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(11, 5, 2, 'Fantastic Wooden Gloves', 'fantastic-wooden-gloves', 'Magnam accusantium expedita voluptatem sed illum eligendi accusantium voluptates consequatur aliquam ratione eveniet aut molestiae earum suscipit enim.', 'https://via.placeholder.com/600x600.png/00ddff?text=adipisci', 206.80, 520.50, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(12, 2, 4, 'Durable Paper Shirt', 'durable-paper-shirt', 'Nulla quia sunt est minus et distinctio commodi ab non.', 'https://via.placeholder.com/600x600.png/0011ee?text=iste', 148.60, 552.50, 10, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(13, 4, 4, 'Synergistic Cotton Bench', 'synergistic-cotton-bench', 'Ut minus sunt autem et ipsa totam reiciendis eligendi iusto et rem.', 'https://via.placeholder.com/600x600.png/0011ee?text=autem', 68.00, 612.70, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(14, 1, 8, 'Enormous Wooden Gloves', 'enormous-wooden-gloves', 'Natus fugiat ex atque sint consequatur consequatur necessitatibus recusandae minima dolor corporis rerum nisi natus maxime cumque ipsum explicabo molestias vel eaque.', 'https://via.placeholder.com/600x600.png/00ff55?text=placeat', 172.70, 871.40, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(15, 5, 2, 'Durable Bronze Car', 'durable-bronze-car', 'Ea et explicabo delectus et laudantium voluptatem consectetur saepe labore illum facilis error architecto fuga et veritatis reiciendis consectetur qui voluptatem.', 'https://via.placeholder.com/600x600.png/0066bb?text=eaque', 305.90, 617.40, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(16, 2, 9, 'Durable Paper Clock', 'durable-paper-clock', 'Natus enim ut eius id vero iusto ratione tempore consectetur repellendus.', 'https://via.placeholder.com/600x600.png/00aacc?text=perferendis', 476.20, 563.10, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(17, 3, 1, 'Mediocre Concrete Gloves', 'mediocre-concrete-gloves', 'Culpa cupiditate vero perspiciatis non dolore a accusamus ut culpa.', 'https://via.placeholder.com/600x600.png/0066dd?text=voluptatem', 84.80, 842.30, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(18, 2, 7, 'Aerodynamic Aluminum Shirt', 'aerodynamic-aluminum-shirt', 'Quae omnis et et pariatur dolor doloremque est temporibus id voluptatem quidem soluta.', 'https://via.placeholder.com/600x600.png/00bb88?text=accusantium', 54.10, 553.40, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(19, 4, 4, 'Durable Iron Lamp', 'durable-iron-lamp', 'Deleniti eos ullam est veniam qui veniam eius vel cupiditate molestiae voluptatem quia est magni ipsum.', 'https://via.placeholder.com/600x600.png/0099aa?text=ipsa', 171.60, 878.40, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(20, 1, 1, 'Fantastic Plastic Lamp', 'fantastic-plastic-lamp', 'Dolorem autem dolorem laudantium eum veniam autem quo eaque libero nisi dolorem tempora odit aut atque officia.', 'https://via.placeholder.com/600x600.png/0044aa?text=tempora', 476.90, 731.10, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(21, 1, 9, 'Practical Concrete Hat', 'practical-concrete-hat', 'Rerum molestias minus eum fugit ut dolorum magnam rerum necessitatibus molestias.', 'https://via.placeholder.com/600x600.png/0099ee?text=quidem', 218.10, 577.90, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(22, 4, 8, 'Small Iron Bottle', 'small-iron-bottle', 'Magnam consequuntur excepturi voluptatibus maxime sunt minus numquam odio consequatur expedita.', 'https://via.placeholder.com/600x600.png/00cc77?text=excepturi', 183.90, 818.80, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(23, 1, 3, 'Sleek Steel Hat', 'sleek-steel-hat', 'Sint dolore praesentium aut consequatur explicabo quidem numquam deleniti corrupti nihil eius placeat minima nam iste qui beatae rerum aut distinctio.', 'https://via.placeholder.com/600x600.png/006677?text=quam', 327.00, 937.00, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(24, 4, 4, 'Rustic Aluminum Watch', 'rustic-aluminum-watch', 'Aut sunt aliquid aperiam dolore sed id aperiam dolores exercitationem consequatur cupiditate qui eligendi enim dolor voluptate.', 'https://via.placeholder.com/600x600.png/00aaee?text=aut', 400.80, 959.00, 10, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(25, 1, 8, 'Heavy Duty Cotton Clock', 'heavy-duty-cotton-clock', 'Sunt et omnis quia voluptatem animi quod amet ratione vel id distinctio rerum porro nulla soluta qui eum rerum laboriosam.', 'https://via.placeholder.com/600x600.png/007766?text=odio', 14.50, 874.30, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(26, 4, 5, 'Rustic Silk Gloves', 'rustic-silk-gloves', 'Laborum porro et molestiae dolores rerum odit consectetur provident accusantium id.', 'https://via.placeholder.com/600x600.png/00ee44?text=rerum', 274.40, 949.60, 10, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(27, 2, 7, 'Lightweight Leather Plate', 'lightweight-leather-plate', 'Molestiae officia qui maxime libero iure quidem qui ipsum voluptas qui tempora accusantium aperiam inventore incidunt perspiciatis voluptatem animi.', 'https://via.placeholder.com/600x600.png/004466?text=ut', 83.50, 514.80, 10, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(28, 3, 6, 'Rustic Rubber Hat', 'rustic-rubber-hat', 'Aut alias illo sunt quos voluptate praesentium ratione qui modi qui eum inventore sequi inventore nostrum asperiores esse est vel labore.', 'https://via.placeholder.com/600x600.png/0022ff?text=id', 411.70, 858.70, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(29, 2, 4, 'Durable Wooden Lamp', 'durable-wooden-lamp', 'Modi suscipit natus non sunt alias adipisci dolorem sapiente perspiciatis.', 'https://via.placeholder.com/600x600.png/00ff77?text=sequi', 267.10, 526.10, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(30, 2, 6, 'Sleek Wool Bench', 'sleek-wool-bench', 'Odit explicabo velit aut reiciendis inventore dolorum excepturi modi aliquam laborum dolorum repellat et harum.', 'https://via.placeholder.com/600x600.png/003377?text=in', 449.40, 804.20, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(31, 2, 7, 'Aerodynamic Paper Bench', 'aerodynamic-paper-bench', 'Aut error in tenetur officia aut aut repellat dolorum nihil voluptas aut beatae quisquam voluptatibus nemo laborum libero sint aspernatur sed dolorum.', 'https://via.placeholder.com/600x600.png/00aa33?text=consequuntur', 97.80, 960.70, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(32, 3, 9, 'Practical Paper Car', 'practical-paper-car', 'Consequatur vel rem assumenda error qui est a excepturi voluptatem.', 'https://via.placeholder.com/600x600.png/00ddcc?text=voluptatem', 498.00, 668.30, 10, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(33, 5, 8, 'Intelligent Paper Shirt', 'intelligent-paper-shirt', 'Rerum possimus sequi id est id tempore aut sed et corrupti repellendus aspernatur expedita.', 'https://via.placeholder.com/600x600.png/00dd11?text=quaerat', 86.40, 552.60, 10, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(34, 4, 3, 'Enormous Aluminum Shirt', 'enormous-aluminum-shirt', 'Possimus adipisci qui cumque impedit eligendi deleniti odit rerum magni et culpa quia eum rem et occaecati est incidunt quia unde.', 'https://via.placeholder.com/600x600.png/0088bb?text=suscipit', 383.10, 869.20, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(35, 3, 3, 'Rustic Iron Wallet', 'rustic-iron-wallet', 'Qui fugit ad neque eos qui nisi eveniet consequatur dolores id dolorum magnam quo et aspernatur nesciunt delectus corporis similique.', 'https://via.placeholder.com/600x600.png/0000bb?text=omnis', 261.10, 949.90, 10, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(36, 4, 7, 'Gorgeous Wool Table', 'gorgeous-wool-table', 'Ut vel officia qui corporis totam dolorum recusandae non quam magnam libero aliquam et est velit exercitationem voluptas quaerat modi suscipit dolore.', 'https://via.placeholder.com/600x600.png/009922?text=vel', 217.50, 704.50, 10, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(37, 5, 5, 'Synergistic Bronze Keyboard', 'synergistic-bronze-keyboard', 'Dolores ut et dicta sit consequatur et consectetur qui consectetur est.', 'https://via.placeholder.com/600x600.png/00ff99?text=tenetur', 262.50, 627.20, 10, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(38, 4, 7, 'Intelligent Leather Keyboard', 'intelligent-leather-keyboard', 'Eos enim est eos ut quibusdam ratione officiis ea qui est adipisci dolores vel soluta ut cumque qui.', 'https://via.placeholder.com/600x600.png/0099cc?text=et', 235.80, 590.20, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(39, 4, 5, 'Incredible Wooden Plate', 'incredible-wooden-plate', 'Optio fugit commodi vero quasi reprehenderit aut optio facere porro atque officia dolorem.', 'https://via.placeholder.com/600x600.png/00cc88?text=autem', 107.40, 684.10, 10, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(40, 2, 3, 'Practical Steel Gloves', 'practical-steel-gloves', 'Porro tempore omnis modi adipisci possimus est nesciunt sit ad enim sint voluptates id a ipsum.', 'https://via.placeholder.com/600x600.png/00ee33?text=facere', 470.30, 825.10, 10, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(41, 4, 5, 'Gorgeous Bronze Coat', 'gorgeous-bronze-coat', 'Neque quo magni voluptas eligendi dolore ut et laboriosam hic cumque facilis ducimus veniam impedit est aut.', 'https://via.placeholder.com/600x600.png/0066ff?text=sapiente', 354.80, 504.70, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(42, 1, 9, 'Mediocre Paper Keyboard', 'mediocre-paper-keyboard', 'Aperiam dignissimos iure similique pariatur eos sed est pariatur natus nihil earum dicta sequi magnam quam voluptas.', 'https://via.placeholder.com/600x600.png/00ffbb?text=minus', 287.20, 701.50, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(43, 2, 10, 'Fantastic Wool Car', 'fantastic-wool-car', 'Rerum molestias sint quo repellendus adipisci autem dolorem ab consequatur recusandae rerum.', 'https://via.placeholder.com/600x600.png/0099aa?text=pariatur', 473.10, 607.50, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(44, 5, 8, 'Enormous Aluminum Plate', 'enormous-aluminum-plate', 'Enim deleniti quas eos blanditiis nisi beatae velit placeat voluptatem modi non qui.', 'https://via.placeholder.com/600x600.png/005555?text=libero', 203.90, 746.80, 10, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(45, 2, 10, 'Small Iron Bag', 'small-iron-bag', 'Rerum autem illo a rerum et reiciendis et voluptatem quia ab ea inventore tempora consequatur possimus.', 'https://via.placeholder.com/600x600.png/007711?text=qui', 8.70, 916.30, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(46, 2, 6, 'Aerodynamic Steel Lamp', 'aerodynamic-steel-lamp', 'Rem commodi doloremque et rerum ratione quas distinctio accusamus laborum sit enim nobis aut sit vel.', 'https://via.placeholder.com/600x600.png/00aa88?text=quam', 348.40, 594.20, 10, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(47, 3, 7, 'Lightweight Rubber Shoes', 'lightweight-rubber-shoes', 'Tenetur ea expedita consequuntur excepturi ipsa suscipit delectus aut et.', 'https://via.placeholder.com/600x600.png/00ccdd?text=aut', 251.90, 933.00, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(48, 4, 7, 'Durable Copper Watch', 'durable-copper-watch', 'Officia exercitationem ab quia minima et labore non ab debitis sit ut est doloribus at rerum.', 'https://via.placeholder.com/600x600.png/00ffcc?text=hic', 287.40, 798.50, 10, NULL, 0.00, 0, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(49, 3, 1, 'Gorgeous Steel Lamp', 'gorgeous-steel-lamp', 'Architecto ab quae et qui dicta dolor ad totam autem ut recusandae sunt aspernatur.', 'https://via.placeholder.com/600x600.png/00ffaa?text=et', 70.50, 963.60, 10, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(50, 1, 4, 'Awesome Silk Gloves', 'awesome-silk-gloves', 'Doloremque omnis aut ut dolor consectetur at perspiciatis tempora non rerum.', 'https://via.placeholder.com/600x600.png/000088?text=enim', 241.70, 744.90, 10, NULL, 0.00, 1, 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20', NULL),
(51, 2, 4, 'Small Linen Watch', 'small-linen-watch', 'Magnam et repudiandae sed id sequi magnam dolor voluptatibus sed iste quis commodi blanditiis voluptatem enim sint quas molestiae eos consequatur voluptates.', 'https://via.placeholder.com/600x600.png/00aa77?text=mollitia', 392.30, 550.60, 10, NULL, 0.00, 1, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(52, 1, 1, 'Enormous Linen Table', 'enormous-linen-table', 'Illum rerum molestiae et voluptatem voluptatem fugiat culpa necessitatibus eligendi qui sint incidunt pariatur voluptas inventore quos sit voluptatem repudiandae et.', 'https://via.placeholder.com/600x600.png/00cc99?text=aliquid', 230.90, 769.10, 10, NULL, 0.00, 1, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(53, 1, 8, 'Small Wool Computer', 'small-wool-computer', 'Commodi veniam sint aut accusamus sunt error ad repellendus provident sint unde nulla temporibus a cumque iusto ratione ut debitis facilis.', 'https://via.placeholder.com/600x600.png/001155?text=aut', 377.20, 560.90, 10, NULL, 0.00, 0, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(54, 2, 6, 'Small Paper Coat', 'small-paper-coat', 'Mollitia recusandae eos libero dolorem saepe architecto dolor facilis architecto eligendi tempora ut veritatis nisi corporis expedita.', 'https://via.placeholder.com/600x600.png/00dd88?text=fuga', 226.70, 680.00, 10, NULL, 0.00, 1, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(55, 5, 8, 'Synergistic Wool Plate', 'synergistic-wool-plate', 'Voluptatem consequatur et aut autem at accusamus autem maiores iste consequatur odio.', 'https://via.placeholder.com/600x600.png/007711?text=amet', 130.90, 675.00, 10, NULL, 0.00, 1, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(56, 3, 8, 'Practical Iron Bench', 'practical-iron-bench', 'Eum sunt soluta nisi quae saepe et consequuntur optio consequatur.', 'https://via.placeholder.com/600x600.png/000055?text=voluptatem', 460.80, 848.60, 10, NULL, 0.00, 1, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(57, 2, 2, 'Rustic Copper Hat', 'rustic-copper-hat', 'Enim sint et laudantium quibusdam natus vitae deserunt itaque id mollitia delectus sunt dolorem aliquam voluptatibus quia aut quam.', 'https://via.placeholder.com/600x600.png/0077ee?text=aut', 365.70, 848.20, 10, NULL, 0.00, 1, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(58, 2, 7, 'Aerodynamic Cotton Bag', 'aerodynamic-cotton-bag', 'Consectetur est repellat voluptatem ea porro quidem temporibus dolor et sit ut qui nobis suscipit quis quaerat commodi distinctio autem nam ad.', 'https://via.placeholder.com/600x600.png/00ee99?text=ad', 133.80, 963.10, 10, NULL, 0.00, 0, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(59, 2, 1, 'Incredible Wooden Hat', 'incredible-wooden-hat', 'Rerum nulla illum expedita consequatur sunt et in earum qui rerum et voluptate accusamus saepe.', 'https://via.placeholder.com/600x600.png/00bb44?text=placeat', 79.00, 629.00, 10, NULL, 0.00, 0, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(60, 1, 8, 'Synergistic Iron Wallet', 'synergistic-iron-wallet', 'Harum earum saepe nihil impedit natus molestias ducimus culpa mollitia reiciendis magni.', 'https://via.placeholder.com/600x600.png/0033cc?text=corporis', 35.30, 863.20, 10, NULL, 0.00, 1, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(61, 4, 5, 'Fantastic Silk Bench', 'fantastic-silk-bench', 'Maxime fugit rem corporis praesentium vero esse aut porro dolorem iusto quia eveniet exercitationem placeat quia animi debitis qui deserunt.', 'https://via.placeholder.com/600x600.png/00aacc?text=eaque', 116.20, 800.80, 10, NULL, 0.00, 0, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(62, 4, 4, 'Lightweight Marble Shoes', 'lightweight-marble-shoes', 'Ut sequi corporis eos perferendis consequuntur optio nisi non nemo quas sed.', 'https://via.placeholder.com/600x600.png/00ccaa?text=ut', 430.00, 504.10, 10, NULL, 0.00, 0, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(63, 3, 3, 'Mediocre Marble Coat', 'mediocre-marble-coat', 'Labore optio perspiciatis omnis aut autem assumenda voluptatem ratione ea ipsam voluptatum autem qui atque odit voluptatem voluptatem eos.', 'https://via.placeholder.com/600x600.png/00cc55?text=in', 120.60, 877.70, 10, NULL, 0.00, 0, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(64, 1, 1, 'Intelligent Wool Keyboard', 'intelligent-wool-keyboard', 'Maiores quia porro est quis minima id incidunt voluptatem aut esse ullam deserunt maiores non vero temporibus voluptates ad.', 'https://via.placeholder.com/600x600.png/00aa88?text=a', 40.70, 898.40, 10, NULL, 0.00, 0, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(65, 3, 1, 'Aerodynamic Aluminum Bench', 'aerodynamic-aluminum-bench', 'Quasi blanditiis beatae recusandae fugit iure est est nihil veniam dolorem quia omnis illum quis.', 'https://via.placeholder.com/600x600.png/00ffcc?text=quibusdam', 483.60, 908.90, 10, NULL, 0.00, 1, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(66, 2, 3, 'Intelligent Wool Shirt', 'intelligent-wool-shirt', 'Nam non ullam maxime sed quaerat eum occaecati at numquam ipsam aperiam quos.', 'https://via.placeholder.com/600x600.png/00bb66?text=hic', 317.40, 688.80, 10, NULL, 0.00, 0, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(67, 4, 2, 'Lightweight Linen Car', 'lightweight-linen-car', 'Sint accusamus sed assumenda a sint quidem labore nemo repellendus saepe facilis eos quia unde aut assumenda quae est aut molestiae.', 'https://via.placeholder.com/600x600.png/00aa66?text=aut', 96.20, 916.30, 10, NULL, 0.00, 0, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(68, 3, 7, 'Mediocre Wool Knife', 'mediocre-wool-knife', 'Dolor molestias quam accusamus cupiditate voluptatem dolore hic nisi sunt amet voluptas quidem voluptas consectetur qui recusandae itaque et et.', 'https://via.placeholder.com/600x600.png/0077dd?text=autem', 35.20, 612.90, 10, NULL, 0.00, 0, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(69, 3, 7, 'Enormous Granite Pants', 'enormous-granite-pants', 'Alias asperiores numquam unde molestiae officia quia tempora temporibus dolore dicta optio ipsam rerum id.', 'https://via.placeholder.com/600x600.png/005544?text=nesciunt', 189.70, 690.80, 10, NULL, 0.00, 0, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(70, 3, 9, 'Sleek Concrete Table', 'sleek-concrete-table', 'Sit maiores adipisci aut autem veritatis voluptatum et ea ut qui maiores voluptas in nam nobis sequi.', 'https://via.placeholder.com/600x600.png/007777?text=magni', 132.20, 693.20, 10, NULL, 0.00, 1, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(71, 5, 10, 'Awesome Leather Keyboard', 'awesome-leather-keyboard', 'Voluptatum accusantium quia id qui quasi quis ipsum nihil vel laudantium voluptatem.', 'https://via.placeholder.com/600x600.png/0066ff?text=illo', 334.60, 542.40, 10, NULL, 0.00, 1, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(72, 3, 4, 'Mediocre Bronze Chair', 'mediocre-bronze-chair', 'Officiis harum quos aut aliquid pariatur qui est eaque ad vel dolores reiciendis dolore.', 'https://via.placeholder.com/600x600.png/00cc22?text=quia', 213.00, 752.10, 10, NULL, 0.00, 1, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(73, 3, 5, 'Aerodynamic Paper Table', 'aerodynamic-paper-table', 'Dolore eligendi qui voluptas iusto sit velit corrupti sunt eum porro cupiditate quae sit magni dignissimos sint omnis non harum.', 'https://via.placeholder.com/600x600.png/0044ee?text=odio', 272.70, 709.70, 10, NULL, 0.00, 0, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(74, 4, 10, 'Durable Concrete Hat', 'durable-concrete-hat', 'Corporis id voluptas qui et sequi odit sed qui vero perferendis soluta aliquid doloribus facere enim ut quo quo illo.', 'https://via.placeholder.com/600x600.png/005511?text=dolor', 384.60, 942.80, 10, NULL, 0.00, 1, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(75, 4, 6, 'Awesome Concrete Bottle', 'awesome-concrete-bottle', 'Voluptates ipsa voluptatem voluptate sit omnis omnis eaque ullam in.', 'https://via.placeholder.com/600x600.png/002277?text=et', 346.70, 972.40, 10, NULL, 0.00, 1, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(76, 5, 3, 'Awesome Marble Pants', 'awesome-marble-pants', 'Illo quam eaque nam ratione ut enim eos eos voluptatibus voluptas qui quibusdam unde dignissimos ut rerum nobis porro architecto.', 'https://via.placeholder.com/600x600.png/002299?text=quaerat', 225.70, 694.30, 10, NULL, 0.00, 0, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(77, 4, 7, 'Lightweight Paper Shoes', 'lightweight-paper-shoes', 'Hic sed maxime quo suscipit qui dolores ipsam officiis et similique ut quia quia explicabo officia molestiae veniam.', 'https://via.placeholder.com/600x600.png/0088cc?text=totam', 414.90, 523.10, 10, NULL, 0.00, 0, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(78, 5, 9, 'Gorgeous Linen Pants', 'gorgeous-linen-pants', 'Nemo quisquam dolor odio autem nesciunt incidunt architecto quas soluta molestiae quo tempora pariatur dolorum nesciunt rerum fugit.', 'https://via.placeholder.com/600x600.png/005588?text=eius', 222.10, 855.70, 10, NULL, 0.00, 0, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(79, 2, 3, 'Rustic Wool Shirt', 'rustic-wool-shirt', 'Quaerat ad ea est suscipit velit ullam et aperiam quo qui id quae laboriosam consectetur reprehenderit est aut labore quisquam sit.', 'https://via.placeholder.com/600x600.png/00ffee?text=suscipit', 233.00, 585.30, 10, NULL, 0.00, 0, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(80, 3, 10, 'Awesome Steel Plate', 'awesome-steel-plate', 'Deleniti est ut quaerat omnis iure beatae earum suscipit voluptates facere qui minima in consectetur quia voluptas accusamus sint deleniti sequi.', 'https://via.placeholder.com/600x600.png/00cc11?text=ratione', 130.50, 789.10, 10, NULL, 0.00, 1, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(81, 2, 8, 'Heavy Duty Linen Computer', 'heavy-duty-linen-computer', 'Accusantium est eos fugit vel quibusdam quo aliquid quisquam omnis omnis et vero autem impedit dicta.', 'https://via.placeholder.com/600x600.png/006600?text=est', 340.40, 747.60, 10, NULL, 0.00, 0, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL),
(82, 4, 10, 'Incredible Plastic Car', 'incredible-plastic-car', 'Quia molestiae debitis odit exercitationem fugiat cupiditate sit cumque officia non consequatur dicta et qui.', 'https://via.placeholder.com/600x600.png/00eeee?text=magnam', 394.20, 686.70, 10, NULL, 0.00, 0, 'active', '2022-11-24 02:26:00', '2022-11-24 02:26:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admins', '2022-11-23 16:18:01', '2022-11-23 16:18:01'),
(2, 'User', '2022-11-23 16:18:28', '2022-11-23 16:18:28');

-- --------------------------------------------------------

--
-- Table structure for table `role_abilities`
--

CREATE TABLE `role_abilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `ability` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('allow','deny','inherit') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_abilities`
--

INSERT INTO `role_abilities` (`id`, `role_id`, `ability`, `type`) VALUES
(1, 1, 'categories.view', 'allow'),
(2, 1, 'categories.create', 'allow'),
(3, 1, 'categories.update', 'allow'),
(4, 1, 'categories.delete', 'allow'),
(5, 1, 'products.view', 'allow'),
(6, 1, 'products.create', 'allow'),
(7, 1, 'products.update', 'allow'),
(8, 1, 'products.delete', 'allow'),
(9, 1, 'orders.view', 'allow'),
(10, 1, 'orders.create', 'allow'),
(11, 1, 'orders.update', 'allow'),
(12, 1, 'orders.delete', 'allow'),
(13, 1, 'users.view', 'allow'),
(14, 1, 'users.create', 'allow'),
(15, 1, 'users.update', 'allow'),
(16, 1, 'users.delete', 'allow'),
(17, 1, 'roles.view', 'allow'),
(18, 1, 'roles.create', 'allow'),
(19, 1, 'roles.update', 'allow'),
(20, 1, 'roles.delete', 'deny'),
(21, 1, 'roles.restore', 'allow'),
(22, 1, 'roles.force-delete', 'allow'),
(23, 2, 'categories.view', 'allow'),
(24, 2, 'products.view', 'allow'),
(25, 2, 'orders.view', 'allow');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `authorizable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorizable_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`authorizable_type`, `authorizable_id`, `role_id`) VALUES
('App\\Models\\Admin', 1, 1),
('App\\Models\\User', 1, 2),
('App\\Models\\Admin', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `slug`, `description`, `logo_image`, `cover_image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'voluptatibus quia', 'voluptatibus-quia', 'Suscipit et accusantium ipsam amet incidunt aut iste quia vel necessitatibus cumque quia totam et.', 'https://via.placeholder.com/300x300.png/00dd22?text=voluptate', 'https://via.placeholder.com/800x600.png/00aa00?text=eum', 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20'),
(2, 'quisquam facere', 'quisquam-facere', 'Repudiandae harum provident et commodi ut consequuntur voluptatibus aut ut et vitae pariatur alias.', 'https://via.placeholder.com/300x300.png/0044aa?text=facilis', 'https://via.placeholder.com/800x600.png/00ffaa?text=facere', 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20'),
(3, 'quas deleniti', 'quas-deleniti', 'Magnam autem in et vero ab omnis molestiae quia voluptate eveniet.', 'https://via.placeholder.com/300x300.png/00cc55?text=et', 'https://via.placeholder.com/800x600.png/00dd55?text=molestiae', 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20'),
(4, 'ad omnis', 'ad-omnis', 'Similique et cum quia est sit illo expedita et sint est eos eaque dolor eum eum.', 'https://via.placeholder.com/300x300.png/001100?text=sapiente', 'https://via.placeholder.com/800x600.png/00dd66?text=mollitia', 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20'),
(5, 'ex illum', 'ex-illum', 'Voluptas distinctio enim ipsa perferendis itaque ut sed nobis pariatur veritatis cupiditate corporis velit libero sed aliquam fugiat eos amet voluptatem.', 'https://via.placeholder.com/300x300.png/008800?text=error', 'https://via.placeholder.com/800x600.png/00aa77?text=ducimus', 'active', '2022-11-20 14:25:20', '2022-11-20 14:25:20');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('user','admin','super-admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `last_active_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_token` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `phone_number`, `type`, `last_active_at`, `store_id`, `remember_token`, `provider`, `provider_id`, `provider_token`, `created_at`, `updated_at`) VALUES
(1, 'Ahmad Joda', 'a@joda.ps', NULL, '$2y$10$uyAiy8jhwzh7Ur8G4Bgz.O9qQFZC6DbOqYpXlhmr5969LoXZ7Ec8W', 'eyJpdiI6Ik9nVG1KaG8vRlJNa3FPUk5Fc2JmY0E9PSIsInZhbHVlIjoidUdjNkR5SG53bVdrUUZEZUN4VEM2NlFMS3J4UzNOK1hnMHRSZUhyU0tYaz0iLCJtYWMiOiI0MTk3NDE2ODU5NGUyNjAzY2IxNDg1MGMzZDI2ODQ0ODAyMmYwMWVhYTQzYjA3OTlkYzc5NmJkZDcxNDRmM2FhIiwidGFnIjoiIn0=', 'eyJpdiI6IkxyMEJTb1JCMXNjMjBydlRuZjIralE9PSIsInZhbHVlIjoieGdHOWQwaWcwb3Z6QXpGZWk1Mm5tY3BZcG9NRm5zRVlXbXFsemgxK3BldFRnN1ZlVDNKZHMvc3lIbGdCYUhIRGdZcTIxUFFJcWIzUEtTQVlneDZJWmFCdzdUSnlIUHNRaytGVCsxci9icDBmcnRGTk9EME1CZnNuN1JLSW9IVHdZcFBkelliK2d5RG5Pd01qS3EzU0RtMUNvU2xWTlo3UkVwNjlNSFFqUzBIVjc3cDQycExkRzJqSUlPMndhQWZXOXplUWVhcjQzN1pGYXcxRTFTZnl4ZUI4eWtZc3VzMjk2UkswRmRVRHU5ZStjeGxBN3B2d3g4Y1QyNHA1OVJvM25ZVkdzQTVBNGhwL1JXM3pPcmg3cUE9PSIsIm1hYyI6IjczM2JkNmI0YmUzM2Y5MDJiOTEyYTRjMTdiNDdhMzdhOTU5MmUzNjExYjhjYWVjZDc3MjkxOGRjMzJiMmZiNTIiLCJ0YWciOiIifQ==', '0597101386', 'super-admin', '2022-11-27 02:35:53', 3, NULL, NULL, NULL, NULL, '2022-11-20 14:25:21', '2022-11-27 02:35:53'),
(2, 'System Admin', 'sys@joda.ps', NULL, '$2y$10$ErG5UiTcjUgn6G8eT2baEeBi/z6ROO9bkcOsEQxF7lzSc9CPulg9K', NULL, NULL, '0599487421', 'user', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Ahmad J. Joda', 'joda.ahmad.96@gmail.com', NULL, '$2y$10$6ICqtmaezZQ02/vfr6xaAeLphfArF20kMAX150NUeiLAfpshTL46G', NULL, NULL, NULL, 'user', '2022-11-25 00:13:25', NULL, NULL, 'google', '100063591619172380338', 'eyJpdiI6IlNlSVh4d0dCSXBTbVJlQTJHZklIMXc9PSIsInZhbHVlIjoiNkxneFNzWnNBcWRJSGdyTnpxK0lhYUdLQUozQm0xcldOdjlUaURvY2RwMHJqcEpTcm5iemVlV0I3c0tSVjNoR1hhN09wNmtzaVNKY2hROHFXb1hqbWpBNi96dXpwcXBxVzcrd3ZvcFdmc203SkEyM1lOMmVIcWZQTTNxeHJuTGNEY1VEM3hXK1ByemNBY3VwT0xSb08vKy9xc3NMcENmMS8rTVUvRERENld0VjJKZUlOTUpjQ3VIMXZmR1ZmY1M1NFZPZFhjRnA1UE1CMkltQjkxT3dlbDZ0NVN3ZmFyNGhKbURqcjVMdWNuTVgvTGJ4cTJYTnNIOFljbEFHTkx0aEVXWjlyRysySUJTcklPZ3lWa2ROMjdQK1BTSHJUd0w0enM5d3Zld3hFb0U9IiwibWFjIjoiYWNkMzAwODRkNjYzMGYxODk3NTY3ZjJjYTU0YWU0ZGFlNTExMzc2ZDdmY2M2NGJmMGZkODg1NDJkOWQ3YjllNyIsInRhZyI6IiJ9', '2022-11-24 12:42:03', '2022-11-25 00:13:25'),
(4, 'Ahmad J. Joda', 'aj.joda@std.alaqsa.edu.ps', NULL, '$2y$10$OM4spj.DhLHjLXfS7R9QwewHRuONLYC.i/aRGl6fW06KHAzUY0iX2', NULL, NULL, NULL, 'user', '2022-11-24 12:56:13', NULL, NULL, 'facebook', '673088504397935', 'eyJpdiI6IkUrN05ORkpvRlJVMmdBSTA4cXB4c2c9PSIsInZhbHVlIjoiUzhjOFlKYTQrWGM1Q1JuRS9DRWQzN01pcHBpUFEzTW9hL1pkZTFjUzhQSkxzaEhuYi8rcFVHYUFuRW5ZNzZXQUJ0R0Y3UlgzSE9pWnMrb0IwbERVTy9BelE0dW9UbXNGcmJxVlNLT2x5VThQdkZwb0p0TDNoY3FBTHNRbDVjc2ZXVXNjZkVxS09LRVRrV0EweVlwa3BGZ3VOT3A5Tjd0a2FFc3g3MmF5eHl4ZjE2VE5UK293RmJFM2dYcktrWi9qaWQ4WDlBZVB2REpkZisxOVVWOHFGUEhlTkZtVVJaQnRHR1pSNkRHV3hneGFzZ2hBb0lHelQzNmFMejNPS042MHRpeTBHaUprM2VFWHFhV21temc4aitnTXVZSGlHYWVjYndwd2FLTkJPV0ZYaHp1UFVveGcyOFlUZmNvRDNJd3ZrbEtEZ0xnNVJINmtCZTlGR2ZEenlBPT0iLCJtYWMiOiJjYTVlYThmNThjY2ViMmNhMzQ4NjU5NWQ0ZjQzZTFkYWQ0OTU2NzUzNjJjM2NlZGM5YjQxMGRmNWNjNWFhODg0IiwidGFnIjoiIn0=', '2022-11-24 12:56:13', '2022-11-24 12:56:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
  ADD UNIQUE KEY `admins_phone_number_unique` (`phone_number`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `carts_cookie_id_product_id_unique` (`cookie_id`,`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deliveries_order_id_foreign` (`order_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_number_unique` (`number`),
  ADD KEY `orders_store_id_foreign` (`store_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_addresses`
--
ALTER TABLE `order_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_addresses_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_items_order_id_product_id_unique` (`order_id`,`product_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_store_id_foreign` (`store_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`product_id`,`tag_id`),
  ADD KEY `product_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `profiles_user_id_unique` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_abilities`
--
ALTER TABLE `role_abilities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_abilities_role_id_ability_unique` (`role_id`,`ability`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`authorizable_id`,`authorizable_type`,`role_id`),
  ADD KEY `role_user_authorizable_type_authorizable_id_index` (`authorizable_type`,`authorizable_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stores_slug_unique` (`slug`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_number_unique` (`phone_number`),
  ADD KEY `users_store_id_foreign` (`store_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_addresses`
--
ALTER TABLE `order_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role_abilities`
--
ALTER TABLE `role_abilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `deliveries_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_addresses`
--
ALTER TABLE `order_addresses`
  ADD CONSTRAINT `order_addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `product_tag_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_abilities`
--
ALTER TABLE `role_abilities`
  ADD CONSTRAINT `role_abilities_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
