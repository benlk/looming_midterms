#!/bin/bash
# This is a cron job, I'm just gonna say it's in the public domain.
# By Ben Keith, 2017
./message.sh | xargs t update --profile=~/looming_midterm.trc
