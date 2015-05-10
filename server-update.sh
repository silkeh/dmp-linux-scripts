#!/bin/sh

if [ -z "$1" ]; then
  echo "create-server.sh [path]"
  exit 0
fi

systemctl stop "dmp@$1"
./server-create.sh "/opt/dmp/$1"
systemctl start "dmp@$1"
