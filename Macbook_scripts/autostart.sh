#!/usr/bin/env bash 

loginctl lock-session

sh ~/Templates/auto_minimize.sh element-desktop&
sh ~/Templates/auto_minimize.sh Discord&
sh ~/Templates/brightness.sh 23
exit 0
