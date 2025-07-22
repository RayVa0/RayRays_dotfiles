#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <application_name>"
    exit 1
fi

if [ "$1" = "handbrake" ]; then 
    nohup "ghb" >&/dev/null &
elif [ "$1" = "plex" ]; then
    sh ~/Downloads/run_plex.sh
else 
    nohup "$1" >&/dev/null &
fi


if [ $? -gt 0 ]; then 
    echo Opening application failed
fi

exit 0
