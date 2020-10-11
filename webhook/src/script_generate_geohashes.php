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

const GAME_ID = 1;

$locations = array(
    array('location_id' => '1','lat' => '59.3399','lng' => '18.0548'),
    array('location_id' => '2','lat' => '35.8621','lng' => '23.305'),
    array('location_id' => '3','lat' => '45.5469','lng' => '11.5465'),
    array('location_id' => '4','lat' => '48.2082','lng' => '16.3738'),
    array('location_id' => '5','lat' => '47.5039','lng' => '19.0548'),
    array('location_id' => '6','lat' => '45.764','lng' => '4.8357'),
    array('location_id' => '7','lat' => '45.6333','lng' => '13.8'),
    array('location_id' => '8','lat' => '46.0321','lng' => '14.5278'),
    array('location_id' => '9','lat' => '44.8149','lng' => '20.1424'),
    array('location_id' => '10','lat' => '47.3727','lng' => '8.53083'),
    array('location_id' => '11','lat' => '42.6752','lng' => '23.3685'),
    array('location_id' => '12','lat' => '50.081','lng' => '14.4114'),
    array('location_id' => '13','lat' => '39.9182','lng' => '32.8417'),
    array('location_id' => '14','lat' => '35.2985','lng' => '25.1596'),
    array('location_id' => '15','lat' => '41.3842','lng' => '2.17069'),
    array('location_id' => '16','lat' => '43.7151','lng' => '10.3913'),
    array('location_id' => '17','lat' => '44.7584','lng' => '20.5984'),
    array('location_id' => '18','lat' => '40.4168','lng' => '-3.70379'),
    array('location_id' => '19','lat' => '52.2','lng' => '21.0333'),
    array('location_id' => '20','lat' => '51.5074','lng' => '-0.127759'),
    array('location_id' => '21','lat' => '41.3896','lng' => '2.11614'),
    array('location_id' => '22','lat' => '56.1677','lng' => '10.1905'),
    array('location_id' => '23','lat' => '47.5087','lng' => '19.074'),
    array('location_id' => '24','lat' => '48.1486','lng' => '17.1077'),
    array('location_id' => '25','lat' => '39.4592','lng' => '-8.66799'),
    array('location_id' => '26','lat' => '38.7368','lng' => '-9.13871'),
    array('location_id' => '27','lat' => '44.4863','lng' => '11.26'),
    array('location_id' => '28','lat' => '46.186','lng' => '14.5956'),
    array('location_id' => '29','lat' => '46.0669','lng' => '14.5392'),
    array('location_id' => '30','lat' => '50.0981','lng' => '14.4327'),
    array('location_id' => '31','lat' => '43.798','lng' => '10.9342'),
    array('location_id' => '32','lat' => '52.7748','lng' => '6.89884'),
    array('location_id' => '33','lat' => '55.6805','lng' => '12.5444'),
    array('location_id' => '34','lat' => '47.5172','lng' => '18.9898'),
    array('location_id' => '35','lat' => '38.737','lng' => '-9.13883'),
    array('location_id' => '36','lat' => '60.2214','lng' => '24.7571'),
    array('location_id' => '37','lat' => '60.1765','lng' => '24.8343'),
    array('location_id' => '38','lat' => '49.5475','lng' => '11.02'),
    array('location_id' => '39','lat' => '50.1017','lng' => '14.3415'),
    array('location_id' => '40','lat' => '52.3699','lng' => '4.89374'),
    array('location_id' => '41','lat' => '47.4734','lng' => '19.053'),
    array('location_id' => '42','lat' => '60.1726','lng' => '24.951'),
    array('location_id' => '43','lat' => '55.7047','lng' => '13.191'),
    array('location_id' => '44','lat' => '46.2338','lng' => '6.05568'),
    array('location_id' => '45','lat' => '47.4798','lng' => '19.0736'),
    array('location_id' => '46','lat' => '60.1871','lng' => '24.9376'),
    array('location_id' => '47','lat' => '64.9426','lng' => '25.4446'),
    array('location_id' => '48','lat' => '59.3355','lng' => '18.061'),
    array('location_id' => '49','lat' => '47.2165','lng' => '-1.5556'),
    array('location_id' => '50','lat' => '51.5039','lng' => '-0.088305'),
    array('location_id' => '51','lat' => '51.5074','lng' => '-0.1278'),
    array('location_id' => '52','lat' => '50.0647','lng' => '19.945'),
    array('location_id' => '53','lat' => '46.0246','lng' => '8.96007'),
    array('location_id' => '54','lat' => '55.605','lng' => '13.0038'),
    array('location_id' => '55','lat' => '65.5848','lng' => '22.1567'),
    array('location_id' => '56','lat' => '58.5953','lng' => '25.0136'),
    array('location_id' => '57','lat' => '50.8503','lng' => '4.3517'),
    array('location_id' => '58','lat' => '51.9966','lng' => '-0.743149'),
    array('location_id' => '59','lat' => '53.3285','lng' => '-2.20738'),
    array('location_id' => '60','lat' => '46.2352','lng' => '6.03053'),
    array('location_id' => '61','lat' => '53.2183','lng' => '-0.625536'),
    array('location_id' => '62','lat' => '59.5035','lng' => '13.3196'),
    array('location_id' => '63','lat' => '45.4543','lng' => '7.85498'),
    array('location_id' => '64','lat' => '51.578541','lng' => '-0.389534'),
    array('location_id' => '65','lat' => '46.199936','lng' => '6.144828'),
    array('location_id' => '66','lat' => '59.975078','lng' => '11.044971'),
);

foreach ($locations as $location) {
    $hash = GeoHash::encode($location['lng'], $location['lat'], 0.001);
    echo $location['location_id'] . ': ' . $hash . PHP_EOL;

    db_perform_action(sprintf(
        'UPDATE `locations` SET `geohash` = "%s" WHERE `game_id` = %d AND `location_id` = %d',
        $hash,
        GAME_ID,
        intval($location['location_id'])
    ));
}
