#!/bin/bash
# This is a cron job, I'm just gonna say it's in the public domain.
# By Ben Keith, 2017
#
# Add this line:
# * 9 * * * /path/to/tweet-countdown.sh >> /path/to/tweet-countdown.log 2>&1

# This needs the full path to the trc, not ~, although . works.
./message.sh | xargs -I '{}' t update --profile=./looming_midterm.trc '{}'
