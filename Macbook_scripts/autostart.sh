#!/usr/bin/env bash 

sh ~/Templates/brightness.sh 23
loginctl lock-session

sh ~/Templates/auto_minimize.sh element-desktop&

exit 0
