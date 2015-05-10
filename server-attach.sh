#!/bin/sh
if [ -z "$1" ]; then
  echo "server-attach.sh [servername]"
  exit 0
fi

if [ "$(id -u)" = 0 ]; then
  sudo -u jebediah screen -rS "dmp-$1"
fi
screen -rS "dmp-$1"
