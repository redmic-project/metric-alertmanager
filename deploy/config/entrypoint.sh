#!/bin/sh

cat ${CONFIG_PATH}/alertmanager-tmpl.yml \
	| sed "s@\${SLACK_URL}@${SLACK_URL}@g" \
	| sed "s@\${SLACK_CHANNEL}@${SLACK_CHANNEL}@g" \
	| sed "s@\${SLACK_USER}@${SLACK_USER}@g" \
	| sed "s@\${SLACK_TEXT_TEMPLATE}@${SLACK_TEXT_TEMPLATE}@g" \
	| sed "s@\${TELEGRAM_CHAT_ID}@${TELEGRAM_CHAT_ID}@g" \
	| sed "s@\${TELEGRAM_BOT_TOKEN}@${TELEGRAM_BOT_TOKEN}@g" \
	| sed "s@\${TELEGRAM_MESSAGE_TEMPLATE}@${TELEGRAM_MESSAGE_TEMPLATE}@g" \
	| sed "s@\${TELEGRAM_DISABLE_NOTIFICATIONS}@${TELEGRAM_DISABLE_NOTIFICATIONS}@g" \
	> ${CONFIG_PATH}/alertmanager.yml

set -- /bin/alertmanager "${@}"

exec "${@}"
