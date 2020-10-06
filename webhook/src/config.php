<?php
/*
 * Telegram Bot Sample
 * ===================
 * UWiClab, University of Urbino
 * ===================
 * Configuration file.
 * Fill in values and save as config.php.
 *
 */

/* Constants for telegram API */
define('TELEGRAM_BOT_TOKEN', getenv('TELEGRAM_BOT_TOKEN'));
define('TELEGRAM_API_URI_BASE', 'https://api.telegram.org/bot' . TELEGRAM_BOT_TOKEN . '/');
define('TELEGRAM_FILE_API_URI_BASE', 'https://api.telegram.org/file/bot' . TELEGRAM_BOT_TOKEN . '/');

/* Constants for DB Access */
define('DATABASE_HOST', 'db');
define('DATABASE_NAME', getenv('MYSQL_DATABASE'));
define('DATABASE_USERNAME', getenv('MYSQL_USER'));
define('DATABASE_PASSWORD', getenv('MYSQL_PASSWORD'));

/* Settings constant */
define('DEBUG', true);
define('PERF_LOGGING', false);
define('CHAT_GROUP_DEBUG', 0);
define('DEBUG_TO_DB', true);
define('DEBUG_TO_BOT', false);
define('DEACTIVATED', false);
define('BOT_DEEPLINK_START_ROOT', 'https://t.me/BOTNAME?start=');

// PHP configuration
date_default_timezone_set('UTC'); // ensure UTC is used for all date functions
set_time_limit(0); // ensure scripts are not interrupted (e.g., long-polling or downloads)
