#!/usr/bin/env php
<?php
/*
 * CodeMOOC TreasureHuntBot
 * ===================
 * UWiClab, University of Urbino
 * ===================
 * CLI test harness: simulates an incoming Telegram message and routes it
 * through the full message-processing pipeline without hitting the Telegram
 * API. Bot replies are printed to stdout instead of being sent.
 *
 * Usage:
 *   php test_message.php --user-id 12345 --text "/start"
 *   php test_message.php --user-id 12345 --text "Hello" \
 *     --first-name "Mario" --last-name "Rossi" --language "it-IT"
 *   php test_message.php --user-id 12345 --callback \
 *     --callback-data "RESET GAME 42" --message-id 100
 *
 * All parameters are optional except --text (for messages) or --callback-data
 * (for callbacks). Defaults: user-id = 1, first-name = "Test",
 * language = "en-US".
 */

// ---------------------------------------------------------------------------
// 1. Define mock perform_telegram_request BEFORE any library loads.
//    lib_telegram.php guards the real definition with function_exists(),
//    so this mock takes precedence. No HTTP calls reach the Telegram API.
// ---------------------------------------------------------------------------

$GLOBALS['_test_outgoing_messages'] = [];

if (!function_exists('perform_telegram_request')) {
    function perform_telegram_request($handle) {
        // Inspect the cURL handle URL to determine the API method
        $url = curl_getinfo($handle, CURLINFO_EFFECTIVE_URL);
        $method = 'unknown';
        if (preg_match('#/bot[^/]+/([a-zA-Z]+)#', $url, $m)) {
            $method = $m[1];
        }

        // Extract parameters from the handle's URL query string.
        // prepare_curl_api_request() encodes all params (including text,
        // chat_id, etc.) into the URL, so we can parse them back out.
        $params = [];
        $query = parse_url($url, PHP_URL_QUERY);
        if ($query) {
            parse_str($query, $params);
        }

        $entry = [
            'method' => $method,
            'url'    => $url,
            'params' => $params,
        ];

        // Try to extract the text from POST body (for sendMessage etc.)
        // curl_getinfo doesn't expose POSTFIELDS directly, but we can
        // reconstruct from the handle. For sendMessage, the text param
        // is in the URL query string because prepare_curl_api_request
        // builds it there.
        if (isset($params['text'])) {
            $entry['text'] = $params['text'];
        }
        if (isset($params['chat_id'])) {
            $entry['chat_id'] = $params['chat_id'];
        }
        if (isset($params['caption'])) {
            $entry['caption'] = $params['caption'];
        }
        if (isset($params['action'])) {
            $entry['action'] = $params['action'];
        }

        $GLOBALS['_test_outgoing_messages'][] = $entry;

        // Close handle to mimic real behaviour
        curl_close($handle);

        // Return a fake successful response shaped like the Telegram API
        // result. sendMessage returns an array with message_id; others
        // just need truthy results.
        if ($method === 'sendMessage') {
            return [
                'message_id' => mt_rand(100000, 999999),
                'date'       => time(),
                'chat'       => ['id' => $params['chat_id'] ?? 0],
            ];
        }
        if ($method === 'sendChatAction') {
            return true;
        }
        if ($method === 'answerCallbackQuery') {
            return true;
        }

        return [];
    }
}

// ---------------------------------------------------------------------------
// 2. Parse CLI arguments.
// ---------------------------------------------------------------------------

function parse_args($argv) {
    $opts = [
        'user-id'       => null,
        'text'          => null,
        'first-name'    => 'Mario',
        'last-name'     => 'Rossi',
        'username'      => 'mrossi',
        'language'      => 'en-US',
        'callback'      => false,
        'callback-data' => null,
        'message-id'    => 1,
        'help'          => false,
    ];

    $count = count($argv);
    for ($i = 1; $i < $count; $i++) {
        $arg = $argv[$i];
        if ($arg === '--help' || $arg === '-h') {
            $opts['help'] = true;
        } elseif ($arg === '--callback') {
            $opts['callback'] = true;
        } elseif (substr($arg, 0, 2) === '--' && $i + 1 < $count) {
            $key = substr($arg, 2);
            if (array_key_exists($key, $opts)) {
                $opts[$key] = $argv[++$i];
            }
        }
    }

    return $opts;
}

function print_help() {
    echo <<<HELP
CLI test harness for the Treasure Hunt Bot.

Simulates an incoming Telegram update (message or callback) and processes it
through the full pipeline. Bot replies are printed to stdout; logs go to stderr.

USAGE
  php test_message.php [OPTIONS] --text "MESSAGE"
  php test_message.php [OPTIONS] --callback --callback-data "DATA"

OPTIONS
  --user-id ID          Telegram user ID (default: 1)
  --text "MESSAGE"      The text message to send (required for message mode)
  --first-name "NAME"   User's first name (default: "Mario")
  --last-name "NAME"    User's last name (default: "Rossi")
  --username "NAME"     Telegram username (default: "mrossi")
  --language "LC"       Language code, e.g. en-US, it-IT (default: "en-US")
  --callback            Switch to callback-query mode
  --callback-data "DATA"  Callback data string (required for callback mode)
  --message-id ID       Message ID for callback mode (default: 1)
  --help, -h            Show this help

EXAMPLES
  # Simple /start command from a private chat
  php test_message.php --user-id 12345 --text "/start"

  # Italian user sending a message, with last name
  php test_message.php --user-id 12345 --text "ciao" \
    --first-name "Mario" --last-name "Rossi" --language "it-IT"

  # Simulate a callback query (e.g. RESET GAME button)
  php test_message.php --user-id 12345 --callback \
    --callback-data "RESET GAME 42" --message-id 100

HELP;
}

// ---------------------------------------------------------------------------
// 3. Build the fake Telegram update structure.
// ---------------------------------------------------------------------------

function build_message_update($opts) {
    $user_id = (int)($opts['user-id'] !== null ? $opts['user-id'] : 1);

    $from = [
        'id'            => $user_id,
        'first_name'    => $opts['first-name'],
        'is_bot'        => false,
    ];
    if ($opts['last-name'] !== '') {
        $from['last_name'] = $opts['last-name'];
    }
    if ($opts['username'] !== '') {
        $from['username'] = $opts['username'];
    }
    if ($opts['language'] !== '') {
        $from['language_code'] = $opts['language'];
    }

    $chat = [
        'id'   => $user_id,
        'type' => 'private',
        'first_name' => $opts['first-name']
    ];
    if ($opts['last-name'] !== '') {
        $chat['last_name'] = $opts['last-name'];
    }

    $message = [
        'message_id' => mt_rand(1, 99999),
        'from'       => $from,
        'chat'       => $chat,
        'date'       => time(),
        'text'       => $opts['text'] ?? '',
    ];

    return [
        'update_id' => mt_rand(1, 999999999),
        'message'   => $message,
    ];
}

function build_callback_update($opts) {
    $user_id = (int)($opts['user-id'] !== null ? $opts['user-id'] : 1);

    $from = [
        'id'         => $user_id,
        'first_name' => $opts['first-name'],
        'is_bot'     => false,
    ];
    if ($opts['last-name'] !== '') {
        $from['last_name'] = $opts['last-name'];
    }
    if ($opts['language'] !== '') {
        $from['language_code'] = $opts['language'];
    }

    $chat = [
        'id'   => $user_id,
        'type' => 'private',
        'first_name' => $opts['first-name']
    ];
    if ($opts['last-name'] !== '') {
        $chat['last_name'] = $opts['last-name'];
    }

    return [
        'update_id'      => mt_rand(1, 999999999),
        'callback_query' => [
            'id'      => (string)mt_rand(1, 999999999),
            'from'    => $from,
            'message' => [
                'message_id' => (int)$opts['message-id'],
                'from'       => $from,
                'chat'       => $chat,
                'date'       => time(),
                'text'       => 'Callback source message',
            ],
            'data'    => $opts['callback-data'] ?? '',
        ],
    ];
}

// ---------------------------------------------------------------------------
// 4. Main entry point.
// ---------------------------------------------------------------------------

$opts = parse_args($argv);

if ($opts['help']) {
    print_help();
    exit(0);
}

// Validate required parameters
if ($opts['callback']) {
    if ($opts['callback-data'] === null) {
        fwrite(STDERR, "E/--callback-data is required in callback mode. Use --help for usage.\n");
        exit(1);
    }
} else {
    if ($opts['text'] === null) {
        fwrite(STDERR, "E/--text is required in message mode. Use --help for usage.\n");
        exit(1);
    }
}

// Build the appropriate update structure
if ($opts['callback']) {
    $update = build_callback_update($opts);
} else {
    $update = build_message_update($opts);
}

// Hand off to the message processing core
include 'msg_processing_core.php';

// Print a separator header to stdout
echo "══════════════════════════════════════════════════════════════\n";
echo "  TEST MESSAGE HARNESS\n";
echo "══════════════════════════════════════════════════════════════\n";
if ($opts['callback']) {
    echo sprintf("  Mode:        callback query\n");
    echo sprintf("  Callback:    %s\n", $opts['callback-data']);
    echo sprintf("  Message ID:  %d\n", (int)$opts['message-id']);
} else {
    echo sprintf("  Mode:        message\n");
    echo sprintf("  Text:        %s\n", $opts['text']);
}
echo sprintf("  User ID:     %d\n", $context->get_telegram_user_id());
echo sprintf("  Chat ID:     %s\n", $context->comm ? $context->comm->get_telegram_id() : 'N/A');
if ($context->game && $context->game->game_id) {
    echo sprintf("  Game ID:     %d (admin: %s)\n", $context->game->game_id, $context->game->is_admin ? 'yes' : 'no');
} else if ($opts['game-id'] !== null) {
    echo sprintf("  Game ID:     %d (admin: %s) [overridden]\n", $opts['game-id'], $opts['is-admin'] ? 'yes' : 'no');
} else {
    echo sprintf("  Game ID:     (none)\n");
}
echo "──────────────────────────────────────────────────────────────\n";
echo "  Bot replies (captured):\n";
echo "──────────────────────────────────────────────────────────────\n";

// Print captured outgoing messages
$messages = $GLOBALS['_test_outgoing_messages'];
if (empty($messages)) {
    echo "  (no replies sent)\n";
} else {
    $idx = 1;
    foreach ($messages as $msg) {
        $label = "[{$idx}] {$msg['method']}";
        if (isset($msg['chat_id'])) {
            $label .= " → chat {$msg['chat_id']}";
        }
        echo "  {$label}\n";
        if (isset($msg['text'])) {
            echo "    " . str_replace("\n", "\n    ", $msg['text']) . "\n";
        }
        if (isset($msg['caption'])) {
            echo "    [caption] " . str_replace("\n", "\n    ", $msg['caption']) . "\n";
        }
        if (isset($msg['action'])) {
            echo "    [action] {$msg['action']}\n";
        }
        echo "\n";
        $idx++;
    }
}

echo "══════════════════════════════════════════════════════════════\n";
echo "  Done. " . count($messages) . " outgoing API call(s) intercepted.\n";
echo "══════════════════════════════════════════════════════════════\n";
