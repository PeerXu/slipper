#!/bin/bash

EXTERNAL_ADDRESS="$(curl -s http://ipecho.net/plain)"

if [ -e "cached" ]; then
  CACHED_ADDRESS="$(cat cached)"
else
  CACHED_ADDRESS="UNCACHED"
fi

if [[ "x$EXTERNAL_ADDRESS" != "x$CACHED_ADDRESS" ]]; then
  msg="update external ip address from $CACHED_ADDRESS to $EXTERNAL_ADDRESS"
  echo $msg
  echo -n $EXTERNAL_ADDRESS > cached
  git add .
  git commit -a -m "$msg"
  git push origin master
fi

exit 0
