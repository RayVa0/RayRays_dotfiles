#!/bin/bash

echo Doing sigkill on $1
killall $1 -9

echo ちょっと待ってください

sleep 0.25
echo -n .
sleep 1
echo -n .
sleep 1 
echo -n .
sleep 1
echo .


echo Running $1 again
sh ~/Templates/run.sh $1
