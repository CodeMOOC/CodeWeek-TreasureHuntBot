-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Oct 11, 2020 at 01:56 PM
-- Server version: 5.7.31
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
('cw2020-66-beva', 'location', NULL, 1, 66, b'0');

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
(1, 'Code Week 2020', 224, NULL, '2020-10-05 21:18:26', 6, 12, 1, NULL, NULL);

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
  `timeout_absolute` datetime DEFAULT NULL COMMENT 'Absolute timeout when game ends',
  `timeout_interval` smallint(6) DEFAULT NULL COMMENT 'Relative timeout in minutes from start',
  `registered_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`game_id`, `event_id`, `state`, `name`, `location_name`, `location_lat`, `location_lng`, `language`, `organizer_id`, `organizer_email`, `badge_overlay_image`, `telegram_channel`, `telegram_channel_censor_photo`, `quick_start`, `location_hints_enabled`, `timeout_absolute`, `timeout_interval`, `registered_on`) VALUES
(1, 1, 128, 'Code Week 2020', 'Europe', NULL, NULL, 'en', 1, NULL, NULL, NULL, b'0', 0, b'1', NULL, NULL, '2020-10-05 21:21:49');

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
(1, 1, 8, 'Main cluster', b'0');

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
(1, 64, 1, 'Joyce Aylard', 51.578541, -0.389534, NULL, 'Find the place where one of the female codebreakers worked during WW2.', 'Joyce Aylard worked at an outstation not far from Bletchley Park.', 'gcptrjs6', b'0', b'0'),
(1, 65, 1, 'MIRALab', 46.199936, 6.144828, NULL, 'Find the University where the MIRALab is conducting user interface research.', 'The lab is headed by Nadia Magnenat Thalmann, an eminent computer graphics expert and robotician.', 'u0hqgf6w', b'0', b'0'),
(1, 66, 1, 'NORSAR', 59.975078, 11.044971, NULL, 'Find the first European site connected to the ARPANET.', 'The site also hosts the Norwegian Seismic Array.', 'u4xv5q4s', b'0', b'0');

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
(1, 73, 7, '', 'codeweek-2017/img7-3.png', '6');

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
  MODIFY `event_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `game_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
