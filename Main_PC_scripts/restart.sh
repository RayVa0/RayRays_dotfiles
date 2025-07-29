#!/bin/bash

echo Doing sigkill on $1
killall $1 -9

if [ $? -gt 0 ]; then
  echo exiting
  exit 1
fi

echo ちょっと待ってください

sleep 0.25
echo -n .
sleep 0.5
echo -n .
sleep 0.5
echo -n .
sleep 0.5
echo .


echo Running $1 again
sh ~/Templates/run.sh $1
