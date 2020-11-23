<?php
/*
 * CodeMOOC TreasureHuntBot
 * ===================
 * UWiClab, University of Urbino
 * ===================
 * Generates GeoHashes for given locations.
 */

require_once(dirname(__FILE__) . '/game.php');
require_once(dirname(__FILE__) . '/lib.php');

use Lvht\GeoHash;

if(!isset($argv[1])) {
    die("Usage: " . basename(__FILE__) . " <GAME ID>\n");
}
$game_id = intval($argv[1]);

$locations = db_table_query(sprintf(
    'SELECT `location_id`, `lat`, `lng` FROM `locations` WHERE `game_id` = %d',
    $game_id
));

echo count($locations) . ' locations loaded' . PHP_EOL;

foreach ($locations as $location) {
    $hash = GeoHash::encode($location['2'], $location['1'], 0.001);
    echo $location['0'] . ': ' . $hash . PHP_EOL;

    db_perform_action(sprintf(
        'UPDATE `locations` SET `geohash` = "%s" WHERE `game_id` = %d AND `location_id` = %d',
        $hash,
        $game_id,
        intval($location['0'])
    ));
}
