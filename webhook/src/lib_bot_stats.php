<?php
/**
 * CodeMOOC TreasureHuntBot
 * ===================
 * UWiClab, University of Urbino
 * ===================
 * Bot stats generation logic.
 */

require_once(dirname(__FILE__) . '/model/context.php');

/**
 * Gets the amount of assigned locations for all playing group.
 */
function bot_get_count_of_assigned_location_for_playing_groups($context) {
    return  db_table_query("SELECT i.`telegram_id`, i.`id`, g.`name`, l.c FROM groups AS g LEFT JOIN `identities` AS i ON g.`group_id` = i.`id`INNER JOIN (SELECT group_id, game_id, COUNT(*) AS c FROM assigned_locations WHERE game_id = {$context->get_game_id()} AND assigned_on IS NOT NULL GROUP BY group_id) AS l ON l.group_id = g.group_id WHERE g.name IS NOT NULL ORDER BY l.`c` DESC;");
}

/**
 * Gets a map of group counts, grouped by group state.
 * Excludes groups by administrators.
 */
function bot_stats_generate_group_state_map($context) {
    $data = db_table_query(sprintf(
        'SELECT `groups`.`state`, count(*) FROM `groups` WHERE `groups`.`game_id` = %1$d AND `groups`.`group_id` NOT IN (SELECT `organizer_id` FROM `games` WHERE `game_id` = %1$d) GROUP BY `groups`.`state` ORDER BY `groups`.`state` ASC',
        $context->game->game_id
    ));

    $map = array();
    foreach(STATE_ALL as $c) {
        $map[$c] = 0;
    }
    foreach($data as $d) {
        if($d[0] > STATE_GAME_WON) {
            $d[0] = STATE_GAME_WON; // group states after victory into victory
        }
        $map[$d[0]] += $d[1];
    }

    return $map;
}

/**
 * Gets the current leaderboard for playing groups.
 *
 * Groups are ordered following these criteria:
 * 1) number of reached location;
 * 2) group status;
 * 3) last_state_change (ASC).
 *
 * @return array|bool Table of (Telegram ID, group ID, group name, # reached locations,
 *                    group state, last state change) or false on failure.
 */
function bot_get_current_chart_of_playing_groups($context) {
    return db_table_query(sprintf(
        'SELECT `identities`.`telegram_id`, `identities`.`id`, `groups`.`name`, IF(`link`.`c` IS NOT NULL, `link`.`c`, 0), `groups`.`state`, TIMESTAMPDIFF(MINUTE, `groups`.`last_state_change`, NOW()) FROM `groups` LEFT JOIN `identities` ON `groups`.`group_id` = `identities`.`id` LEFT JOIN (SELECT group_id, game_id, COUNT(*) AS c, MAX(reached_on) as max_r FROM assigned_locations WHERE game_id = %1$d AND reached_on IS NOT NULL GROUP BY group_id) AS `link` ON `link`.`group_id` = `groups`.`group_id` WHERE `groups`.`game_id` = %1$d AND `groups`.`state` >= %2$d ORDER BY `link`.`c` DESC, `groups`.`state` DESC, `link`.`max_r` ASC',
        $context->game->game_id,
        STATE_GAME_LOCATION
    ));
}

/**
 * Gets the count of registered groups (verified and with name).
 */
function bot_get_registered_groups($context) {
    return db_scalar_query(sprintf(
        "SELECT count(*) FROM `groups` WHERE `game_id` = %d AND `state` >= %d",
        $context->game->game_id,
        STATE_REG_NAME
    ));
}

/**
 * Gets the count of ready groups and participants.
 * Excludes groups by organizers.
 */
function bot_stats_ready_groups($context) {
    return db_row_query(sprintf(
        'SELECT count(*), sum(`participants_count`) FROM `groups` WHERE `game_id` = %d AND `state` >= %d AND `groups`.`group_id` NOT IN (SELECT `organizer_id` FROM `games` WHERE `game_id` = %1$d)',
        $context->game->game_id,
        STATE_REG_READY
    ));
}
