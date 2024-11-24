-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2024 at 04:52 AM
-- Server version: 8.0.33
-- PHP Version: 8.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_year` int NOT NULL,
  `publisher` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `synopsis` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `borrower_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `name`, `published_year`, `publisher`, `synopsis`, `borrower_id`, `created_at`, `updated_at`) VALUES
(1, 'perferendis', 2016, 'Marks-Bogisich', 'Dolorum maiores ea ipsum rerum possimus veniam. Ut quae ipsa vitae voluptatem. Ut aliquid iure corporis aut accusantium dolorum et.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(2, 'id', 2024, 'Leffler Ltd', 'Rerum quia ut voluptates quis sequi reiciendis. Excepturi harum nemo qui magnam. Magnam autem debitis facere quas delectus et officiis. Sint facere voluptas sint ipsam quae.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(3, 'molestias', 2002, 'Weimann and Sons', 'Facilis eos doloribus culpa delectus. Excepturi vel quaerat vel itaque ab quas blanditiis. Ipsam eveniet praesentium et ut.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(4, 'quasi', 2005, 'Funk Group', 'Autem inventore et alias dolorem perferendis. Ex quo minus ea harum eum aut et doloribus. Corporis neque qui et vero. Dolores eius eum amet vel et neque.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(5, 'est', 1991, 'O\'Conner Inc', 'Ipsam qui cupiditate nulla dolores. Quo eaque maxime est porro doloremque laudantium quis sint.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(6, 'soluta', 2002, 'Koss, Pollich and Bashirian', 'Omnis veniam qui odio aut alias veniam. Odit porro quis cupiditate reiciendis eum. Ex ducimus quam provident et sunt qui. Sunt magnam veniam rerum in eos. Voluptas occaecati eos tenetur voluptas vel qui.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(7, 'dolores', 2015, 'Bergnaum-Runolfsdottir', 'Rem amet nemo perferendis culpa. Sed accusantium quis quas et fugiat aut qui. Alias laboriosam accusantium dolores quia enim facilis.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(8, 'sapiente', 2008, 'Kuhic-Casper', 'Quae voluptas eius quasi reiciendis et. Quo accusantium voluptatibus ducimus ipsam ea qui sint est. Dolorem non dolore voluptatibus temporibus dignissimos dicta quia. Placeat amet qui veniam veritatis corporis.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(9, 'voluptatem', 1995, 'Johns, Gorczany and Bernier', 'Fugit aut accusamus assumenda qui ex. Sed nihil quia non sed harum et. Sed et ad modi vitae labore repellendus voluptates. Id eaque enim aut explicabo voluptatem minima totam. Temporibus nisi aut vel architecto optio.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(10, 'nesciunt', 2009, 'Toy, Terry and Wunsch', 'Unde molestias voluptatem ut aut. In eum voluptate dolorem.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(11, 'sit', 2002, 'Gleason, Hahn and Mann', 'Aut enim ducimus consequatur autem sunt optio. Sit quo rerum alias ratione quia et. Tempore a voluptatem et ut dolore. Excepturi omnis aut et magnam. Cumque sed officiis ipsa magni.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(12, 'enim', 1993, 'Hegmann-Lebsack', 'Dolor aut debitis asperiores quos explicabo. Et cum et quia natus vero qui aspernatur maxime. Vero quia sunt aspernatur modi quaerat. Sed nihil quam sequi non deserunt dolor.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(13, 'et', 2003, 'Krajcik, Leffler and Paucek', 'Enim eaque quibusdam asperiores voluptatum delectus atque odio eum. Dolore provident non sit qui. Ea deserunt fuga minima. Ut dolores vitae culpa harum minus voluptatem.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(14, 'eos', 1999, 'Kuhic, Corkery and Cronin', 'Sit aut inventore ducimus qui. Voluptatem modi nisi suscipit voluptatem explicabo illo et. Ut optio quos nostrum et voluptatem quo dolorem. Porro recusandae omnis debitis.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(15, 'et', 2002, 'Bergnaum-Jacobs', 'Est asperiores voluptatem provident praesentium. Commodi voluptates eius dolor et amet. Velit veritatis sequi dolor iusto repellat et omnis reprehenderit. Quod nobis doloremque ipsa consequatur.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(16, 'et', 2012, 'Parisian, Hartmann and Ankunding', 'Id tempore saepe neque qui consequatur est quas. Iure debitis ut atque quasi. Quod perspiciatis aperiam odio. Voluptas reiciendis voluptate est eum odio laborum saepe.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(17, 'deleniti', 1994, 'Hammes Ltd', 'Natus debitis enim expedita consequatur doloremque hic quod. Facilis sint quae aut et sint asperiores corporis.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(18, 'facere', 2001, 'Sawayn-Champlin', 'Est ratione vel dolores ea. Culpa ut quis culpa. Officiis ut sunt et molestiae dolorem possimus. Consequatur ipsam et et deleniti provident.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(19, 'tempora', 2017, 'Homenick Ltd', 'Tempora voluptatum non eum magnam veritatis. Exercitationem qui dignissimos excepturi numquam amet placeat id et. Voluptas quia sint omnis et rem fugiat.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(20, 'aut', 2009, 'Swaniawski, Block and Weber', 'Minima magni dolor voluptas. Et corporis maxime at beatae est rem qui.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(21, 'laboriosam', 2024, 'Abernathy Ltd', 'Deleniti modi a expedita odio ducimus temporibus rerum. Quae nihil voluptatibus fugit ea explicabo. Nam eos placeat in repellendus quod delectus totam.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(22, 'asperiores', 2009, 'Greenholt and Sons', 'Voluptatem nulla cumque qui officiis soluta. Eveniet maiores et voluptatem autem. Et aperiam et praesentium enim repudiandae magnam expedita. Incidunt in inventore accusamus qui odit. Dolorem expedita dolorem necessitatibus fugiat.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(23, 'commodi', 2023, 'Windler, Borer and Keebler', 'Nostrum neque veritatis quidem veritatis. Aut ea aut asperiores iusto odio voluptate. Quo esse modi pariatur in necessitatibus harum.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(24, 'ducimus', 2010, 'Hauck LLC', 'Placeat dolorem non adipisci voluptatem. Aliquam corrupti repudiandae quae aperiam. Hic voluptatibus autem sequi nobis quis.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(25, 'tenetur', 2017, 'Mueller, Breitenberg and Gulgowski', 'Impedit qui eius qui possimus. Sed quia ex quo est. Quos consequatur et excepturi dolorem inventore. Recusandae qui autem quibusdam neque consequatur natus id sit.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(26, 'animi', 1995, 'Quitzon-Buckridge', 'Facilis aut voluptas ea consectetur. Ratione tenetur illum rerum placeat voluptas. Occaecati maiores consequatur minus et distinctio voluptate odio. Soluta rerum qui ut reprehenderit et. Eius sed quia in modi pariatur voluptatem.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(27, 'voluptas', 2001, 'Lemke, Crooks and Thompson', 'Quam quasi in voluptas voluptas. Sit illum qui accusantium ab aut omnis. Sunt sed et expedita esse.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(28, 'ex', 1992, 'Runte-Ziemann', 'Perferendis dolorem fuga corrupti voluptatem. Nam quia rerum quibusdam fugiat. Quia atque aut hic beatae quo voluptate ut.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(29, 'unde', 1995, 'Nader, Schinner and Kihn', 'Eius minima dignissimos odio architecto eum aliquam. Occaecati ut voluptate minima eos ad eos. Voluptates adipisci dolor eaque qui.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(30, 'vero', 2007, 'Abbott, Morar and Kunde', 'Non et provident dignissimos eius dolores. Delectus sapiente quis aliquam qui officiis aut repellat. Eius commodi nesciunt enim aut quia incidunt.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(31, 'expedita', 1999, 'Glover and Sons', 'Molestias sunt aperiam est tempora quidem voluptas et vel. Est suscipit error esse facere asperiores. Quos et totam omnis cumque sapiente.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(32, 'cum', 1998, 'Weber Ltd', 'Amet iusto voluptatum alias eius occaecati omnis. Animi facilis quam dolore officiis ipsum. Debitis non nihil voluptas suscipit aut. Qui repudiandae et excepturi saepe ad.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(33, 'quo', 2021, 'Windler, Hartmann and Marks', 'Non officiis id dolorem mollitia deleniti nihil architecto. Fugiat velit voluptates doloremque. Quae praesentium ducimus vero commodi molestiae sit. Ipsum sit eligendi facilis maxime. Sunt quasi ab nam.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(34, 'animi', 2013, 'Moen-McGlynn', 'Nihil corrupti quibusdam quae ut dolorum voluptas. Dicta accusantium nobis repellat quidem. Quis voluptatum non dolor quibusdam omnis sed excepturi. Ullam dolores repellendus et. Ea voluptas et temporibus autem illum rem.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(35, 'quaerat', 2024, 'Heaney, Glover and Mraz', 'Rem et ea voluptatem qui ducimus. Ex at velit cupiditate illo officiis repellendus ipsam. Nesciunt incidunt saepe vero molestias. Placeat modi quidem commodi nam quia provident omnis.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(36, 'amet', 2017, 'Feeney, Weimann and Bauch', 'Sed neque dicta maxime et et. Hic repellat minus cum ad enim sunt. Aliquid qui sed voluptatem quis quod consequatur. Et rem consequuntur dolor ut ab reprehenderit.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(37, 'vitae', 2017, 'Moen LLC', 'Nihil recusandae sit impedit earum voluptas nesciunt doloribus. Animi incidunt qui ut sed animi.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(38, 'fuga', 1998, 'Simonis, Greenholt and Spinka', 'Quas quia modi accusantium fugiat eum. Eligendi id facere et quis. Praesentium cumque iste a perferendis beatae. Neque sunt autem iure amet quis. Et maxime provident illo ad incidunt est.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(39, 'veritatis', 2005, 'Harvey-Ondricka', 'Dolore tempora et est est nam. Enim voluptatem consequatur cupiditate eius quisquam minus debitis. Aut culpa et mollitia tempore ipsam quam doloremque.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(40, 'quae', 2005, 'Price, Jaskolski and Jenkins', 'Laudantium ut quis ea doloremque. Odit et voluptatem sapiente quod. Ut quo labore autem. Ut laborum quia beatae magni.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(41, 'aut', 2006, 'Howell-Welch', 'Unde suscipit fugit veniam consequatur ab. Id consectetur dolorem ipsam sapiente minima minus atque. Animi ut assumenda sunt. Est dolorem ut alias alias dolore ea ut. Voluptatem dolorum enim autem natus voluptatem tempore autem.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(42, 'commodi', 2010, 'Vandervort Ltd', 'Est provident totam quidem sit optio qui placeat. Provident omnis hic aut est tempore rerum. Reprehenderit et et aut harum dolore cum.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(43, 'facilis', 2019, 'Powlowski-Jacobi', 'Iusto non vel eius dolor rerum omnis. Enim ullam non eveniet quisquam perspiciatis recusandae. Tempora ut cumque voluptatem omnis est ut et.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(44, 'vero', 2021, 'Gutmann-Tromp', 'Quo quam dolor qui nulla temporibus porro sit esse. Reprehenderit eum sunt rerum sed veritatis minima. Omnis et velit quas quibusdam iure et.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(45, 'aut', 2016, 'Kautzer, Dooley and Beer', 'Voluptas iure et voluptatum autem consequatur minima. Minus a repudiandae beatae unde ratione fugiat. Velit porro voluptas deleniti eos ut. Necessitatibus praesentium exercitationem velit itaque in aut ipsam odio.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(46, 'doloremque', 2004, 'Wuckert, Hackett and Cormier', 'Dolor animi consequatur autem sint voluptatem sit enim. Ex quo nostrum quas culpa ab. Earum voluptate repellendus quidem voluptatibus ut. Est ut amet reiciendis dolor.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(47, 'cupiditate', 1996, 'Schuster, Nicolas and McGlynn', 'Excepturi et delectus id. Alias provident sint ullam accusamus saepe quia culpa. Ab quis placeat debitis voluptatem. Eos odio ut veritatis consectetur natus tenetur nam.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(48, 'laudantium', 1991, 'Cummings Ltd', 'Aliquid dolorem commodi autem sunt numquam excepturi ut eos. Nihil minus quae quasi nam et ratione voluptatem. Ipsa accusamus beatae iure.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(49, 'eum', 1991, 'Cremin and Sons', 'Quis blanditiis esse rerum excepturi omnis. Eaque et est exercitationem dolore. Aperiam minus sed dignissimos qui dolores sed corrupti.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(50, 'numquam', 2019, 'McGlynn Inc', 'Libero similique sed numquam et. Rem inventore reprehenderit voluptatibus minima quia. Est non at omnis eius odio non. Quo aut error voluptas omnis officiis vero.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(51, 'libero', 1997, 'Klocko LLC', 'Id eos dolorem nemo molestiae sit. Autem voluptatem repudiandae quis. Ut modi laboriosam sint beatae totam nam provident minus. Expedita eos qui esse officia iusto.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(52, 'animi', 2009, 'Blick, Kunze and Walker', 'Molestiae molestiae qui sapiente incidunt sequi architecto. Voluptatem totam distinctio libero nobis. Necessitatibus sapiente rem provident ea iste consequatur sequi. Eveniet numquam ut voluptatibus dolores ducimus amet.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(53, 'voluptas', 2022, 'Wilkinson, Leffler and Dibbert', 'Sit ut neque qui dolores dolor. Nisi reprehenderit non sit voluptatum est. Sit velit voluptatem dignissimos sed natus. Molestias similique aut minus provident repellendus.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(54, 'tenetur', 1991, 'Purdy, Anderson and Altenwerth', 'Neque dolorum velit laborum. Ab et quia quia sapiente error enim porro. Voluptas alias consequatur quae expedita pariatur ullam nam harum. Qui qui architecto vitae necessitatibus.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(55, 'qui', 1999, 'Gottlieb and Sons', 'Enim sit facilis aut rerum facere exercitationem est similique. Modi eos laboriosam quisquam illo ab.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(56, 'temporibus', 1995, 'Bergstrom LLC', 'Officia tenetur incidunt deleniti. Et voluptatum corporis et et amet voluptatem iusto. Quibusdam iste voluptatem maxime et corporis dolorem sunt. Est reiciendis a fuga. Quos voluptatibus et provident aut officiis totam.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(57, 'est', 1992, 'Bergnaum-Turner', 'Facilis quaerat quis praesentium expedita non. Non cum fuga magnam qui consequatur id. Non molestiae quaerat qui maxime quaerat et et est.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(58, 'consequatur', 1999, 'McKenzie LLC', 'Ut ea nulla accusamus. Quibusdam illo hic temporibus in recusandae ut. Sapiente in mollitia laborum laudantium quas. Dolorum totam voluptatem deleniti ipsum asperiores ducimus tempora.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(59, 'rem', 2015, 'Rogahn-Balistreri', 'Nisi et dolores molestias in maiores sit. Et quo suscipit excepturi quia eveniet sunt perspiciatis. Sit unde ullam sunt voluptates veritatis aut labore. Autem eum quia laborum non.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(60, 'fugit', 2024, 'Heidenreich-Hermiston', 'Soluta delectus aut sed pariatur illo libero qui. Et non magnam occaecati quia ut.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(61, 'et', 1999, 'Schowalter, Durgan and VonRueden', 'Architecto doloribus voluptatem quo qui esse ea. Quisquam reiciendis provident perspiciatis quis architecto nulla ullam. Dolore culpa fugiat expedita eum est voluptatibus dolorum.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(62, 'error', 2021, 'Kling-Rohan', 'Nam aperiam ducimus doloremque culpa et quia. Quia rerum voluptas culpa qui necessitatibus sed. Doloremque expedita in nulla excepturi at. Voluptas velit est amet alias sit aperiam. Facere est sed excepturi et ut est dolore.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(63, 'adipisci', 2017, 'Brown-O\'Kon', 'Eos odio aut necessitatibus explicabo odio. Enim aut est id aliquam. Et laborum sunt qui. Totam aspernatur in qui tempore.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(64, 'qui', 2006, 'Rodriguez PLC', 'Qui sed fugit provident ullam molestias modi. Voluptas quis officiis quia et. Sit dolorum enim distinctio et.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(65, 'porro', 2017, 'Lockman, King and Blanda', 'Et laudantium voluptatem nemo voluptas ratione omnis. Placeat quas accusamus velit eum ratione facere sit. Et dolorum error excepturi praesentium voluptas. Fuga quos nesciunt in ipsam enim est tenetur.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(66, 'enim', 2016, 'Gutkowski Ltd', 'Ea ipsum eos facilis ut aut accusamus. Tempore accusantium non nulla. Fuga distinctio quia aut iure vel vero.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(67, 'est', 2004, 'Shanahan-Pfannerstill', 'Laboriosam et est illo eum enim. Libero molestias et id distinctio velit numquam doloremque. Ut quia et itaque quibusdam odit illum placeat. Excepturi fugit at aliquam magni illum.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(68, 'aut', 1991, 'Bogan-Ritchie', 'In excepturi rem eum et a qui. Corporis illum fugit ut qui quasi tenetur. Rerum cumque aliquam et tenetur occaecati aliquid at. Nostrum quisquam at temporibus vel ut.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(69, 'dignissimos', 2003, 'Weber-Parker', 'Et doloribus nobis molestias quod ipsa et cupiditate. Corporis architecto explicabo quo vel ullam distinctio. Ut corrupti ut fuga ut quae.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(70, 'aut', 1999, 'Ernser, Rutherford and Kunze', 'Esse est molestias non qui. Sint animi sint et vitae. Labore sit rerum alias deserunt ut.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(71, 'explicabo', 2001, 'Shields, Eichmann and Wisoky', 'Dolores qui dolores voluptatem ut magnam saepe. Fuga ut earum ullam velit quo omnis. Eligendi ipsam cumque ratione.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(72, 'molestias', 2020, 'Jacobi, Smith and Jones', 'Sapiente consequatur est laborum alias id. Voluptate expedita architecto deserunt neque porro similique. Temporibus delectus autem ut quisquam eum dolores voluptatem. Est repellat aliquam est voluptatem consequatur non qui. Et odio incidunt distinctio mollitia qui et magnam.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(73, 'excepturi', 2020, 'Dickens-Kassulke', 'Voluptatibus eum possimus voluptas qui perspiciatis sint consequatur. Minus porro quam aspernatur molestiae quidem doloribus. Aliquid iusto perferendis aspernatur nesciunt et.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(74, 'soluta', 2020, 'Lynch, Hettinger and Corwin', 'Nostrum molestiae et quos sit accusantium et aut. Asperiores et ut labore totam accusamus consequatur omnis. Aut consequatur in architecto ut non sed. Porro voluptas in commodi amet vel nemo.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(75, 'quaerat', 2009, 'Larkin LLC', 'Sunt modi consequatur nihil consequuntur et possimus culpa. Mollitia ea unde rerum soluta veritatis aliquid eum. Suscipit nihil animi qui quidem voluptas velit illum voluptas.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(76, 'ducimus', 1994, 'Ankunding Group', 'Ut harum reiciendis aut et ut. Repellendus molestiae sed doloribus repudiandae perferendis nihil. Debitis voluptas sint repellat. Ratione aliquid aliquam rerum consequuntur aut ut.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(77, 'pariatur', 2001, 'Swaniawski-Johnston', 'Eius dolor odio quia eveniet. Non eum praesentium consequuntur.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(78, 'quis', 2001, 'Green-Dickinson', 'Exercitationem minus officia in possimus occaecati adipisci rerum aut. Omnis exercitationem doloremque esse et. Nostrum eos ducimus dolorem quia.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(79, 'maiores', 2020, 'Blick LLC', 'Aliquam officiis nisi facilis dolores quibusdam consequatur. Qui dolores recusandae sed earum et molestiae. Sequi soluta nihil dolorem blanditiis sed.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(80, 'incidunt', 2013, 'Kiehn Ltd', 'Corrupti quia ullam dolore voluptatem. Quas exercitationem cum magni vitae velit aut molestias molestiae. Laboriosam debitis est qui ab saepe voluptatem quos. Placeat illum facere corporis vel.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(81, 'veniam', 2012, 'Koss Group', 'Doloremque tempore sit ut fugit vel. Totam harum libero expedita praesentium enim ut expedita. Quam consequuntur blanditiis ea possimus impedit.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(82, 'omnis', 1999, 'Walter-Krajcik', 'Nobis ad occaecati ea aliquid alias. Ipsam non at atque consequatur nihil eos. Qui accusamus dolorum sunt facilis.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(83, 'quam', 1995, 'Beatty Ltd', 'Qui distinctio a velit enim. Incidunt magni excepturi rerum sunt quae et. Vel est id deserunt tempore fugiat consequatur inventore. Aut et consequuntur at est delectus suscipit.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(84, 'voluptatem', 1993, 'Weber, Tremblay and Yost', 'Omnis impedit labore aut enim et et. Aut laborum illo reiciendis dolores. A itaque quia alias et. Est magnam inventore ea voluptas non sed itaque. Architecto reprehenderit inventore suscipit.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(85, 'sed', 2009, 'Lowe-Pollich', 'Voluptatum excepturi et autem sint sit. Aliquid nobis iste ea quia excepturi. Quo ipsum qui necessitatibus corrupti doloremque unde quas.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(86, 'molestiae', 1995, 'Paucek-Wilderman', 'Placeat dolorem cumque doloribus est officiis reiciendis. Harum consectetur ut eos eos.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(87, 'architecto', 2017, 'Rogahn Group', 'Dolores ut accusantium perspiciatis voluptatibus voluptates ipsum ut. Fugit doloribus inventore quis provident quae. Maiores aut sint aut distinctio est ut iure.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(88, 'recusandae', 2014, 'Hirthe, Von and Wisozk', 'Rerum magni architecto quis tenetur aut explicabo. Dolores et corporis mollitia ea unde quis. Quia repellat accusantium voluptatum.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(89, 'laborum', 2022, 'Walter-Stark', 'Fugiat architecto officia sint quia nostrum. Aut voluptas illum rem aut id amet. Consectetur dolor dignissimos quas dolorum ut et.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(90, 'aperiam', 2015, 'Veum Group', 'Quo provident magni illo. Quam et sed dolore. Cum iste ut enim nisi.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(91, 'earum', 2018, 'Ortiz, McDermott and Toy', 'Unde nihil nisi nihil consequatur incidunt. At et nihil ratione voluptatibus cupiditate delectus.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(92, 'tempore', 2007, 'Herman, Langosh and Monahan', 'Sunt dolores quae quae cumque magnam quaerat minima. Odit minus adipisci ut possimus tempore repellat. Corporis rerum nostrum cumque ipsam molestias.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(93, 'nisi', 1992, 'Morissette Inc', 'Iste magni voluptatem dolore ad sapiente blanditiis ab. Modi deleniti consequatur reiciendis rerum. Accusamus id soluta ipsum voluptatem.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(94, 'alias', 2001, 'Koepp-Nicolas', 'Facere omnis sed magni in sapiente ullam omnis. Nobis a sed aut accusantium debitis deserunt rerum. Quidem veniam et ipsa corrupti. Magni voluptatum adipisci ullam totam.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(95, 'enim', 2009, 'Ebert LLC', 'Nihil quo accusamus necessitatibus voluptatibus aut. Iusto eos minus error dolores rerum. Similique et qui hic aut. Facilis omnis beatae tempore fugiat aut molestiae.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(96, 'commodi', 2007, 'Howell, O\'Connell and Stehr', 'Molestias odio expedita mollitia minus laboriosam. Sed ex non deserunt enim. Nostrum ut et sed ab.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(97, 'nulla', 2000, 'Predovic, Stiedemann and Emard', 'Reiciendis molestiae nihil in maxime quia ut. Tempora quia mollitia dolor omnis voluptas quod quis quod.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(98, 'quia', 2000, 'Glover PLC', 'Veniam voluptates vero sit. Consequatur quidem architecto vitae dicta ut. Et assumenda et quo modi debitis.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(99, 'dignissimos', 2022, 'Mayert-Heller', 'Incidunt ea voluptatem dolores et possimus provident aliquam. Dicta voluptatem recusandae iusto ex voluptatem. Quos odit cupiditate voluptatibus et vel temporibus ad. Nihil eum dignissimos molestiae voluptatem error veniam.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31'),
(100, 'rerum', 2007, 'Bechtelar Ltd', 'Voluptate consequatur dolore sed in quo reprehenderit laborum. Dolores dolorem aliquam iure id inventore.', NULL, '2024-11-23 21:49:31', '2024-11-23 21:49:31');

-- --------------------------------------------------------

--
-- Table structure for table `book_category`
--

CREATE TABLE `book_category` (
  `book_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_category`
--

INSERT INTO `book_category` (`book_id`, `category_id`) VALUES
(1, 1),
(3, 1),
(15, 1),
(17, 1),
(21, 1),
(25, 1),
(33, 1),
(39, 1),
(40, 1),
(42, 1),
(43, 1),
(48, 1),
(50, 1),
(65, 1),
(66, 1),
(80, 1),
(88, 1),
(92, 1),
(93, 1),
(96, 1),
(5, 2),
(13, 2),
(22, 2),
(29, 2),
(31, 2),
(34, 2),
(36, 2),
(40, 2),
(48, 2),
(54, 2),
(56, 2),
(60, 2),
(61, 2),
(64, 2),
(82, 2),
(88, 2),
(89, 2),
(93, 2),
(97, 2),
(98, 2),
(1, 3),
(10, 3),
(11, 3),
(12, 3),
(14, 3),
(18, 3),
(22, 3),
(23, 3),
(41, 3),
(46, 3),
(49, 3),
(52, 3),
(56, 3),
(67, 3),
(70, 3),
(84, 3),
(86, 3),
(87, 3),
(88, 3),
(93, 3),
(95, 3),
(97, 3),
(98, 3),
(2, 4),
(8, 4),
(14, 4),
(17, 4),
(19, 4),
(20, 4),
(21, 4),
(24, 4),
(31, 4),
(32, 4),
(37, 4),
(40, 4),
(46, 4),
(47, 4),
(50, 4),
(59, 4),
(60, 4),
(63, 4),
(72, 4),
(74, 4),
(79, 4),
(85, 4),
(90, 4),
(91, 4),
(3, 5),
(4, 5),
(10, 5),
(12, 5),
(16, 5),
(45, 5),
(52, 5),
(54, 5),
(55, 5),
(58, 5),
(66, 5),
(68, 5),
(69, 5),
(77, 5),
(78, 5),
(79, 5),
(84, 5),
(98, 5),
(3, 6),
(6, 6),
(7, 6),
(8, 6),
(23, 6),
(24, 6),
(26, 6),
(32, 6),
(43, 6),
(53, 6),
(71, 6),
(75, 6),
(78, 6),
(80, 6),
(83, 6),
(86, 6),
(92, 6),
(99, 6),
(100, 6),
(1, 7),
(16, 7),
(18, 7),
(20, 7),
(26, 7),
(30, 7),
(35, 7),
(42, 7),
(43, 7),
(44, 7),
(45, 7),
(64, 7),
(69, 7),
(75, 7),
(76, 7),
(80, 7),
(81, 7),
(96, 7),
(8, 8),
(9, 8),
(13, 8),
(15, 8),
(21, 8),
(23, 8),
(27, 8),
(29, 8),
(30, 8),
(38, 8),
(39, 8),
(50, 8),
(51, 8),
(56, 8),
(58, 8),
(86, 8),
(87, 8),
(90, 8),
(92, 8),
(94, 8),
(96, 8),
(2, 9),
(4, 9),
(7, 9),
(10, 9),
(28, 9),
(29, 9),
(31, 9),
(33, 9),
(38, 9),
(46, 9),
(51, 9),
(60, 9),
(69, 9),
(73, 9),
(90, 9),
(97, 9),
(4, 10),
(7, 10),
(12, 10),
(14, 10),
(15, 10),
(18, 10),
(22, 10),
(24, 10),
(33, 10),
(41, 10),
(44, 10),
(45, 10),
(49, 10),
(52, 10),
(54, 10),
(57, 10),
(59, 10),
(62, 10),
(63, 10),
(64, 10),
(67, 10),
(72, 10),
(76, 10),
(78, 10),
(85, 10),
(89, 10);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Et quo.', '2024-11-23 21:49:30', '2024-11-23 21:49:30'),
(2, 'Est.', '2024-11-23 21:49:30', '2024-11-23 21:49:30'),
(3, 'Omnis.', '2024-11-23 21:49:30', '2024-11-23 21:49:30'),
(4, 'Optio.', '2024-11-23 21:49:30', '2024-11-23 21:49:30'),
(5, 'Quam temporibus.', '2024-11-23 21:49:30', '2024-11-23 21:49:30'),
(6, 'Rem.', '2024-11-23 21:49:30', '2024-11-23 21:49:30'),
(7, 'Accusamus sed.', '2024-11-23 21:49:30', '2024-11-23 21:49:30'),
(8, 'Dicta.', '2024-11-23 21:49:30', '2024-11-23 21:49:30'),
(9, 'Omnis.', '2024-11-23 21:49:30', '2024-11-23 21:49:30'),
(10, 'Distinctio.', '2024-11-23 21:49:30', '2024-11-23 21:49:30');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_23_065440_create_books_table', 1),
(5, '2024_11_23_065632_create_categories_table', 1),
(6, '2024_11_23_070729_create_book_category_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('WqddnEUM4KkbHKfHCF2vrjk1NWoFAryyZWKyDFQl', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQ29haFhTYmhzU0ZsV3k0a2ZwSWlESTdEM3J3SUhremd4VnVFN1V0diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9wZXJwdXN0YWthYW4udGVzdC9yZWdpc3RlciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1732423924);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Rama Adi', 'test@example.com', NULL, '$2y$12$gJQGI0c0yLI53PnYLcmR5.Njg5eTM21aY.xgkCgBgKiYiBiWsg5sW', NULL, '2024-11-23 21:52:00', '2024-11-23 21:52:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `books_borrower_id_foreign` (`borrower_id`);

--
-- Indexes for table `book_category`
--
ALTER TABLE `book_category`
  ADD UNIQUE KEY `book_category_book_id_category_id_unique` (`book_id`,`category_id`),
  ADD KEY `book_category_category_id_foreign` (`category_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_borrower_id_foreign` FOREIGN KEY (`borrower_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `book_category_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
