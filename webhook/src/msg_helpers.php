<?php
/*
 * CodeMOOC TreasureHuntBot
 * ===================
 * UWiClab, University of Urbino
 * ===================
 * Helpers for common message processing / messaging functions.
 */

/**
 * Processes a victory by the user, for a given game or event.
 */
function msg_process_victory($context, $event_id = null, $game_id = null) {
    Logger::debug("Message processing for victory in event {$event_id} and game {$game_id}", __FILE__, $context);

    if($event_id === null && $game_id === null) {
        $game_id = $context->game->game_id;
    }

    $result = bot_direct_win($context, $event_id, $game_id);
    if($result === 'wrong') {
        $context->comm->reply(__('cmd_start_wrong_payload'));
    }
    else if($result === 'unallowed_event_not_ready') {
        $context->comm->reply(__('failure_event_not_ready'));
    }
    else if($result === 'unallowed_event_over') {
        $context->comm->reply(__('failure_event_over'));
    }
    else if($result === 'unallowed_game_not_ready') {
        $context->comm->reply(__('failure_game_not_ready'));
    }
    else if($result === 'unallowed_game_over') {
        $context->comm->reply(__('failure_game_dead'));
    }
    else if($result === 'too_soon') {
        // Invalid state, cannot win game yet/again
        $context->comm->reply(__('cmd_start_prize_invalid'));
    }
    else if(is_array($result)) {
        if($result[0] === 'first') {
            $context->comm->reply(__('cmd_start_prize_first'));
            $context->comm->channel(__('cmd_start_prize_channel_first'));
        }
        else {
            $context->comm->reply(__('cmd_start_prize_not_first'), array(
                '%WINNING_GROUP%' => $result[1],
                '%INDEX%' => $result[2]
            ));
            $context->comm->channel(__('cmd_start_prize_channel_not_first'), array(
                '%INDEX%' => $result[2]
            ));
        }

        $context->comm->reply(__('questionnaire_finish_generating'));
        telegram_send_chat_action($context->comm->get_telegram_id());

        // Generate certificate
        $identifier = "{$context->game->game_id}-{$context->get_internal_id()}";
        $elapsed_minutes = intval(ceil($context->game->get_elapsed_time() / 60.0));

        $certificate_path = "/data/certificates/{$identifier}-certificate.pdf";
        $certificate_cmd = sprintf(
            'php /html2pdf/cert-gen.php "%s" "%s" %d "%s" "%s" "%s" "%s" %d',
            game_get_certificate_template($context->game->game_id),
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

        Logger::info("Delivering certificate from {$certificate_path}", __FILE__, $context);
        $context->comm->document($certificate_path, __('questionnaire_attachment_caption'));

        bot_set_group_state($context, STATE_CERT_SENT);

        $context->comm->reply(
            __('won_ask_location_for_wom'),
            null,
            array(
                'reply_markup' => array(
                    'keyboard' => array(
                        array(
                            array(
                                'text' => __('send_current_location'),
                                'request_location' => true
                            )
                        )
                    )
                )
            )
        );
    }
    else {
        $context->comm->reply(__('failure_general'));
    }
}
