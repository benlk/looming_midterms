#! python3
# Currently tweeting as looming_midterms
# looming_midterms, this Twitter bot, is copyright 2017 and following by Ben Keith.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the Creative Commons Attribution-ShareAlike 4.0
# International, aka CC BY-SA 4.0.
#
# https://creativecommons.org/licenses/by-sa/4.0/

import datetime, getopt, yaml, sys
from twython import Twython

dry_run = False

def main( argv ):
    global dry_run

    dry_run = maybe_dry_run( argv )
    countdown_message = countdown()
    twitter = tweet_setup( argv )

    # countdown tweet
    countdown_tweet = tweet( twitter, status=countdown_message )

    # Survey tweet
    reply_tweet = tweet( twitter, status=reply_survey( countdown_tweet ), in_reply_to_status_id = countdown_tweet['id'], auto_populate_reply_metadata=True )

    # is today a tuesday and is today a voting day?
    #reply_tweet = tweet( twitter, status=reply_tuesday_voting( countdown_tweet ), in_reply_to_status_id = countdown_tweet['id'], auto_populate_reply_metadata=True )

def tweet( twitter, *args, **kwargs ):
    """
    A way of doing Twitter things with dry_run protections.
    Arguments other than dry_run and twitter are passed to twitter.update_status
    """
    global dry_run
    if dry_run == True:
        print( 'dry_run tweet: ' + kwargs['status'] )
        return 0
    else:
        return twitter.update_status( *args, **kwargs )

def maybe_dry_run( argv ):
    opts, args = getopt.getopt( argv, '', ['dry_run','profile='] )

    for opt, arg in opts:
        if opt == '--dry_run':
            dry_run = True
            print( 'Running dry; will not make API calls' )
    return dry_run

def countdown():
    today = datetime.date.today()
    dday = datetime.date( 2018, 11, 6 )
    difference = ( dday - today )
    return "{0} days until the 2018 midterm elections.".format( difference.days )

def tweet_setup( argv ):
    '''
    returns a Twython twitter object
    '''
    config_file = ''
    config = {}
    global dry_run

    if dry_run == True:
        return 0

    # https://www.tutorialspoint.com/python3/python_command_line_arguments.htm
    try:
        opts, args = getopt.getopt( argv, '', ['dry_run','profile='] )
    except getopt.GetoptError:
        print( "something went wrong with message.py's tweeting function" )
        print( "try specifying a profile file from sferik/t:" )
        print( "python3 ./message.py --profile=./looming_midterm.trc" )
        sys.exit( 2 )

    for opt, arg in opts:
        if opt == '--profile':
            config_file = arg

            # https://stackoverflow.com/questions/1773805/how-can-i-parse-a-yaml-file-in-python#1774043
            with open( config_file, 'r' ) as trc:
                try:
                    config = yaml.load( trc )
                except yaml.YAMLError as exc:
                    print( exc )
        else:
            print( opt, arg )

    # the following parsing logic is basically copied from sferik/t, which is in ruby:
    # https://github.com/sferik/t/blob/8c2f9f624086091cfd0700b7be55ebef31dfe994/lib/t/rcfile.rb#L59
    profile = config['configuration']['default_profile'] # a pair of profile name, profile ID, as 0, 1
    consumer_key = config['profiles'][profile[0]][profile[1]]['consumer_key'] # app key
    consumer_secret = config['profiles'][profile[0]][profile[1]]['consumer_secret'] # app secret
    secret = config['profiles'][profile[0]][profile[1]]['secret'] # Oauth secret
    token = config['profiles'][profile[0]][profile[1]]['token'] # Oauth token
    username = config['profiles'][profile[0]][profile[1]]['username']

    twitter = Twython( consumer_key, consumer_secret, token, secret ) # Oauth 1

    return twitter

def reply_survey( previous_tweet ):
    mention = previous_tweet['user']['screen_name']
    message = '[SURVEY] What info do you want to see here? Voter-reg dates? Primaries? Anything from this list?: https://github.com/democrats/data/tree/master/election-calendar/2018'
    return message

def reply_tuesday_voting( previous_tweet ):
    """
    This should figure out if today is a voting day, and alert if it is.

    This will involve:
    - looking up the stuff in the election calendar
    - getting a list of things today, and t
    """
    message = ''
    return message

if __name__ == "__main__":
    # execute only if run as a script
    main( sys.argv[1:] )
