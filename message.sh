#!/bin/bash
# Currently tweeting as looming_midterms
# looming_midterms, this Twitter bot, is copyright 2017 and following by Ben Keith.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see http://www.gnu.org/licenses/.

# Contributions to this list are welcome.
# Empty lines in this area are for randomness.
arr[0]='Will you run for office?'
arr[1]=''
arr[2]='⚑'
arr[3]='🇺🇸'
arr[4]='Do you know where your polling place is?'
arr[6]=''
arr[7]=''
arr[8]=''
arr[9]=''
arr[10]=''
arr[11]=''
arr[12]=''
arr[13]=''
arr[14]=''
arr[15]=''
arr[16]=''
arr[17]=''
arr[18]='Do you know who is running?'
arr[19]='What can you do to help?'

# random item generation from https://stackoverflow.com/questions/5189913/pick-and-print-one-of-three-strings-at-random-in-bash-script
rand=$[ $RANDOM % ${#arr[*]} ]

# Days until event from https://stackoverflow.com/questions/6282059/how-do-you-print-the-days-until-a-deadline-from-the-command-line#6282176
# also, there's a difference between the BSD date(1) and the Linux date(1)
# This does not work on OSX
#    sigh
echo $(expr '(' $(date -d 2018/11/6 +%s) - $(date +%s) + 86399 ')' / 86400) "days until the 2018 midterms. ""${arr[$rand]}"
