# Alertmanager

Handler for Prometheus alerts, allow silencing and routing alerts to multiple services. Inspired by <https://github.com/stefanprodan/swarmprom>

## Slack receiver

First, create an App at <https://api.slack.com/apps> with `chat:write` scope and save all the secret values (found at *Basic Information* section, inside App configuration page).

Now, you can install the App to your workspace. From Slack main view, expand over your workspace name and go to *Tools and settings* -> *Manage applications*.

Then, get a bot token at your App configuration page, section *Oauth & Permissions* -> *OAuth Tokens*, generated when you added App to your Slack workspace.

Finally, add to desired channel (specified at `${SLACK_CHANNEL}`) the recently created App (from channel view, go to *More settings* -> *Integrations* -> *Add apps*) to start receiving alerts.

## Telegram receiver

First, create a bot <https://core.telegram.org/bots#creating-a-new-bot> (using [@BotFather](https://t.me/botfather)) and save the token.

There is no need to create a different one for each environment, because same bot can be joined to multiple chat groups.

Don't add your bot when creating the chat group, because this event won't be reported at `getUpdates`.

Get chat group ID from <https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/getUpdates>.
