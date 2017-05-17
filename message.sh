#!/bin/bash
# Currently tweeting as looming_midterms
# looming_midterms, this Twitter bot, is copyright 2017 and following by Ben Keith.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the Creative Commons Attribution-ShareAlike 4.0
# International, aka CC BY-SA 4.0.
#
# https://creativecommons.org/licenses/by-sa/4.0/

# Contributions to this list are welcome.
# Empty lines in this area are for randomness.
# Escape "" and '' with \
arr[0]='Will you run for office?'
arr[1]=''
arr[2]='⚑'
arr[3]='🇺🇸'
arr[4]='Do you know where your polling place is?'
arr[6]='Register as a pollworker with your local board of elections.'
arr[7]=''
arr[8]=''
arr[9]=''
arr[10]=''
arr[11]=''
arr[12]=''
arr[13]=''
arr[14]=''
arr[15]='Have you checked your voter registration status? https://www.vote.org/'
arr[16]='Are you registered to vote? https://www.vote.org/'
arr[17]='You should research running for office: https://timetorun.org/'
arr[18]='Do you know who is running?'
arr[19]='What can you do to help?'

# random item generation from https://stackoverflow.com/questions/5189913/pick-and-print-one-of-three-strings-at-random-in-bash-script
rand=$[ $RANDOM % ${#arr[*]} ]

# Days until event from https://stackoverflow.com/questions/6282059/how-do-you-print-the-days-until-a-deadline-from-the-command-line#6282176
# also, there's a difference between the BSD date(1) and the Linux date(1)
# This does not work on OSX; all it does is this:
#    usage: date [-jnu] [-d dst] [-r seconds] [-t west] [-v[+|-]val[ymwdHMS]] ... 
#                [-f fmt date | [[[mm]dd]HH]MM[[cc]yy][.ss]] [+format]
#                expr: syntax error
#    days until the 2018 midterms.
# So yeah, only cron this on a Linux machine
echo $(expr '(' $(date -d 2018/11/6 +%s) - $(date +%s) + 86399 ')' / 86400) "days until the 2018 midterm elections."
echo -n $(expr '(' $(date -d 2017/8/21 +%s) - $(date +%s) + 86399 ')' / 86400) "days until the 2017 solar eclipse."
echo -e "\0"
