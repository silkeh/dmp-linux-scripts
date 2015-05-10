#!/bin/sh
if [ -z "$1" ]; then
  echo "create-server.sh [path]"
  exit 0
fi
/bin/mkdir -p "$1"
echo "Downloading DMPUpdater"
curl -so "$1/DMPUpdater.exe" http://godarklight.kerbalcentral.com/dmp/downloads/dmpupdater/DMPUpdater.exe
/usr/bin/touch "$1/DMPServer.exe"
/usr/bin/mono  "$1/DMPUpdater.exe"

if [ "$(id -u)" = 0 ]; then
  chown jebediah: -R "$1"
fi
