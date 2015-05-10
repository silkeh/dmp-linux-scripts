#!/bin/bash

win="$1"
cmd="${*:2}"

echo "Sending $cmd to $1."
cmd="$cmd$(printf \\r)"

if [[ $EUID -eq 0 ]]; then
    sudo -u jebediah screen -S dmp -p "dmp-$1" -X stuff "$cmd"
else
    screen -S dmp -p "dmp-$1" -X stuff "$cmd"
fi
