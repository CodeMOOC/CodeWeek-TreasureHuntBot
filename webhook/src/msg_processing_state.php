<?php
/*
 * CodeMOOC TreasureHuntBot
 * ===================
 * UWiClab, University of Urbino
 * ===================
 * Game state process message processing.
 */

/**
 * Handles the group's current registration state,
 * sending out a question to the user if needed.
 *  @param Context $context - message context.
 * @return bool True if handled, false if no need.
 */
function msg_processing_handle_group_state($context) {
    if(!$context->game || $context->game->group_state === null) {
        //No state
        Logger::debug("Ignoring message for group state", __FILE__, $context);
        return false;
    }

    switch($context->game->group_state) {
        case STATE_NEW:
            // Send out guide
            $context->comm->reply(
                __('send_out_game_guide'),
                array(
                    '%HELP_LINK%' => GAME_GUIDE_LINKS[$context->game->game_id]
                ),
                array("reply_markup" => array(
                    "inline_keyboard" => array(
                        array(
                            array(
                                "text" => __('game_guide_got_it'),
                                "callback_data" => 'done'
                            )
                        )
                    )
                ))
            );
            return true;

        case STATE_NEW_INSTRUCTED:
            // Send out the captcha question
            $context->comm->reply(__('registration_new_state'));

            $context->comm->picture(
                'images/quiz-captcha.png',
                __('registration_new_state_caption')
            );

            return true;

        case STATE_REG_VERIFIED:
            //Needs to ask for group name
            $context->comm->reply(__('registration_verified_state'));
            return true;

        case STATE_REG_NAME:
            $context->comm->reply(__('registration_name_state'));
            return true;

        case STATE_REG_NUMBER:
            $context->comm->reply(
                __('registration_number_state'),
                null,
                array("reply_markup" => array(
                    "inline_keyboard" => array(
                        array(
                            array(
                                "text" => __('skip'),
                                "callback_data" => 'skip avatar'
                            )
                        )
                    )
                ))
            );
            return true;

        case STATE_REG_READY:
            $context->comm->reply(__('start_right_away'));

            // Go straight to riddle and next location!
            $riddle_id = bot_assign_random_riddle($context);
            if($riddle_id === false || $riddle_id === null) {
                $context->comm->reply(__('failure_general'));
            }

            return true;

        /* GAME */

        case STATE_GAME_LOCATION:
            return true;

        case STATE_GAME_SELFIE:
            $context->comm->reply(__('game_selfie_state'));
            return true;

        case STATE_GAME_PUZZLE:
            $context->comm->reply(__('game_puzzle_state'));
            return true;

        case STATE_GAME_LAST_LOC:
            $context->comm->reply(
                __('almost_there_geohash'),
                null,
                array("reply_markup" => array(
                    "inline_keyboard" => array(
                        array(
                            array(
                                "text" => __('game_location_hint_button'),
                                "callback_data" => 'hint'
                            ),
                            array(
                                "text" => __('open_location_map'),
                                "url" => GAME_MAP_LINKS[$context->game->game_id]
                            )
                        )
                    )
                ))
            );
            return true;

        case STATE_GAME_LAST_SELF:
            $context->comm->reply(__('game_last_selfie_state'));
            return true;

        case STATE_GAME_LAST_PUZ:
            if($context->game->event_id === GAME_EVENT_ID_CODEWEEK_2019) {
                $context->comm->picture('../riddles/codeweek-2019/europe.jpg', __('riddle_type_final', 'riddles'));
            }
            else {
                $context->comm->picture(GAME_LAST_PUZZLE_1_IMAGE, __('riddle_type_final', 'riddles'));
            }
            return true;

        case STATE_GAME_LAST_PUZ + 1:
            if($context->game->event_id === GAME_EVENT_ID_CODEWEEK_2019) {
                $context->comm->picture('../riddles/codeweek-2019/hungary.jpg', __('riddle_type_final_repeat', 'riddles'));
            }
            else {
                $context->comm->picture(GAME_LAST_PUZZLE_2_IMAGE, __('riddle_type_final_repeat', 'riddles'));
            }
            return true;

        case STATE_GAME_LAST_PUZ + 2:
            if($context->game->event_id === GAME_EVENT_ID_CODEWEEK_2019) {
                $context->comm->picture('../riddles/codeweek-2019/vonneumann.jpg', "“Helló, barátaim! I was born here in 1903 and in ’29 I moved to the United States. Modern computer architecture and programming are based on a model that has my name. What’s the first name I adopted when moving to the USA?”");
            }
            else {
                $context->comm->picture(GAME_LAST_PUZZLE_3_IMAGE, "“Hello, mes amis. My father was a tax collector in Rouen and I helped him by developing one of the first mechanical calculators in 1642. What's my last name?”");
            }
            return true;

        case STATE_GAME_WON:
            $context->comm->reply(__('game_won_state'));
            return true;

        case STATE_FEEDBACK:
            $context->comm->reply(__('questionnaire_q1'), null, array(
                'reply_markup' => array(
                    'keyboard' => array(
                        array(__('questionnaire_likert_1')),
                        array(__('questionnaire_likert_2')),
                        array(__('questionnaire_likert_3')),
                        array(__('questionnaire_likert_4')),
                        array(__('questionnaire_likert_5'))
                    )
                )
            ));
            return true;

        case STATE_FEEDBACK + 1:
            $context->comm->reply(__('questionnaire_q2'), null, array(
                'reply_markup' => array(
                    'keyboard' => array(
                        array(__('questionnaire_likert_1')),
                        array(__('questionnaire_likert_2')),
                        array(__('questionnaire_likert_3')),
                        array(__('questionnaire_likert_4')),
                        array(__('questionnaire_likert_5'))
                    )
                )
            ));
            return true;

        case STATE_FEEDBACK + 2:
            $context->comm->reply(__('questionnaire_q3'), null, array(
                'reply_markup' => array(
                    'keyboard' => array(
                        array(__('questionnaire_likert_1')),
                        array(__('questionnaire_likert_2')),
                        array(__('questionnaire_likert_3')),
                        array(__('questionnaire_likert_4')),
                        array(__('questionnaire_likert_5'))
                    )
                )
            ));
            return true;

        case STATE_FEEDBACK + 3:
            $context->comm->reply(__('questionnaire_q4'));
            return true;

        case STATE_CERT_SENT:
            $context->comm->reply(__('game_won_state'));

            $context->comm->reply(
                __('victory_location_for_wom'),
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
            return true;

        case STATE_WOM_SENT:
            $context->comm->reply(__('game_won_state'));
            return true;
    }

    return false;
}

/**
 * Handles the user's response if needed by the registration state.
 * @return bool True if handled, false otherwise.
 */
function msg_processing_handle_group_response($context) {
    if(!$context->game || $context->game->group_state === null) {
        //No state
        Logger::debug("Ignoring message for group response", __FILE__, $context);
        return false;
    }

    $message_response = '';
    if($context->message) {
        $message_response = $context->message->get_response();
    }

    switch($context->game->group_state) {

        /* REGISTRATION */
        case STATE_NEW:
            if(
                ($context->is_callback() && $context->callback->data === 'done') ||
                is_affirmative($message_response)
            ) {
                bot_set_group_state($context, STATE_NEW_INSTRUCTED);

                msg_processing_handle_group_state($context);
            }
            else {
                $context->comm->reply(__('say_again_ready'));
            }
            return true;

        case STATE_NEW_INSTRUCTED:
            if('c' === $message_response) {
                bot_set_group_state($context, STATE_REG_VERIFIED);
                $context->comm->reply(__('registration_new_response_correct'));

                msg_processing_handle_group_state($context);
            }
            else {
                $context->comm->reply(__('registration_new_response_wrong'));
            }
            return true;

        case STATE_REG_VERIFIED:
            if($message_response) {
                $name = ucwords($message_response);

                bot_set_group_name($context, $name);
                bot_set_group_state($context, STATE_REG_NAME);

                $groups_count = bot_get_registered_groups($context);

                Logger::info("Registered group '{$name}' ({$groups_count}th)", __FILE__, $context);

                $context->comm->reply(__('registration_verified_response_ok'), array(
                    '%GROUP_COUNT%' => $groups_count
                ));

                msg_processing_handle_group_state($context);
            }
            else {
                $context->comm->reply(__('registration_verified_response_invalid'));
            }
            return true;

        case STATE_REG_NAME:
            if(!is_numeric($message_response)) {
                $context->comm->reply(__('registration_name_response_invalid'));
                return true;
            }

            $number = intval($message_response);
            if($number < 1) {
                $context->comm->reply(__('registration_name_response_toofew'));
                return true;
            }
            else if($number > 50) {
                $context->comm->reply(__('registration_name_response_toomany'));
                return true;
            }

            bot_set_group_participants($context, $number);
            bot_set_group_state($context, STATE_REG_NUMBER);

            Logger::info("Group '{$context->game->group_name}' registered '{$number}' participants", __FILE__, $context);

            $context->comm->reply(__('registration_name_response_ok'), array(
                '%NUMBER%' => $number
            ));

            msg_processing_handle_group_state($context);

            return true;

        case STATE_REG_NUMBER:
            if($context->is_message() && $context->message->get_photo_max_id()) {
                $file_info = telegram_get_file_info($context->message->get_photo_max_id());
                $file_path = $file_info['file_path'];
                $local_path = "{$context->game->game_id}-{$context->get_internal_id()}.jpg";
                telegram_download_file($file_path, "/data/avatars/$local_path");

                bot_set_group_photo($context, $local_path);
                bot_set_group_state($context, STATE_REG_READY);

                $groups_count = bot_stats_ready_groups($context)[0];

                Logger::info("Group '{$context->game->group_name}' is ready for the game ({$groups_count}th)", __FILE__, $context);

                $context->comm->reply(__('registration_number_response_ok'), array(
                    '%GROUP_COUNT%' => $groups_count
                ));

                msg_processing_handle_group_state($context);
            }
            else if($context->is_callback() && $context->callback->data === 'skip avatar') {
                bot_set_group_photo($context, 'default_user.jpg');
                bot_set_group_state($context, STATE_REG_READY);

                $groups_count = bot_stats_ready_groups($context)[0];

                Logger::info("Group '{$context->game->group_name}' is ready for the game ({$groups_count}th)", __FILE__, $context);

                $context->comm->reply(__('registration_number_response_ok'), array(
                    '%GROUP_COUNT%' => $groups_count
                ));

                msg_processing_handle_group_state($context);
            }
            else {
                $context->comm->reply(__('registration_number_response_invalid'));
            }
            return true;

        case STATE_REG_READY:
            // Nop
            return true;

        /* GAME */

        case STATE_GAME_LOCATION:
            // We expect a deeplink that will come through the /start command
            if($context->is_callback() && $context->callback->data === 'hint') {
                $elapsed_seconds = bot_get_time_since_location_assignment($context);
                $seconds_to_wait = 60 - $elapsed_seconds;
                Logger::debug("{$elapsed_seconds} seconds elapsed since location assignment", __FILE__, $context);

                if($elapsed_seconds >= 60) {
                    $location_info = bot_get_location_info($context, bot_get_expected_location_id($context));
                    if($location_info[5]) {
                        // Send location-specific text hint
                        $context->comm->reply($location_info[5]);
                    }
                    else {
                        // Send precise location
                        $context->comm->reply(__('game_location_hint_confirm'));
                        telegram_send_location(
                            $context->get_telegram_chat_id(),
                            $location_info[0],
                            $location_info[1]
                        );
                    }
                    return true;
                }
                else {
                    $context->comm->reply(__('game_location_hint_wait'), array(
                        '%SECONDS%' => $seconds_to_wait
                    ), array("reply_markup" => array(
                        "inline_keyboard" => array(
                            array(
                                array("text" => __('game_location_hint_button'), "callback_data" => 'hint')
                            )
                        )
                    )));
                    return true;
                }
            }
            else if($context->is_message() && $context->message->is_text()) {
                $context->comm->reply(__('game_location_hint_nudge'), null, array("reply_markup" => array(
                    "inline_keyboard" => array(
                        array(
                            array("text" => __('game_location_hint_button'), "callback_data" => 'hint')
                        )
                    )
                )));
                return true;
            }

            msg_processing_handle_group_state($context);
            return true;

        case STATE_GAME_SELFIE:
            // Expecting photo taken at reached location
            if($context->is_message() && $context->message->get_photo_max_id()) {
                $reached_locations_count = bot_get_count_of_reached_locations($context);

                $file_info = telegram_get_file_info($context->message->get_photo_max_id());
                $file_path = $file_info['file_path'];
                $local_path = "{$context->game->game_id}-{$context->get_internal_id()}-{$reached_locations_count}";
                telegram_download_file($file_path, "/data/selfies/{$local_path}.jpg");

                // Process selfie and optional badge
                if($context->game->badge_overlay_image) {
                    exec("convert /data/selfies/{$local_path}.jpg -resize 1600x1600^ -gravity center -crop 1600x1600+0+0 +repage {$context->game->badge_overlay_image} -composite /data/badges/{$local_path}.jpg");

                    $context->comm->picture("/data/badges/{$local_path}.jpg", __('game_selfie_response_badge'));
                }
                else {
                    $context->comm->reply(__('game_selfie_response_ok'));
                }

                // Post notice on channel
                if($reached_locations_count > 0) {
                    $context->comm->channel_picture($file_info['file_id'], __('game_selfie_forward_caption'), array(
                        '%INDEX%' => $reached_locations_count
                    ));
                }

                $riddle_id = bot_assign_random_riddle($context);
                if($riddle_id === false || $riddle_id === null) {
                    $context->comm->reply(__('failure_general'));
                    return true;
                }
            }
            else {
                msg_processing_handle_group_state($context);
            }
            return true;

        case STATE_GAME_PUZZLE:
            if($message_response || $message_response === '0') {
                $result = bot_give_solution($context, $message_response);

                if($result === false) {
                    $context->comm->reply(__('failure_general'));
                }
                else if($result === 'wrong') {
                    $context->comm->reply(__('game_puzzle_response_wrong'));
                }
                else if($result === true) {
                    $confirm_text = __('game_puzzle_response_correct');
                    $current_hint = bot_get_current_hint($context);
                    if($current_hint !== null) {
                        $confirm_text .= ' <b>' . $current_hint . '</b>';
                    }
                    $context->comm->reply($confirm_text);

                    $advance_result = bot_advance_track_location($context);
                    if($advance_result === false) {
                        $context->comm->reply(__('failure_general'));
                        return true;
                    }

                    if(!$advance_result['end_of_track']) {
                        // Send out directions for next location
                        $target_location_id = $advance_result['location_id'];
                        $location_info = bot_get_location_info($context, $target_location_id);

                        // Prep keyboard
                        $keyboard = array(
                            array(
                                "text" => __('open_location_map'),
                                "url" => GAME_MAP_LINKS[$context->game->game_id]
                            )
                        );
                        if($context->game->location_hints_enabled && $location_info[5]) {
                            $keyboard[] = array(
                                "text" => __('game_location_hint_button'),
                                "callback_data" => 'hint'
                            );
                        }

                        $context->comm->reply(
                            $location_info[2],
                            null,
                            array("reply_markup" => array(
                                "inline_keyboard" => array($keyboard)
                            ))
                        );
                    }

                    // This sends out hint to last location, if required
                    msg_processing_handle_group_state($context);
                }
                else {
                    $context->comm->reply(__('game_puzzle_response_wait'), array(
                        '%SECONDS%' => intval($result)
                    ));
                }
            }
            else {
                msg_processing_handle_group_state($context);
            }
            return true;

        case STATE_GAME_LAST_LOC:
            // We expect a deeplink that will come through the /start command
            if($context->is_callback() && $context->callback->data === 'hint') {
                $context->comm->reply(
                    __('geohash_hint'),
                    null,
                    array("reply_markup" => array(
                        "inline_keyboard" => array(
                            array(
                                array(
                                    "text" => __('geohash_conversion_link'),
                                    "url" => "https://www.movable-type.co.uk/scripts/geohash.html"
                                ),
                                array(
                                    "text" => __('open_location_map'),
                                    "url" => GAME_MAP_LINKS[$context->game->game_id]
                                )
                            )
                        )
                    ))
                );
            }
            else if($context->is_message() && $context->message->is_text()) {
                // Nop
            }
            return true;

        case STATE_GAME_LAST_SELF:
            // Expecting photo taken at last location
            if($context->is_message() && $context->message->get_photo_max_id()) {
                $file_info = telegram_get_file_info($context->message->get_photo_max_id());
                $file_path = $file_info['file_path'];
                $local_path = "{$context->game->game_id}-{$context->get_internal_id()}-final";
                telegram_download_file($file_path, "/data/selfies/{$local_path}.jpg");

                $context->comm->reply(__('game_last_selfie_response_ok'));

                $context->comm->channel_picture($file_info['file_id'], __('game_last_selfie_forward_caption'));

                if(in_array($context->game->event_id, EVENT_IDS_WITH_FINAL_PUZZLE)) {
                    $context->comm->reply(__('game_last_puzzle_instructions'));
                    
                    bot_set_group_state($context, STATE_GAME_LAST_PUZ);
                }
                else {
                    msg_process_victory($context);
                }
            }

            msg_processing_handle_group_state($context);

            return true;

        case STATE_GAME_LAST_PUZ:
            if($context->game->event_id === GAME_EVENT_ID_CODEWEEK_2019) {
                if($message_response === 'e6') {
                    bot_set_group_state($context, STATE_GAME_LAST_PUZ + 1);
                    msg_processing_handle_group_state($context);
                    return true;
                }
            }
            else {
                if($message_response === GAME_LAST_PUZZLE_1_SOLUTION) {
                    bot_set_group_state($context, STATE_GAME_LAST_PUZ + 1);
                    msg_processing_handle_group_state($context);
                    return true;
                }
            }
            
            $context->comm->reply(__('game_last_puzzle_wrong'));
            return true;

        case STATE_GAME_LAST_PUZ + 1:
            if($context->game->event_id === GAME_EVENT_ID_CODEWEEK_2019) {
                if($message_response === 'd3') {
                    bot_set_group_state($context, STATE_GAME_LAST_PUZ + 2);
                    msg_processing_handle_group_state($context);
                    return true;
                }
            }
            else {
                if($message_response === GAME_LAST_PUZZLE_2_SOLUTION) {
                    bot_set_group_state($context, STATE_GAME_LAST_PUZ + 2);
                    msg_processing_handle_group_state($context);
                }
            }
            
            $context->comm->reply(__('game_last_puzzle_wrong'));
            return true;

        case STATE_GAME_LAST_PUZ + 2:
            if($context->game->event_id === GAME_EVENT_ID_CODEWEEK_2019) {
                if($message_response === 'john') {
                    msg_process_victory($context);
                    return true;
                }
            }
            else {
                if($message_response === GAME_LAST_PUZZLE_3_SOLUTION) {
                    msg_process_victory($context);
                    return true;
                }
            }
            
            $context->comm->reply(__('game_last_puzzle_wrong'));
            return true;

        case STATE_GAME_WON:
            if($context->is_callback()) {
                if(!$context->verify_callback()) {
                    return false;
                }

                if($context->callback->data == 'questionnaire') {
                    bot_set_group_state($context, STATE_FEEDBACK);

                    $context->comm->reply(__('questionnaire_init_instructions'));
                    $context->comm->reply(__('questionnaire_init_begin'));
                }
                else {
                    return false;
                }
            }

            msg_processing_handle_group_state($context);
            return true;

        case STATE_CERT_SENT:
            if($context->message && $context->message->is_location()) {
                $context->comm->reply(__('received_location_for_wom'));
                telegram_send_chat_action($context->comm->get_telegram_id());

                $lat = $context->message->latitude;
                $lng = $context->message->longitude;

                // Generate WOM vouchers
                $Instrument = new \WOM\Instrument(INSTRUMENT_ID, INSTRUMENT_PRIVATE_KEY, INSTRUMENT_PRIVATE_KEY_PASSWORD);
                $vouchers[] = \WOM\Voucher::Create('C', $lat, $lng, new DateTime('NOW'), 30);

                try {
                    Logger::info("Generating WOM vouchers", __FILE__, $context);

                    $Instrument->RequestVouchers($vouchers, "", $pin, $otc);

                    $womCodePath = "/data/qrcodes/wom-otc-" . $context->get_internal_id() . "-" . $context->game->game_id . ".png";
                    Logger::debug("Storing WOM QR code at {$womCodePath}", __FILE__, $context);
                    \WOM\WOMQRCodeGenerator::GetQRCode($otc, 200, $womCodePath);

                    $context->comm->picture($womCodePath, null);
                    $context->comm->reply(__('received_wom_vouchers'), array(
                        '%WOM_LINK%' => 'https://wom.social/vouchers/' . $otc,
                        '%WOM_PIN%' => '$pin'
                    ));
                }
                catch(Exception $exception) {
                    Logger::error($exception, __FILE__, $context);
                }

                bot_set_group_state($context, STATE_WOM_SENT);

                $context->comm->reply(
                    __('questionnaire_finish_thankyou'),
                    null,
                    array("reply_markup" => array(
                        "inline_keyboard" => array(
                            array(
                                array(
                                    "text" => "Play again!",
                                    "callback_data" => "RESET GAME " . $context->game->game_id
                                )
                            )
                        )
                    ))
                );
            }
            else {
                msg_processing_handle_group_state($context);
            }
            return true;

        case STATE_WOM_SENT:
            msg_processing_handle_group_state($context);
            return true;
    }

    return false;
}
