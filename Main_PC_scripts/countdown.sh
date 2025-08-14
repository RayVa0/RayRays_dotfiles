#!/usr/bin/env bash 

for((i=$1; i>0;i--)); do
  sleep 1
  echo -n "$i.."
done
