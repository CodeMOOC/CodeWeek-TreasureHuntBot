-- Show groups of a game and locations reached
SELECT `groups`.`group_id`, `groups`.`name`, `groups`.`participants_count`, `groups`.`last_state_change`,
(SELECT COUNT(*) FROM `assigned_locations` AS al WHERE `groups`.`game_id` = al.game_id AND `groups`.`group_id` = al.group_id) AS `assigned_locations`,
(SELECT COUNT(*) FROM `assigned_locations` AS al WHERE `groups`.`game_id` = al.game_id AND `groups`.`group_id` = al.group_id AND al.reached_on IS NOT NULL) AS `reached_locations`,
(SELECT MIN(al.`assigned_on`) FROM `assigned_locations` AS al WHERE `groups`.`game_id` = al.game_id AND `groups`.`group_id` = al.group_id) AS `started_on`,
(SELECT MAX(al.`reached_on`) FROM `assigned_locations` AS al WHERE `groups`.`game_id` = al.game_id AND `groups`.`group_id` = al.group_id) AS `stopped_on`
FROM `groups` WHERE `groups`.`game_id` = 1136 AND `groups`.`state` > 10 AND `groups`.`name` IS NOT NULL;
