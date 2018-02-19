#! /bin/bash
output=$(echo "foo" | xargs -0 -I {} t update "{}")
#output='Tweet posted by @looming_midterm. Run `t delete status 965374407727288320` to delete.'
foo=$( echo $output | grep -Eo '[[:digit:]]+' )
echo $foo
reply_output=$( ./message.sh | xargs -0 -I {} t reply $foo "{}" )
