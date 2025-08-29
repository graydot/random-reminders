#!/bin/bash
REMINDERS_FILE="$HOME/reminders.txt"

if ! command -v shuf >> /dev/null; then
    brew install coreutils
fi

if ! command -v terminal-notifier &> /dev/null; then
    brew install terminal-notifier
fi



LINE=$(shuf -n 1 "$REMINDERS_FILE")
echo $LINE

terminal-notifier -title "Reminder" -message "$LINE"

# Add to crontab by running in same directory as this script
# ( crontab -l 2>/dev/null; echo "0 * * * * $(pwd)/reminder.sh >> $(pwd)/reminder.log 2>&1" ) | crontab -


# Remove from crontab by running in same directory as this script
# crontab -l | grep -v "$(pwd)/reminder.sh" | crontab -

# List all cron jobs
# crontab -l