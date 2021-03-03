-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Mar 03, 2021 at 05:22 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `treasurehuntbot`
--

-- --------------------------------------------------------

--
-- Table structure for table `assigned_locations`
--

CREATE TABLE `assigned_locations` (
  `game_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `assigned_on` datetime NOT NULL,
  `reached_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assigned_riddles`
--

CREATE TABLE `assigned_riddles` (
  `event_id` int(10) UNSIGNED NOT NULL,
  `game_id` int(10) UNSIGNED NOT NULL,
  `riddle_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `assigned_on` datetime NOT NULL,
  `last_answer_on` datetime DEFAULT NULL,
  `solved_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `code_lookup`
--

CREATE TABLE `code_lookup` (
  `code` varchar(20) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `type` enum('creation','registration','location','victory') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'location',
  `event_id` int(10) UNSIGNED DEFAULT NULL,
  `game_id` int(10) UNSIGNED DEFAULT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `is_disabled` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Marks code as disabled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `code_lookup`
--

INSERT INTO `code_lookup` (`code`, `type`, `event_id`, `game_id`, `location_id`, `is_disabled`) VALUES
('codeweek2020', 'registration', NULL, 1, NULL, b'0'),
('cw2020-01-2bpg', 'location', NULL, 1, 1, b'0'),
('cw2020-02-XIgS', 'location', NULL, 1, 2, b'0'),
('cw2020-03-knkA', 'location', NULL, 1, 3, b'0'),
('cw2020-04-W84U', 'location', NULL, 1, 4, b'0'),
('cw2020-05-JyGa', 'location', NULL, 1, 5, b'0'),
('cw2020-06-3E41', 'location', NULL, 1, 6, b'0'),
('cw2020-08-eFu7', 'location', NULL, 1, 8, b'0'),
('cw2020-09-xeO4', 'location', NULL, 1, 9, b'0'),
('cw2020-10-vs1q', 'location', NULL, 1, 10, b'0'),
('cw2020-12-bGiJ', 'location', NULL, 1, 12, b'0'),
('cw2020-14-gyuj', 'location', NULL, 1, 14, b'0'),
('cw2020-15-Xc7v', 'location', NULL, 1, 15, b'0'),
('cw2020-16-FCgK', 'location', NULL, 1, 16, b'0'),
('cw2020-17-imhZ', 'location', NULL, 1, 17, b'0'),
('cw2020-18-PmUt', 'location', NULL, 1, 18, b'0'),
('cw2020-19-40Ps', 'location', NULL, 1, 19, b'0'),
('cw2020-20-Kek9', 'location', NULL, 1, 20, b'0'),
('cw2020-21-sQoD', 'location', NULL, 1, 21, b'0'),
('cw2020-22-Ksn4', 'location', NULL, 1, 22, b'0'),
('cw2020-23-qwlq', 'location', NULL, 1, 23, b'0'),
('cw2020-24-nOIL', 'location', NULL, 1, 24, b'0'),
('cw2020-25-vbpZ', 'location', NULL, 1, 25, b'0'),
('cw2020-26-d2VD', 'location', NULL, 1, 26, b'0'),
('cw2020-27-KQaT', 'location', NULL, 1, 27, b'0'),
('cw2020-28-dHJT', 'location', NULL, 1, 28, b'0'),
('cw2020-29-YNiq', 'location', NULL, 1, 29, b'0'),
('cw2020-30-nA8p', 'location', NULL, 1, 30, b'0'),
('cw2020-31-hC27', 'location', NULL, 1, 31, b'0'),
('cw2020-32-LNoI', 'location', NULL, 1, 32, b'0'),
('cw2020-33-G8Nx', 'location', NULL, 1, 33, b'0'),
('cw2020-34-hsqW', 'location', NULL, 1, 34, b'0'),
('cw2020-35-e3ZU', 'location', NULL, 1, 35, b'0'),
('cw2020-36-vfYY', 'location', NULL, 1, 36, b'0'),
('cw2020-37-ON2u', 'location', NULL, 1, 37, b'0'),
('cw2020-38-b9XU', 'location', NULL, 1, 38, b'0'),
('cw2020-39-F88A', 'location', NULL, 1, 39, b'0'),
('cw2020-40-CLdw', 'location', NULL, 1, 40, b'0'),
('cw2020-41-5R3T', 'location', NULL, 1, 41, b'0'),
('cw2020-42-5Gdn', 'location', NULL, 1, 42, b'0'),
('cw2020-43-DzX0', 'location', NULL, 1, 43, b'0'),
('cw2020-44-vBvY', 'location', NULL, 1, 44, b'0'),
('cw2020-45-NKEe', 'location', NULL, 1, 45, b'0'),
('cw2020-46-VpgU', 'location', NULL, 1, 46, b'0'),
('cw2020-47-YXCv', 'location', NULL, 1, 47, b'0'),
('cw2020-48-EW0a', 'location', NULL, 1, 48, b'0'),
('cw2020-49-wdGf', 'location', NULL, 1, 49, b'0'),
('cw2020-50-fiS3', 'location', NULL, 1, 50, b'0'),
('cw2020-51-GIWE', 'location', NULL, 1, 51, b'0'),
('cw2020-52-91Vh', 'location', NULL, 1, 52, b'0'),
('cw2020-53-o0TL', 'location', NULL, 1, 53, b'0'),
('cw2020-54-on1J', 'location', NULL, 1, 54, b'0'),
('cw2020-55-xg2X', 'location', NULL, 1, 55, b'0'),
('cw2020-56-Hnor', 'location', NULL, 1, 56, b'0'),
('cw2020-57-CdaQ', 'location', NULL, 1, 57, b'0'),
('cw2020-58-Ds5W', 'location', NULL, 1, 58, b'0'),
('cw2020-59-gQmd', 'location', NULL, 1, 59, b'0'),
('cw2020-61-agiq', 'location', NULL, 1, 61, b'0'),
('cw2020-62-V9Xs', 'location', NULL, 1, 62, b'0'),
('cw2020-63-0X8o', 'location', NULL, 1, 63, b'0'),
('cw2020-64-xcv4', 'location', NULL, 1, 64, b'0'),
('cw2020-65-poi7', 'location', NULL, 1, 65, b'0'),
('cw2020-66-beva', 'location', NULL, 1, 66, b'0'),
('free-to-play', 'creation', 2, NULL, NULL, b'0'),
('nottericercatori', 'registration', NULL, 2, NULL, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `conversation_memories`
--

CREATE TABLE `conversation_memories` (
  `telegram_id` int(11) NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `last_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `logo_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registered_on` datetime NOT NULL,
  `min_num_locations` tinyint(3) UNSIGNED NOT NULL DEFAULT '10' COMMENT 'Minimum number of locations',
  `max_num_locations` tinyint(3) UNSIGNED NOT NULL DEFAULT '30' COMMENT 'Maximum number of locations',
  `organizer_id` int(10) UNSIGNED NOT NULL,
  `min_avg_distance` float DEFAULT NULL COMMENT 'Minimum average distance between locations (in kms)',
  `telegram_channel` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `name`, `state`, `logo_path`, `registered_on`, `min_num_locations`, `max_num_locations`, `organizer_id`, `min_avg_distance`, `telegram_channel`) VALUES
(1, 'Code Week 2020', 255, NULL, '2020-10-05 21:18:26', 6, 12, 1, NULL, NULL),
(2, 'Free to play', 192, NULL, '2021-03-01 18:48:02', 8, 30, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `game_id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED DEFAULT NULL,
  `state` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_lat` float DEFAULT NULL,
  `location_lng` float DEFAULT NULL,
  `language` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organizer_id` int(10) UNSIGNED NOT NULL,
  `organizer_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `badge_overlay_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telegram_channel` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telegram_channel_censor_photo` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Set if pictures should not be sent on the channel',
  `quick_start` tinyint(1) NOT NULL DEFAULT '0',
  `location_hints_enabled` bit(1) NOT NULL DEFAULT b'0',
  `location_map_url` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timeout_absolute` datetime DEFAULT NULL COMMENT 'Absolute timeout when game ends',
  `timeout_interval` smallint(6) DEFAULT NULL COMMENT 'Relative timeout in minutes from start',
  `registered_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`game_id`, `event_id`, `state`, `name`, `location_name`, `location_lat`, `location_lng`, `language`, `organizer_id`, `organizer_email`, `badge_overlay_image`, `telegram_channel`, `telegram_channel_censor_photo`, `quick_start`, `location_hints_enabled`, `location_map_url`, `timeout_absolute`, `timeout_interval`, `registered_on`) VALUES
(1, 1, 128, 'Code Week 2020', 'Europe', NULL, NULL, 'en', 1, NULL, NULL, NULL, b'0', 0, b'1', 'https://codeweek.eu/code-hunting-game', NULL, NULL, '2020-10-05 21:21:49'),
(2, 1, 128, 'La Notte dei Ricercatori', 'Italy', NULL, NULL, 'it', 1, NULL, NULL, NULL, b'0', 0, b'0', 'https://umap.openstreetmap.fr/it/map/inaf-code-hunting-game_526996#6/41.860/11.821', NULL, NULL, '2020-11-18 17:20:20');

-- --------------------------------------------------------

--
-- Table structure for table `game_location_clusters`
--

CREATE TABLE `game_location_clusters` (
  `game_id` int(10) UNSIGNED NOT NULL,
  `cluster_id` tinyint(3) UNSIGNED NOT NULL,
  `num_locations` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of locations to reach in this cluster',
  `description` text COLLATE utf8_unicode_ci,
  `force_location_on_enter` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `game_location_clusters`
--

INSERT INTO `game_location_clusters` (`game_id`, `cluster_id`, `num_locations`, `description`, `force_location_on_enter`) VALUES
(1, 1, 8, 'Main cluster', b'0'),
(2, 1, 8, 'Main cluster', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `game_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `participants_count` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `photo_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Path to the group''s photo',
  `registered_on` datetime NOT NULL COMMENT 'Original generation timestamp',
  `last_state_change` datetime NOT NULL COMMENT 'Timestamp of last state change',
  `timeout_absolute` datetime DEFAULT NULL COMMENT 'Absolute timeout when game ends for this group',
  `final_location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hints`
--

CREATE TABLE `hints` (
  `event_id` int(10) UNSIGNED NOT NULL,
  `riddles_solved_count` tinyint(3) UNSIGNED NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `identities`
--

CREATE TABLE `identities` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Internal ID',
  `telegram_id` int(11) NOT NULL,
  `first_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_seen_on` datetime NOT NULL,
  `last_access` datetime NOT NULL,
  `language` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `active_game` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `identities`
--

INSERT INTO `identities` (`id`, `telegram_id`, `first_name`, `full_name`, `first_seen_on`, `last_access`, `language`, `is_admin`, `active_game`) VALUES
(1, 178430499, 'Lorenz', 'Lorenz Klopfenstein', '2020-10-05 16:41:47', '2020-10-06 09:14:15', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `game_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `cluster_id` tinyint(3) UNSIGNED NOT NULL,
  `internal_note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `image_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `hint` text COLLATE utf8_unicode_ci COMMENT 'Optional hint when user fails',
  `geohash` varchar(12) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `is_start` bit(1) NOT NULL DEFAULT b'0',
  `is_end` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`game_id`, `location_id`, `cluster_id`, `internal_note`, `lat`, `lng`, `image_path`, `description`, `hint`, `geohash`, `is_start`, `is_end`) VALUES
(1, 1, 1, 'BARK', 59.3399, 18.0548, NULL, 'Find the place where the first Swedish computer was built.', 'It is the biggest town in Sweden.', 'u6scdf7p', b'0', b'0'),
(1, 2, 1, 'The Antikythera mechanism', 35.8621, 23.305, NULL, 'Find the place of a hand-powered device that was used to predict astronomical positions.', 'It took its name from the Greek island where it was found.', 'sw2s426p', b'0', b'0'),
(1, 3, 1, 'Micro-processor co-inventor', 45.5469, 11.5465, NULL, 'Find the place of birth of the man who created a technology that made the microprocessor possible.', 'This city is close to Venice in Italy.', 'u205nexc', b'0', b'0'),
(1, 4, 1, 'Printed circuit board', 48.2082, 16.3738, NULL, 'Find the place of study of the man who created the printed circuit board.', 'Paul Eislier studied in a German speaking capital situated on the Danube. ', 'u2edk851', b'0', b'0'),
(1, 5, 1, 'BASIC', 47.5039, 19.0548, NULL, 'Find the place of birth of the man who co-created the BASIC programming language.', 'John George Kemeny was born in ninth-largest city in the European Union.', 'u2mw1xg6', b'0', b'0'),
(1, 6, 1, 'The Jacquard loom', 45.764, 4.8357, NULL, 'Find the place where a weaver who played an important role in the development of hte earlierst programmable loom came from.', 'The third largest city in France.', 'u05kq514', b'0', b'0'),
(1, 8, 1, 'Line Rider', 46.0321, 14.5278, NULL, 'Find the place where the inventor of Line Rider went to school.', 'It’s the capital city of an EU country with LOVE in its name.', 'u24mfefu', b'0', b'0'),
(1, 9, 1, 'Pioneer of the net.art movement', 44.8149, 20.1424, NULL, 'Find the place of one of the pioneers of the net.art movement.', 'Look for a pin where Danube meets the river Sava.', 'sryqfq71', b'0', b'0'),
(1, 10, 1, 'Online calendar ', 47.3727, 8.53083, NULL, 'Find the city hosting a huge online calendar.', 'The country is known for its alps, chocolate and its citizens have the reputation of always being on time.', 'u0qj6pgv', b'0', b'0'),
(1, 12, 1, 'Rossum\'s Universal Robots', 50.081, 14.4114, NULL, 'Find the city where the word \"robot\" was used in public for the first time in 1921.', 'The play is called RUR - Rossum\'s Universial Robots.', 'u2fhzuyn', b'0', b'0'),
(1, 14, 1, 'Talos: The first robot in Mythology', 35.2985, 25.1596, NULL, 'Meet the first robot of Greek mythology.', 'His home was at the largest Greek island. ', 'sw3bu9bs', b'0', b'0'),
(1, 15, 1, 'Francisco Salvá y Campillo (1751-1828)', 41.3842, 2.17069, NULL, 'Meet the Pioneer of the Electric Telegraph.', 'Look for a city famous for its football club, unfinished cathedral and one of the most important museums of Pablo Picasso. ', 'sp3e3mu8', b'0', b'0'),
(1, 16, 1, 'Museum of calculating machines. ', 43.7151, 10.3913, NULL, 'Find the city where you can visit a Museum of calculating machines.', 'Look for an Italian city with a white tower where Galileo Galilei conducted experiments to understand gravity.  ', 'spz2sqnd', b'0', b'0'),
(1, 17, 1, 'CER-10: first digital computer in Southern Europe', 44.7584, 20.5984, NULL, 'Find the home of the first digital computer in Southern Europe.', 'The place is near the city that is at the heart of Balkan peninsula and its name translated to English means “White town”\".\"', 'srywssp2', b'0', b'0'),
(1, 18, 1, 'First true autonomous machine capable of playing chess', 40.4168, -3.70379, NULL, 'Find the place where the first computer game was born.', 'Look for the EU capital that is built in the highest altitude.', 'ezjmgtwu', b'0', b'0'),
(1, 19, 1, 'K-2020 first Polish minicomputer', 52.2, 21.0333, NULL, 'Find the place where the Polish minicomputer K-202 was developed.', 'Look for an east-European city that is often nicknamed “Phoenix city” and where you can find the world’s narrowest house.', 'u3qbywez', b'0', b'0'),
(1, 20, 1, 'The First Computer Programmer', 51.5074, -0.127759, NULL, 'Meet the world\'s first computer programmer.', 'Look for a place where a big eye overlooks the city\'s iconic river.', 'gcpvj0du', b'0', b'0'),
(1, 21, 1, 'Marenostrum supercomputer', 41.3896, 2.11614, NULL, 'Find the home of the most powerful supercomputer in Spain.', 'The supercomputer is installed in the Chapel Torre Girona in the city of Gaudi\'s colourful mosaics.', 'sp3e2nsz', b'0', b'0'),
(1, 22, 1, 'Inventor of C++', 56.1677, 10.1905, NULL, 'Meet the inventor of C++.', 'Look for a seaside city, named European Capital of Culture in 2017, that is known as “The city of smiles”.', 'u1zpxch2', b'0', b'0'),
(1, 23, 1, 'János von Neumann', 47.5087, 19.074, NULL, 'Meet the computer scientist and engineer who designed the architecture for electronic digital computer.', 'He was born in the city on the Danube river famous for its baths and the magnificent Parliament building', 'u2mw609q', b'0', b'0'),
(1, 24, 1, '„The Turk” - fake chess playing machine', 48.1486, 17.1077, NULL, 'Meet the Austro-Hungarian inventor of an old famous chess-playing automation hoax.', 'Look for a big Slovak city whose name used to be Pressburg.', 'u2s1vm1m', b'0', b'0'),
(1, 25, 1, 'Paper transistor', 39.4592, -8.66799, NULL, 'Find the birth place of the Portuguese inventor of the first paper transistor.', 'The city lays half-way between the current and the former capital of Portugal', 'ez1b6z24', b'0', b'0'),
(1, 26, 1, 'Portuguese satellite ISTsat-1', 38.7368, -9.13871, NULL, 'Find the place where ISTsat-1 - the first Portuguese satellite made by students - was developed.', 'A city of delicious Pastel de nata.', 'eycs25c6', b'0', b'0'),
(1, 27, 1, 'CINECA - Italy\'s largest computing centre', 44.4863, 11.26, NULL, 'Find the home of CINECA - the the largest Italian computing centre and one of the most important worldwide.', 'Look around the Italian city with the oldest university in the world.', 'srbj04rr', b'0', b'0'),
(1, 28, 1, 'HP-35 scienitfic pocket calculator', 46.186, 14.5956, NULL, 'Find the country of one of the  inventors of the first scientific pocket calculator.', 'The inventor was born in a city north of Llubljana.', 'u24qspuh', b'0', b'0'),
(1, 29, 1, 'Talking Tom and Friends', 46.0669, 14.5392, NULL, 'Find the country of origin of one of the most downloaded smartphone game of all times.', 'It involves a cute cat, called Tom and the place sits on a formal Roman city called Emona. ', 'u24q4f5p', b'0', b'0'),
(1, 30, 1, 'Global Navigation Satellite Systems Agency', 50.0981, 14.4327, NULL, 'Find the headquarters of the Galileo project which provides navigation and location services around the world.', 'The Global Navigation Satellite Systems Agency is the headquarters.', 'u2fm02jd', b'0', b'0'),
(1, 31, 1, 'Leonardo’s robot', 43.798, 10.9342, NULL, 'Find the birth place of a true renaissance man and a great Italian inventor.', 'Search in the mountains west from the Tuscany’s capital.', 'spzc0v4j', b'0', b'0'),
(1, 32, 1, 'Bluetooth developer', 52.7748, 6.89884, NULL, 'Find the birth place of the man who developed the specifications of Bluetooth.', 'He worked for Ericsson in Sweden, but comes from a country with windwills.', 'u1kuhzre', b'0', b'0'),
(1, 33, 1, 'Algol 60', 55.6805, 12.5444, NULL, 'Find the capital of the country where the developer of Algol 60 comes from.', 'This capital has a nice Tivoli.', 'u3buv2qd', b'0', b'0'),
(1, 34, 1, 'The Rubik’s Cube', 47.5172, 18.9898, NULL, 'Meet the man who invented world’s most famous cube.', 'He lived in a European capital divided by EU’s longest river with mountains on one side and flat countryside on the other.', 'u2mw245z', b'0', b'0'),
(1, 35, 1, 'Casper the playful robot', 38.737, -9.13883, NULL, 'Find the place where this robot helps children with cancer.', 'His name is Casper and his city welcomes visitors with cute yellow trams.', 'eycs25c7', b'0', b'0'),
(1, 36, 1, 'The Snake game', 60.2214, 24.7571, NULL, 'Find the place of the Nordic phone maker which made a serpent game very popular.', 'This is the country of Santa Claus.', 'ud9we6gx', b'0', b'0'),
(1, 37, 1, 'Angry birds', 60.1765, 24.8343, NULL, 'Find out where the angry birds and pigs live.', 'Game made by Rovio a company based inext to EU’s northernmost capital city. ', 'ud9wm4gc', b'0', b'0'),
(1, 38, 1, 'MP3 format', 49.5475, 11.02, NULL, 'Meet the team who developed the MP3 technology.', 'Look around the German \"Land\" known for lager beer festivities.\"', 'u0zcfgbe', b'0', b'0'),
(1, 39, 1, 'SAPO, world’s first fault-tolerant computer', 50.1017, 14.3415, NULL, 'Find the birth place of the first known fault-tolerant computer SAPO.', 'Look for the city where the Velvet revolution in 1989 took place.', 'u2fjn2ep', b'0', b'0'),
(1, 40, 1, 'Python', 52.3699, 4.89374, NULL, 'Find the place where the programming language Python was invented.', 'This capital is known for its canals and bikes.', 'u173zmes', b'0', b'0'),
(1, 41, 1, 'Charles Simonyi, the father of MS Office', 47.4734, 19.053, NULL, 'Find the birth place of the developer of MS Word and MS Excel.', 'Search in the 9th biggest city in the EU.', 'u2mw1d3b', b'0', b'0'),
(1, 42, 1, 'Linux', 60.1726, 24.951, NULL, 'Find the place where the developer of Linux, studied.', 'Capital of Finland.', 'ud9wrf0f', b'0', b'0'),
(1, 43, 1, 'Bluetooth', 55.7047, 13.191, NULL, 'Find the place where a viking inspired a wireless technology.', 'Harald Blåtand united dissonant Danish tribes into a single kingdom.', 'u3ckuhtr', b'0', b'0'),
(1, 44, 1, 'The World Wide Web', 46.2338, 6.05568, NULL, 'Find the place where the World Wide Web was invented.', 'The country is known for its cuckoo clocks and mountains.', 'u0hr1b9e', b'0', b'0'),
(1, 45, 1, 'Dennis Gabor, inventor of the hologram', 47.4798, 19.0736, NULL, 'Meet the inventor of the hologram.', 'He was born in a city on a big European river with 80 geothermal springs.', 'u2mw452v', b'0', b'0'),
(1, 46, 1, 'SMS Nation', 60.1871, 24.9376, NULL, 'Find the country which was first in the world to offer SMS functionality commercially.', 'It’s a nothern country with thousands of lakes.', 'ud9wrkxp', b'0', b'0'),
(1, 47, 1, 'Polar: the world’s first wearable wire-free heart rate monitor', 64.9426, 25.4446, NULL, 'Meet the company that inventer the first wearable wire-free hart rate monitor.', 'The company’s headquaters is almost beyond the polar cercle.', 'ued17n2n', b'0', b'0'),
(1, 48, 1, 'Daniel Ek, founder of Spotify', 59.3355, 18.061, NULL, 'Meet the founder of Spotify.', 'His birth place is in one of Europe’s northen capitals', 'u6scdcxw', b'0', b'0'),
(1, 49, 1, 'Frédéric Mazzella - founder of BlaBlaCar', 47.2165, -1.5556, NULL, 'Meet the founder of BlaBlaCar.', 'His birth place is in the 6th biggest French city', 'gbqusee0', b'0', b'0'),
(1, 50, 1, 'Charles Babbage', 51.5039, -0.088305, NULL, 'Meet the man who originated the concept of a digital programmable computer.', 'He was born in the city famous for its Shard and Eye', 'gcpuvzzx', b'0', b'0'),
(1, 51, 1, 'The Turing machine', 51.5074, -0.1278, NULL, 'Meet one of the fathers of artificial intelligence.', 'He developped the Turing machine.', 'gcpvj0du', b'0', b'0'),
(1, 52, 1, 'Roman Stanisław Ingarden', 50.0647, 19.945, NULL, 'Meet the grand-father of the quantum information theory.', 'He was born in a city at the bottom of the highest Polish mountains.', 'u2yhvf58', b'0', b'0'),
(1, 53, 1, 'Piz Daint, Europe’s most powerful supercomputer', 46.0246, 8.96007, NULL, 'Find Europe’s most powerful supercomputer.', 'Search for a Swiss city which lays on board of a lake that hold’s the city’s name.', 'u0nmgfs8', b'0', b'0'),
(1, 54, 1, 'Hövding, the Chief', 55.605, 13.0038, NULL, 'Find the place of birth of the airbag bicycle helmet.', 'The town is known for the Turning Torso.', 'u3chrft4', b'0', b'0'),
(1, 55, 1, 'Micro IP', 65.5848, 22.1567, NULL, 'Meet the inventor of the micro IP.', 'Adam Dunkles was born in this northern Scandinavian town.', 'u7xv05q5', b'0', b'0'),
(1, 56, 1, 'Online voting', 58.5953, 25.0136, NULL, 'Find the country that was the first to adopt online voting.', 'The country’s flag is blue, black and white.', 'ud3v34yq', b'0', b'0'),
(1, 57, 1, '.eu', 50.8503, 4.3517, NULL, 'Find the headquarters of the .eu domain.', 'This city also host the European Commission and the European Parliament.', 'u151710b', b'0', b'0'),
(1, 58, 1, 'Bletchley Park', 51.9966, -0.743149, NULL, 'Find the victorian estate where a team of cryptographers worked during WW2 to break the ENIGMA codes used by Nazi Germany.', 'Search for a town in the United Kingdom, not far north from London.', 'gcprz1dy', b'0', b'0'),
(1, 59, 1, 'Alan Turing', 53.3285, -2.20738, NULL, 'Find the house where a famous matematician, cryptographer, computer scientist, and pioneer of artificial intelligence spent his childhood.', 'He gave a fundamental contribution to breaking the Enigma code.', 'gcqrmu0t', b'0', b'0'),
(1, 61, 1, 'George Boole', 53.2183, -0.625536, NULL, 'Find the town where the father of Boolean algebra was born.', 'The word “Boolean” comes from the last name of the mathematician who invented algebraic logic', 'gcrwcb07', b'0', b'0'),
(1, 62, 1, 'Harry Nyquist', 59.5035, 13.3196, NULL, 'Find the European town where one of the two scientis who developed a famous sampling theorem is born.', 'The ?–Shannon sampling theorem is a theorem in the field of digital signal processing and led to the to the development of information theory.', 'u696x071', b'0', b'0'),
(1, 63, 1, 'ELEA 9003', 45.4543, 7.85498, NULL, 'Find the town where the first computer to be entirely made with transistors.', 'Adriano Olivetti was born there in 1901.', 'u0jdddxy', b'0', b'0'),
(1, 64, 1, 'Joyce Aylard', 51.5785, -0.389534, NULL, 'Find the place where one of the female codebreakers worked during WW2.', 'Joyce Aylard worked at an outstation not far from Bletchley Park.', 'gcptrjs6', b'0', b'0'),
(1, 65, 1, 'MIRALab', 46.1999, 6.14483, NULL, 'Find the University where the MIRALab is conducting user interface research.', 'The lab is headed by Nadia Magnenat Thalmann, an eminent computer graphics expert and robotician.', 'u0hqgf6w', b'0', b'0'),
(1, 66, 1, 'NORSAR', 59.9751, 11.045, NULL, 'Find the first European site connected to the ARPANET.', 'The site also hosts the Norwegian Seismic Array.', 'u4xv5q4s', b'0', b'0'),
(2, 1, 1, 'Aeroporto di Taranto-Grottaglie', 40.5173, 17.4024, NULL, 'Trova quello che presto diventerà il primo Spazioporto italiano', 'Cerca nel tacco dello stivale', 'srhqkpbn', b'0', b'0'),
(2, 2, 1, 'Angelo Secchi', 44.6966, 10.6269, NULL, 'Incontra colui che propose la prima classificazione stellare basata su criteri spettroscopici', 'Cerca a Reggio Emilia, dove nacque il 28 giugno 1818 in una piccola casa di via Porta Brennone', 'spzw3bf2', b'0', b'0'),
(2, 3, 1, 'Angioletta Coradini', 41.8389, 12.6469, NULL, 'Incontra colei che fu direttrice dell\'Istituto di Fisica dello Spazio Interplanetario dal 2001 al 2010', 'Vai all\'indirizzo dell\'istituto che ha diretto Margherita Hack', 'sr2ypb91', b'0', b'0'),
(2, 4, 1, 'Agenzia Spaziale Italiana', 41.8552, 12.6195, NULL, 'Trova l’ente governativo italiano che ha il compito di predisporre e attuare la politica aerospaziale italiana', 'Cerca vicino all\'Università degli Studi di Roma Tor Vergata', 'sr2yp5t0', b'0', b'0'),
(2, 5, 1, 'Atlante Farnese', 40.8538, 14.2505, NULL, 'Trova la scultura che possiede la più antica e una delle più complete raffigurazioni delle costellazioni', 'Cerca nel Museo archeologico nazionale di Napoli', 'sr60km0y', b'0', b'0'),
(2, 6, 1, 'Basilica di San Lorenzo', 43.7751, 11.2538, NULL, 'Trova la basilica con una volta affrescata del cielo del 4 luglio 1442', 'Cerca nella Sagrestia Vecchia della basilica di San Lorenzo a Firenze', 'srb1014b', b'0', b'0'),
(2, 7, 1, 'Basilica di Santa Croce', 43.7685, 11.2625, NULL, 'Trova il pantheon italiano dove è stato sepolto Galileo Galilei', 'Cerca un simbolo prestigioso di Firenze', 'srb0brc1', b'0', b'0'),
(2, 8, 1, 'Basilica di Santa Maria degli Angeli e dei Martiri', 41.9035, 12.4973, NULL, 'Trova la basilica della capitale al cui interno si trova una meridiana di notevole interesse storico e artistico', 'Cerca la chiesa dove si svolgono le cerimonie ufficiali della Repubblica Italiana', 'sr2ykkk3', b'0', b'0'),
(2, 9, 1, 'Basilica di Santa Maria Novella ', 43.7741, 11.2495, NULL, 'Trova la chiesa di Firenze sulla cui facciata è riportato un laboratorio astronomico', 'Cerca la facciata capolavoro rinascimentale di Leon Battista Alberti, a Firenze', 'spzcpbzd', b'0', b'0'),
(2, 10, 1, 'Campanile di Giotto', 43.7728, 11.2557, NULL, 'Trova il campanile attorno al quale è scolpito il bassorilievo di un astronomo', 'Cerca in Piazza del Duomo, a Firenze', 'srb100s5', b'0', b'0'),
(2, 11, 1, 'Centro di geodesia spaziale Giuseppe Colombo', 40.6492, 16.7042, NULL, 'Trova il centro di geodesia spaziale dell\'Agenzia Spaziale Italiana', 'Cerca sul limite occidentale delle Murge.', 'sr5zhpgw', b'0', b'0'),
(2, 12, 1, 'Centro Visite Torre dei Guardiani', 40.9863, 16.4328, NULL, 'Trovo un luogo privilegiato per le osservazioni astronomiche situato nel Parco Nazionale dell\'Alta Murgia', 'Cerca in Puglia, nel Parco Nazionale dell\'Alta Murgia', 'sr79jvmf', b'0', b'0'),
(2, 13, 1, 'Città della scienza', 40.8056, 14.1747, NULL, 'Trova la sede del festival di divulgazione scientifica Futuro Remoto', 'Cerca sul Golfo di Napoli', 'sr604s3t', b'0', b'0'),
(2, 15, 1, 'CTAO Headquarter', 44.5219, 11.3367, NULL, 'Trova il quartier generale del Cherenkov Telescope Array Observatory', 'Cerca a Bologna, vicino al Navile', 'srbj3bzn', b'0', b'0'),
(2, 16, 1, 'Enrico Fermi', 41.8971, 12.4931, NULL, 'Incontra il nobel per la Fisica nel 1938', 'Cerca nella città Natale del premio Nobel per la Fisica nel 1938', 'sr2yk71h', b'0', b'0'),
(2, 17, 1, 'ESRIN', 41.8274, 12.6745, NULL, 'Trova uno dei sei centri dell\'Agenzia Spaziale Europea responsabile per il telerilevamento', 'Cerca uno dei sei centri dell\'ESA, poco fuori Roma', 'sr3jbqmq', b'0', b'0'),
(2, 18, 1, 'Ex sede dell\'INAF Osservatorio Astronomico di Cagliari', 39.1369, 8.97315, NULL, 'Trova la vecchia sede dell\'Osservatorio Astronomico di Cagliari', 'Cerca nel Poggio sardo dove gli alberi spargono i loro aghi ed un tempo si studiavano le stelle', 'snyqshwh', b'0', b'0'),
(2, 19, 1, 'Galileo Galilei', 43.7163, 10.4058, NULL, 'Incontra il padre della scienza moderna', 'Cerca la sua casa Natale, vicino alla Chiesa di Sant\'Andrea Forisportam', 'spz2sy33', b'0', b'0'),
(2, 20, 1, 'Giovanni Domenico Cassini', 43.8669, 7.67435, NULL, 'Incontra colui a cui è intitolata la Divisione negli anelli di Saturno', 'Cerca nel suo luogo di nascita, lungo l\'esile cresta collinare che si stacca a levante dal nodo dei monti Bignone e Caggio', 'spv3w9sr', b'0', b'0'),
(2, 21, 1, 'Giovanni Virginio Schiaparelli', 45.4718, 9.18899, NULL, 'Incontra colui che nel 1877 fece fondamentali osservazioni del Pianeta rosso', 'Cerca la Cupola Schiaparelli, a Milano', 'u0nd9jgh', b'0', b'0'),
(2, 22, 1, 'Giulio Fabrizio Tomasi Principe di Lampedusa', 38.1649, 13.3287, NULL, 'Incontra il principe che ispirò il Gattopardo', 'Vai nel luogo in cui è nato Giulio Fabrizio Tomasi Principe di Lampedusa', 'sqc3p79w', b'0', b'0'),
(2, 23, 1, 'Giuseppe Occhialini', 43.689, 12.8061, NULL, 'Incontra colui al quale hanno intitolato il satellite per alte energie SAX, BeppoSAX', 'Cerca il luogo in cui Giuseppe Occhialini è nato', 'src0e3m4', b'0', b'0'),
(2, 24, 1, 'Guglielmo Marconi', 44.4314, 11.2675, NULL, 'Incontra il Nobel per la Fisica nel 1909', 'Cerca il luogo, vicino a Bologna, in cui Marconi compì i suoi primi esperimenti di radiotrasmissione', 'srbhb2kx', b'0', b'0'),
(2, 25, 1, 'Il marmo zodiacale intarsiato nel pavimento di San Miniato al Monte ', 43.7595, 11.2651, NULL, 'Trova la Basilica nel cui pavimento è intarsiato uno zodiaco di marmo del 1207, di cui recentemente si è scoperto l’uso astronomico (di segnalazione del solstizio estivo)  ', '\'Cerca la Basilica con la scritta \"Haec est porta coeli\"\'', 'srb0bq4v', b'0', b'0'),
(2, 26, 1, 'INAF IAPS Roma', 41.8401, 12.6489, NULL, 'Trova l’Istituto di astrofisica e planetologia spaziali che ha sede nella capitale', 'Cerca vicino all\'Orto Botanico, Università di Roma Tor Vergata', 'sr2ypbf8', b'0', b'0'),
(2, 27, 1, 'INAF IASF Milano', 45.4807, 9.23158, NULL, 'Trova una delle strutture INAF in Lombardia', 'Cerca la struttura fondata nel 1969 da Giuseppe Occhialini', 'u0nddpd0', b'0', b'0'),
(2, 28, 1, 'INAF IASF Palermo', 38.1661, 13.3104, NULL, 'Trova la struttura siciliana dell\'INAF fondata da Livio Scarsi nel 1981', 'Cerca nella Trinacria', 'sqc3ngum', b'0', b'0'),
(2, 29, 1, 'INAF Istituto di Radioastronomia di Bologna', 44.5339, 11.3353, NULL, 'Trova la struttura di ricerca nata appositamente per la radioastronomia e per gestire i primi radiotelescopi italiani', 'Cerca l\'Ente di ricerca dell\'INAF che gestisce i radiotelescopi della Stazione radioastronomica di Medicina e il radiotelescopio di Noto, in Sicilia', 'srbj3gnh', b'0', b'0'),
(2, 30, 1, 'INAF Osservatorio Astrofisico di Arcetri', 43.7507, 11.2544, NULL, 'Trova uno tra i più importanti osservatori d\'Europa, in una zona collinare del comune di Firenze', 'Cerca vicino alla Villa in cui visse e morì Galileo Galilei', 'srb0bhe4', b'0', b'0'),
(2, 31, 1, 'INAF Osservatorio Astrofisico di Asiago', 45.8486, 11.5689, NULL, 'Trova il più grande strumento ottico presente sul suolo italiano', 'Cerca sulla sommità di Cima Ekar', 'u20hz62p', b'0', b'0'),
(2, 32, 1, 'INAF Osservatorio Astrofisico di Catania', 37.529, 15.0719, NULL, 'Trova quella che, nel 1887, fu l\'unica sede italiana a partecipare alla redazione della Carte du Ciel', 'Nel 1887, fu l\'unico Osservatorio italiano a partecipare alla redazione del prestigioso catalogo Carte du Ciel, insieme ad altre 18 stazioni straniere nel mondo', 'sqdtqzzn', b'0', b'0'),
(2, 33, 1, '\'INAF Osservatorio Astrofisico di Catania - Sede \"Mario Girolamo Fracastoro\" presso la località Serra La Nave\'', 37.6931, 14.9745, NULL, 'Trova la sede dell\'Osservatorio Astrofisico di Catania presso la contrada di Serra La Nave', 'Cerca l\'Osservatorio Astrofisico più a sud sul territorio italiano, a un\'altitudine di 1735 metri sul livello del mare', 'sqdwkvb4', b'0', b'0'),
(2, 34, 1, 'INAF Osservatorio Astrofisico di Torino', 45.0413, 7.76513, NULL, 'Trova la cupola del rifrattore Morais', 'Cerca vicino a un planetario il cui nome richiama l\'Infinito', 'u0j80xw2', b'0', b'0'),
(2, 35, 1, 'INAF Osservatorio Astronomico Capodimonte', 40.8637, 14.255, NULL, 'Trova la più antica istituzione scientifica partenopea', 'Cerca la sezione napoletana dell\'Istituto Nazionale di Astrofisica', 'sr60krh0', b'0', b'0'),
(2, 36, 1, 'INAF Osservatorio Astronomico d’Abruzzo (OAAb), sede di Teramo', 42.6538, 13.7316, NULL, 'Trova l’unico Osservatorio Astronomico Nazionale vicino alla costa adriatica, dalla Puglia alle Marche', 'Cerca la sede di Teramo dell\'Osservatorio Astronomico d\'Abruzzo', 'sr9f8kzh', b'0', b'0'),
(2, 37, 1, 'INAF Osservatorio Astronomico d’Abruzzo, sede di Campo Imperatore', 42.4443, 13.558, NULL, 'Trova l\'unico Osservatorio, sul territorio italiano, con un telescopio dotato di camera infrarossa', 'Cerca nel Parco Nazionale del Gran Sasso', 'sr99kw8x', b'0', b'0'),
(2, 38, 1, 'INAF Osservatorio Astronomico di Brera', 45.4718, 9.18808, NULL, 'Trova lo storico osservatorio nel palazzo di Brera che ospita la Cupola Schiaparelli', 'Cerca a Milano', 'u0nd9jfs', b'0', b'0'),
(2, 39, 1, 'INAF Osservatorio Astronomico di Cagliari', 39.2819, 9.13136, NULL, 'Trova il centro di eccellenza per l\'astrofisica e la radioastronomia che gestisce il Sardinia Radio Telescope', 'Cerca in Sardegna', 'snyrrz13', b'0', b'0'),
(2, 40, 1, 'INAF Osservatorio Astronomico di Padova', 45.4019, 11.8684, NULL, '\'Trova l\'Osservatorio con una sezione museale denominata \"Museo della Specola\"\'', 'Cerca la Torlonga, un\'antica torre di difesa medievale edificata nel IX secolo d.C.', 'u206q14m', b'0', b'0'),
(2, 41, 1, 'INAF Osservatorio Astronomico di Palermo - Museo della Specola', 38.1118, 13.3534, NULL, 'Trova l\'Osservatorio nel quale, nel 1801, è stato scoperto Cerere', 'Cerca in Sicilia, a Palermo', 'sqc2zf59', b'0', b'0'),
(2, 42, 1, 'INAF Osservatorio Astronomico di Roma', 41.9227, 12.4522, NULL, 'Trova l\'Osservatorio Astronomico che nasce dalla fusione dell\'Osservatorio del Collegio Romano e dell\'Osservatorio del Campidoglio', 'Cerca l\'osservatorio della capitale', 'sr2y7rg3', b'0', b'0'),
(2, 43, 1, 'INAF Osservatorio Astronomico di Trieste', 45.6448, 13.774, NULL, 'Cerca l\'Osservatorio che ha due sedi, una delle quali è la Specola intitolata a Margherita Hack', 'Cerca il castello Basevi, a Trieste', 'u21g9mmu', b'0', b'0'),
(2, 44, 1, 'INAF Osservatorio di Astrofisica e Scienza dello Spazio di Bologna', 44.5219, 11.3366, NULL, 'Trova l\'ultima nata fra le sedi dell’Istituto Nazionale di Astrofisica', 'Cerca accanto all\'Area della Ricerca di Bologna', 'srbj3bzn', b'0', b'0'),
(2, 45, 1, 'INAF Osservatorio di Loiano', 44.2593, 11.3342, NULL, 'Trova il telescopio più grande d\'Italia dopo quello di Asiago', 'Cerca tra gli alberi del Monte Orzale', 'srb5ccjm', b'0', b'0'),
(2, 46, 1, 'Joseph-Louis Lagrange', 45.0637, 7.68058, NULL, 'Incontra colui a cui sono intitolati i famosi punti Lagrangiani', 'Cerca un monumento dedicato a Joseph-Louis Lagrange nella sua città Natale, Torino', 'u0j2qg8g', b'0', b'0'),
(2, 47, 1, 'La sala delle Carte geografiche in Palazzo Vecchio ', 43.7693, 11.2562, NULL, 'Trovala la sala delle Carte geografiche di Cosimo I de\' Medici ', 'Cerca in Palazzo Vecchio, a Firenze', 'srb0bpuw', b'0', b'0'),
(2, 48, 1, 'La sfera armillare di Solunto', 38.0922, 13.5314, NULL, 'Trova una delle immagini più antiche di una sfera armillare, a Palermo', 'Cerca nella casa di Leda, a Palermo', 'sqc8eymr', b'0', b'0'),
(2, 49, 1, 'La Torre Solare di Monte Mario', 41.9231, 12.4523, NULL, 'Trova la Torre Solare dell’INAF più grande d’Italia', 'Cerca la torre solare a Monte Mario, nella capitale', 'sr2y7rg7', b'0', b'0'),
(2, 50, 1, 'Laboratori e officine di INAF', 38.1095, 13.3727, NULL, 'Trova i laboratori, a Palermo, in cui si sviluppano strumenti per l\'astronomia nei raggi X', 'Cerca in Sicilia, a Palermo', 'sqc8b39e', b'0', b'0'),
(2, 51, 1, 'Laboratori Nazionali del Gran Sasso', 42.42, 13.5172, NULL, 'Trova il centro di ricerca sotterraneo più grande e importante del mondo', 'Cerca nel Parco Nazionale del Gran Sasso', 'sr997d6f', b'0', b'0'),
(2, 52, 1, 'Le tavole sciateriche di Kircher', 41.8112, 12.7047, NULL, 'Trova una invenzione gnomonica a opera di Kircher', 'Cerca a Monte Porzio Catone', 'sr3jc57r', b'0', b'0'),
(2, 53, 1, 'Marcello Ceccarelli', 44.4996, 11.3539, NULL, 'Incontra colui che è considerato il padre della radioastronomia italiana', 'Cerca il luogo in cui Marcello Ceccarelli ha iniziato a lavorare e ha costruito il gruppo di lavoro che ha progettato e costruito il primo radiotelescopio italiano, la Croce del Nord', 'srbj4kgs', b'0', b'0'),
(2, 54, 1, 'Margherita Hack', 43.7844, 11.2764, NULL, 'Incontra la famosa astronoma che, nel 2012, è stata nominata Cavaliere di gran croce dell\'Ordine al merito della Repubblica italiana, per il costante e instancabile impegno profuso nella ricerca scientifica e al servizio della società, che la rende esempio di straordinaria dedizione e coerenza per le giovani generazioni', 'Trova la via in cui Marcherita Hack è nata il 12 giugno 1922, vicino a Campo di Marte', 'srb10den', b'0', b'0'),
(2, 55, 1, 'Mentore Maggini', 42.654, 13.7313, NULL, 'Incontra il pioniere italiano della fotometria fotoelettrica', 'Cerca Mentore Maggini in quello che fu l\'Osservatorio di Collurania, che ha diretto dal 1926', 'sr9f8kyv', b'0', b'0'),
(2, 56, 1, 'Meridiana della Cattedrale di Palermo', 38.1144, 13.3561, NULL, 'Trova la meridiana che è stata fatta realizzare da Giuseppe Piazzi', 'Cerca la meridiana nella cattedrale normanna di Palermo', 'sqc2zft8', b'0', b'0'),
(2, 57, 1, 'Meridiana di Cassini', 44.4931, 11.3431, NULL, 'Trova la meridiana più grande al mondo', 'Cerca nella chiesa più grande di Bologna', 'srbj45ez', b'0', b'0'),
(2, 58, 1, 'Meridiana di Rocco Bovi', 40.8436, 14.2411, NULL, 'Trova la meridiana a camera oscura alla Certosa di San Martino', 'Cerca sulla collina del Vomero, accanto al castel Sant\'Elmo', 'sr60k565', b'0', b'0'),
(2, 59, 1, 'Meridiana di Santa Maria del Fiore ', 43.7731, 11.2571, NULL, 'Trova la meridiana più alta del mondo', 'Cerca nella cupola di Brunelleschi del Duomo di Firenze', 'srb100th', b'0', b'0'),
(2, 60, 1, 'MuSA - Museo degli Strumenti Astronomici', 40.8637, 14.2555, NULL, 'Trova il museo astronomico pubblico dell\'Italia centro-meridionale aperto ai visitatori', 'Cerca il museo degli strumenti astronomici a Napoli', 'sr60krh8', b'0', b'0'),
(2, 61, 1, 'Museo Astronomico e Copernicano', 41.9224, 12.4513, NULL, 'Trova il museo di storia dell’astronomia più antico d’Italia', 'Cerca in Viale del Parco Mellini, nella capitale', 'sr2y7rdz', b'0', b'0'),
(2, 62, 1, 'Museo del Balì', 43.7565, 12.8903, NULL, 'Trova un moderno science centre nelle Marche', 'Cerca nelle Marche, lungo il corso del Metauro', 'src0vmdk', b'0', b'0'),
(2, 63, 1, 'Museo del Cielo e della Terra', 44.6362, 11.1827, NULL, 'Trova il museo del cielo e della terra', 'Cercalo nella sede aministrativa dei comuni di terre d\'acqua', 'spzvymyb', b'0', b'0'),
(2, 64, 1, 'Museo della Specola di Bologna', 44.4969, 11.3524, NULL, 'Trova la sede storica del Dipartimento di Astronomia di Bologna', 'Cerca la torre astronomica in via Zamboni 33', 'srbj4k6t', b'0', b'0'),
(2, 65, 1, 'Museo dell\'astronomia e Planetario di Torino', 45.0399, 7.76185, NULL, 'Trova uno dei planetari più belli d\'Italia, in Piemonte', 'Cerca sulle colline di Torino', 'u0j80xk0', b'0', b'0'),
(2, 66, 1, 'Museo Galileo', 43.7679, 11.2559, NULL, 'Trova il museo che conserva una delle raccolte di strumenti scientifici più importanti al mondo, in particolare gli strumenti originali di Galileo Galilei', 'Cerca un museo di Firenze intitolato al padre del metodo scientifico', 'srb0bpsq', b'0', b'0'),
(2, 67, 1, 'Nichi D\'Amico', 39.4932, 9.24505, NULL, 'Incontra il Presidente dell\'Inaf scomparso il 14 settembre 2020, per 8 anni direttore dell\'Osservatorio Astronomico di Cagliari e direttore del progetto Sardinia Radio Telescope', 'Cercalo in Sardegna, dove sorge il Sardinia Radio Telescope', 'spn8dms0', b'0', b'0'),
(2, 68, 1, 'Orologio astronomico di Messina', 38.1938, 15.5549, NULL, 'Trova l’orologio astronomico e meccanico più grande del mondo', 'Cerca nei pressi dello stretto di Messina', 'sqg13byx', b'0', b'0'),
(2, 69, 1, 'Osservatorio astronomico del Campidoglio', 41.893, 12.4834, NULL, 'Trova uno dei due osservatori astronomici di Roma in cui nella seconda metà dell’Ottocento sono stati compiuti i primi studi pionieristici di astrofisica', 'Cerca nel Campidoglio', 'sr2yk46h', b'0', b'0'),
(2, 70, 1, 'Osservatorio astronomico del Collegio Romano', 41.8978, 12.4804, NULL, 'Trova l\'osservatorio in cui Padre Angelo Secchi propose la prima classificazione spettrale delle stelle', 'Cerca nella capitale', 'sr2y7grb', b'0', b'0'),
(2, 71, 1, 'Osservatorio Astronomico di Siligo', 40.5826, 8.73213, NULL, 'Trova un punto di riferimento per la promozione e la divulgazione dell\'astronomia nel nord Sardegna e in tutta l\'isola', 'Cerca nel settentrione della terra più isolata dal continente, dove troverai un luogo da cui osservare le stelle, vere o riprodotte, comunque belle', 'spnnyeyd', b'0', b'0'),
(2, 72, 1, 'Osservatorio Astronomico Ferdinando Caliumi', 39.8775, 9.50402, NULL, 'Trova la sede osservativa dell\'Associazione Ogliastrina di Astronomia, associazione di astrofili molto attiva nel territorio dell\'Ogliastra', 'Cerca un osservatorio astronomico sito in Ogliastra', 'spnfb72x', b'0', b'0'),
(2, 73, 1, '\'Osservatorio e Parco astronomico \"Luigi Lilio\"\'', 39.315, 16.7517, NULL, 'Trova un parco astronomico nel crotonese', 'Cerca vicino alla punta dello stivale', 'sqgztjn4', b'0', b'0'),
(2, 74, 1, 'Osservatorio Fondation Clément Fillietroz', 45.7897, 7.47852, NULL, 'Trova l\'osservatorio astronomico della Regione Autonoma Valle d\'Aosta', 'Cerca nel vallone di Saint-Barthélemy', 'u0jk6pv8', b'0', b'0'),
(2, 75, 1, 'Palazzo Viviani o “dei Cartelloni”', 43.7755, 11.2515, NULL, 'Trova il primo monumento pubblico in onore di Galileo Galilei', 'Cerca a Firenze', 'srb10114', b'0', b'0'),
(2, 76, 1, 'Pantheon', 41.8988, 12.4774, NULL, 'Trova uno dei monumenti romani più celebri, luogo di osservazione di fenomeni astronomici', 'Cerca il luogo in cui è sepolto Raffaello Sanzio', 'sr2y7gmy', b'0', b'0'),
(2, 77, 1, 'Parco Astronomico dell\'Osservatorio di Roma', 41.8116, 12.7024, NULL, 'Trova il parco astronomico della capitale', 'Cerca a Monte Porzio Catone', 'sr3jc59d', b'0', b'0'),
(2, 78, 1, 'Parco Astronomico di Sardegna in Miniatura', 39.7012, 8.98, NULL, 'Trova un science center dedicato all\'astronomia in Sardegna', 'Cerca nell\'area del famoso villaggio nuragico Su Nuraxi di Barumini', 'spn3u77h', b'0', b'0'),
(2, 79, 1, 'Parco Astronomico Fondazione Gal Hassin, Isnello', 37.9395, 14.0212, NULL, 'Trova uno dei parchi astronomici più importanti d\'Italia, e lo sarà ancora di più quando monteranno il telescopio ESA su Monte Mufara', 'Cerca il luogo in cui sta per sorgere il Wide-field Mufara Telescope', 'sq9zz49v', b'0', b'0'),
(2, 80, 1, 'Planetario Civico Ulrico Hoepli, Milano', 45.4739, 9.20361, NULL, 'Trova un famoso planetario di Milano', 'Cerca nei giardini pubblici di Porta Venezia', 'u0nd9qmb', b'0', b'0'),
(2, 81, 1, 'Planetario de L\'Unione Sarda', 39.2268, 9.09822, NULL, 'Trova un planetario che opera dal 2011 nel territorio sardo, fornendo un importante supporto al mondo della divulgazione e dell\'istruzione nelle discipline scientifiche', 'Cerca, a Cagliari, un posto in cui puoi guardare l\'Universo ma anche leggere il più diffuso quotidiano sardo!', 'snyrpj10', b'0', b'0'),
(2, 82, 1, 'Planetario di Bari', 41.1374, 16.8379, NULL, 'Trova uno dei sette planetari più grandi d\'Italia, il più grande del Sud Italia', 'Cerca vicino a un porto da cui si salpa per Durazzo', 'sr7fp0uf', b'0', b'0'),
(2, 83, 1, 'Planetario di Padova', 45.4043, 11.8936, NULL, 'Trova il planetario inaugurato nell\'aprile 2009', 'Cerca a Padova, all’interno del parco naturalistico urbano “Ex Macello”', 'u206q9se', b'0', b'0'),
(2, 84, 1, 'Planetario e museo astronomico di Roma', 41.9194, 12.4884, NULL, 'Trova il planetario e museo astronomico della capitale', 'Cerca a Roma, vicino al Bio Parco', 'sr2ykpjy', b'0', b'0'),
(2, 85, 1, 'Planetario INAF - Osservatorio Astronomico di Cagliari', 39.2819, 9.13136, NULL, 'Trova il planetario dell’Osservatorio Astronomico di Cagliari', 'Cerca un planetario sardo', 'snyrrz13', b'0', b'0'),
(2, 86, 1, 'Planetario Osservatorio astronomico di Anzi', 40.518, 15.924, NULL, 'Trova un osservatorio astronomico in Basilicata', 'Cerca sulla vetta del Monte Siri', 'sr5qd25d', b'0', b'0'),
(2, 87, 1, 'Planetarium Pythagoras', 38.1196, 15.6602, NULL, 'Trova il planetario che dal 2013 è diventato uno dei dieci poli nazionali per l\'organizzazione delle Olimpiadi italiane di Astronomia', 'Cerca vicino al Parco Nazionale dell\'Aspromonte', 'sqg0u77q', b'0', b'0'),
(2, 88, 1, 'Radiotelescopio di Noto', 36.9007, 15.0656, NULL, 'Trova il radiotelescopio italiano più a sud, uno dei più importanti per la radioastronomia europea', 'Cerca nel comune siciliano il cui centro storico è patrimonio Unesco', 'sqd9yvd6', b'0', b'0'),
(2, 89, 1, 'REM, the Rapid Eye Mount', -29.2564, -70.7386, NULL, 'Trova il telescopio italiano che ha fotografato la kilonova nell\'agosto del 2017. Attenzione: è italiano ma è lontano dall\'Italia!', '\'Cerca una piccola cupola nascosta su un \"cerro\" delle Ande cilene\'', '66v9w619', b'0', b'0'),
(2, 90, 1, 'Riccardo Giacconi', 45.4722, 9.1891, NULL, 'Incontra il premio Nobel per la fisica nel 2002', 'Cerca all\'Osservatorio Astronomico di Brera, dove esisteva una stanza per le visite di Riccardo Giacconi', 'u0nd9jgq', b'0', b'0'),
(2, 91, 1, 'Salone della Meridiana – Museo Archeologico Nazionale di Napoli', 40.8538, 14.2505, NULL, 'Trova uno dei più importanti musei archeologici al mondo', 'Cerca nella città del vulcano', 'sr60km0y', b'0', b'0'),
(2, 92, 1, 'Sardinia Radio Telescope (SRT)', 39.4931, 9.24545, NULL, 'Trova la parabola radioastronomica più grande d\'Italia', 'Cerca il radiotelescopio in località Pranu \'e sànguni', 'spn8dmkr', b'0', b'0'),
(2, 93, 1, 'Stazione Astronomica di Carloforte', 39.1378, 8.31222, NULL, 'Trova la prima sede osservativa astronomica in Sardegna, una delle cinque stazioni dell\'International Latitude Service', 'Cerca il primo osservatorio astronomico in Sardegna', 'snvythuf', b'0', b'0'),
(2, 94, 1, 'Stazione Radioastronomica di Medicina', 44.5246, 11.6462, NULL, 'Trova il luogo in cui è nata la radioastronomia italiana, con il gruppo di ricerca di Marcello Ceccarelli', 'Cerca vicino a Bologna', 'srbm312w', b'0', b'0'),
(2, 95, 1, 'Telescopio ASTRI-Horn', 37.6931, 14.9744, NULL, 'Trova il prototipo di uno degli Small Size Telescope proposti per CTA', 'Cerca alle pendici del Monte Etna', 'sqdwkvb4', b'0', b'0'),
(2, 96, 1, 'Telescopio Nazionale Galileo', 28.7544, -17.8893, NULL, 'Anche se non si trova in Italia, è il più grande telescopio ottico/infrarosso completamente italiano', 'Cerca nelle isole Canarie', 'et578ft6', b'0', b'0'),
(2, 97, 1, 'Torre del Primo Meridiano d\'Italia', 41.9243, 12.4517, NULL, 'Trova l\'origine delle longitudini della moderna cartografia italiana e della rete geodetica nazionale', 'Cerca nella capitale il punto di origine delle longitudini italiane', 'sr2ye254', b'0', b'0'),
(2, 99, 1, 'Villa Adriana ', 41.9431, 12.7747, NULL, 'Trova una villa oggetto di studi di archeoastronomia che hanno confermato l’orientamento astronomico dell’intera Spianata', 'Cerca la celebre villa imperiale nelle vicinanze di Roma', 'sr3ndew2', b'0', b'0'),
(2, 100, 1, 'Vincenzo Cerulli', 42.6585, 13.7052, NULL, 'Incontra il fondatore dell’Osservatorio Astronomico di Collurania', 'Cerca nella città Natale di Vincenzo Cerulli il corso a lui intitolato', 'sr9dxvez', b'0', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `severity` tinyint(3) UNSIGNED NOT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  `identity_id` int(10) UNSIGNED DEFAULT NULL,
  `game_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `perf_log`
--

CREATE TABLE `perf_log` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `memory_peak_bytes` int(10) UNSIGNED NOT NULL,
  `elapsed_seconds` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questionnaire`
--

CREATE TABLE `questionnaire` (
  `game_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) CHARACTER SET ascii NOT NULL,
  `rating` tinyint(3) DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `riddles`
--

CREATE TABLE `riddles` (
  `event_id` int(10) UNSIGNED NOT NULL,
  `riddle_id` int(10) UNSIGNED NOT NULL,
  `riddle_type` tinyint(2) NOT NULL DEFAULT '1',
  `riddle_param` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `solution` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `riddles`
--

INSERT INTO `riddles` (`event_id`, `riddle_id`, `riddle_type`, `riddle_param`, `image_path`, `solution`) VALUES
(1, 1, 1, 'FFLFFLF', 'codeweek-2017/img1-1.png', 'b'),
(1, 2, 1, 'FFLFFLF', 'codeweek-2017/img1-1.png', 'b'),
(1, 3, 1, 'FFFLFFFRF', 'codeweek-2017/img1-1.png', 'a'),
(1, 4, 1, 'LFFFRFF', 'codeweek-2017/img1-1.png', 'c'),
(1, 5, 1, 'RFLFF', 'codeweek-2017/img1-2.png', 'b'),
(1, 6, 1, 'FLFF', 'codeweek-2017/img1-2.png', 'a'),
(1, 7, 1, 'RFFRF', 'codeweek-2017/img1-2.png', 'c'),
(1, 21, 2, '', 'codeweek-2017/img2-1.png', 'frflff'),
(1, 22, 2, '', 'codeweek-2017/img2-2.png', 'rfrflff'),
(1, 23, 2, '', 'codeweek-2017/img2-3.png', 'fflff'),
(1, 24, 2, '', 'codeweek-2017/img2-4.png', 'ffrfff'),
(1, 25, 2, '', 'codeweek-2017/img2-5.png', 'ffrfffrf'),
(1, 31, 3, 'FFLFLFF', 'codeweek-2017/img3-1.png', '1'),
(1, 32, 3, 'FLFRFF', 'codeweek-2017/img3-1.png', '1'),
(1, 33, 3, 'FFLFFRFF', 'codeweek-2017/img3-2.png', '1'),
(1, 34, 3, 'FFFLFFF', 'codeweek-2017/img3-2.png', '0'),
(1, 35, 3, 'FLFFRRFF', 'codeweek-2017/img3-3.png', '2'),
(1, 41, 4, '', 'codeweek-2017/img4-1.png', 'l'),
(1, 42, 4, '', 'codeweek-2017/img4-2.png', 'r'),
(1, 43, 4, '', 'codeweek-2017/img4-3.png', 'f'),
(1, 44, 4, '', 'codeweek-2017/img4-4.png', 'l'),
(1, 51, 5, 'FFFLFLFFF', 'codeweek-2017/img5-1.png', 'c'),
(1, 52, 5, 'FLFRFF', 'codeweek-2017/img5-1.png', 'b'),
(1, 53, 5, 'FFFRFRFFF', 'codeweek-2017/img5-1.png', 'a'),
(1, 54, 5, 'FLFFLF', 'codeweek-2017/img5-2.png', 'a'),
(1, 55, 5, 'FFLFF', 'codeweek-2017/img5-2.png', 'c'),
(1, 56, 5, 'LFFRFF', 'codeweek-2017/img5-2.png', 'b'),
(1, 61, 6, '', 'codeweek-2017/img6-1.png', '19'),
(1, 62, 6, '', 'codeweek-2017/img6-2.png', '15'),
(1, 71, 7, '', 'codeweek-2017/img7-1.png', '11'),
(1, 72, 7, '', 'codeweek-2017/img7-2.png', '9'),
(1, 73, 7, '', 'codeweek-2017/img7-3.png', '6'),
(2, 1, 1, 'FFLFFLF', 'codeweek-2017/img1-1.png', 'b'),
(2, 2, 1, 'FFLFFLF', 'codeweek-2017/img1-1.png', 'b'),
(2, 3, 1, 'FFFLFFFRF', 'codeweek-2017/img1-1.png', 'a'),
(2, 4, 1, 'LFFFRFF', 'codeweek-2017/img1-1.png', 'c'),
(2, 5, 1, 'RFLFF', 'codeweek-2017/img1-2.png', 'b'),
(2, 6, 1, 'FLFF', 'codeweek-2017/img1-2.png', 'a'),
(2, 7, 1, 'RFFRF', 'codeweek-2017/img1-2.png', 'c'),
(2, 21, 2, '', 'codeweek-2017/img2-1.png', 'frflff'),
(2, 22, 2, '', 'codeweek-2017/img2-2.png', 'rfrflff'),
(2, 23, 2, '', 'codeweek-2017/img2-3.png', 'fflff'),
(2, 24, 2, '', 'codeweek-2017/img2-4.png', 'ffrfff'),
(2, 25, 2, '', 'codeweek-2017/img2-5.png', 'ffrfffrf'),
(2, 31, 3, 'FFLFLFF', 'codeweek-2017/img3-1.png', '1'),
(2, 32, 3, 'FLFRFF', 'codeweek-2017/img3-1.png', '1'),
(2, 33, 3, 'FFLFFRFF', 'codeweek-2017/img3-2.png', '1'),
(2, 34, 3, 'FFFLFFF', 'codeweek-2017/img3-2.png', '0'),
(2, 35, 3, 'FLFFRRFF', 'codeweek-2017/img3-3.png', '2'),
(2, 41, 4, '', 'codeweek-2017/img4-1.png', 'l'),
(2, 42, 4, '', 'codeweek-2017/img4-2.png', 'r'),
(2, 43, 4, '', 'codeweek-2017/img4-3.png', 'f'),
(2, 44, 4, '', 'codeweek-2017/img4-4.png', 'l'),
(2, 51, 5, 'FFFLFLFFF', 'codeweek-2017/img5-1.png', 'c'),
(2, 52, 5, 'FLFRFF', 'codeweek-2017/img5-1.png', 'b'),
(2, 53, 5, 'FFFRFRFFF', 'codeweek-2017/img5-1.png', 'a'),
(2, 54, 5, 'FLFFLF', 'codeweek-2017/img5-2.png', 'a'),
(2, 55, 5, 'FFLFF', 'codeweek-2017/img5-2.png', 'c'),
(2, 56, 5, 'LFFRFF', 'codeweek-2017/img5-2.png', 'b'),
(2, 61, 6, '', 'codeweek-2017/img6-1.png', '19'),
(2, 62, 6, '', 'codeweek-2017/img6-2.png', '15'),
(2, 71, 7, '', 'codeweek-2017/img7-1.png', '11'),
(2, 72, 7, '', 'codeweek-2017/img7-2.png', '9'),
(2, 73, 7, '', 'codeweek-2017/img7-3.png', '6');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assigned_locations`
--
ALTER TABLE `assigned_locations`
  ADD PRIMARY KEY (`game_id`,`location_id`,`group_id`),
  ADD KEY `assloc_group_constraint` (`group_id`);

--
-- Indexes for table `assigned_riddles`
--
ALTER TABLE `assigned_riddles`
  ADD PRIMARY KEY (`event_id`,`game_id`,`riddle_id`,`group_id`) USING BTREE,
  ADD KEY `assriddles_group_index` (`group_id`) USING BTREE,
  ADD KEY `assriddle_riddle_constraint` (`event_id`,`riddle_id`),
  ADD KEY `assriddle_group_constraint` (`game_id`,`group_id`);

--
-- Indexes for table `code_lookup`
--
ALTER TABLE `code_lookup`
  ADD PRIMARY KEY (`code`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `game_id` (`game_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `code_lookup_location_constraint` (`game_id`,`location_id`);

--
-- Indexes for table `conversation_memories`
--
ALTER TABLE `conversation_memories`
  ADD UNIQUE KEY `telegram_id` (`telegram_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `event_organizer_index` (`organizer_id`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`game_id`),
  ADD KEY `game_event_index` (`event_id`),
  ADD KEY `game_organizer_index` (`organizer_id`);

--
-- Indexes for table `game_location_clusters`
--
ALTER TABLE `game_location_clusters`
  ADD PRIMARY KEY (`game_id`,`cluster_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`game_id`,`group_id`),
  ADD KEY `status_group_constraint` (`group_id`);

--
-- Indexes for table `hints`
--
ALTER TABLE `hints`
  ADD PRIMARY KEY (`event_id`,`riddles_solved_count`);

--
-- Indexes for table `identities`
--
ALTER TABLE `identities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `telegram_id` (`telegram_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`game_id`,`location_id`),
  ADD KEY `cluster_id` (`cluster_id`),
  ADD KEY `location_cluster_constraint` (`game_id`,`cluster_id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `timestamp` (`timestamp`),
  ADD KEY `tag` (`tag`),
  ADD KEY `log_context_index` (`identity_id`,`game_id`),
  ADD KEY `log_game_constraint` (`game_id`);

--
-- Indexes for table `perf_log`
--
ALTER TABLE `perf_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timestamp` (`timestamp`);

--
-- Indexes for table `questionnaire`
--
ALTER TABLE `questionnaire`
  ADD PRIMARY KEY (`game_id`,`group_id`,`name`) USING BTREE,
  ADD KEY `name` (`name`),
  ADD KEY `questionnaire_group_constraint` (`group_id`);

--
-- Indexes for table `riddles`
--
ALTER TABLE `riddles`
  ADD PRIMARY KEY (`event_id`,`riddle_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `game_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `identities`
--
ALTER TABLE `identities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Internal ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perf_log`
--
ALTER TABLE `perf_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assigned_locations`
--
ALTER TABLE `assigned_locations`
  ADD CONSTRAINT `assloc_group_constraint` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assloc_location_constraint` FOREIGN KEY (`game_id`,`location_id`) REFERENCES `locations` (`game_id`, `location_id`) ON DELETE CASCADE;

--
-- Constraints for table `assigned_riddles`
--
ALTER TABLE `assigned_riddles`
  ADD CONSTRAINT `assriddle_event_constraint` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  ADD CONSTRAINT `assriddle_game_constraint` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assriddle_group_constraint` FOREIGN KEY (`game_id`,`group_id`) REFERENCES `groups` (`game_id`, `group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assriddle_riddle_constraint` FOREIGN KEY (`event_id`,`riddle_id`) REFERENCES `riddles` (`event_id`, `riddle_id`);

--
-- Constraints for table `code_lookup`
--
ALTER TABLE `code_lookup`
  ADD CONSTRAINT `code_look_game_constraint` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `code_lookup_event_constraint` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `code_lookup_location_constraint` FOREIGN KEY (`game_id`,`location_id`) REFERENCES `locations` (`game_id`, `location_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_identity_constraint` FOREIGN KEY (`organizer_id`) REFERENCES `identities` (`id`);

--
-- Constraints for table `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `game_event_constraint` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  ADD CONSTRAINT `game_organizer_constraint` FOREIGN KEY (`organizer_id`) REFERENCES `identities` (`id`);

--
-- Constraints for table `game_location_clusters`
--
ALTER TABLE `game_location_clusters`
  ADD CONSTRAINT `game_location_clusters_game_constraint` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`) ON DELETE CASCADE;

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_game_constraint` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `groups_identity_constraint` FOREIGN KEY (`group_id`) REFERENCES `identities` (`id`);

--
-- Constraints for table `hints`
--
ALTER TABLE `hints`
  ADD CONSTRAINT `hint_event_constraint` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE;

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `location_cluster_constraint` FOREIGN KEY (`game_id`,`cluster_id`) REFERENCES `game_location_clusters` (`game_id`, `cluster_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `location_game_constraint` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`) ON DELETE CASCADE;

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_game_constraint` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `log_identity_constraint` FOREIGN KEY (`identity_id`) REFERENCES `identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questionnaire`
--
ALTER TABLE `questionnaire`
  ADD CONSTRAINT `questionnaire_game_constraint` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questionnaire_group_constraint` FOREIGN KEY (`group_id`) REFERENCES `identities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `riddles`
--
ALTER TABLE `riddles`
  ADD CONSTRAINT `riddle_event_constraint` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE;
COMMIT;
