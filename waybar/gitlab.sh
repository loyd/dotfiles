#!/bin/bash

token=`cat $HOME/.auth/gl-notifications.token`
count=`curl -m 5 -H "PRIVATE-TOKEN: $token" 'https://gitlab.advsys.work/api/v4/todos?state=pending&per_page=100' 2>/dev/null | jq length`

echo $count
