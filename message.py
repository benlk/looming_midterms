#! python3
# Currently tweeting as looming_midterms
# looming_midterms, this Twitter bot, is copyright 2017 and following by Ben Keith.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the Creative Commons Attribution-ShareAlike 4.0
# International, aka CC BY-SA 4.0.
#
# https://creativecommons.org/licenses/by-sa/4.0/

import datetime

def main():
    print( countdown() )

def countdown():
    today = datetime.date.today()
    dday = datetime.date( 2018, 11, 6 )
    difference = ( dday - today )
    return "{0} days until the 2018 midterm elections.".format( difference.days )

if __name__ == "__main__":
    # execute only if run as a script
    main()
