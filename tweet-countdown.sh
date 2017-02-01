#!/bin/bash
# This is a cron job, I'm just gonna say it's in the public domain.
# By Ben Keith, 2017
#
# Add this line:
# * 9 * * * /path/to/tweet-countdown.sh >> /path/to/tweet-countdown.log 2>&1

# . in the cronjob is ~, but when you run this script by yourself, it's .
# t needs the full path to the trc, not ~, although . works.
~/looming_midterm/message.sh | xargs -I '{}' t update --profile=./looming_midterm/looming_midterm.trc '{}'
