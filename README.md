
Pushover.net API script mini manual
===================================


First steps
-----------
1. Login with your account on pushover.net
2. Copy your user key from the pushover dashboard
3. paste your user key to the pushover.sh script USER="<your user key>" line
4. Create a new application on the pushover dashboard with "type: script" parameter
5. copy your APP API token key
6. paste your app key to the pushover.sh script TOKEN="<your app key>" line
7. change default parameters in your pushover.sh script, example: TITLE="" , SOUND="", MESSAGE=""
8. try your pushover script :)


Script usage
------------
You can run the script with parameters. If you don't define any parameter/value, the script send a push message with default parameter value.
You can override the default value in the script with any parameter below:
*	**-d** - target device name/list (check https://pushover.net/api#identifiers)-
*	**-t** - message title/subject
*	**-i** - message timestamp in unix timestamp format (check https://pushover.net/api#timestamp)
*	**-p** - message priority (check https://pushover.net/api#priority)
*	**-r** - retry time in seconds (min 30 sec)
*	**-e** - exipre time in seconds (max 24 hours)
*	**-s** - message notification sound (check https://pushover.net/api#sounds)
*	**-h** - message format is html or text (default text) (check https://pushover.net/api#html)
*	**-m** - message


Examples
--------

low priority message without tone notification:
```./pushover.sh -t "this is a test message" -p -1 -s none -m "This is a text message from the https://pushover.net API script"```

high priority message with tone notification:
```./pushover.sh -t "this is a test message" -p 1 -s pushover -m "This is a high priority text message from the https://pushover.net API script"```





Good Luck! :)
