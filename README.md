# Treasure Hunt Bot (CodeWeek edition)

Source code of the **Code Hunting Games** Telegram bot, refreshed and updated for **Code Week 2020**.
Visit the [official website](https://codehunting.games) for further information on how to play the game and how to create your own *Code Hunting Game* sessions.

[Archived version of the original bot source code](https://github.com/CodeMOOC/TreasureHuntBot).

Developed at the University&nbsp;of&nbsp;Urbino&nbsp;(Italy) and DIGIT&nbsp;srl.

## Contribute

Source code pull requests are welcome.
Please also check out [issues](https://github.com/CodeMOOC/CodeWeek-TreasureHuntBot/issues) to give feedback on errors, possible bugs, or improvements.

## Deploy your own bot

A *Code Hunting Game* session can very easily be organized using our main instance of the Telegram bot, [@treasurehuntbot](https://t.me/treasurehuntbot).

If you want to deploy the bot on your own, requirements are as follows:

* A Telegram bot,
* Server with a public&nbsp;IP,
* PHP&nbsp;7,
* MySQL.

In order to install the bot, please proceed as follows:

1. Get the code from this repository and ensure that your Web server correctly serves the source files at directory `/src` through the PHP&nbsp;interpreter.
1. Copy the `/src/config-template.php` file to `/src/config.php` and edit if as follows:
    1. Set `TELEGRAM_BOT_TOKEN` to your Telegram bot's token,
    1. Set all `DATABASE` constants to point to your local MySQL and ensure that the database user you are setting has read/write access,
    1. Update `BOT_DEEPLINK_START_ROOT`, replacing `BOTNAME` with your Telegram bot's nickname.
1. Install the database schema, running the `/sql/treasurehuntbot.sql` script,
1. Check whether the bot works, by running `php pull.php` (in directory `/src`): this will attempt to process Telegram messages you send to your bot in *pull* mode.
1. If everything works correctly, setup a webhook to your bot through the Telegram bot&nbsp;API:

```sh
curl -F "url=https://YOURDOMAIN/PATH-TO-BOT/src/hook.php" https://api.telegram.org/botBOTTOKEN/setWebhook
```

(Make sure to replace the URL with the correct path to your server and the `TOKEN` with your Telegram bot's token.)

That is all: the bot should now respond to your messages automatically.
You're all set and ready to create your own *Code Hunting Games*.
