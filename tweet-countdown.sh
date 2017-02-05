#!/bin/bash
# This is a cron job, I'm just gonna say it's in the public domain.
# By Ben Keith, 2017
#
# Add this line:
# * 9 * * * /path/to/tweet-countdown.sh >> /path/to/tweet-countdown.log 2>&1
#
# You will also need to run `which t` to find out the directory containing `t`
# You will need to edit the line containing `/usr/local/bin/t` to match your system.

# prevent multi-posting like what happened Feb 5: http://stackoverflow.com/a/11631222
if [ -f /tmp/looming_midterm.lock ]
then
	exit
fi

touch /tmp/looming_midterm.lock

# . in the cronjob is ~, but when you run this script by yourself, it's .
# t needs the full path to the trc, not ~, although . works.
cd ~/looming_midterm/

# using /usr/local/bin/t because this isn't working otherwise
./message.sh | xargs -I '{}' /usr/local/bin/t update --profile=./looming_midterm.trc '{}'

rm /tmp/looming_midtern.lock
