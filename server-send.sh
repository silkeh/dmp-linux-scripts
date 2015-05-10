#!/bin/bash

if [ -z "$1" ]; then
  echo "server-send.sh [servername] [message/command]"
  exit 0
fi

cmd="${*:2}"
echo "Sending $cmd to $1."

if [  "$(id -u)" = 0 ]; then
  sudo -u jebediah screen -S "dmp-$1" -X stuff "$cmd$(printf \\r)"
else
  screen -S "dmp-$1" -X stuff "$cmd$(printf \\r)"
fi
