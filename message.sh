#!/bin/bash
# Currently tweeting as thunderhug43210

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

echo $(expr '(' $(date -d 2018/11/6 +%s) - $(date +%s) + 86399 ')' / 86400) "days until the 2018 midterms. ""${arr[$rand]}"
