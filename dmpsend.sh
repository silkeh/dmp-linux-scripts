#!/bin/bash

win="$1"
cmd="${*:2}"

echo "Sending $cmd to $win."

if [[ "$cmd" == "update" ]]
then
	cmd="mono DMPUpdater.exe; mono DMPServer.exe$(printf \\r)"
fi
if [[ "$cmd" == "update-dev" ]]
then
	 cmd="mono DMPUpdater-development.exe; mono DMPServer.exe$(printf \\r)"
fi

cmd="$cmd$(printf \\r)"

screen -S dmp -p "$win" -X stuff "$cmd"
