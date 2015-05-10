#!/bin/sh

if [ -z "$1" ]; then
  echo "server-update.sh [servername]"
  exit 0
fi

systemctl stop "dmp-screen@$1"
./server-create.sh "/opt/dmp/$1"
systemctl start "dmp-screen@$1"
