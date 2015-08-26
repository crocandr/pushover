#!/bin/bash

#
# This is a Pushover Message Sender Script
# API doc: https://pushover.net/api
#

# --- User Settings ---
# App Token 
# example: TOKEN="at...2b"
TOKEN="<your app key>"
# User Token
# example: USER="uZ...JQ"
USER="<your user key>"

# --- Defaults ---
# device - user ID, group ID, user device(s)
DEVICE=""
# message title
TITLE="Alert Message"
# message timestamp
TIMESTAMP="`date +%s`"
# lowest -2, low -1, normal 0, high 1, emergency 2
PRIORITY="0"
# how often send same notification (sec) - min. 30 sec!
RETRY=30
# continue delivery the notification (sec) - max. 86400 sec (24h)!
EXPIRE=60
# notification sound - name
# pushover - default sound, none - silent/none
SOUND="pushover"
# message format html (1) or simple txt (0)
HTML=0
# message
MESSAGE="Check your `hostname` server - `date +\"%Y%m%d %T\"`"
# API URL
APIURL="https://api.pushover.net/1/messages.json"

# --- Custom Param ---
# Response file
OUTFILE="/tmp/curlout.txt"
# List parameter value before send the push message
LIST=1


# Read parameters
# every parameter is optional
while getopts d:t:i:p:r:e:s:h:m: option
do
	case "$option" in
	d)
		# device
		DEVICE=$OPTARG
		;;
	t)
		# title
		TITLE=$OPTARG
		;;
	i)
		# date = timestamp
		TIMESTAMP=$OPTARG
		;;
	p)
		# priority
		PRIORITY=$OPTARG
		;;
	r)
		# retry
		RETRY=$OPTARG
		;;
	e)
		# expire
		EXPIRE=$OPTARG
		;;
	s)
		# sound - name
		SOUND=$OPTARG
		;;
	h)
		# html
		HTML=$OPTARG
		;;
	m)
		# message
		MESSAGE="$OPTARG"
		;;
	esac
done

# List parameter values
if [ $LIST -eq 1 ]
then
	echo "Device (-d): $DEVICE"
	echo "Title (-t): $TITLE"
	echo "Timestamp (-i): $TIMESTAMP"
	echo "Priority (-p): $PRIORITY"
	echo "Retry (-r): $RETRY"
	echo "Expire (-e): $EXPIRE"
	echo "Sound (-s): $SOUND"
	echo "HTML (-h): $HTML"
	echo "Message (-m): \"$MESSAGE\""
fi


# send the push message with API call
curl -s \
	--form-string "token=$TOKEN" \
	--form-string "user=$USER" \
	--form-string "device=$DEVICE" \
	--form-string "title=$TITLE" \
	--form-string "timestamp=$TIMESTAMP" \
	--form-string "priority=$PRIORITY" \
	--form-string "retry=$RETRY" \
	--form-string "expire=$EXPIRE" \
	--form-string "sound=$SOUND" \
	--form-string "html=$HTML" \
	--form-string "message=$MESSAGE" \
	"$APIURL" \
	-o $OUTFILE

