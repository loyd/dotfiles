#!/bin/bash

token=`cat $HOME/.auth/gh-notifications.token`
count=`curl -m 5 -u loyd:$token https://api.github.com/notifications 2>/dev/null | jq length`

echo $count
