#!/bin/bash
SCRIPT_DIR="$(dirname "$(realpath "$0")")"
REMINDERS_FILE="$SCRIPT_DIR/reminders.txt"

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
# ( crontab -l 2>/dev/null; echo "0 * * * * $(pwd)/reminders.sh >> $(pwd)/reminders.log 2>&1" ) | crontab -


# Remove from crontab by running in same directory as this script
# crontab -l | grep -v "$(pwd)/reminders.sh" | crontab -

# List all cron jobs
# crontab -l