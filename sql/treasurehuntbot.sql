-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Oct 05, 2020 at 09:25 PM
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
  `timeout_absolute` datetime DEFAULT NULL COMMENT 'Absolute timeout when game ends for this group'
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
(1, 178430499, 'Lorenz', 'Lorenz Klopfenstein', '2020-10-05 16:41:47', '2020-10-05 16:41:47', NULL, 0, NULL);

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
  `is_start` bit(1) NOT NULL DEFAULT b'0',
  `is_end` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
