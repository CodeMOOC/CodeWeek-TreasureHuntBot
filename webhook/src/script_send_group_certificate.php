<?php
/*
 * CodeMOOC TreasureHuntBot
 * ===================
 * UWiClab, University of Urbino
 * ===================
 * Generates individual certificate for a group.
 */

require_once(dirname(__FILE__) . '/game.php');
require_once(dirname(__FILE__) . '/lib.php');
require_once(dirname(__FILE__) . '/model/context.php');

require_once(dirname(__FILE__) . '/msg_processing_state.php');

if(!isset($argv[1]) || !isset($argv[2])) {
    die("Usage: " . basename(__FILE__) . " <GAME ID> <GROUP ID> [\"Message\"]\n");
}
$game_id = intval($argv[1]);
$group_id = intval($argv[2]);
$add_message = $argv[3];

// Load context
$context = new Context((int)$group_id);
$context->set_active_game($game_id, false, false);

// Generate certificate
$identifier = "{$context->game->game_id}-{$context->get_internal_id()}";
$elapsed_minutes = intval(ceil($context->game->get_elapsed_time() / 60.0));

echo "Generating montage with identifier: '" . $identifier . "'" . PHP_EOL;

$certificate_path = "/data/certificates/{$identifier}-certificate.pdf";
$certificate_cmd = sprintf(
    'php /html2pdf/cert-gen.php "%s" "%s" %d "%s" "%s" "%s" "%s" %d',
    GAME_CERTIFICATE_TEMPLATES[$context->game->game_id],
    $certificate_path,
    $context->game->group_participants,
    addslashes($context->game->group_name),
    $context->game->get_group_avatar(),
    $context->game->game_name,
    $identifier,
    $elapsed_minutes
);
Logger::debug("Generating certificate at {$certificate_path} with command: {$certificate_cmd}", __FILE__, $context);

exec($certificate_cmd);

// Send out stuff
if(!empty($add_message)) {
    echo "Writing out additional message" . PHP_EOL;
    $context->comm->reply($add_message);
}

echo "Delivering certificate" . PHP_EOL;

$context->comm->document($certificate_path, __('questionnaire_attachment_caption'));

bot_set_group_state($context, STATE_CERT_SENT);
