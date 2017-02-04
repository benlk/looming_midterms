#!/bin/bash
# This is a cron job, I'm just gonna say it's in the public domain.
# By Ben Keith, 2017
#
# Add this line:
# * 9 * * * /path/to/tweet-countdown.sh >> /path/to/tweet-countdown.log 2>&1
#
# You will also need to run `which t` to find out the directory containing `t`
# so that you can add it to $PATH in your crontab
# Add this line, or one like it, when you edit your crontab with `crontab -e`

# . in the cronjob is ~, but when you run this script by yourself, it's .
# t needs the full path to the trc, not ~, although . works.
cd ~/looming_midterm/
./message.sh | xargs -I '{}' /usr/local/bin/t update --profile=./looming_midterm.trc '{}'
